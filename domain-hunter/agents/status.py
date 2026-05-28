"""STATUS AGENT — domain yaşı, son kullanma tarihi ve 'düşme' durumu.

RDAP (modern WHOIS) ile:
  * registration tarihi -> domain yaşı (matrix: 3+ yıl)
  * expiration tarihi   -> ne zaman düşecek
  * status kodları      -> pendingDelete / redemptionPeriod = 'düşmek üzere'

DNS çözümlemesi ile domainin hâlâ canlı olup olmadığına bakar.
Ağ kapalıysa alanları boş bırakır (sessiz degrade).
"""
from __future__ import annotations

import socket
from datetime import datetime, timezone
from typing import Optional

from core.config import Config
from core.models import Candidate
from core.netclient import NetClient

DROPPING_STATUSES = {"pending delete", "redemption period", "pendingdelete",
                     "redemptionperiod", "auto renew period", "autorenewperiod"}


def _parse_date(s: str) -> Optional[datetime]:
    if not s:
        return None
    s = s.strip().replace("Z", "+00:00")
    try:
        dt = datetime.fromisoformat(s)
        return dt if dt.tzinfo else dt.replace(tzinfo=timezone.utc)
    except ValueError:
        for fmt in ("%Y-%m-%dT%H:%M:%S", "%Y-%m-%d"):
            try:
                return datetime.strptime(s[:19], fmt).replace(tzinfo=timezone.utc)
            except ValueError:
                continue
    return None


def _dns_alive(domain: str, timeout: float) -> Optional[bool]:
    old = socket.getdefaulttimeout()
    socket.setdefaulttimeout(timeout)
    try:
        socket.getaddrinfo(domain, None)
        return True
    except socket.gaierror:
        return False
    except OSError:
        return None
    finally:
        socket.setdefaulttimeout(old)


def inspect(cand: Candidate, net: NetClient, cfg: Config) -> None:
    cand.dns_alive = _dns_alive(cand.domain, min(cfg.request_timeout, 5))

    data = net.get_json(cfg.rdap_base + cand.domain)
    if not data:
        cand.notes.append("rdap: erişilemedi")
        return

    for ev in data.get("events", []) or []:
        action = (ev.get("eventAction") or "").lower()
        date = ev.get("eventDate") or ""
        if action == "registration":
            cand.created = date
        elif action == "expiration":
            cand.expiry = date

    created_dt = _parse_date(cand.created or "")
    if created_dt:
        cand.age_years = round(
            (datetime.now(timezone.utc) - created_dt).days / 365.25, 1)

    statuses = [str(s).lower() for s in (data.get("status") or [])]
    cand.rdap_status = statuses
    if any(s in DROPPING_STATUSES for s in statuses):
        cand.notes.append("DÜŞMEK ÜZERE (rdap status)")
