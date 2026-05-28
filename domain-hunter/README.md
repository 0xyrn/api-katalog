# Domain Hunter — Finans/Borsa Nişi Düşmüş Domain Avcısı

Senin filtre matrisini birebir uygulayan bir **agent ekibi**. Bağımlılık yok
(saf Python 3.9+ standart kütüphane). Telefon/Claude Code dahil her yerde çalışır.

## Ekip (agents/)
| Agent | Görevi (stratejideki karşılığı) |
|-------|----------------------------------|
| `harvester` | ExpiredDomains.net CSV'sini ya da düz domain listesini yükler |
| `reputation` | Domain adında kötü kelime izi + manuel kontrol linkleri (çevrimdışı) |
| `status` | RDAP/DNS: domain yaşı, son kullanma, "düşmek üzere mi" (pendingDelete) |
| `history` | Wayback Machine: kumar/yetişkin/yabancı içerik geçmişi (tuzak testi #2) |
| `scorer` | Filtre matrisini uygular → PASS / REVIEW / REJECT + 0-100 puan |

## Neden CSV ile başlıyoruz?
ExpiredDomains.net'i kazımak site kurallarına aykırı ve çoğu ortamda ağ engelli.
Ama ExpiredDomains'in **ücretsiz CSV export'u** zaten DA/PA, Spam Score,
RefDomains ve Backlinks sütunlarını içeriyor. En güvenli + en zengin ücretsiz yol bu.

## Akış
1. ExpiredDomains.net'te filtrele: anahtar kelime `borsa, analiz, hisse, finans,
   forex, coin`, TLD `.com/.net`, "Deleted/Pending Delete" sekmesi.
2. Sonucu **CSV** olarak indir.
3. Çevrimdışı skorla → kısa liste çıkar:
   ```
   python3 hunt.py --input export.csv
   ```
4. Sadece en iyi adayları internetle doğrula (RDAP yaş + Wayback geçmiş):
   ```
   python3 hunt.py --input export.csv --enrich --top 25
   ```
5. Çıktı: `report/report.md` (PASS/REVIEW/REJECT tabloları) + `report/results.csv`.

Hızlı deneme:
```
python3 hunt.py --input samples/sample_expireddomains.csv
```

## Filtre Matrisi (varsayılan eşikler)
DA≥15 · Spam≤%2 · RefDomains 50–500 · Yaş≥3y · `.edu/.gov` backlink bonusu.
Değiştirmek için `--config config.json` (örnek: `{"min_da": 20, "ref_domains_max": 300}`).

## Karar mantığı
- **REJECT**: kumar/yetişkin geçmiş izi, domain adında spam kelime, Spam>%2,
  DA<15, yaş<3y, veya RefDomains>500 (PBN şişirme).
- **REVIEW**: 2+ metrik eksik ya da CJK/Kiril script uyarısı → elle doğrula.
- **PASS**: bilinen tüm çekirdek kriterler geçti.

## Ücretsiz modun sınırları (dürüst not)
- **Anchor text zehirlenmesi** ve gerçek **Google index sayımı** ücretsiz API
  ile otomatikleştirilemez. Araç bunları her aday için **manuel kontrol linki**
  olarak rapora koyar (`site:` ve `web.archive.org/web/*/`).
- DA/PA/Spam yalnızca CSV'de varsa kullanılır; yoksa "manuel doldur" işaretlenir.
- Paralı API (Moz/Ahrefs/DataForSEO) eklemek istersen `agents/authority.py`
  içine bir fetch fonksiyonu yazıp `harvester` metriklerini doldurman yeterli.
