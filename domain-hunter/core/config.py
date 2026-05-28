"""Filtre matrisi ve çalışma ayarları.

Eşik değerleri kullanıcının finans/borsa nişi stratejisinden birebir alınmıştır.
İstersen bir JSON dosyasıyla (--config config.json) üzerine yazabilirsin.
"""
from __future__ import annotations

import json
from dataclasses import dataclass, field, asdict


# Geçmiş içerikte / anchor text'te görülürse domaini zehirli sayan kelimeler.
DEFAULT_BAD_KEYWORDS = [
    # kumar / bahis
    "casino", "kazino", "bahis", "bet", "betting", "iddaa", "poker", "slot",
    "rulet", "roulette", "jackpot", "gambling", "sportsbook", "bookmaker",
    # yetişkin
    "porn", "porno", "sex", "sexs", "escort", "xxx", "adult", "webcam", "hentai",
    # ilaç spam'i
    "viagra", "cialis", "pharma", "payday", "loan", "replica", "rolex",
    # bilinen spam izleri
    "vpx", "v1agra", "ph4rmacy",
]


@dataclass
class Config:
    # --- Filtre Matrisi (kullanıcının tablosu) ---
    min_da: float = 15.0              # DA minimum
    min_pa: float = 15.0             # PA minimum
    max_spam_score: float = 2.0      # Moz Spam Score maksimum (%)
    ref_domains_min: int = 50        # ref. domain alt sınır
    ref_domains_max: int = 500       # ref. domain üst sınır (üstü genelde PBN/spam şişirme)
    min_age_years: float = 3.0       # minimum domain yaşı
    authority_tlds: tuple = (".edu", ".gov", ".gov.tr", ".edu.tr")

    # --- Red flag / tuzak tespiti ---
    bad_keywords: list = field(default_factory=lambda: list(DEFAULT_BAD_KEYWORDS))
    flag_cjk: bool = True            # Çince/Japonca/Korece karakter = şüpheli (kullanıcı uyarısı)
    flag_cyrillic: bool = True

    # --- Ağ / enrichment ---
    request_timeout: int = 12
    max_workers: int = 6
    rate_delay: float = 0.4          # istekler arası saygı gecikmesi (sn)
    wayback_title_samples: int = 3   # geçmişten kaç snapshot başlığı taranacak
    user_agent: str = "domain-hunter/1.0 (research; +offline-scoring)"

    # endpoints (sandbox dışında çalışır; gerekirse değiştir)
    rdap_base: str = "https://rdap.org/domain/"
    wayback_cdx: str = "http://web.archive.org/cdx/search/cdx"
    wayback_snapshot: str = "http://web.archive.org/web/{ts}id_/{url}"

    @classmethod
    def load(cls, path: str | None) -> "Config":
        cfg = cls()
        if path:
            with open(path, "r", encoding="utf-8") as f:
                data = json.load(f)
            for k, v in data.items():
                if hasattr(cfg, k):
                    setattr(cfg, k, v)
        return cfg

    def dump(self) -> str:
        return json.dumps(asdict(self), indent=2, ensure_ascii=False)
