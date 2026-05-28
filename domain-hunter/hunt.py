#!/usr/bin/env python3
"""DOMAIN HUNTER — orkestra şefi (ekip lideri).

Ekip:
  Harvester   -> adayları yükler (ExpiredDomains CSV / txt)
  Reputation  -> çevrimdışı red-flag + manuel kontrol linkleri
  Status      -> RDAP/DNS: yaş, son kullanma, 'düşüyor mu'   (--enrich)
  History     -> Wayback: kumar/yetişkin geçmiş izi          (--enrich)
  Scorer      -> filtre matrisini uygular, PASS/REVIEW/REJECT + puan

Kullanım:
  python3 hunt.py --input export.csv                  # çevrimdışı skorlama
  python3 hunt.py --input export.csv --enrich --top 25  # ilk 25'i internetle doğrula
"""
from __future__ import annotations

import argparse
import csv
import os
import sys
from concurrent.futures import ThreadPoolExecutor

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from agents import harvester, reputation, scorer, status, history  # noqa: E402
from core.config import Config  # noqa: E402
from core.netclient import NetClient  # noqa: E402

_RANK = {"PASS": 0, "REVIEW": 1, "REJECT": 2, "?": 3}


def _enrich_one(cand, cfg: Config) -> None:
    net = NetClient(cfg.request_timeout, cfg.user_agent, cfg.rate_delay)
    status.inspect(cand, net, cfg)
    history.inspect(cand, net, cfg)


def run(args) -> int:
    cfg = Config.load(args.config)
    if not os.path.exists(args.input):
        print(f"HATA: girdi bulunamadı: {args.input}", file=sys.stderr)
        return 1

    cands = harvester.harvest(args.input)
    print(f"[harvester] {len(cands)} aday yüklendi: {args.input}")
    if not cands:
        print("Aday yok. CSV/txt formatını kontrol et.", file=sys.stderr)
        return 1

    for c in cands:
        reputation.inspect(c, cfg)
        scorer.judge(c, cfg)

    if args.enrich:
        pool = [c for c in cands if c.verdict != "REJECT"]
        pool.sort(key=lambda c: c.score, reverse=True)
        target = pool[: args.top]
        print(f"[enrich] {len(target)} aday internetle doğrulanıyor "
              f"(RDAP + Wayback)...")
        with ThreadPoolExecutor(max_workers=cfg.max_workers) as ex:
            list(ex.map(lambda c: _enrich_one(c, cfg), target))
        for c in target:
            scorer.judge(c, cfg)

    cands.sort(key=lambda c: (_RANK[c.verdict], -c.score))
    os.makedirs(args.out, exist_ok=True)
    _write_csv(cands, os.path.join(args.out, "results.csv"))
    _write_md(cands, os.path.join(args.out, "report.md"), cfg, args)
    _print_summary(cands, args)
    print(f"\nRapor: {args.out}/report.md  ve  {args.out}/results.csv")
    return 0


def _write_csv(cands, path: str) -> None:
    rows = [c.to_row() for c in cands]
    with open(path, "w", encoding="utf-8", newline="") as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        w.writeheader()
        w.writerows(rows)


def _write_md(cands, path: str, cfg: Config, args) -> None:
    passed = [c for c in cands if c.verdict == "PASS"]
    review = [c for c in cands if c.verdict == "REVIEW"]
    rejected = [c for c in cands if c.verdict == "REJECT"]
    lines = [
        "# Düşmüş Domain Avı — Rapor",
        "",
        f"- Girdi: `{args.input}`  | Toplam aday: **{len(cands)}**  "
        f"| Enrichment: **{'açık' if args.enrich else 'kapalı (çevrimdışı)'}**",
        f"- Matrix: DA≥{cfg.min_da}, Spam≤{cfg.max_spam_score}%, "
        f"Ref.Domain {cfg.ref_domains_min}-{cfg.ref_domains_max}, "
        f"Yaş≥{cfg.min_age_years}y",
        f"- Sonuç: **{len(passed)} PASS** · {len(review)} REVIEW · "
        f"{len(rejected)} REJECT",
        "",
    ]
    for title, group in (("✅ PASS — aday kısa liste", passed),
                         ("🟡 REVIEW — elle doğrula", review),
                         ("❌ REJECT — uzak dur", rejected)):
        lines += [f"## {title} ({len(group)})", ""]
        if not group:
            lines += ["_(yok)_", ""]
            continue
        lines += ["| # | Domain | Puan | DA | PA | Spam | RefDom | Yaş | Notlar |",
                  "|---|--------|------|----|----|------|--------|-----|--------|"]
        for i, c in enumerate(group, 1):
            m = c.metrics
            lines.append(
                f"| {i} | `{c.domain}` | {c.score:.0f} | {m.da or '-'} | "
                f"{m.pa or '-'} | {m.spam_score if m.spam_score is not None else '-'} | "
                f"{m.ref_domains or '-'} | {c.age_years or '-'} | "
                f"{'; '.join(c.reasons)[:120]} |")
        lines.append("")
    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))


def _print_summary(cands, args) -> None:
    passed = [c for c in cands if c.verdict == "PASS"]
    print(f"\n=== ÖZET ===  PASS={len(passed)}  "
          f"REVIEW={sum(c.verdict=='REVIEW' for c in cands)}  "
          f"REJECT={sum(c.verdict=='REJECT' for c in cands)}")
    for c in (passed or cands)[:15]:
        print(f"  [{c.verdict:6}] {c.score:5.0f}  {c.domain:32}  "
              f"{'; '.join(c.reasons)[:70]}")


def main() -> int:
    p = argparse.ArgumentParser(description="Finans/borsa nişi düşmüş domain avcısı")
    p.add_argument("--input", "-i", required=True,
                   help="ExpiredDomains CSV ya da düz metin domain listesi")
    p.add_argument("--out", "-o", default="report", help="çıktı klasörü")
    p.add_argument("--config", "-c", default=None, help="opsiyonel JSON ayar")
    p.add_argument("--enrich", action="store_true",
                   help="internetle RDAP + Wayback doğrulaması yap")
    p.add_argument("--top", type=int, default=25,
                   help="enrich modunda doğrulanacak en iyi N aday")
    return run(p.parse_args())


if __name__ == "__main__":
    raise SystemExit(main())
