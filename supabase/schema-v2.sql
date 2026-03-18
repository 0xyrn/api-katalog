-- ============ SCHEMA V2 - YENİ KOLONLAR ============

-- apis tablosuna yeni kolonlar
ALTER TABLE apis ADD COLUMN IF NOT EXISTS tags TEXT[] DEFAULT '{}';
ALTER TABLE apis ADD COLUMN IF NOT EXISTS features TEXT[] DEFAULT '{}';
ALTER TABLE apis ADD COLUMN IF NOT EXISTS code_example TEXT DEFAULT '';
ALTER TABLE apis ADD COLUMN IF NOT EXISTS is_repo BOOLEAN DEFAULT false;
ALTER TABLE apis ADD COLUMN IF NOT EXISTS github_url TEXT;
ALTER TABLE apis ADD COLUMN IF NOT EXISTS github_stars INT DEFAULT 0;
ALTER TABLE apis ADD COLUMN IF NOT EXISTS github_forks INT DEFAULT 0;

-- reviews tablosuna kaynak bilgisi
ALTER TABLE reviews ADD COLUMN IF NOT EXISTS source TEXT DEFAULT 'user';
ALTER TABLE reviews ADD COLUMN IF NOT EXISTS source_url TEXT;

-- reviews tablosundaki unique constraint'i kaldır (Reddit/HN yorumları için)
ALTER TABLE reviews DROP CONSTRAINT IF EXISTS reviews_user_id_api_id_key;

-- user_id nullable yap (Reddit/HN yorumları user olmadan eklenecek)
ALTER TABLE reviews ALTER COLUMN user_id DROP NOT NULL;

-- Yeni kategoriler
INSERT INTO categories (name, slug, description, icon) VALUES
  ('GitHub Repoları', 'github-repolari', 'Popüler open source projeler, framework''ler ve kütüphaneler', '⭐'),
  ('Blockchain & Web3', 'blockchain-web3', 'Blockchain, DeFi, NFT ve Web3 geliştirme API servisleri', '⛓️'),
  ('Medya & Dosya', 'medya-dosya', 'Görüntü işleme, dosya depolama ve CDN servisleri', '📁')
ON CONFLICT (slug) DO NOTHING;
