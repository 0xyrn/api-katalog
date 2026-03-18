-- Kategoriler tablosu
CREATE TABLE categories (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  description TEXT NOT NULL DEFAULT '',
  icon TEXT NOT NULL DEFAULT '📦',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- API'ler tablosu
CREATE TABLE apis (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  description TEXT NOT NULL DEFAULT '',
  logo_url TEXT,
  website_url TEXT NOT NULL,
  affiliate_url TEXT,
  pricing_info TEXT NOT NULL DEFAULT 'Ücretsiz',
  category_id UUID REFERENCES categories(id) ON DELETE CASCADE,
  avg_rating DECIMAL(2,1) DEFAULT 0,
  review_count INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Yorumlar tablosu
CREATE TABLE reviews (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  api_id UUID REFERENCES apis(id) ON DELETE CASCADE NOT NULL,
  rating INT CHECK (rating >= 1 AND rating <= 5) NOT NULL,
  comment TEXT NOT NULL DEFAULT '',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, api_id) -- Her kullanıcı bir API'ye tek yorum
);

-- Favoriler tablosu
CREATE TABLE favorites (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  api_id UUID REFERENCES apis(id) ON DELETE CASCADE NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, api_id)
);

-- Tıklama takibi (affiliate analytics)
CREATE TABLE click_tracks (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  api_id UUID REFERENCES apis(id) ON DELETE CASCADE NOT NULL,
  user_id UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  clicked_at TIMESTAMPTZ DEFAULT NOW()
);

-- İndeksler
CREATE INDEX idx_apis_category ON apis(category_id);
CREATE INDEX idx_apis_slug ON apis(slug);
CREATE INDEX idx_reviews_api ON reviews(api_id);
CREATE INDEX idx_reviews_user ON reviews(user_id);
CREATE INDEX idx_categories_slug ON categories(slug);

-- Puan ortalamasını otomatik güncelleyen fonksiyon
CREATE OR REPLACE FUNCTION update_api_rating()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE apis SET
    avg_rating = (SELECT COALESCE(AVG(rating), 0) FROM reviews WHERE api_id = COALESCE(NEW.api_id, OLD.api_id)),
    review_count = (SELECT COUNT(*) FROM reviews WHERE api_id = COALESCE(NEW.api_id, OLD.api_id))
  WHERE id = COALESCE(NEW.api_id, OLD.api_id);
  RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

-- Trigger: Yorum eklenince/güncellenince/silinince puan güncelle
CREATE TRIGGER trigger_update_rating
AFTER INSERT OR UPDATE OR DELETE ON reviews
FOR EACH ROW EXECUTE FUNCTION update_api_rating();

-- Row Level Security
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE apis ENABLE ROW LEVEL SECURITY;
ALTER TABLE reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE favorites ENABLE ROW LEVEL SECURITY;
ALTER TABLE click_tracks ENABLE ROW LEVEL SECURITY;

-- Herkes okuyabilir
CREATE POLICY "Herkes kategorileri görebilir" ON categories FOR SELECT USING (true);
CREATE POLICY "Herkes API'leri görebilir" ON apis FOR SELECT USING (true);
CREATE POLICY "Herkes yorumları görebilir" ON reviews FOR SELECT USING (true);

-- Giriş yapmış kullanıcılar yorum/favori ekleyebilir
CREATE POLICY "Giriş yapanlar yorum ekleyebilir" ON reviews FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Kullanıcılar kendi yorumlarını düzenleyebilir" ON reviews FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Kullanıcılar kendi yorumlarını silebilir" ON reviews FOR DELETE USING (auth.uid() = user_id);

CREATE POLICY "Giriş yapanlar favori ekleyebilir" ON favorites FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Giriş yapanlar favori ekleyebilir insert" ON favorites FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Kullanıcılar kendi favorilerini silebilir" ON favorites FOR DELETE USING (auth.uid() = user_id);

CREATE POLICY "Herkes tıklama kaydı oluşturabilir" ON click_tracks FOR INSERT WITH CHECK (true);

-- ============ ÖRNEK VERİLER ============

-- Kategoriler
INSERT INTO categories (name, slug, description, icon) VALUES
  ('Finans & Trading', 'finans-trading', 'Kripto, borsa, ödeme ve finansal veri API servisleri', '💰'),
  ('AI & Makine Öğrenimi', 'ai-ml', 'Yapay zeka, NLP, görüntü işleme ve ML API servisleri', '🤖'),
  ('Geliştirici Araçları', 'gelistirici-araclari', 'Auth, mesajlaşma, bulut ve DevOps API servisleri', '🛠️'),
  ('Sosyal Medya', 'sosyal-medya', 'Sosyal medya platformları ve içerik API servisleri', '📱'),
  ('E-ticaret', 'e-ticaret', 'Ödeme, kargo, ürün ve mağaza API servisleri', '🛒'),
  ('Harita & Konum', 'harita-konum', 'Harita, geocoding ve konum bazlı API servisleri', '🗺️'),
  ('Hava Durumu', 'hava-durumu', 'Hava durumu ve meteoroloji API servisleri', '🌤️'),
  ('İletişim', 'iletisim', 'Email, SMS, push bildirim ve mesajlaşma API servisleri', '📧'),
  ('Eğlence', 'eglence', 'Oyun, müzik, film ve eğlence API servisleri', '🎮'),
  ('Sağlık', 'saglik', 'Sağlık, fitness ve medikal veri API servisleri', '🏥'),
  ('Eğitim', 'egitim', 'Eğitim, kurs ve öğrenme platformu API servisleri', '📚'),
  ('Güvenlik', 'guvenlik', 'Siber güvenlik, şifreleme ve doğrulama API servisleri', '🔒');

-- Örnek API'ler
INSERT INTO apis (name, slug, description, website_url, affiliate_url, pricing_info, category_id) VALUES
  ('Binance API', 'binance-api', 'Dünyanın en büyük kripto borsasının API servisi. Spot, futures, margin trading ve piyasa verileri.', 'https://www.binance.com/en/binance-api', NULL, 'Ücretsiz (işlem komisyonu var)', (SELECT id FROM categories WHERE slug = 'finans-trading')),
  ('Stripe API', 'stripe-api', 'Online ödeme altyapısı. Kredi kartı, abonelik, fatura ve ödeme yönetimi.', 'https://stripe.com/docs/api', NULL, 'İşlem başına %2.9 + 30¢', (SELECT id FROM categories WHERE slug = 'finans-trading')),
  ('CoinGecko API', 'coingecko-api', 'Kapsamlı kripto para verileri. Fiyat, hacim, market cap ve geçmiş veriler.', 'https://www.coingecko.com/en/api', NULL, 'Ücretsiz (rate limit var)', (SELECT id FROM categories WHERE slug = 'finans-trading')),
  ('OpenAI API', 'openai-api', 'GPT-4, DALL-E, Whisper modelleri. Metin üretimi, görüntü oluşturma, ses tanıma.', 'https://platform.openai.com/docs', NULL, 'Kullanım bazlı ($0.002/1K token~)', (SELECT id FROM categories WHERE slug = 'ai-ml')),
  ('Claude API', 'claude-api', 'Anthropic''un Claude modeli. Güvenli, yardımsever AI asistan API servisi.', 'https://docs.anthropic.com/en/docs', NULL, 'Kullanım bazlı', (SELECT id FROM categories WHERE slug = 'ai-ml')),
  ('Hugging Face API', 'huggingface-api', 'Binlerce ML modeline erişim. NLP, görüntü, ses ve daha fazlası.', 'https://huggingface.co/docs/api-inference', NULL, 'Ücretsiz tier mevcut', (SELECT id FROM categories WHERE slug = 'ai-ml')),
  ('Firebase', 'firebase', 'Google''ın uygulama geliştirme platformu. Auth, Firestore, Hosting, Cloud Functions.', 'https://firebase.google.com/docs', NULL, 'Ücretsiz tier (Spark plan)', (SELECT id FROM categories WHERE slug = 'gelistirici-araclari')),
  ('Twilio API', 'twilio-api', 'SMS, sesli arama, video ve WhatsApp mesajlaşma API servisi.', 'https://www.twilio.com/docs', NULL, 'Kullanım bazlı (SMS $0.0079~)', (SELECT id FROM categories WHERE slug = 'iletisim')),
  ('Google Maps API', 'google-maps-api', 'Harita, yol tarifi, geocoding ve yer bilgisi API servisi.', 'https://developers.google.com/maps', NULL, 'Aylık $200 kredi (ücretsiz)', (SELECT id FROM categories WHERE slug = 'harita-konum')),
  ('OpenWeather API', 'openweather-api', 'Hava durumu verileri. Güncel, tahmin, geçmiş ve hava haritaları.', 'https://openweathermap.org/api', NULL, 'Ücretsiz tier (1000 call/gün)', (SELECT id FROM categories WHERE slug = 'hava-durumu')),
  ('Shopify API', 'shopify-api', 'E-ticaret platformu API servisi. Ürün, sipariş, müşteri ve mağaza yönetimi.', 'https://shopify.dev/docs/api', NULL, 'Shopify planına dahil', (SELECT id FROM categories WHERE slug = 'e-ticaret')),
  ('Auth0', 'auth0', 'Kimlik doğrulama ve yetkilendirme platformu. OAuth, SSO, MFA desteği.', 'https://auth0.com/docs', NULL, 'Ücretsiz (7K kullanıcıya kadar)', (SELECT id FROM categories WHERE slug = 'guvenlik'));
