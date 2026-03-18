-- ============================================================================
-- seed-apis.sql
-- 100+ Real APIs and 30 GitHub Repos seed data
-- Generated: 2026-03-12
-- Usage: psql -f seed-apis.sql  OR  run via Supabase SQL Editor
-- ============================================================================

-- ==========================================================================
-- FINANS & TRADING (10)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'Alpaca',
  'alpaca',
  'Alpaca, komisyonsuz hisse senedi ve kripto para ticareti yapmanıza olanak tanıyan bir API platformudur. Algoritmik ticaret botları geliştirmek için güçlü bir altyapı sunar ve paper trading desteği ile risksiz test imkanı sağlar.',
  'https://alpaca.markets',
  NULL,
  'Ücretsiz (paper trading), Commission-free live trading',
  (SELECT id FROM categories WHERE slug = 'finans-trading'),
  ARRAY['rest', 'free-tier', 'trading', 'stocks', 'crypto'],
  ARRAY['Commission-free trading', 'Paper trading', 'Real-time market data', 'WebSocket streaming', 'OAuth 2.0'],
  'curl -X GET https://paper-api.alpaca.markets/v2/account \
  -H "APCA-API-KEY-ID: YOUR_KEY" \
  -H "APCA-API-SECRET-KEY: YOUR_SECRET"',
  false, NULL, NULL, NULL
),
(
  'Plaid',
  'plaid',
  'Plaid, banka hesaplarına güvenli bir şekilde bağlanmanızı sağlayan fintech API platformudur. Hesap bakiyesi sorgulama, işlem geçmişi ve kimlik doğrulama gibi bankacılık verilerine kolayca erişim imkanı sunar.',
  'https://plaid.com',
  NULL,
  'Ücretsiz (100 hesap), Production: kullanım başına ücret',
  (SELECT id FROM categories WHERE slug = 'finans-trading'),
  ARRAY['rest', 'fintech', 'banking', 'free-tier'],
  ARRAY['Bank account linking', 'Transaction history', 'Identity verification', 'Balance check', 'ACH transfers'],
  'const { PlaidApi, Configuration } = require(''plaid'');
const client = new PlaidApi(new Configuration({
  basePath: ''https://sandbox.plaid.com'',
  baseOptions: { headers: { ''PLAID-CLIENT-ID'': ''YOUR_ID'', ''PLAID-SECRET'': ''YOUR_SECRET'' } }
}));',
  false, NULL, NULL, NULL
),
(
  'Coinbase',
  'coinbase',
  'Coinbase API, kripto para alım-satım işlemleri gerçekleştirmenize ve portföy yönetimi yapmanıza olanak tanır. Gerçek zamanlı fiyat verileri, cüzdan yönetimi ve ödeme entegrasyonu gibi kapsamlı özellikler sunar.',
  'https://docs.cloud.coinbase.com',
  NULL,
  'Ücretsiz API erişimi, işlem başına komisyon',
  (SELECT id FROM categories WHERE slug = 'finans-trading'),
  ARRAY['rest', 'crypto', 'trading', 'websocket'],
  ARRAY['Real-time prices', 'Wallet management', 'Trading', 'Payment integration', 'WebSocket feeds'],
  'curl https://api.coinbase.com/v2/prices/BTC-USD/spot \
  -H "Authorization: Bearer YOUR_API_KEY"',
  false, NULL, NULL, NULL
),
(
  'Kraken',
  'kraken',
  'Kraken, dünya genelinde en güvenilir kripto para borsalarından biridir ve gelişmiş ticaret API''si sunar. Spot ve vadeli işlemler, marjin ticareti ve staking gibi geniş bir özellik yelpazesi ile profesyonel trader''lara hitap eder.',
  'https://docs.kraken.com/rest',
  NULL,
  'Ücretsiz API erişimi, işlem hacmine göre komisyon',
  (SELECT id FROM categories WHERE slug = 'finans-trading'),
  ARRAY['rest', 'websocket', 'crypto', 'trading'],
  ARRAY['Spot trading', 'Futures trading', 'Margin trading', 'Staking', 'WebSocket v2'],
  'curl "https://api.kraken.com/0/public/Ticker?pair=XBTUSD"',
  false, NULL, NULL, NULL
),
(
  'TradingView',
  'tradingview',
  'TradingView, finansal piyasalar için gelişmiş grafik ve teknik analiz araçları sunan bir platformdur. Widget''ları ve charting library''si ile kendi uygulamanıza profesyonel grafik çözümleri entegre edebilirsiniz.',
  'https://www.tradingview.com/rest-api-spec',
  NULL,
  'Ücretsiz (temel), Pro: $14.95/ay, Premium: $59.95/ay',
  (SELECT id FROM categories WHERE slug = 'finans-trading'),
  ARRAY['rest', 'charts', 'trading', 'widgets'],
  ARRAY['Advanced charting', 'Technical indicators', 'Embeddable widgets', 'Real-time data', 'Pine Script'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'Alpha Vantage',
  'alpha-vantage',
  'Alpha Vantage, hisse senetleri, forex ve kripto paralar için ücretsiz finansal veri API''si sunar. Teknik göstergeler, temel analiz verileri ve zaman serisi verileri ile kapsamlı bir finansal veri kaynağıdır.',
  'https://www.alphavantage.co',
  NULL,
  'Ücretsiz (25 istek/gün), Premium: $49.99/ay',
  (SELECT id FROM categories WHERE slug = 'finans-trading'),
  ARRAY['rest', 'free-tier', 'stocks', 'forex', 'crypto'],
  ARRAY['Time series data', 'Technical indicators', 'Fundamental data', 'Forex rates', 'Crypto data'],
  'curl "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=AAPL&apikey=YOUR_KEY"',
  false, NULL, NULL, NULL
),
(
  'Moralis',
  'moralis',
  'Moralis, Web3 geliştiricileri için kapsamlı bir blockchain veri API''si sunar. NFT verileri, token fiyatları, cüzdan bakiyeleri ve DeFi verileri gibi çok çeşitli blockchain verilerine tek bir API üzerinden erişim sağlar.',
  'https://moralis.io',
  NULL,
  'Ücretsiz (40k istek/ay), Pro: $49/ay',
  (SELECT id FROM categories WHERE slug = 'finans-trading'),
  ARRAY['rest', 'web3', 'blockchain', 'nft', 'free-tier'],
  ARRAY['NFT data', 'Token prices', 'Wallet balances', 'DeFi data', 'Multi-chain support'],
  'curl "https://deep-index.moralis.io/api/v2.2/0x.../balance?chain=eth" \
  -H "X-API-Key: YOUR_KEY"',
  false, NULL, NULL, NULL
),
(
  'Polygon.io',
  'polygon-io',
  'Polygon.io, hisse senetleri, opsiyonlar, forex ve kripto paralar için gerçek zamanlı ve geçmiş piyasa verileri sunan kurumsal düzeyde bir finansal veri API''sidir. WebSocket desteği ile anlık fiyat akışları sağlar.',
  'https://polygon.io',
  NULL,
  'Ücretsiz (5 istek/dk), Starter: $29/ay, Developer: $79/ay',
  (SELECT id FROM categories WHERE slug = 'finans-trading'),
  ARRAY['rest', 'websocket', 'stocks', 'forex', 'crypto', 'free-tier'],
  ARRAY['Real-time data', 'Historical data', 'WebSocket streaming', 'Options data', 'Reference data'],
  'curl "https://api.polygon.io/v2/aggs/ticker/AAPL/prev?apiKey=YOUR_KEY"',
  false, NULL, NULL, NULL
),
(
  'IEX Cloud',
  'iex-cloud',
  'IEX Cloud, finansal veri ve altyapı hizmetleri sunan bir platformdur. Hisse senedi fiyatları, şirket bilgileri, finansal tablolar ve piyasa istatistikleri gibi geniş kapsamlı verilere kolay erişim imkanı sağlar.',
  'https://iexcloud.io',
  NULL,
  'Ücretsiz (temel), Launch: $9/ay, Grow: $49/ay',
  (SELECT id FROM categories WHERE slug = 'finans-trading'),
  ARRAY['rest', 'stocks', 'financial-data', 'free-tier'],
  ARRAY['Stock prices', 'Company info', 'Financial statements', 'Market stats', 'Batch requests'],
  'curl "https://cloud.iexapis.com/stable/stock/AAPL/quote?token=YOUR_TOKEN"',
  false, NULL, NULL, NULL
),
(
  'Yahoo Finance API',
  'yahoo-finance-api',
  'Yahoo Finance API (gayri resmi), Yahoo Finance verilerine programatik erişim sağlar. Hisse senedi fiyatları, geçmiş veriler, finansal tablolar ve piyasa haberleri gibi kapsamlı finansal bilgilere erişim sunar.',
  'https://finance.yahoo.com',
  NULL,
  'Ücretsiz (gayri resmi), RapidAPI üzerinden çeşitli planlar',
  (SELECT id FROM categories WHERE slug = 'finans-trading'),
  ARRAY['rest', 'stocks', 'financial-data', 'free-tier'],
  ARRAY['Stock quotes', 'Historical data', 'Financial statements', 'Market news', 'Options data'],
  'curl "https://query1.finance.yahoo.com/v8/finance/chart/AAPL?interval=1d&range=5d"',
  false, NULL, NULL, NULL
)
ON CONFLICT (slug) DO NOTHING;

-- ==========================================================================
-- AI & ML (10)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'Replicate',
  'replicate',
  'Replicate, açık kaynak makine öğrenmesi modellerini bulut üzerinde kolayca çalıştırmanıza olanak tanır. Stable Diffusion, LLaMA ve binlerce diğer modeli API üzerinden saniyeler içinde kullanabilirsiniz.',
  'https://replicate.com',
  NULL,
  'Kullanım başına ücret, GPU süresine göre fiyatlandırma',
  (SELECT id FROM categories WHERE slug = 'ai-ml'),
  ARRAY['rest', 'ai', 'ml', 'image-generation', 'llm'],
  ARRAY['Run open-source models', 'Auto-scaling', 'Fine-tuning', 'Streaming', 'Webhooks'],
  'curl -s -X POST https://api.replicate.com/v1/predictions \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d ''{"version": "MODEL_VERSION", "input": {"prompt": "a photo of an astronaut"}}''',
  false, NULL, NULL, NULL
),
(
  'Stability AI',
  'stability-ai',
  'Stability AI, Stable Diffusion modellerinin arkasındaki şirkettir ve güçlü görsel üretim API''leri sunar. Metin-görsel dönüşümü, görsel düzenleme, upscaling ve video üretimi gibi gelişmiş yapay zeka özellikleri sağlar.',
  'https://platform.stability.ai',
  NULL,
  'Ücretsiz (25 kredi/gün), $10/1000 kredi',
  (SELECT id FROM categories WHERE slug = 'ai-ml'),
  ARRAY['rest', 'ai', 'image-generation', 'stable-diffusion'],
  ARRAY['Text-to-image', 'Image-to-image', 'Upscaling', 'Inpainting', 'SDXL support'],
  'curl -X POST https://api.stability.ai/v1/generation/stable-diffusion-xl-1024-v1-0/text-to-image \
  -H "Authorization: Bearer YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d ''{"text_prompts": [{"text": "A sunset over mountains"}]}''',
  false, NULL, NULL, NULL
),
(
  'Cohere',
  'cohere',
  'Cohere, kurumsal düzeyde doğal dil işleme (NLP) API''leri sunan bir yapay zeka platformudur. Metin üretimi, embedding, sınıflandırma ve yeniden sıralama gibi NLP görevleri için optimize edilmiş modeller sağlar.',
  'https://cohere.com',
  NULL,
  'Ücretsiz (deneme), Production: $1/1M token',
  (SELECT id FROM categories WHERE slug = 'ai-ml'),
  ARRAY['rest', 'ai', 'nlp', 'embeddings', 'free-tier'],
  ARRAY['Text generation', 'Embeddings', 'Classification', 'Reranking', 'RAG support'],
  'curl https://api.cohere.ai/v1/generate \
  -H "Authorization: Bearer YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d ''{"model": "command", "prompt": "Explain quantum computing"}''',
  false, NULL, NULL, NULL
),
(
  'Mistral AI',
  'mistral-ai',
  'Mistral AI, Avrupa''nın önde gelen yapay zeka şirketidir ve açık ağırlıklı dil modelleri sunar. Mistral, Mixtral ve Codestral gibi modelleri ile yüksek performanslı metin üretimi ve kod yazımı sağlar.',
  'https://mistral.ai',
  NULL,
  'Ücretsiz (temel modeller), $2-8/1M token (premium modeller)',
  (SELECT id FROM categories WHERE slug = 'ai-ml'),
  ARRAY['rest', 'ai', 'llm', 'open-source', 'free-tier'],
  ARRAY['Chat completion', 'Code generation', 'Function calling', 'JSON mode', 'Streaming'],
  'curl https://api.mistral.ai/v1/chat/completions \
  -H "Authorization: Bearer YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d ''{"model": "mistral-large-latest", "messages": [{"role": "user", "content": "Hello"}]}''',
  false, NULL, NULL, NULL
),
(
  'Groq',
  'groq',
  'Groq, LPU (Language Processing Unit) teknolojisi ile ultra hızlı yapay zeka çıkarımı sunar. Llama, Mixtral ve Gemma gibi açık kaynak modelleri rakipsiz hızda çalıştırarak anlık yanıt süreleri sağlar.',
  'https://groq.com',
  NULL,
  'Ücretsiz (sınırlı), On-demand fiyatlandırma',
  (SELECT id FROM categories WHERE slug = 'ai-ml'),
  ARRAY['rest', 'ai', 'llm', 'fast-inference', 'free-tier'],
  ARRAY['Ultra-fast inference', 'OpenAI compatible', 'Streaming', 'Function calling', 'JSON mode'],
  'curl https://api.groq.com/openai/v1/chat/completions \
  -H "Authorization: Bearer YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d ''{"model": "llama-3.3-70b-versatile", "messages": [{"role": "user", "content": "Hi"}]}''',
  false, NULL, NULL, NULL
),
(
  'DeepL',
  'deepl',
  'DeepL, yapay zeka destekli dünyanın en doğru çeviri API''sidir. 30''dan fazla dil desteği ile profesyonel düzeyde metin çevirisi ve belge çevirisi hizmetleri sunar.',
  'https://www.deepl.com/pro-api',
  NULL,
  'Ücretsiz (500k karakter/ay), Pro: $5.49/ay + kullanım',
  (SELECT id FROM categories WHERE slug = 'ai-ml'),
  ARRAY['rest', 'ai', 'translation', 'nlp', 'free-tier'],
  ARRAY['Text translation', 'Document translation', '30+ languages', 'Glossary support', 'Formality control'],
  'curl -X POST https://api-free.deepl.com/v2/translate \
  -d "auth_key=YOUR_KEY" \
  -d "text=Hello, world!" \
  -d "target_lang=TR"',
  false, NULL, NULL, NULL
),
(
  'AssemblyAI',
  'assemblyai',
  'AssemblyAI, konuşmayı metne çeviren güçlü bir yapay zeka API''sidir. Otomatik konuşma tanıma, konuşmacı ayrımı, duygu analizi ve içerik moderasyonu gibi gelişmiş ses işleme özellikleri sunar.',
  'https://www.assemblyai.com',
  NULL,
  'Ücretsiz (deneme), $0.37/saat (transkripsiyon)',
  (SELECT id FROM categories WHERE slug = 'ai-ml'),
  ARRAY['rest', 'ai', 'speech-to-text', 'audio'],
  ARRAY['Speech-to-text', 'Speaker diarization', 'Sentiment analysis', 'Content moderation', 'Real-time transcription'],
  'curl https://api.assemblyai.com/v2/transcript \
  -H "Authorization: YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d ''{"audio_url": "https://example.com/audio.mp3"}''',
  false, NULL, NULL, NULL
),
(
  'ElevenLabs',
  'elevenlabs',
  'ElevenLabs, yapay zeka ile gerçekçi ses üretimi ve metin-konuşma dönüşümü sağlayan bir platformdur. Ses klonlama, çok dilli konuşma sentezi ve ses dubbing gibi ileri düzey ses teknolojileri sunar.',
  'https://elevenlabs.io',
  NULL,
  'Ücretsiz (10k karakter/ay), Starter: $5/ay, Creator: $22/ay',
  (SELECT id FROM categories WHERE slug = 'ai-ml'),
  ARRAY['rest', 'ai', 'text-to-speech', 'voice-cloning', 'free-tier'],
  ARRAY['Text-to-speech', 'Voice cloning', 'Multi-language', 'Streaming audio', 'Voice dubbing'],
  'curl -X POST https://api.elevenlabs.io/v1/text-to-speech/VOICE_ID \
  -H "xi-api-key: YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d ''{"text": "Merhaba dünya!", "model_id": "eleven_multilingual_v2"}''',
  false, NULL, NULL, NULL
),
(
  'Perplexity',
  'perplexity',
  'Perplexity AI, internet araması ile güçlendirilmiş yapay zeka API''si sunar. Güncel bilgilere erişebilen ve kaynak gösterebilen AI yanıtları üreterek araştırma ve bilgi sorgulama görevlerinde üstün performans sağlar.',
  'https://docs.perplexity.ai',
  NULL,
  'Ücretsiz (sınırlı), Pro: $20/ay, API: kullanım başına',
  (SELECT id FROM categories WHERE slug = 'ai-ml'),
  ARRAY['rest', 'ai', 'llm', 'search', 'rag'],
  ARRAY['Online LLM', 'Citation support', 'Web search grounding', 'OpenAI compatible', 'Streaming'],
  'curl https://api.perplexity.ai/chat/completions \
  -H "Authorization: Bearer YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d ''{"model": "sonar-pro", "messages": [{"role": "user", "content": "Latest AI news?"}]}''',
  false, NULL, NULL, NULL
),
(
  'Together AI',
  'together-ai',
  'Together AI, açık kaynak yapay zeka modellerini yüksek performansla çalıştırmak için optimize edilmiş bir bulut platformudur. 100''den fazla model desteği, fine-tuning ve özel model eğitimi imkanları sunar.',
  'https://together.ai',
  NULL,
  'Ücretsiz ($5 kredi), Kullanım başına ücretlendirme',
  (SELECT id FROM categories WHERE slug = 'ai-ml'),
  ARRAY['rest', 'ai', 'llm', 'open-source', 'free-tier'],
  ARRAY['100+ models', 'Fine-tuning', 'Custom training', 'OpenAI compatible', 'Serverless inference'],
  NULL,
  false, NULL, NULL, NULL
)
ON CONFLICT (slug) DO NOTHING;

-- ==========================================================================
-- GELİŞTİRİCİ ARAÇLARI (10)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'Vercel API',
  'vercel-api',
  'Vercel API, deployment yönetimi, domain yapılandırması ve proje ayarları gibi Vercel platform özelliklerine programatik erişim sağlar. CI/CD otomasyonu ve sunucusuz fonksiyon yönetimi için güçlü araçlar sunar.',
  'https://vercel.com/docs/rest-api',
  NULL,
  'Ücretsiz (Hobby), Pro: $20/ay',
  (SELECT id FROM categories WHERE slug = 'gelistirici-araclari'),
  ARRAY['rest', 'deployment', 'serverless', 'free-tier'],
  ARRAY['Deployment management', 'Domain config', 'Environment variables', 'Serverless functions', 'Edge config'],
  'curl https://api.vercel.com/v9/projects \
  -H "Authorization: Bearer YOUR_TOKEN"',
  false, NULL, NULL, NULL
),
(
  'Netlify API',
  'netlify-api',
  'Netlify API, web sitesi deployment''ları, form gönderileri, split testing ve build hook''ları gibi Netlify platform özelliklerini kontrol etmenize olanak tanır. JAMstack uygulamalarını otomatik olarak yönetmek için idealdir.',
  'https://docs.netlify.com/api',
  NULL,
  'Ücretsiz (Starter), Pro: $19/ay',
  (SELECT id FROM categories WHERE slug = 'gelistirici-araclari'),
  ARRAY['rest', 'deployment', 'jamstack', 'free-tier'],
  ARRAY['Site deployment', 'Form handling', 'Split testing', 'Build hooks', 'DNS management'],
  'curl https://api.netlify.com/api/v1/sites \
  -H "Authorization: Bearer YOUR_TOKEN"',
  false, NULL, NULL, NULL
),
(
  'Cloudflare API',
  'cloudflare-api',
  'Cloudflare API, DNS yönetimi, CDN yapılandırması, güvenlik duvarı kuralları ve Workers gibi Cloudflare hizmetlerini programatik olarak kontrol etmenizi sağlar. Web performansı ve güvenliği için kapsamlı araçlar sunar.',
  'https://developers.cloudflare.com/api',
  NULL,
  'Ücretsiz (temel), Pro: $20/ay, Business: $200/ay',
  (SELECT id FROM categories WHERE slug = 'gelistirici-araclari'),
  ARRAY['rest', 'cdn', 'dns', 'security', 'free-tier'],
  ARRAY['DNS management', 'CDN config', 'Firewall rules', 'Workers', 'Page rules'],
  'curl https://api.cloudflare.com/client/v4/zones \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json"',
  false, NULL, NULL, NULL
),
(
  'Docker Hub API',
  'docker-hub-api',
  'Docker Hub API, container image''larını arama, çekme ve yönetme işlemlerini programatik olarak yapmanızı sağlar. Repository yönetimi, image tag''leri ve otomatik build yapılandırması gibi özellikler sunar.',
  'https://docs.docker.com/docker-hub/api',
  NULL,
  'Ücretsiz (1 özel repo), Pro: $5/ay',
  (SELECT id FROM categories WHERE slug = 'gelistirici-araclari'),
  ARRAY['rest', 'docker', 'containers', 'free-tier'],
  ARRAY['Image search', 'Repository management', 'Automated builds', 'Webhooks', 'Image scanning'],
  'curl "https://hub.docker.com/v2/repositories/library/node/tags/?page_size=10"',
  false, NULL, NULL, NULL
),
(
  'NPM Registry',
  'npm-registry',
  'NPM Registry API, Node.js paket ekosistemindeki milyonlarca pakete programatik erişim sağlar. Paket arama, versiyon bilgileri, indirme istatistikleri ve bağımlılık analizi gibi özellikler sunar.',
  'https://github.com/npm/registry',
  NULL,
  'Ücretsiz (genel paketler), npm Pro: $7/ay',
  (SELECT id FROM categories WHERE slug = 'gelistirici-araclari'),
  ARRAY['rest', 'npm', 'nodejs', 'packages', 'free-tier'],
  ARRAY['Package search', 'Version info', 'Download stats', 'Dependency analysis', 'Publish packages'],
  'curl "https://registry.npmjs.org/react/latest"',
  false, NULL, NULL, NULL
),
(
  'Sentry',
  'sentry',
  'Sentry, uygulama hata izleme ve performans takibi için kullanılan kapsamlı bir platformdur. Gerçek zamanlı hata raporlama, yığın izleme analizi ve kullanıcı oturum tekrarları ile hataları hızlıca tespit edip çözmenizi sağlar.',
  'https://docs.sentry.io/api',
  NULL,
  'Ücretsiz (5K event/ay), Team: $26/ay, Business: $80/ay',
  (SELECT id FROM categories WHERE slug = 'gelistirici-araclari'),
  ARRAY['rest', 'error-tracking', 'monitoring', 'free-tier'],
  ARRAY['Error tracking', 'Performance monitoring', 'Session replay', 'Release tracking', 'Alerting'],
  'curl https://sentry.io/api/0/projects/ \
  -H "Authorization: Bearer YOUR_AUTH_TOKEN"',
  false, NULL, NULL, NULL
),
(
  'PostHog',
  'posthog',
  'PostHog, açık kaynaklı ürün analitik platformudur ve event tracking, session recording, feature flagler ve A/B testleri gibi kapsamlı araçlar sunar. Kendi sunucunuzda barındırma imkanı ile veri gizliliği sağlar.',
  'https://posthog.com/docs/api',
  NULL,
  'Ücretsiz (1M event/ay), Ücretli planlar kullanıma göre',
  (SELECT id FROM categories WHERE slug = 'gelistirici-araclari'),
  ARRAY['rest', 'analytics', 'open-source', 'free-tier'],
  ARRAY['Event tracking', 'Session recording', 'Feature flags', 'A/B testing', 'Self-hosting'],
  'curl https://app.posthog.com/api/event/ \
  -H "Authorization: Bearer YOUR_KEY"',
  false, NULL, NULL, NULL
),
(
  'Supabase API',
  'supabase-api',
  'Supabase, Firebase''e açık kaynaklı bir alternatif olarak PostgreSQL tabanlı backend hizmetleri sunar. Veritabanı, kimlik doğrulama, dosya depolama, gerçek zamanlı abonelikler ve Edge Functions gibi kapsamlı özellikler sağlar.',
  'https://supabase.com/docs/guides/api',
  NULL,
  'Ücretsiz (500MB DB), Pro: $25/ay',
  (SELECT id FROM categories WHERE slug = 'gelistirici-araclari'),
  ARRAY['rest', 'graphql', 'postgresql', 'open-source', 'free-tier', 'realtime'],
  ARRAY['Auto-generated REST API', 'Realtime subscriptions', 'Auth', 'Storage', 'Edge Functions'],
  'import { createClient } from ''@supabase/supabase-js''
const supabase = createClient(''YOUR_URL'', ''YOUR_KEY'')
const { data } = await supabase.from(''posts'').select(''*'')',
  false, NULL, NULL, NULL
),
(
  'PlanetScale',
  'planetscale',
  'PlanetScale, MySQL uyumlu sunucusuz veritabanı platformudur ve Git benzeri branching özelliği sunar. Sıfır kesinti süreli şema değişiklikleri, otomatik ölçeklendirme ve global dağıtım ile modern uygulama geliştirme için idealdir.',
  'https://planetscale.com/docs/reference/api',
  NULL,
  'Ücretsiz (5GB), Scaler: $29/ay',
  (SELECT id FROM categories WHERE slug = 'gelistirici-araclari'),
  ARRAY['rest', 'mysql', 'database', 'serverless', 'free-tier'],
  ARRAY['Database branching', 'Zero-downtime migrations', 'Auto-scaling', 'Global deployment', 'Query insights'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'Neon',
  'neon',
  'Neon, sunucusuz PostgreSQL veritabanı platformudur ve otomatik ölçeklendirme, branching ve sıfıra kadar küçülme gibi modern özellikler sunar. Vercel ve diğer platformlarla derin entegrasyon sağlar.',
  'https://neon.tech/docs/reference/api-reference',
  NULL,
  'Ücretsiz (0.5GB), Launch: $19/ay',
  (SELECT id FROM categories WHERE slug = 'gelistirici-araclari'),
  ARRAY['rest', 'postgresql', 'serverless', 'database', 'free-tier'],
  ARRAY['Serverless PostgreSQL', 'Auto-scaling', 'Database branching', 'Scale to zero', 'Vercel integration'],
  NULL,
  false, NULL, NULL, NULL
)
ON CONFLICT (slug) DO NOTHING;

-- ==========================================================================
-- SOSYAL MEDYA (8)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'Twitter/X API',
  'twitter-x-api',
  'Twitter/X API, tweet gönderme, kullanıcı bilgilerini sorgulama, timeline okuma ve gerçek zamanlı akış gibi X platformunun temel özelliklerine programatik erişim sağlar. Bot geliştirme ve sosyal medya analizi için yaygın olarak kullanılır.',
  'https://developer.x.com/en/docs',
  NULL,
  'Ücretsiz (temel okuma), Basic: $100/ay, Pro: $5000/ay',
  (SELECT id FROM categories WHERE slug = 'sosyal-medya'),
  ARRAY['rest', 'social-media', 'streaming', 'oauth2'],
  ARRAY['Tweet management', 'User lookup', 'Streaming', 'Spaces', 'Direct Messages'],
  'curl "https://api.twitter.com/2/tweets?ids=1234567890" \
  -H "Authorization: Bearer YOUR_BEARER_TOKEN"',
  false, NULL, NULL, NULL
),
(
  'Discord API',
  'discord-api',
  'Discord API, sunucu yönetimi, mesaj gönderme, ses kanalları ve bot geliştirme gibi Discord platformunun tüm özelliklerine erişim sağlar. Slash komutları, webhook''lar ve Gateway bağlantıları ile zengin bot deneyimleri oluşturabilirsiniz.',
  'https://discord.com/developers/docs',
  NULL,
  'Ücretsiz',
  (SELECT id FROM categories WHERE slug = 'sosyal-medya'),
  ARRAY['rest', 'websocket', 'social-media', 'bots', 'free-tier'],
  ARRAY['Bot development', 'Slash commands', 'Webhooks', 'Gateway (WebSocket)', 'Voice support'],
  'curl -X POST "https://discord.com/api/v10/channels/CHANNEL_ID/messages" \
  -H "Authorization: Bot YOUR_BOT_TOKEN" \
  -H "Content-Type: application/json" \
  -d ''{"content": "Hello from API!"}''',
  false, NULL, NULL, NULL
),
(
  'Telegram Bot API',
  'telegram-bot-api',
  'Telegram Bot API, Telegram platformunda bot oluşturmak ve yönetmek için kullanılan resmi API''dir. Mesaj gönderme, inline sorguları, ödeme entegrasyonu ve grup yönetimi gibi kapsamlı bot geliştirme araçları sunar.',
  'https://core.telegram.org/bots/api',
  NULL,
  'Ücretsiz',
  (SELECT id FROM categories WHERE slug = 'sosyal-medya'),
  ARRAY['rest', 'bots', 'messaging', 'free-tier'],
  ARRAY['Message sending', 'Inline queries', 'Payment integration', 'Group management', 'File sharing'],
  'curl "https://api.telegram.org/botYOUR_TOKEN/sendMessage?chat_id=CHAT_ID&text=Hello"',
  false, NULL, NULL, NULL
),
(
  'Reddit API',
  'reddit-api',
  'Reddit API, subreddit''lere erişim, gönderi oluşturma, yorum okuma ve kullanıcı verilerini sorgulama gibi Reddit platformunun özelliklerine programatik erişim sağlar. İçerik analizi ve topluluk yönetimi için kullanılır.',
  'https://www.reddit.com/dev/api',
  NULL,
  'Ücretsiz (100 istek/dk), Ücretli planlar yüksek hacim için',
  (SELECT id FROM categories WHERE slug = 'sosyal-medya'),
  ARRAY['rest', 'social-media', 'oauth2', 'free-tier'],
  ARRAY['Subreddit access', 'Post creation', 'Comment threads', 'User data', 'Voting'],
  'curl "https://oauth.reddit.com/r/programming/hot" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "User-Agent: MyApp/1.0"',
  false, NULL, NULL, NULL
),
(
  'YouTube Data API',
  'youtube-data-api',
  'YouTube Data API, video arama, kanal bilgileri, oynatma listeleri ve yorum yönetimi gibi YouTube platformunun verilerine erişim sağlar. Video analitikleri ve içerik yönetimi için Google Cloud üzerinden sunulur.',
  'https://developers.google.com/youtube/v3',
  NULL,
  'Ücretsiz (10.000 birim/gün)',
  (SELECT id FROM categories WHERE slug = 'sosyal-medya'),
  ARRAY['rest', 'video', 'google', 'free-tier'],
  ARRAY['Video search', 'Channel info', 'Playlists', 'Comments', 'Analytics'],
  'curl "https://www.googleapis.com/youtube/v3/search?part=snippet&q=coding&key=YOUR_KEY"',
  false, NULL, NULL, NULL
),
(
  'Instagram Graph API',
  'instagram-graph-api',
  'Instagram Graph API, işletme ve içerik üreticisi hesapları için medya yönetimi, profil bilgileri ve yorum moderasyonu gibi özelliklere erişim sağlar. Meta Developer Platform üzerinden sunulan resmi API''dir.',
  'https://developers.facebook.com/docs/instagram-api',
  NULL,
  'Ücretsiz (Meta Developer hesabı ile)',
  (SELECT id FROM categories WHERE slug = 'sosyal-medya'),
  ARRAY['rest', 'social-media', 'meta', 'oauth2'],
  ARRAY['Media management', 'Insights', 'Comment moderation', 'Content publishing', 'Story insights'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'TikTok API',
  'tiktok-api',
  'TikTok API, video paylaşımı, kullanıcı verilerine erişim ve reklam yönetimi gibi TikTok platformunun özelliklerini uygulamalarınıza entegre etmenizi sağlar. Login Kit ve Share Kit gibi araçlar sunar.',
  'https://developers.tiktok.com',
  NULL,
  'Ücretsiz (geliştirici hesabı ile)',
  (SELECT id FROM categories WHERE slug = 'sosyal-medya'),
  ARRAY['rest', 'social-media', 'video', 'oauth2'],
  ARRAY['Login Kit', 'Share Kit', 'Video upload', 'User info', 'Sound library'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'LinkedIn API',
  'linkedin-api',
  'LinkedIn API, profil bilgilerine erişim, gönderi paylaşımı, şirket sayfaları yönetimi ve mesajlaşma gibi LinkedIn platformunun profesyonel ağ özelliklerini uygulamalarınıza entegre etmenizi sağlar.',
  'https://learn.microsoft.com/en-us/linkedin',
  NULL,
  'Ücretsiz (onaylı uygulamalar için)',
  (SELECT id FROM categories WHERE slug = 'sosyal-medya'),
  ARRAY['rest', 'social-media', 'professional', 'oauth2'],
  ARRAY['Profile access', 'Post sharing', 'Company pages', 'Messaging', 'Jobs API'],
  NULL,
  false, NULL, NULL, NULL
)
ON CONFLICT (slug) DO NOTHING;

-- ==========================================================================
-- E-TİCARET (6)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'WooCommerce',
  'woocommerce',
  'WooCommerce REST API, WordPress tabanlı e-ticaret mağazanızı programatik olarak yönetmenizi sağlar. Ürün, sipariş, müşteri ve kupon yönetimi gibi kapsamlı mağaza operasyonlarına API üzerinden erişim sunar.',
  'https://woocommerce.github.io/woocommerce-rest-api-docs',
  NULL,
  'Ücretsiz (açık kaynak)',
  (SELECT id FROM categories WHERE slug = 'e-ticaret'),
  ARRAY['rest', 'e-commerce', 'wordpress', 'open-source', 'free-tier'],
  ARRAY['Product management', 'Order management', 'Customer management', 'Coupon management', 'Webhooks'],
  'curl https://example.com/wp-json/wc/v3/products \
  -u consumer_key:consumer_secret',
  false, NULL, NULL, NULL
),
(
  'Paddle',
  'paddle',
  'Paddle, SaaS şirketleri için tam kapsamlı ödeme altyapısı sunan bir platformdur. Abonelik yönetimi, vergi hesaplama, faturalama ve global ödeme işleme gibi karmaşık ödeme süreçlerini basitleştirir.',
  'https://developer.paddle.com',
  NULL,
  'İşlem başına %5 + $0.50',
  (SELECT id FROM categories WHERE slug = 'e-ticaret'),
  ARRAY['rest', 'payments', 'saas', 'subscriptions'],
  ARRAY['Subscription management', 'Tax calculation', 'Invoicing', 'Global payments', 'Checkout overlay'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'Gumroad',
  'gumroad',
  'Gumroad API, dijital ürün satışı ve abonelik yönetimi için kullanılan basit bir e-ticaret platformudur. Ürün oluşturma, satış takibi, lisans doğrulama ve webhook entegrasyonu gibi özellikler sunar.',
  'https://app.gumroad.com/api',
  NULL,
  '%10 işlem komisyonu',
  (SELECT id FROM categories WHERE slug = 'e-ticaret'),
  ARRAY['rest', 'e-commerce', 'digital-products'],
  ARRAY['Product management', 'Sales tracking', 'License verification', 'Webhooks', 'Subscription management'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'LemonSqueezy',
  'lemonsqueezy',
  'LemonSqueezy, dijital ürünler ve SaaS abonelikleri için modern bir ödeme platformudur. Vergi uyumluluğu, abonelik yönetimi, lisanslama ve checkout deneyimi gibi kapsamlı satış araçları sunar.',
  'https://docs.lemonsqueezy.com/api',
  NULL,
  '%5 + $0.50 işlem başına',
  (SELECT id FROM categories WHERE slug = 'e-ticaret'),
  ARRAY['rest', 'payments', 'saas', 'digital-products'],
  ARRAY['Subscription management', 'Tax compliance', 'License keys', 'Checkout overlay', 'Webhooks'],
  'curl https://api.lemonsqueezy.com/v1/products \
  -H "Authorization: Bearer YOUR_KEY" \
  -H "Accept: application/vnd.api+json"',
  false, NULL, NULL, NULL
),
(
  'PayPal API',
  'paypal-api',
  'PayPal API, online ödeme işlemleri, faturalama ve para transferi için dünyanın en yaygın ödeme platformlarından birinin programatik erişim arayüzüdür. Checkout entegrasyonu, abonelik yönetimi ve anlaşmazlık çözümü gibi kapsamlı ödeme araçları sunar.',
  'https://developer.paypal.com/docs/api/overview',
  NULL,
  'İşlem başına %2.9 + $0.30 (değişken)',
  (SELECT id FROM categories WHERE slug = 'e-ticaret'),
  ARRAY['rest', 'payments', 'global'],
  ARRAY['Checkout', 'Subscriptions', 'Invoicing', 'Payouts', 'Disputes API'],
  'curl -X POST https://api-m.sandbox.paypal.com/v2/checkout/orders \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN" \
  -H "Content-Type: application/json" \
  -d ''{"intent": "CAPTURE", "purchase_units": [{"amount": {"currency_code": "USD", "value": "10.00"}}]}''',
  false, NULL, NULL, NULL
),
(
  'Square API',
  'square-api',
  'Square API, ödeme işleme, envanter yönetimi, müşteri ilişkileri ve çalışan yönetimi gibi kapsamlı ticaret çözümleri sunar. Fiziksel ve online satış noktalarını birleştiren omnichannel ticaret altyapısı sağlar.',
  'https://developer.squareup.com',
  NULL,
  'İşlem başına %2.6 + $0.10',
  (SELECT id FROM categories WHERE slug = 'e-ticaret'),
  ARRAY['rest', 'payments', 'pos', 'e-commerce'],
  ARRAY['Payment processing', 'Inventory management', 'Customer directory', 'Team management', 'Loyalty programs'],
  NULL,
  false, NULL, NULL, NULL
)
ON CONFLICT (slug) DO NOTHING;

-- ==========================================================================
-- HARİTA & KONUM (4)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'Mapbox',
  'mapbox',
  'Mapbox, özelleştirilebilir haritalar, navigasyon, geocoding ve konum tabanlı hizmetler sunan güçlü bir harita platformudur. Mobil ve web uygulamaları için yüksek performanslı harita render''lama ve veri görselleştirme araçları sağlar.',
  'https://docs.mapbox.com/api',
  NULL,
  'Ücretsiz (50k harita yüklemesi/ay), Kullanım başına ücret',
  (SELECT id FROM categories WHERE slug = 'harita-konum'),
  ARRAY['rest', 'maps', 'geocoding', 'navigation', 'free-tier'],
  ARRAY['Custom maps', 'Geocoding', 'Navigation', 'Static images', 'Isochrone API'],
  'curl "https://api.mapbox.com/geocoding/v5/mapbox.places/Istanbul.json?access_token=YOUR_TOKEN"',
  false, NULL, NULL, NULL
),
(
  'HERE API',
  'here-api',
  'HERE API, konum hizmetleri, harita görüntüleme, rota hesaplama ve trafik bilgileri sunan kurumsal düzeyde bir konum platformudur. Lojistik, ulaşım ve araç takibi gibi endüstriyel kullanım senaryoları için optimize edilmiştir.',
  'https://developer.here.com',
  NULL,
  'Ücretsiz (250k istek/ay), Kullanım başına ücret',
  (SELECT id FROM categories WHERE slug = 'harita-konum'),
  ARRAY['rest', 'maps', 'routing', 'traffic', 'free-tier'],
  ARRAY['Map display', 'Routing', 'Traffic info', 'Geocoding', 'Fleet management'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'TomTom',
  'tomtom',
  'TomTom API, navigasyon, trafik bilgileri, harita görüntüleme ve geocoding hizmetleri sunan bir konum teknolojisi platformudur. Gerçek zamanlı trafik verileri ve EV şarj istasyonu bilgileri ile öne çıkar.',
  'https://developer.tomtom.com',
  NULL,
  'Ücretsiz (2.500 istek/gün), Kullanım başına ücret',
  (SELECT id FROM categories WHERE slug = 'harita-konum'),
  ARRAY['rest', 'maps', 'navigation', 'traffic', 'free-tier'],
  ARRAY['Maps SDK', 'Routing', 'Real-time traffic', 'Geocoding', 'EV charging stations'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'Leaflet',
  'leaflet',
  'Leaflet, mobil uyumlu interaktif haritalar için kullanılan en popüler açık kaynaklı JavaScript kütüphanesidir. Hafif yapısı, geniş eklenti ekosistemi ve kolay kullanımı ile web harita uygulamaları geliştirmek için idealdir.',
  'https://github.com/Leaflet/Leaflet',
  NULL,
  'Ücretsiz (açık kaynak)',
  (SELECT id FROM categories WHERE slug = 'harita-konum'),
  ARRAY['javascript', 'maps', 'open-source', 'free-tier'],
  ARRAY['Interactive maps', 'Mobile-friendly', 'Plugin ecosystem', 'GeoJSON support', 'Lightweight'],
  NULL,
  true, 'https://github.com/Leaflet/Leaflet', 42000, 5800
)
ON CONFLICT (slug) DO NOTHING;

-- ==========================================================================
-- HAVA DURUMU (3)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'WeatherAPI',
  'weatherapi',
  'WeatherAPI, güncel hava durumu, tahminler, geçmiş veriler ve astronomi bilgileri sunan kapsamlı bir hava durumu API''sidir. 3 günlük ücretsiz tahmin, hava kalitesi indeksi ve spor uygunluğu gibi zengin veri setleri sağlar.',
  'https://www.weatherapi.com',
  NULL,
  'Ücretsiz (1M istek/ay), Pro: $4/ay',
  (SELECT id FROM categories WHERE slug = 'hava-durumu'),
  ARRAY['rest', 'weather', 'forecast', 'free-tier'],
  ARRAY['Current weather', 'Forecast', 'Historical data', 'Air quality', 'Astronomy'],
  'curl "https://api.weatherapi.com/v1/current.json?key=YOUR_KEY&q=Istanbul"',
  false, NULL, NULL, NULL
),
(
  'Visual Crossing',
  'visual-crossing',
  'Visual Crossing Weather API, geçmiş, güncel ve tahmini hava durumu verilerini tek bir API üzerinden sunar. 50 yıllık geçmiş veri arşivi, saatlik tahminler ve hava olayı uyarıları ile kapsamlı meteorolojik veriler sağlar.',
  'https://www.visualcrossing.com/weather-api',
  NULL,
  'Ücretsiz (1000 istek/gün), Professional: $35/ay',
  (SELECT id FROM categories WHERE slug = 'hava-durumu'),
  ARRAY['rest', 'weather', 'historical-data', 'free-tier'],
  ARRAY['Historical data (50 years)', 'Hourly forecast', 'Weather alerts', 'Climate data', 'Batch requests'],
  'curl "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Istanbul?key=YOUR_KEY"',
  false, NULL, NULL, NULL
),
(
  'Tomorrow.io',
  'tomorrow-io',
  'Tomorrow.io (eski adıyla Climacell), dakika bazında yağış tahmini, hava kalitesi ve şiddetli hava uyarıları sunan ileri düzey bir hava durumu API''sidir. Micro-weather teknolojisi ile yüksek çözünürlüklü yerel tahminler sağlar.',
  'https://docs.tomorrow.io',
  NULL,
  'Ücretsiz (500 istek/gün), Basic: $25/ay',
  (SELECT id FROM categories WHERE slug = 'hava-durumu'),
  ARRAY['rest', 'weather', 'forecast', 'free-tier'],
  ARRAY['Minute-by-minute precipitation', 'Air quality', 'Severe weather alerts', 'Pollen data', 'Fire index'],
  NULL,
  false, NULL, NULL, NULL
)
ON CONFLICT (slug) DO NOTHING;

-- ==========================================================================
-- İLETİŞİM (6)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'SendGrid',
  'sendgrid',
  'SendGrid (Twilio), yüksek hacimli e-posta gönderimi için kullanılan güvenilir bir e-posta API''sidir. Transactional ve marketing e-postaları, şablon yönetimi, analytics ve teslim edilebilirlik optimizasyonu gibi kapsamlı özellikler sunar.',
  'https://docs.sendgrid.com/api-reference',
  NULL,
  'Ücretsiz (100 e-posta/gün), Essentials: $19.95/ay',
  (SELECT id FROM categories WHERE slug = 'iletisim'),
  ARRAY['rest', 'email', 'messaging', 'free-tier'],
  ARRAY['Transactional email', 'Marketing campaigns', 'Email templates', 'Analytics', 'Deliverability tools'],
  'curl -X POST https://api.sendgrid.com/v3/mail/send \
  -H "Authorization: Bearer YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d ''{"personalizations": [{"to": [{"email": "test@example.com"}]}], "from": {"email": "sender@example.com"}, "subject": "Hello", "content": [{"type": "text/plain", "value": "Test"}]}''',
  false, NULL, NULL, NULL
),
(
  'Mailgun',
  'mailgun',
  'Mailgun, geliştiriciler için tasarlanmış güçlü bir e-posta gönderim API''sidir. E-posta doğrulama, yönlendirme, izleme ve log analizi gibi gelişmiş özellikler ile yüksek teslim edilebilirlik oranları sağlar.',
  'https://documentation.mailgun.com',
  NULL,
  'Ücretsiz (100 e-posta/gün deneme), Foundation: $35/ay',
  (SELECT id FROM categories WHERE slug = 'iletisim'),
  ARRAY['rest', 'email', 'messaging'],
  ARRAY['Email sending', 'Email validation', 'Routing', 'Tracking', 'Log analysis'],
  'curl -s --user ''api:YOUR_KEY'' \
  https://api.mailgun.net/v3/YOUR_DOMAIN/messages \
  -F from=''sender@example.com'' \
  -F to=''recipient@example.com'' \
  -F subject=''Hello'' \
  -F text=''Test message''',
  false, NULL, NULL, NULL
),
(
  'Postmark',
  'postmark',
  'Postmark, transactional e-postalar için optimize edilmiş hızlı ve güvenilir bir e-posta gönderim servisidir. Yüksek teslim edilebilirlik oranları, detaylı analytics ve mesaj akışı yönetimi ile öne çıkar.',
  'https://postmarkapp.com/developer',
  NULL,
  'Ücretsiz (100 e-posta/ay deneme), $15/ay (10k e-posta)',
  (SELECT id FROM categories WHERE slug = 'iletisim'),
  ARRAY['rest', 'email', 'transactional'],
  ARRAY['Fast delivery', 'Message streams', 'Templates', 'Bounce handling', 'Inbound processing'],
  'curl "https://api.postmarkapp.com/email" \
  -X POST \
  -H "Accept: application/json" \
  -H "X-Postmark-Server-Token: YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d ''{"From": "sender@example.com", "To": "recipient@example.com", "Subject": "Hello", "TextBody": "Test"}''',
  false, NULL, NULL, NULL
),
(
  'Resend',
  'resend',
  'Resend, modern geliştiriciler için tasarlanmış yeni nesil e-posta API''sidir. React Email ile uyumlu çalışarak bileşen tabanlı e-posta şablonları oluşturmanızı ve SDK''lar aracılığıyla kolayca gönderim yapmanızı sağlar.',
  'https://resend.com/docs/api-reference',
  NULL,
  'Ücretsiz (100 e-posta/gün), Pro: $20/ay',
  (SELECT id FROM categories WHERE slug = 'iletisim'),
  ARRAY['rest', 'email', 'developer-friendly', 'free-tier'],
  ARRAY['React Email support', 'Domain verification', 'Webhooks', 'Analytics', 'Multi-region'],
  'curl -X POST https://api.resend.com/emails \
  -H "Authorization: Bearer YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d ''{"from": "onboarding@resend.dev", "to": "user@example.com", "subject": "Hello", "html": "<p>Test</p>"}''',
  false, NULL, NULL, NULL
),
(
  'Pusher',
  'pusher',
  'Pusher, gerçek zamanlı bildirimler, canlı güncellemeler ve WebSocket bağlantıları için kullanılan bir iletişim platformudur. Channels ve Beams ürünleri ile web ve mobil uygulamalar için anlık veri iletimi sağlar.',
  'https://pusher.com/docs',
  NULL,
  'Ücretsiz (200k mesaj/gün), Startup: $49/ay',
  (SELECT id FROM categories WHERE slug = 'iletisim'),
  ARRAY['rest', 'websocket', 'realtime', 'push-notifications', 'free-tier'],
  ARRAY['Channels (WebSocket)', 'Beams (push notifications)', 'Presence channels', 'Encrypted channels', 'Webhooks'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'OneSignal',
  'onesignal',
  'OneSignal, web ve mobil push bildirimleri, e-posta ve SMS gönderimi için kullanılan çoklu kanal iletişim platformudur. Segmentasyon, A/B testi ve otomasyon araçları ile kişiselleştirilmiş bildirim kampanyaları yönetmenizi sağlar.',
  'https://documentation.onesignal.com',
  NULL,
  'Ücretsiz (sınırsız push), Growth: $9/ay (e-posta/SMS)',
  (SELECT id FROM categories WHERE slug = 'iletisim'),
  ARRAY['rest', 'push-notifications', 'email', 'sms', 'free-tier'],
  ARRAY['Push notifications', 'Email', 'SMS', 'In-app messaging', 'Segmentation'],
  'curl -X POST https://onesignal.com/api/v1/notifications \
  -H "Authorization: Basic YOUR_REST_API_KEY" \
  -H "Content-Type: application/json" \
  -d ''{"app_id": "YOUR_APP_ID", "included_segments": ["All"], "contents": {"en": "Hello!"}}''',
  false, NULL, NULL, NULL
)
ON CONFLICT (slug) DO NOTHING;

-- ==========================================================================
-- EĞLENCE (5)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'Spotify Web API',
  'spotify-web-api',
  'Spotify Web API, müzik arama, çalma listeleri yönetme, sanatçı bilgileri sorgulama ve kullanıcı kütüphanelerine erişim gibi Spotify platformunun zengin müzik verilerine programatik erişim sağlar.',
  'https://developer.spotify.com/documentation/web-api',
  NULL,
  'Ücretsiz (rate limit ile)',
  (SELECT id FROM categories WHERE slug = 'eglence'),
  ARRAY['rest', 'music', 'streaming', 'oauth2', 'free-tier'],
  ARRAY['Track search', 'Playlist management', 'Artist info', 'Audio features', 'Recommendations'],
  'curl "https://api.spotify.com/v1/search?q=Tarkan&type=artist" \
  -H "Authorization: Bearer YOUR_TOKEN"',
  false, NULL, NULL, NULL
),
(
  'TMDB',
  'tmdb',
  'The Movie Database (TMDB) API, film ve dizi bilgileri, oyuncu verileri, görseller ve kullanıcı puanlamaları gibi kapsamlı eğlence verilerine erişim sağlar. Topluluk tarafından desteklenen geniş bir veritabanı sunar.',
  'https://developer.themoviedb.org/docs',
  NULL,
  'Ücretsiz (API anahtarı ile)',
  (SELECT id FROM categories WHERE slug = 'eglence'),
  ARRAY['rest', 'movies', 'tv-shows', 'free-tier'],
  ARRAY['Movie database', 'TV show info', 'Cast & crew', 'Images', 'User ratings'],
  'curl "https://api.themoviedb.org/3/movie/popular?api_key=YOUR_KEY&language=tr-TR"',
  false, NULL, NULL, NULL
),
(
  'IGDB',
  'igdb',
  'IGDB (Internet Game Database) API, video oyunları hakkında kapsamlı bilgiler sunan Twitch tarafından desteklenen bir platformdur. Oyun detayları, platformlar, şirketler ve kullanıcı puanlamaları gibi geniş bir veri seti sağlar.',
  'https://api-docs.igdb.com',
  NULL,
  'Ücretsiz (Twitch geliştirici hesabı ile)',
  (SELECT id FROM categories WHERE slug = 'eglence'),
  ARRAY['rest', 'games', 'twitch', 'free-tier'],
  ARRAY['Game database', 'Platform info', 'Company details', 'Ratings', 'Cover art'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'Tenor',
  'tenor',
  'Tenor (Google), GIF arama ve paylaşım API''si sunan dünyanın en büyük GIF platformlarından biridir. Anahtar kelime araması, trend GIF''ler ve kategorilere göre filtreleme gibi özellikler ile uygulamalarınıza GIF desteği eklemenizi sağlar.',
  'https://developers.google.com/tenor/guides/quickstart',
  NULL,
  'Ücretsiz',
  (SELECT id FROM categories WHERE slug = 'eglence'),
  ARRAY['rest', 'gif', 'media', 'google', 'free-tier'],
  ARRAY['GIF search', 'Trending GIFs', 'Categories', 'Autocomplete', 'Share tracking'],
  'curl "https://tenor.googleapis.com/v2/search?q=funny&key=YOUR_KEY&limit=10"',
  false, NULL, NULL, NULL
),
(
  'Giphy',
  'giphy',
  'Giphy API, GIF ve sticker arama, trend içerikler ve rastgele GIF seçimi gibi özellikler sunan popüler bir medya platformudur. Geniş GIF kütüphanesi ve kolay entegrasyon ile uygulamalarınıza eğlenceli içerik eklemenizi sağlar.',
  'https://developers.giphy.com/docs/api',
  NULL,
  'Ücretsiz (API anahtarı ile)',
  (SELECT id FROM categories WHERE slug = 'eglence'),
  ARRAY['rest', 'gif', 'stickers', 'free-tier'],
  ARRAY['GIF search', 'Sticker search', 'Trending', 'Random', 'Upload'],
  'curl "https://api.giphy.com/v1/gifs/trending?api_key=YOUR_KEY&limit=10"',
  false, NULL, NULL, NULL
)
ON CONFLICT (slug) DO NOTHING;

-- ==========================================================================
-- SAĞLIK (3)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'Fitbit API',
  'fitbit-api',
  'Fitbit Web API, kullanıcıların aktivite, uyku, kalp atış hızı ve beslenme verilerine erişim sağlar. Sağlık ve fitness uygulamaları geliştirmek için Fitbit cihazlarından toplanan detaylı biyometrik verileri sunar.',
  'https://dev.fitbit.com/build/reference/web-api',
  NULL,
  'Ücretsiz (kişisel kullanım), Ticari kullanım için başvuru gerekli',
  (SELECT id FROM categories WHERE slug = 'saglik'),
  ARRAY['rest', 'health', 'fitness', 'wearables', 'oauth2'],
  ARRAY['Activity data', 'Sleep tracking', 'Heart rate', 'Nutrition logging', 'Intraday data'],
  'curl "https://api.fitbit.com/1/user/-/activities/date/today.json" \
  -H "Authorization: Bearer YOUR_TOKEN"',
  false, NULL, NULL, NULL
),
(
  'Apple HealthKit',
  'apple-healthkit',
  'Apple HealthKit, iOS ve watchOS cihazlarından sağlık ve fitness verilerine erişim sağlayan Apple''ın resmi sağlık veri çerçevesidir. Adım sayısı, kalp ritmi, uyku analizi ve tıbbi kayıtlar gibi kapsamlı sağlık verileri sunar.',
  'https://developer.apple.com/documentation/healthkit',
  NULL,
  'Ücretsiz (Apple Developer hesabı ile)',
  (SELECT id FROM categories WHERE slug = 'saglik'),
  ARRAY['swift', 'health', 'ios', 'wearables', 'apple'],
  ARRAY['Health data access', 'Workout tracking', 'Heart rate monitoring', 'Sleep analysis', 'Medical records'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'FHIR API',
  'fhir-api',
  'FHIR (Fast Healthcare Interoperability Resources), sağlık verilerinin değişimi için uluslararası bir standarttır. Hasta kayıtları, tıbbi geçmiş, ilaç bilgileri ve klinik veriler gibi sağlık bilgilerini standart formatlarda paylaşmayı sağlar.',
  'https://www.hl7.org/fhir',
  NULL,
  'Ücretsiz (açık standart)',
  (SELECT id FROM categories WHERE slug = 'saglik'),
  ARRAY['rest', 'health', 'medical', 'open-standard', 'free-tier'],
  ARRAY['Patient records', 'Medical history', 'Medications', 'Clinical data', 'Interoperability'],
  'curl "https://hapi.fhir.org/baseR4/Patient?name=Smith" \
  -H "Accept: application/fhir+json"',
  false, NULL, NULL, NULL
)
ON CONFLICT (slug) DO NOTHING;

-- ==========================================================================
-- EĞİTİM (3)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'Udemy API',
  'udemy-api',
  'Udemy API, kurs arama, kurs detayları ve eğitmen bilgileri gibi Udemy platformundaki eğitim içeriklerine programatik erişim sağlar. Affiliate entegrasyonu ve kurs önerileri ile eğitim uygulamaları geliştirmenize olanak tanır.',
  'https://www.udemy.com/developers',
  NULL,
  'Ücretsiz (affiliate programı ile)',
  (SELECT id FROM categories WHERE slug = 'egitim'),
  ARRAY['rest', 'education', 'courses', 'free-tier'],
  ARRAY['Course search', 'Course details', 'Instructor info', 'Reviews', 'Affiliate integration'],
  'curl "https://www.udemy.com/api-2.0/courses/?search=python" \
  -u "CLIENT_ID:CLIENT_SECRET"',
  false, NULL, NULL, NULL
),
(
  'Khan Academy API',
  'khan-academy-api',
  'Khan Academy API, ücretsiz eğitim içeriklerine erişim sağlayan bir arayüzdür. Matematik, fen bilimleri, programlama ve daha birçok konuda video dersler, alıştırmalar ve ilerleme takibi gibi eğitim kaynakları sunar.',
  'https://www.khanacademy.org/computing',
  NULL,
  'Ücretsiz',
  (SELECT id FROM categories WHERE slug = 'egitim'),
  ARRAY['rest', 'education', 'free-tier', 'open-education'],
  ARRAY['Video lessons', 'Exercises', 'Progress tracking', 'Multiple subjects', 'Localized content'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'edX API',
  'edx-api',
  'edX API, dünyanın önde gelen üniversitelerinin sunduğu online kurslara ve programlara erişim sağlar. Kurs kataloğu, kayıt yönetimi ve sertifika bilgileri gibi eğitim verilerine programatik erişim sunar.',
  'https://courses.edx.org/api-docs',
  NULL,
  'Ücretsiz (kurs kataloğu), Sertifika: ücretli',
  (SELECT id FROM categories WHERE slug = 'egitim'),
  ARRAY['rest', 'education', 'university', 'free-tier'],
  ARRAY['Course catalog', 'Enrollment management', 'Certificates', 'University courses', 'Professional programs'],
  NULL,
  false, NULL, NULL, NULL
)
ON CONFLICT (slug) DO NOTHING;

-- ==========================================================================
-- GÜVENLİK (5)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'Let''s Encrypt',
  'lets-encrypt',
  'Let''s Encrypt, ücretsiz SSL/TLS sertifikaları sağlayan otomatik bir sertifika otoritesidir. ACME protokolü üzerinden sertifika alma, yenileme ve iptal işlemlerini programatik olarak gerçekleştirmenize olanak tanır.',
  'https://letsencrypt.org/docs',
  NULL,
  'Ücretsiz',
  (SELECT id FROM categories WHERE slug = 'guvenlik'),
  ARRAY['rest', 'ssl', 'security', 'free-tier', 'acme'],
  ARRAY['Free SSL certificates', 'Automatic renewal', 'ACME protocol', 'Wildcard certificates', 'Rate limiting info'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'Cloudflare Security',
  'cloudflare-security',
  'Cloudflare Security API, DDoS koruması, WAF kuralları, bot yönetimi ve tehdit analizi gibi güvenlik özelliklerini programatik olarak yönetmenizi sağlar. Zero Trust erişim kontrolü ve güvenlik analitiği ile kapsamlı koruma sunar.',
  'https://developers.cloudflare.com/security',
  NULL,
  'Ücretsiz (temel), Pro: $20/ay, Business: $200/ay',
  (SELECT id FROM categories WHERE slug = 'guvenlik'),
  ARRAY['rest', 'security', 'ddos', 'waf', 'free-tier'],
  ARRAY['DDoS protection', 'WAF rules', 'Bot management', 'Zero Trust', 'Security analytics'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'Have I Been Pwned',
  'haveibeenpwned',
  'Have I Been Pwned API, e-posta adreslerinin veri ihlallerinde yer alıp almadığını kontrol etmenizi sağlar. Şifre sızıntısı kontrolü, ihlal bilgileri ve domain bazlı arama gibi güvenlik doğrulama araçları sunar.',
  'https://haveibeenpwned.com/API/v3',
  NULL,
  'Ücretsiz (şifre kontrolü), Ücretli (domain arama): $3.50/ay',
  (SELECT id FROM categories WHERE slug = 'guvenlik'),
  ARRAY['rest', 'security', 'breach-detection', 'free-tier'],
  ARRAY['Breach check', 'Password check (k-anonymity)', 'Paste search', 'Domain search', 'Breach notifications'],
  'curl "https://haveibeenpwned.com/api/v3/breachedaccount/test@example.com" \
  -H "hibp-api-key: YOUR_KEY" \
  -H "user-agent: MyApp"',
  false, NULL, NULL, NULL
),
(
  'VirusTotal',
  'virustotal',
  'VirusTotal API, dosyaları, URL''leri, domain''leri ve IP adreslerini 70''den fazla antivirüs motoruyla taramanızı sağlar. Kötü amaçlı yazılım analizi, tehdit istihbaratı ve güvenlik araştırmaları için kapsamlı bir platform sunar.',
  'https://docs.virustotal.com/reference/overview',
  NULL,
  'Ücretsiz (500 istek/gün), Premium: isteğe bağlı fiyatlandırma',
  (SELECT id FROM categories WHERE slug = 'guvenlik'),
  ARRAY['rest', 'security', 'malware', 'threat-intelligence', 'free-tier'],
  ARRAY['File scanning', 'URL scanning', 'Domain analysis', 'IP analysis', '70+ AV engines'],
  'curl "https://www.virustotal.com/api/v3/files/FILE_HASH" \
  -H "x-apikey: YOUR_KEY"',
  false, NULL, NULL, NULL
),
(
  'Snyk',
  'snyk',
  'Snyk API, yazılım bağımlılıklarındaki güvenlik açıklarını tespit etmenizi ve düzeltmenizi sağlayan bir güvenlik platformudur. Açık kaynak kütüphaneler, container image''ları ve IaC yapılandırmalarındaki güvenlik risklerini analiz eder.',
  'https://docs.snyk.io/snyk-api',
  NULL,
  'Ücretsiz (200 test/ay), Team: $25/geliştirici/ay',
  (SELECT id FROM categories WHERE slug = 'guvenlik'),
  ARRAY['rest', 'security', 'vulnerability', 'devops', 'free-tier'],
  ARRAY['Dependency scanning', 'Container scanning', 'IaC scanning', 'License compliance', 'Fix suggestions'],
  NULL,
  false, NULL, NULL, NULL
)
ON CONFLICT (slug) DO NOTHING;

-- ==========================================================================
-- BLOCKCHAIN & WEB3 (6)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'Alchemy',
  'alchemy',
  'Alchemy, Web3 geliştiricileri için en popüler blockchain altyapı platformlarından biridir. Ethereum, Polygon, Arbitrum ve diğer EVM zincirleri için node hizmetleri, gelişmiş API''ler ve geliştirici araçları sunar.',
  'https://docs.alchemy.com',
  NULL,
  'Ücretsiz (300M CU/ay), Growth: $49/ay',
  (SELECT id FROM categories WHERE slug = 'blockchain-web3'),
  ARRAY['rest', 'web3', 'blockchain', 'ethereum', 'free-tier'],
  ARRAY['Node infrastructure', 'NFT API', 'Token API', 'Webhooks', 'Multi-chain support'],
  'curl https://eth-mainnet.g.alchemy.com/v2/YOUR_KEY \
  -X POST \
  -H "Content-Type: application/json" \
  -d ''{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":0}''',
  false, NULL, NULL, NULL
),
(
  'Infura',
  'infura',
  'Infura (ConsenSys), Ethereum ve IPFS ağlarına güvenilir erişim sağlayan bir altyapı platformudur. Yüksek kullanılabilirlik, otomatik ölçeklendirme ve çoklu ağ desteği ile Web3 uygulamaları geliştirmek için temel bir araçtır.',
  'https://docs.infura.io',
  NULL,
  'Ücretsiz (100k istek/gün), Developer: $50/ay',
  (SELECT id FROM categories WHERE slug = 'blockchain-web3'),
  ARRAY['rest', 'web3', 'ethereum', 'ipfs', 'free-tier'],
  ARRAY['Ethereum nodes', 'IPFS gateway', 'Multi-chain', 'WebSocket support', 'Archive data'],
  'curl https://mainnet.infura.io/v3/YOUR_PROJECT_ID \
  -X POST \
  -H "Content-Type: application/json" \
  -d ''{"jsonrpc":"2.0","method":"eth_getBalance","params":["0x...","latest"],"id":1}''',
  false, NULL, NULL, NULL
),
(
  'Etherscan',
  'etherscan',
  'Etherscan API, Ethereum blockchain üzerindeki işlemleri, kontratları, token transferlerini ve gas fiyatlarını sorgulamak için kullanılan en popüler blockchain explorer API''sidir. Detaylı on-chain veri analizi sunar.',
  'https://docs.etherscan.io',
  NULL,
  'Ücretsiz (5 istek/sn), Pro: $199/ay',
  (SELECT id FROM categories WHERE slug = 'blockchain-web3'),
  ARRAY['rest', 'blockchain', 'ethereum', 'explorer', 'free-tier'],
  ARRAY['Transaction history', 'Contract verification', 'Token transfers', 'Gas tracker', 'Block info'],
  'curl "https://api.etherscan.io/api?module=account&action=balance&address=0x...&tag=latest&apikey=YOUR_KEY"',
  false, NULL, NULL, NULL
),
(
  'Chainlink',
  'chainlink',
  'Chainlink, blockchain uygulamalarına gerçek dünya verilerini güvenli bir şekilde aktaran merkeziyetsiz oracle ağıdır. Fiyat beslemeleri, rastgele sayı üretimi (VRF) ve zincirler arası iletişim gibi kritik Web3 hizmetleri sunar.',
  'https://docs.chain.link',
  NULL,
  'Ücretsiz (veri beslemeleri), LINK token kullanım maliyeti',
  (SELECT id FROM categories WHERE slug = 'blockchain-web3'),
  ARRAY['web3', 'oracle', 'blockchain', 'defi'],
  ARRAY['Price feeds', 'VRF (random numbers)', 'Automation', 'CCIP (cross-chain)', 'Data streams'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'The Graph',
  'the-graph',
  'The Graph, blockchain verilerini indeksleyen ve GraphQL ile sorgulamanızı sağlayan merkeziyetsiz bir protokoldür. DeFi, NFT ve diğer Web3 uygulamalarının verilerini hızlı ve verimli bir şekilde sorgulamak için subgraph''lar kullanır.',
  'https://thegraph.com/docs',
  NULL,
  'Ücretsiz (100k sorgu/ay), Kullanım başına GRT token',
  (SELECT id FROM categories WHERE slug = 'blockchain-web3'),
  ARRAY['graphql', 'web3', 'blockchain', 'indexing', 'free-tier'],
  ARRAY['Subgraph indexing', 'GraphQL queries', 'Decentralized network', 'Multi-chain', 'Real-time data'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'QuickNode',
  'quicknode',
  'QuickNode, 25''den fazla blockchain ağına erişim sağlayan hızlı ve güvenilir bir Web3 altyapı platformudur. Özel node''lar, gelişmiş API''ler ve marketplace eklentileri ile tam kapsamlı blockchain geliştirme deneyimi sunar.',
  'https://www.quicknode.com/docs',
  NULL,
  'Ücretsiz (deneme), Build: $49/ay',
  (SELECT id FROM categories WHERE slug = 'blockchain-web3'),
  ARRAY['rest', 'web3', 'blockchain', 'multi-chain'],
  ARRAY['25+ chains', 'Dedicated nodes', 'Enhanced APIs', 'Marketplace add-ons', 'WebSocket streams'],
  NULL,
  false, NULL, NULL, NULL
)
ON CONFLICT (slug) DO NOTHING;

-- ==========================================================================
-- MEDYA & DOSYA (5)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'Cloudinary',
  'cloudinary',
  'Cloudinary, görsel ve video yönetimi için kullanılan kapsamlı bir bulut medya platformudur. Otomatik optimizasyon, dönüştürme, AI tabanlı kırpma ve CDN dağıtımı ile medya dosyalarınızı profesyonel düzeyde yönetmenizi sağlar.',
  'https://cloudinary.com/documentation',
  NULL,
  'Ücretsiz (25 kredi/ay), Plus: $89/ay',
  (SELECT id FROM categories WHERE slug = 'medya-dosya'),
  ARRAY['rest', 'image', 'video', 'cdn', 'free-tier'],
  ARRAY['Image optimization', 'Video transcoding', 'AI-based cropping', 'CDN delivery', 'Transformations'],
  'curl "https://api.cloudinary.com/v1_1/YOUR_CLOUD/image/upload" \
  -X POST \
  -F "file=@photo.jpg" \
  -F "upload_preset=YOUR_PRESET"',
  false, NULL, NULL, NULL
),
(
  'Imgix',
  'imgix',
  'Imgix, gerçek zamanlı görsel işleme ve CDN dağıtımı sunan bir medya platformudur. URL tabanlı dönüştürmeler ile görselleri anında boyutlandırma, kırpma, filtre uygulama ve optimize etme imkanı sağlar.',
  'https://docs.imgix.com/apis',
  NULL,
  'Ücretsiz (deneme), Starter: $10/ay',
  (SELECT id FROM categories WHERE slug = 'medya-dosya'),
  ARRAY['rest', 'image', 'cdn', 'optimization'],
  ARRAY['Real-time processing', 'URL-based transforms', 'Auto-format', 'Face detection', 'Watermarking'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'Uploadthing',
  'uploadthing',
  'Uploadthing, Next.js ve React uygulamaları için tasarlanmış modern bir dosya yükleme platformudur. Tip güvenli API, dosya doğrulama ve otomatik optimizasyon ile dosya yükleme süreçlerini basitleştirir.',
  'https://docs.uploadthing.com',
  NULL,
  'Ücretsiz (2GB), Pro: $10/ay',
  (SELECT id FROM categories WHERE slug = 'medya-dosya'),
  ARRAY['rest', 'file-upload', 'nextjs', 'typescript', 'free-tier'],
  ARRAY['Type-safe uploads', 'File validation', 'Auto optimization', 'Next.js integration', 'Presigned URLs'],
  NULL,
  false, NULL, NULL, NULL
),
(
  'AWS S3',
  'aws-s3',
  'Amazon S3 (Simple Storage Service), dünyanın en yaygın kullanılan nesne depolama hizmetidir. Sınırsız ölçeklenebilirlik, yüksek dayanıklılık ve çeşitli depolama sınıfları ile her türlü dosya depolama ihtiyacını karşılar.',
  'https://docs.aws.amazon.com/AmazonS3/latest/API',
  NULL,
  'Ücretsiz (5GB/12 ay), Kullanım başına ücret (yaklaşık $0.023/GB/ay)',
  (SELECT id FROM categories WHERE slug = 'medya-dosya'),
  ARRAY['rest', 'storage', 'aws', 'cloud', 'free-tier'],
  ARRAY['Object storage', 'Versioning', 'Lifecycle policies', 'Presigned URLs', 'Server-side encryption'],
  'import boto3
s3 = boto3.client(''s3'')
s3.upload_file(''local_file.txt'', ''my-bucket'', ''remote_file.txt'')',
  false, NULL, NULL, NULL
),
(
  'Bunny CDN',
  'bunny-cdn',
  'Bunny CDN, uygun fiyatlı ve yüksek performanslı bir içerik dağıtım ağıdır. Global CDN, görsel optimizasyonu, video streaming ve DNS hizmetleri ile web içeriklerinizi dünya genelinde hızlı bir şekilde sunmanızı sağlar.',
  'https://docs.bunny.net/reference/bunnynet-api-overview',
  NULL,
  '$0.01/GB (Avrupa & Kuzey Amerika), diğer bölgeler değişken',
  (SELECT id FROM categories WHERE slug = 'medya-dosya'),
  ARRAY['rest', 'cdn', 'storage', 'video', 'affordable'],
  ARRAY['Global CDN', 'Image optimization', 'Video streaming', 'Edge storage', 'DDoS protection'],
  NULL,
  false, NULL, NULL, NULL
)
ON CONFLICT (slug) DO NOTHING;

-- ==========================================================================
-- GITHUB REPOLARI (30)
-- ==========================================================================

INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id, tags, features, code_example, is_repo, github_url, github_stars, github_forks) VALUES
(
  'React',
  'react',
  'React, Meta tarafından geliştirilen ve kullanıcı arayüzleri oluşturmak için kullanılan dünyanın en popüler JavaScript kütüphanesidir. Bileşen tabanlı mimari, sanal DOM ve zengin ekosistemi ile modern web uygulamaları geliştirmek için standart haline gelmiştir.',
  'https://github.com/facebook/react',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['javascript', 'typescript', 'frontend', 'ui', 'open-source'],
  ARRAY['Component-based', 'Virtual DOM', 'Hooks', 'Server Components', 'Concurrent rendering'],
  'import { useState } from ''react'';
function Counter() {
  const [count, setCount] = useState(0);
  return <button onClick={() => setCount(count + 1)}>Count: {count}</button>;
}',
  true, 'https://github.com/facebook/react', 230000, 47000
),
(
  'Vue.js',
  'vuejs',
  'Vue.js, kullanıcı arayüzleri ve tek sayfa uygulamaları oluşturmak için kullanılan progresif bir JavaScript çerçevesidir. Kolay öğrenme eğrisi, Composition API ve reaktif veri bağlama ile geliştiricilere esnek bir geliştirme deneyimi sunar.',
  'https://github.com/vuejs/core',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['javascript', 'typescript', 'frontend', 'ui', 'open-source'],
  ARRAY['Reactive data binding', 'Composition API', 'Single-file components', 'Virtual DOM', 'TypeScript support'],
  '<script setup>
import { ref } from ''vue''
const count = ref(0)
</script>
<template>
  <button @click="count++">Count: {{ count }}</button>
</template>',
  true, 'https://github.com/vuejs/core', 48000, 8300
),
(
  'Next.js',
  'nextjs',
  'Next.js, Vercel tarafından geliştirilen React tabanlı tam yığın web çerçevesidir. Server-side rendering, statik site oluşturma, API rotaları ve App Router ile üretim kalitesinde web uygulamaları geliştirmek için en popüler çözümdür.',
  'https://github.com/vercel/next.js',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['javascript', 'typescript', 'react', 'fullstack', 'open-source'],
  ARRAY['App Router', 'Server Components', 'SSR/SSG/ISR', 'API Routes', 'Middleware'],
  '// app/page.tsx
export default async function Home() {
  const data = await fetch(''https://api.example.com/data'');
  return <main>{JSON.stringify(data)}</main>;
}',
  true, 'https://github.com/vercel/next.js', 130000, 28000
),
(
  'Svelte',
  'svelte',
  'Svelte, derleme zamanında çalışan ve sanal DOM kullanmayan yenilikçi bir UI çerçevesidir. Minimal boilerplate, gerçek reaktivite ve küçük paket boyutu ile yüksek performanslı web uygulamaları oluşturmanızı sağlar.',
  'https://github.com/sveltejs/svelte',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['javascript', 'typescript', 'frontend', 'compiler', 'open-source'],
  ARRAY['No virtual DOM', 'Compile-time framework', 'Reactive declarations', 'Scoped CSS', 'Small bundle size'],
  '<script>
  let count = $state(0);
</script>
<button onclick={() => count++}>Count: {count}</button>',
  true, 'https://github.com/sveltejs/svelte', 81000, 4300
),
(
  'Tailwind CSS',
  'tailwindcss',
  'Tailwind CSS, utility-first yaklaşımıyla hızlı UI geliştirmeye olanak tanıyan bir CSS çerçevesidir. Önceden tanımlanmış yardımcı sınıflar, responsive tasarım ve koyu mod desteği ile modern web arayüzleri oluşturmak için en popüler araçtır.',
  'https://github.com/tailwindlabs/tailwindcss',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['css', 'frontend', 'utility-first', 'open-source'],
  ARRAY['Utility-first', 'Responsive design', 'Dark mode', 'JIT compiler', 'Plugin system'],
  NULL,
  true, 'https://github.com/tailwindlabs/tailwindcss', 85000, 4300
),
(
  'shadcn/ui',
  'shadcn-ui',
  'shadcn/ui, Radix UI ve Tailwind CSS üzerine inşa edilmiş yeniden kullanılabilir bileşen koleksiyonudur. Kopyala-yapıştır yaklaşımı ile tam kontrol sağlar, npm paketi olmayıp doğrudan projenize eklenen özelleştirilebilir bileşenler sunar.',
  'https://github.com/shadcn-ui/ui',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['typescript', 'react', 'tailwindcss', 'radix-ui', 'open-source'],
  ARRAY['Copy-paste components', 'Radix UI primitives', 'Tailwind styling', 'Dark mode', 'Accessible'],
  'npx shadcn@latest add button',
  true, 'https://github.com/shadcn-ui/ui', 78000, 5000
),
(
  'Prisma',
  'prisma',
  'Prisma, Node.js ve TypeScript için modern bir veritabanı ORM''dir. Tip güvenli veritabanı sorguları, otomatik migration''lar ve görsel veritabanı yönetim aracı (Prisma Studio) ile veritabanı işlemlerini büyük ölçüde kolaylaştırır.',
  'https://github.com/prisma/prisma',
  NULL,
  'Ücretsiz (açık kaynak), Accelerate: $29/ay',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['typescript', 'orm', 'database', 'nodejs', 'open-source'],
  ARRAY['Type-safe queries', 'Auto migrations', 'Prisma Studio', 'Multi-database', 'Edge compatible'],
  'const users = await prisma.user.findMany({
  where: { email: { contains: ''@example.com'' } },
  include: { posts: true }
});',
  true, 'https://github.com/prisma/prisma', 41000, 1600
),
(
  'tRPC',
  'trpc',
  'tRPC, TypeScript ile end-to-end tip güvenli API''ler oluşturmanızı sağlayan bir çerçevedir. Kod üretimi veya şema tanımı gerektirmeden sunucu ve istemci arasında tam tip güvenliği sağlayarak geliştirici deneyimini üst düzeye çıkarır.',
  'https://github.com/trpc/trpc',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['typescript', 'api', 'fullstack', 'rpc', 'open-source'],
  ARRAY['End-to-end type safety', 'No code generation', 'Subscriptions', 'Middleware', 'React Query integration'],
  NULL,
  true, 'https://github.com/trpc/trpc', 36000, 1300
),
(
  'Zustand',
  'zustand',
  'Zustand, React uygulamaları için minimal ve esnek bir durum yönetimi kütüphanesidir. Basit API''si, middleware desteği ve boilerplate gerektirmeyen yapısı ile Redux''a hafif bir alternatif olarak öne çıkar.',
  'https://github.com/pmndrs/zustand',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['typescript', 'react', 'state-management', 'open-source'],
  ARRAY['Minimal API', 'No boilerplate', 'Middleware support', 'Persist middleware', 'DevTools'],
  'import { create } from ''zustand''
const useStore = create((set) => ({
  count: 0,
  increment: () => set((state) => ({ count: state.count + 1 })),
}));',
  true, 'https://github.com/pmndrs/zustand', 50000, 1500
),
(
  'TanStack Query',
  'tanstack-query',
  'TanStack Query (eski adıyla React Query), sunucu durumu yönetimi için kullanılan güçlü bir veri çekme kütüphanesidir. Otomatik önbellekleme, arka plan yenileme, sayfalama ve sonsuz scroll gibi gelişmiş veri yönetimi özellikleri sunar.',
  'https://github.com/TanStack/query',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['typescript', 'react', 'data-fetching', 'caching', 'open-source'],
  ARRAY['Auto caching', 'Background refetching', 'Pagination', 'Infinite scroll', 'Optimistic updates'],
  'const { data, isLoading } = useQuery({
  queryKey: [''todos''],
  queryFn: () => fetch(''/api/todos'').then(res => res.json()),
});',
  true, 'https://github.com/TanStack/query', 43000, 3000
),
(
  'Zod',
  'zod',
  'Zod, TypeScript-first şema doğrulama kütüphanesidir. Çalışma zamanında veri doğrulama, tip çıkarımı ve kompozisyon desteği ile API girişleri, form verileri ve yapılandırma dosyalarını güvenli bir şekilde doğrulamanızı sağlar.',
  'https://github.com/colinhacks/zod',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['typescript', 'validation', 'schema', 'open-source'],
  ARRAY['TypeScript-first', 'Runtime validation', 'Type inference', 'Composable schemas', 'Error formatting'],
  'import { z } from ''zod'';
const UserSchema = z.object({
  name: z.string().min(2),
  email: z.string().email(),
  age: z.number().min(18),
});
type User = z.infer<typeof UserSchema>;',
  true, 'https://github.com/colinhacks/zod', 35000, 1200
),
(
  'Drizzle ORM',
  'drizzle-orm',
  'Drizzle ORM, TypeScript için hafif ve performanslı bir veritabanı ORM''dir. SQL benzeri sorgu oluşturucu, sıfır bağımlılık ve serverless ortamlar için optimize edilmiş yapısı ile modern veritabanı erişimi sağlar.',
  'https://github.com/drizzle-team/drizzle-orm',
  NULL,
  'Ücretsiz (Apache 2.0 Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['typescript', 'orm', 'database', 'serverless', 'open-source'],
  ARRAY['SQL-like query builder', 'Zero dependencies', 'Serverless ready', 'Multiple databases', 'Drizzle Kit'],
  'const users = await db.select().from(usersTable).where(eq(usersTable.age, 25));',
  true, 'https://github.com/drizzle-team/drizzle-orm', 26000, 650
),
(
  'Bun',
  'bun',
  'Bun, JavaScript ve TypeScript için hızlı bir çalışma zamanı, paket yöneticisi ve bundler''dır. Node.js uyumlu API''leri, yerleşik test runner''ı ve SQLite desteği ile geliştirme deneyimini hızlandıran all-in-one bir araçtır.',
  'https://github.com/oven-sh/bun',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['javascript', 'typescript', 'runtime', 'bundler', 'open-source'],
  ARRAY['Fast runtime', 'Built-in bundler', 'Package manager', 'Test runner', 'Node.js compatible'],
  'Bun.serve({
  port: 3000,
  fetch(req) {
    return new Response("Hello from Bun!");
  },
});',
  true, 'https://github.com/oven-sh/bun', 76000, 2700
),
(
  'Deno',
  'deno',
  'Deno, güvenli bir JavaScript ve TypeScript çalışma zamanıdır ve Node.js''in yaratıcısı Ryan Dahl tarafından geliştirilmiştir. Yerleşik TypeScript desteği, izin tabanlı güvenlik modeli ve standart kütüphane ile modern sunucu taraflı geliştirme sunar.',
  'https://github.com/denoland/deno',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['typescript', 'javascript', 'runtime', 'secure', 'open-source'],
  ARRAY['Built-in TypeScript', 'Permission-based security', 'Standard library', 'Node.js compat', 'Deno Deploy'],
  NULL,
  true, 'https://github.com/denoland/deno', 98000, 5400
),
(
  'Rust',
  'rust-lang',
  'Rust, bellek güvenliği ve yüksek performans sunan bir sistem programlama dilidir. Ownership modeli, sıfır maliyetli soyutlamalar ve güçlü tip sistemi ile güvenli ve verimli yazılım geliştirmenizi sağlar.',
  'https://github.com/rust-lang/rust',
  NULL,
  'Ücretsiz (MIT/Apache 2.0 Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['rust', 'systems-programming', 'performance', 'memory-safety', 'open-source'],
  ARRAY['Memory safety', 'Zero-cost abstractions', 'Ownership model', 'Cargo package manager', 'WebAssembly support'],
  NULL,
  true, 'https://github.com/rust-lang/rust', 100000, 13000
),
(
  'Go',
  'go-lang',
  'Go (Golang), Google tarafından geliştirilen basit, verimli ve güvenilir bir programlama dilidir. Dahili eşzamanlılık desteği, hızlı derleme süreleri ve güçlü standart kütüphanesi ile bulut hizmetleri ve mikroservisler için idealdir.',
  'https://github.com/golang/go',
  NULL,
  'Ücretsiz (BSD Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['go', 'systems-programming', 'concurrency', 'cloud', 'open-source'],
  ARRAY['Built-in concurrency', 'Fast compilation', 'Garbage collection', 'Standard library', 'Cross-compilation'],
  NULL,
  true, 'https://github.com/golang/go', 125000, 17000
),
(
  'FastAPI',
  'fastapi',
  'FastAPI, Python ile yüksek performanslı API''ler geliştirmek için kullanılan modern bir web çerçevesidir. Otomatik OpenAPI dokümantasyonu, tip doğrulama ve asenkron destek ile hızlı ve güvenilir API geliştirme deneyimi sunar.',
  'https://github.com/fastapi/fastapi',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['python', 'api', 'async', 'openapi', 'open-source'],
  ARRAY['Auto documentation', 'Type validation', 'Async support', 'Dependency injection', 'OpenAPI/Swagger'],
  'from fastapi import FastAPI
app = FastAPI()

@app.get("/items/{item_id}")
async def read_item(item_id: int):
    return {"item_id": item_id}',
  true, 'https://github.com/fastapi/fastapi', 80000, 6800
),
(
  'Django',
  'django',
  'Django, Python''un en kapsamlı web çerçevesidir ve "batteries included" felsefesiyle ORM, admin paneli, kimlik doğrulama ve güvenlik araçlarını yerleşik olarak sunar. Hızlı geliştirme ve temiz tasarım prensiplerini benimser.',
  'https://github.com/django/django',
  NULL,
  'Ücretsiz (BSD Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['python', 'web-framework', 'fullstack', 'orm', 'open-source'],
  ARRAY['ORM', 'Admin panel', 'Authentication', 'Security', 'Template engine'],
  NULL,
  true, 'https://github.com/django/django', 82000, 32000
),
(
  'Laravel',
  'laravel',
  'Laravel, PHP''nin en popüler web çerçevesidir ve zarif sözdizimi ile hızlı uygulama geliştirmeyi hedefler. Eloquent ORM, Blade şablon motoru, kuyruk sistemi ve kapsamlı ekosistemi ile tam yığın PHP geliştirme sunar.',
  'https://github.com/laravel/laravel',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['php', 'web-framework', 'fullstack', 'orm', 'open-source'],
  ARRAY['Eloquent ORM', 'Blade templates', 'Queue system', 'Broadcasting', 'Laravel Forge'],
  NULL,
  true, 'https://github.com/laravel/laravel', 79000, 24000
),
(
  'Ruby on Rails',
  'ruby-on-rails',
  'Ruby on Rails, Ruby programlama dili ile geliştirilen ve "convention over configuration" prensibini benimseyen web çerçevesidir. Active Record, Action Cable ve Turbo gibi araçlarla hızlı prototipleme ve full-stack geliştirme sunar.',
  'https://github.com/rails/rails',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['ruby', 'web-framework', 'fullstack', 'mvc', 'open-source'],
  ARRAY['Active Record', 'Action Cable', 'Turbo/Hotwire', 'Active Job', 'Convention over configuration'],
  NULL,
  true, 'https://github.com/rails/rails', 56000, 21000
),
(
  'Express.js',
  'expressjs',
  'Express.js, Node.js için minimalist ve esnek bir web uygulama çerçevesidir. Middleware mimarisi, yönlendirme sistemi ve geniş eklenti ekosistemi ile RESTful API''ler ve web uygulamaları geliştirmek için en yaygın kullanılan Node.js çerçevesidir.',
  'https://github.com/expressjs/express',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['javascript', 'nodejs', 'web-framework', 'backend', 'open-source'],
  ARRAY['Middleware', 'Routing', 'Template engines', 'Error handling', 'Static files'],
  'const express = require(''express'');
const app = express();
app.get(''/api/hello'', (req, res) => {
  res.json({ message: ''Hello World'' });
});
app.listen(3000);',
  true, 'https://github.com/expressjs/express', 66000, 16000
),
(
  'NestJS',
  'nestjs',
  'NestJS, TypeScript ile ölçeklenebilir sunucu taraflı uygulamalar geliştirmek için tasarlanmış bir Node.js çerçevesidir. Angular''dan ilham alan modüler mimari, bağımlılık enjeksiyonu ve dekoratör tabanlı yapısı ile kurumsal düzeyde backend geliştirme sunar.',
  'https://github.com/nestjs/nest',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['typescript', 'nodejs', 'backend', 'enterprise', 'open-source'],
  ARRAY['Modular architecture', 'Dependency injection', 'GraphQL support', 'Microservices', 'WebSocket gateway'],
  NULL,
  true, 'https://github.com/nestjs/nest', 69000, 7700
),
(
  'Astro',
  'astro',
  'Astro, içerik odaklı web siteleri oluşturmak için tasarlanmış modern bir web çerçevesidir. Sıfır JavaScript varsayılanı, ada mimarisi ve çoklu framework desteği ile ultra hızlı statik siteler ve SSR uygulamaları geliştirmenizi sağlar.',
  'https://github.com/withastro/astro',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['javascript', 'typescript', 'static-site', 'ssr', 'open-source'],
  ARRAY['Zero JS by default', 'Island architecture', 'Multi-framework', 'Content collections', 'View transitions'],
  NULL,
  true, 'https://github.com/withastro/astro', 48000, 2500
),
(
  'Remix',
  'remix',
  'Remix, React tabanlı tam yığın web çerçevesidir ve web standartlarına odaklanır. Nested routing, progressive enhancement ve server-side rendering ile performanslı ve erişilebilir web uygulamaları geliştirmenizi sağlar.',
  'https://github.com/remix-run/remix',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['typescript', 'react', 'fullstack', 'ssr', 'open-source'],
  ARRAY['Nested routing', 'Progressive enhancement', 'Server-side rendering', 'Data loading', 'Error boundaries'],
  NULL,
  true, 'https://github.com/remix-run/remix', 30000, 2500
),
(
  'Nuxt',
  'nuxt',
  'Nuxt, Vue.js tabanlı tam yığın web çerçevesidir ve otomatik yönlendirme, SSR, SSG ve API katmanı gibi kapsamlı özellikler sunar. Modül ekosistemi ve Nitro sunucu motoru ile Vue uygulamalarını üretim kalitesine taşır.',
  'https://github.com/nuxt/nuxt',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['typescript', 'vue', 'fullstack', 'ssr', 'open-source'],
  ARRAY['Auto-routing', 'SSR/SSG/ISR', 'Nitro server', 'Module ecosystem', 'Auto-imports'],
  NULL,
  true, 'https://github.com/nuxt/nuxt', 56000, 5100
),
(
  'Electron',
  'electron',
  'Electron, HTML, CSS ve JavaScript ile masaüstü uygulamaları oluşturmanızı sağlayan bir çerçevedir. Chromium ve Node.js üzerine inşa edilmiş olup VS Code, Slack ve Discord gibi popüler uygulamaların temelini oluşturur.',
  'https://github.com/electron/electron',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['javascript', 'typescript', 'desktop', 'cross-platform', 'open-source'],
  ARRAY['Cross-platform desktop', 'Chromium-based', 'Node.js integration', 'Auto-updater', 'Native APIs'],
  NULL,
  true, 'https://github.com/electron/electron', 115000, 15000
),
(
  'Tauri',
  'tauri',
  'Tauri, Rust ve web teknolojileri ile hafif ve güvenli masaüstü uygulamaları oluşturmanızı sağlayan bir çerçevedir. Electron''a göre çok daha küçük paket boyutu, düşük bellek kullanımı ve güvenlik odaklı mimari ile öne çıkar.',
  'https://github.com/tauri-apps/tauri',
  NULL,
  'Ücretsiz (MIT/Apache 2.0 Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['rust', 'typescript', 'desktop', 'cross-platform', 'open-source'],
  ARRAY['Small bundle size', 'Rust backend', 'Security focused', 'Cross-platform', 'Plugin system'],
  NULL,
  true, 'https://github.com/tauri-apps/tauri', 87000, 2600
),
(
  'Flutter',
  'flutter',
  'Flutter, Google tarafından geliştirilen açık kaynaklı UI toolkit''idir ve tek kod tabanından iOS, Android, web ve masaüstü uygulamaları oluşturmanızı sağlar. Dart dili, widget tabanlı mimari ve hot reload ile hızlı çapraz platform geliştirme sunar.',
  'https://github.com/flutter/flutter',
  NULL,
  'Ücretsiz (BSD Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['dart', 'mobile', 'cross-platform', 'ui', 'open-source'],
  ARRAY['Cross-platform', 'Hot reload', 'Widget-based', 'Material & Cupertino', 'Dart language'],
  NULL,
  true, 'https://github.com/flutter/flutter', 168000, 28000
),
(
  'React Native',
  'react-native',
  'React Native, Meta tarafından geliştirilen ve React ile yerel mobil uygulamalar oluşturmanızı sağlayan bir çerçevedir. JavaScript ile iOS ve Android için tek kod tabanından performanslı mobil uygulamalar geliştirmenize olanak tanır.',
  'https://github.com/facebook/react-native',
  NULL,
  'Ücretsiz (MIT Lisansı)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['javascript', 'typescript', 'mobile', 'cross-platform', 'open-source'],
  ARRAY['Native components', 'Hot reloading', 'Cross-platform', 'New Architecture (Fabric)', 'Large ecosystem'],
  NULL,
  true, 'https://github.com/facebook/react-native', 120000, 24000
),
(
  'Expo',
  'expo',
  'Expo, React Native uygulamaları geliştirmek, derlemek ve dağıtmak için kullanılan kapsamlı bir platformdur. Expo Router, EAS Build ve zengin SDK modülleri ile React Native geliştirme deneyimini büyük ölçüde kolaylaştırır.',
  'https://github.com/expo/expo',
  NULL,
  'Ücretsiz (MIT Lisansı), EAS: $99/ay (Production)',
  (SELECT id FROM categories WHERE slug = 'github-repolari'),
  ARRAY['typescript', 'react-native', 'mobile', 'cross-platform', 'open-source'],
  ARRAY['Expo Router', 'EAS Build', 'OTA updates', 'Expo SDK modules', 'Web support'],
  NULL,
  true, 'https://github.com/expo/expo', 36000, 5800
)
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- SEED COMPLETE
-- Total: 84 APIs + 30 GitHub repos = 114 entries
-- ============================================================================
