"""HISTORY AGENT — Wayback Machine (archive.org) geçmiş kontrolü.

Kullanıcının 'gizli tuzaklar' testi #2: domainin geçmişinde kumar / yetişkin /
alakasız içerik var mı? Ücretsiz CDX API kullanır.

Sinyaller:
  * ilk snapshot yılı  -> gerçek yaş teyidi
  * snapshot sayısı    -> gerçekten yaşamış bir site mi, park mı
  * URL yolları + eski sayfa başlıkları -> kumar/yetişkin/yabancı içerik izi
"""
from __future__ import annotations

import re
from urllib.parse import quote

from core.config import Config
from core.models import Candidate
from core.netclient import NetClient

_TITLE_RE = re.compile(r"<title[^>]*>(.*?)</title>", re.IGNORECASE | re.DOTALL)
_CJK_RE = re.compile(r"[一-鿿぀-ヿ가-힯]")
_CYR_RE = re.compile(r"[Ѐ-ӿ]")


def _bad_hits(text: str, cfg: Config) -> set[str]:
    low = text.lower()
    hits = {kw for kw in cfg.bad_keywords if kw in low}
    if cfg.flag_cjk and _CJK_RE.search(text):
        hits.add("cjk-script")
    if cfg.flag_cyrillic and _CYR_RE.search(text):
        hits.add("cyrillic-script")
    return hits


def inspect(cand: Candidate, net: NetClient, cfg: Config) -> None:
    cdx = (f"{cfg.wayback_cdx}?url={quote(cand.domain)}/*"
           f"&output=json&fl=timestamp,original&collapse=timestamp:8&limit=5000")
    rows = net.get_json(cdx)
    if not rows or len(rows) < 2:
        cand.notes.append("wayback: kayıt yok / erişilemedi")
        return

    data = rows[1:]  # ilk satır başlık
    cand.wayback_snapshots = len(data)
    try:
        cand.wayback_first_year = int(min(r[0] for r in data)[:4])
    except (ValueError, IndexError):
        pass

    # 1) URL yollarında kötü kelime izi
    path_blob = " ".join((r[1] if len(r) > 1 else "") for r in data)
    for kw in _bad_hits(path_blob, cfg):
        cand.red_flags.append(f"wayback-url:{kw}")

    # 2) en yeni birkaç snapshot başlığını tara
    recent = sorted(data, key=lambda r: r[0], reverse=True)[: cfg.wayback_title_samples]
    for ts, original in ((r[0], r[1]) for r in recent if len(r) > 1):
        html = net.get(cfg.wayback_snapshot.format(ts=ts, url=original))
        if not html:
            continue
        m = _TITLE_RE.search(html)
        title = (m.group(1).strip() if m else "")[:200]
        for kw in _bad_hits(title, cfg):
            cand.red_flags.append(f"wayback-title:{kw}")

    cand.red_flags = sorted(set(cand.red_flags))
