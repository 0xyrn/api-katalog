"""REPUTATION AGENT — itibar / ceza sinyalleri (çevrimdışı çalışır).

  * domain adının kendisinde kötü kelime izi
  * yapay (manuel doğrulanması gereken) Google index kontrol bağlantısı üretir
  * ücretsiz modda DA/PA/Spam eksikse manuel doldurma notu

Not: Anchor text zehirlenmesi ve gerçek Google index sayımı ücretsiz API'siz
otomatikleştirilemez; araç bu adımları 'manuel kontrol' linkiyle işaretler.
"""
from __future__ import annotations

from core.config import Config
from core.models import Candidate


def inspect(cand: Candidate, cfg: Config) -> None:
    low = cand.domain.lower()
    for kw in cfg.bad_keywords:
        if kw in low:
            cand.red_flags.append(f"domain-name:{kw}")

    m = cand.metrics
    if m.da is None and m.pa is None:
        cand.notes.append("DA/PA yok -> manuel doldur (ücretsiz mod)")
    if m.spam_score is None:
        cand.notes.append("Spam Score yok -> Moz'dan manuel bak")

    # manuel doğrulama bağlantıları (kullanıcının 3 testi)
    cand.notes.append(f"index-check: https://www.google.com/search?q=site:{cand.domain}")
    cand.notes.append(f"wayback: https://web.archive.org/web/*/{cand.domain}")

    cand.red_flags = sorted(set(cand.red_flags))
