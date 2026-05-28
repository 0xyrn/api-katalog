"""SCORER / JUDGE AGENT — filtre matrisini uygular, karar + puan üretir.

Karar (verdict):
  PASS    -> bilinen tüm çekirdek kriterler geçti, kritik red flag yok
  REVIEW  -> eksik metrik veya uyarı var, elle bak
  REJECT  -> kritik tuzak (kumar/yetişkin geçmiş) ya da matrix'i sert ihlal

Puan (0-100) sadece sıralama içindir; karar puandan bağımsızdır.
"""
from __future__ import annotations

from core.config import Config
from core.models import Candidate

_SCRIPT_FLAGS = {"cjk-script", "cyrillic-script"}


def _split_flags(cand: Candidate) -> tuple[list[str], list[str]]:
    critical, warnings = [], []
    for f in cand.red_flags:
        kw = f.split(":", 1)[-1]
        (warnings if kw in _SCRIPT_FLAGS else critical).append(f)
    return critical, warnings


def _clamp(x: float, lo: float, hi: float) -> float:
    return max(lo, min(hi, x))


def judge(cand: Candidate, cfg: Config) -> None:
    m = cand.metrics
    reasons: list[str] = []
    critical, warnings = _split_flags(cand)

    # --- yaş: rdap yoksa wayback ilk yılına düş ---
    age = cand.age_years
    if age is None and cand.wayback_first_year:
        from datetime import datetime
        age = datetime.now().year - cand.wayback_first_year
        reasons.append(f"yaş wayback'ten tahmin: ~{age}y")

    # --- sert ihlaller -> REJECT ---
    hard_fail = False
    if critical:
        hard_fail = True
        reasons.append("KRİTİK tuzak: " + ", ".join(critical))
    if m.spam_score is not None and m.spam_score > cfg.max_spam_score:
        hard_fail = True
        reasons.append(f"Spam {m.spam_score} > {cfg.max_spam_score}")
    if m.da is not None and m.da < cfg.min_da:
        hard_fail = True
        reasons.append(f"DA {m.da} < {cfg.min_da}")
    if age is not None and age < cfg.min_age_years:
        hard_fail = True
        reasons.append(f"Yaş {age}y < {cfg.min_age_years}y")
    if m.ref_domains is not None and m.ref_domains > cfg.ref_domains_max:
        hard_fail = True
        reasons.append(f"Ref.domain {m.ref_domains} > {cfg.ref_domains_max} (PBN/şişirme)")

    # --- puanlama ---
    score = 0.0
    if m.da is not None:
        score += _clamp(m.da, 0, 50) / 50 * 25
    if m.pa is not None:
        score += _clamp(m.pa, 0, 50) / 50 * 15
    if m.ref_domains is not None:
        if cfg.ref_domains_min <= m.ref_domains <= cfg.ref_domains_max:
            score += 20
        elif m.ref_domains < cfg.ref_domains_min:
            score += m.ref_domains / cfg.ref_domains_min * 12
    if m.spam_score is not None:
        score += _clamp((10 - m.spam_score) / 10, 0, 1) * 15
    if age is not None:
        score += _clamp(age, 0, 10) / 10 * 15
    if m.majestic_tf is not None:
        score += _clamp(m.majestic_tf, 0, 50) / 50 * 10
    if cand.tld in tuple(cfg.authority_tlds):
        score += 10
        reasons.append("otorite TLD bonusu")
    score -= 8 * len(warnings)
    cand.score = _clamp(score, 0, 100)

    # --- bilinmeyen metrik sayısı (REVIEW tetikler) ---
    unknown = sum(v is None for v in
                  (m.da, m.spam_score, m.ref_domains)) + (age is None)

    if hard_fail:
        cand.verdict = "REJECT"
    elif warnings or unknown >= 2:
        cand.verdict = "REVIEW"
        if warnings:
            reasons.append("uyarı: " + ", ".join(warnings))
        if unknown >= 2:
            reasons.append("eksik metrik -> elle doğrula")
    else:
        cand.verdict = "PASS"
        reasons.append("matrix kriterleri geçti")

    cand.reasons = reasons
