"""Veri modelleri: bir düşmüş domain adayını ve onun skorunu temsil eder."""
from __future__ import annotations

from dataclasses import dataclass, field
from typing import Optional


@dataclass
class Metrics:
    """Otorite / spam metrikleri. Genelde ExpiredDomains.net CSV'sinden gelir."""
    da: Optional[float] = None            # Domain Authority (Moz)
    pa: Optional[float] = None            # Page Authority (Moz)
    spam_score: Optional[float] = None    # Moz Spam Score (%)
    ref_domains: Optional[int] = None     # benzersiz link veren domain sayısı
    backlinks: Optional[int] = None       # toplam backlink
    majestic_tf: Optional[float] = None   # Trust Flow
    majestic_cf: Optional[float] = None   # Citation Flow


@dataclass
class Candidate:
    """Tek bir domain adayı ve onunla ilgili toplanan tüm sinyaller."""
    domain: str
    source: str = "input"
    metrics: Metrics = field(default_factory=Metrics)

    # status agent (RDAP/DNS)
    created: Optional[str] = None
    expiry: Optional[str] = None
    age_years: Optional[float] = None
    rdap_status: list[str] = field(default_factory=list)
    dns_alive: Optional[bool] = None

    # history agent (Wayback)
    wayback_first_year: Optional[int] = None
    wayback_snapshots: Optional[int] = None

    # reputation/red-flag agent
    red_flags: list[str] = field(default_factory=list)
    notes: list[str] = field(default_factory=list)

    # scorer (judge) çıktısı
    score: float = 0.0
    verdict: str = "?"          # PASS | REVIEW | REJECT
    reasons: list[str] = field(default_factory=list)

    @property
    def tld(self) -> str:
        return "." + self.domain.rsplit(".", 1)[-1].lower() if "." in self.domain else ""

    def to_row(self) -> dict:
        m = self.metrics
        return {
            "domain": self.domain,
            "verdict": self.verdict,
            "score": round(self.score, 1),
            "da": m.da,
            "pa": m.pa,
            "spam_score": m.spam_score,
            "ref_domains": m.ref_domains,
            "backlinks": m.backlinks,
            "tf": m.majestic_tf,
            "cf": m.majestic_cf,
            "age_years": self.age_years,
            "expiry": self.expiry,
            "rdap_status": "|".join(self.rdap_status),
            "wayback_first_year": self.wayback_first_year,
            "wayback_snapshots": self.wayback_snapshots,
            "red_flags": "|".join(self.red_flags),
            "reasons": "; ".join(self.reasons),
        }
