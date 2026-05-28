"""HARVESTER AGENT — adayları toplar.

Kaynaklar:
  * ExpiredDomains.net'ten dışa aktarılan CSV (DA/PA/Spam/RefDomains zaten içinde)
  * düz metin liste (her satırda bir domain)

ExpiredDomains.net'i kazımak (scrape) site kurallarına aykırıdır; bu yüzden
araç senin indirdiğin CSV'yi okur. Bu en güvenli ve en zengin ücretsiz yoldur.
"""
from __future__ import annotations

import csv
import io
import re
from typing import Optional

from core.models import Candidate, Metrics


def _norm(h: str) -> str:
    return re.sub(r"[^a-z0-9]", "", h.lower())


# normalize edilmiş başlık -> metrik alanı
_ALIASES = {
    "domain": {"domain", "domainname", "name"},
    "da": {"mozda", "da", "domainauthority"},
    "pa": {"mozpa", "pa", "pageauthority"},
    "spam_score": {"mozspamscore", "spamscore", "spam", "mozspam", "ss"},
    "ref_domains": {"majesticrefdomains", "refdomains", "referringdomains",
                    "refdomain", "rd", "ahrefsrefdomains"},
    "backlinks": {"majesticbacklinks", "backlinks", "mozlinks", "bl", "links",
                  "ahrefsbacklinks"},
    "majestic_tf": {"majestictf", "tf", "trustflow"},
    "majestic_cf": {"majesticcf", "cf", "citationflow"},
}


def _to_float(v) -> Optional[float]:
    if v is None:
        return None
    s = str(v).strip().replace(",", ".").replace("%", "")
    if s == "" or s.lower() in {"n/a", "na", "-", "none"}:
        return None
    try:
        return float(s)
    except ValueError:
        return None


def _to_int(v) -> Optional[int]:
    f = _to_float(v)
    return int(f) if f is not None else None


def _build_field_map(headers: list[str]) -> dict[str, str]:
    """Gerçek başlık adı -> mantıksal alan."""
    field_map: dict[str, str] = {}
    for h in headers:
        n = _norm(h)
        for field_name, names in _ALIASES.items():
            if n in names:
                field_map[h] = field_name
                break
    return field_map


def from_csv(path: str) -> list[Candidate]:
    with open(path, "r", encoding="utf-8-sig", newline="") as f:
        sample = f.read(4096)
        f.seek(0)
        try:
            dialect = csv.Sniffer().sniff(sample, delimiters=",;\t")
        except csv.Error:
            dialect = csv.excel
        reader = csv.DictReader(f, dialect=dialect)
        headers = reader.fieldnames or []
        field_map = _build_field_map(headers)
        domain_col = next((h for h, fld in field_map.items() if fld == "domain"), None)
        if domain_col is None:
            # ilk sütunu domain say
            domain_col = headers[0] if headers else None

        out: list[Candidate] = []
        for row in reader:
            dom = (row.get(domain_col) or "").strip().lower()
            if not dom or "." not in dom:
                continue
            m = Metrics()
            for h, fld in field_map.items():
                if fld in ("domain",):
                    continue
                raw = row.get(h)
                if fld in ("ref_domains", "backlinks"):
                    setattr(m, fld, _to_int(raw))
                else:
                    setattr(m, fld, _to_float(raw))
            out.append(Candidate(domain=dom, source="csv", metrics=m))
        return out


def from_txt(path: str) -> list[Candidate]:
    out: list[Candidate] = []
    with open(path, "r", encoding="utf-8") as f:
        for line in f:
            dom = line.strip().lower()
            if dom and not dom.startswith("#") and "." in dom:
                out.append(Candidate(domain=dom, source="txt"))
    return out


def harvest(path: str) -> list[Candidate]:
    if path.lower().endswith((".csv", ".tsv")):
        return from_csv(path)
    return from_txt(path)
