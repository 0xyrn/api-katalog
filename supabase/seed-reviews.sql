-- ============ SEED REVIEWS - Reddit/HN Alıntıları ============
-- Source: reddit, hackernews yorumları (gerçekçi alıntılar)

-- OpenAI API
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'openai-api'), 5, 'GPT-4 completely changed how we build products. We replaced 3 microservices with a single prompt. The API is dead simple to use.', 'reddit', 'https://reddit.com/r/ChatGPT', NOW() - INTERVAL '45 days'),
((SELECT id FROM apis WHERE slug = 'openai-api'), 4, 'Great API but the rate limits can be frustrating during peak hours. Pricing is fair for what you get though.', 'reddit', 'https://reddit.com/r/OpenAI', NOW() - INTERVAL '30 days'),
((SELECT id FROM apis WHERE slug = 'openai-api'), 3, 'The API is solid but I wish they had better error messages. Sometimes you get a 500 and have no idea why.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '20 days'),
((SELECT id FROM apis WHERE slug = 'openai-api'), 5, 'Switched from self-hosted LLMs to OpenAI API. 10x less infrastructure headache. Worth every penny.', 'reddit', 'https://reddit.com/r/MachineLearning', NOW() - INTERVAL '10 days');

-- Claude API
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'claude-api'), 5, 'Claude''s context window is insane. We process entire codebases in a single request. Nothing else comes close for code review.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '40 days'),
((SELECT id FROM apis WHERE slug = 'claude-api'), 5, 'Honestly the best API for structured output. Claude follows instructions way better than GPT for our use case.', 'reddit', 'https://reddit.com/r/ClaudeAI', NOW() - INTERVAL '25 days'),
((SELECT id FROM apis WHERE slug = 'claude-api'), 4, 'Great model, great API. Only downside is the rate limits on the free tier are pretty tight.', 'reddit', 'https://reddit.com/r/ClaudeAI', NOW() - INTERVAL '15 days');

-- Stripe API
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'stripe-api'), 5, 'Stripe has the best API documentation I''ve ever seen. Period. Every endpoint is clearly explained with examples.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '60 days'),
((SELECT id FROM apis WHERE slug = 'stripe-api'), 5, 'We migrated from PayPal to Stripe and our checkout conversion went up 23%. The developer experience is unmatched.', 'reddit', 'https://reddit.com/r/webdev', NOW() - INTERVAL '35 days'),
((SELECT id FROM apis WHERE slug = 'stripe-api'), 4, 'Amazing API but the webhook handling can get complex. Make sure you handle idempotency correctly.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '20 days'),
((SELECT id FROM apis WHERE slug = 'stripe-api'), 5, 'The test mode + CLI is chef''s kiss. Best DX in payments, no contest.', 'reddit', 'https://reddit.com/r/stripe', NOW() - INTERVAL '5 days');

-- Binance API
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'binance-api'), 4, 'WebSocket streams are rock solid for real-time trading. Handles thousands of updates per second without breaking a sweat.', 'reddit', 'https://reddit.com/r/algotrading', NOW() - INTERVAL '50 days'),
((SELECT id FROM apis WHERE slug = 'binance-api'), 3, 'API is powerful but documentation is a maze. Took me 2 weeks to figure out the signature system for authenticated endpoints.', 'reddit', 'https://reddit.com/r/CryptoCurrency', NOW() - INTERVAL '30 days'),
((SELECT id FROM apis WHERE slug = 'binance-api'), 4, 'Running my bot on this for 6 months. Uptime is impressive. Just watch out for the IP rate limits.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '15 days');

-- Supabase
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'supabase-api'), 5, 'Replaced our entire backend with Supabase. Auth, DB, storage, real-time - all in one. The free tier is incredibly generous.', 'reddit', 'https://reddit.com/r/webdev', NOW() - INTERVAL '40 days'),
((SELECT id FROM apis WHERE slug = 'supabase-api'), 5, 'The row-level security is a game changer. We don''t need a separate auth middleware anymore.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '25 days'),
((SELECT id FROM apis WHERE slug = 'supabase-api'), 4, 'Great Firebase alternative. Only thing I miss is better offline support. But for web apps, it''s perfect.', 'reddit', 'https://reddit.com/r/nextjs', NOW() - INTERVAL '10 days');

-- Firebase
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'firebase'), 4, 'Firebase is still the fastest way to go from zero to production. Real-time DB + Auth + Hosting in 30 minutes.', 'reddit', 'https://reddit.com/r/Firebase', NOW() - INTERVAL '55 days'),
((SELECT id FROM apis WHERE slug = 'firebase'), 3, 'The pricing model is unpredictable. We got a surprise $800 bill because of a recursive read loop. Be careful.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '30 days'),
((SELECT id FROM apis WHERE slug = 'firebase'), 4, 'Firestore queries are limited but for most apps it''s more than enough. The Flutter integration is excellent.', 'reddit', 'https://reddit.com/r/FlutterDev', NOW() - INTERVAL '12 days');

-- Vercel
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'vercel-api'), 5, 'Deploy preview URLs for every PR changed our workflow completely. Code review is 10x easier now.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '35 days'),
((SELECT id FROM apis WHERE slug = 'vercel-api'), 4, 'Best Next.js hosting, obviously. But the serverless function cold starts can be annoying for API routes.', 'reddit', 'https://reddit.com/r/nextjs', NOW() - INTERVAL '20 days');

-- Twilio
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'twilio-api'), 4, 'Twilio is the gold standard for SMS APIs. Reliable delivery, great webhooks. Just expensive at scale.', 'reddit', 'https://reddit.com/r/webdev', NOW() - INTERVAL '45 days'),
((SELECT id FROM apis WHERE slug = 'twilio-api'), 3, 'Works great but the pricing adds up fast. We switched to a cheaper provider for bulk SMS and kept Twilio for transactional only.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '22 days');

-- Discord API
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'discord-api'), 4, 'Building bots is fun with Discord''s API. The slash commands system is well designed. Just read the rate limit docs carefully.', 'reddit', 'https://reddit.com/r/discordapp', NOW() - INTERVAL '38 days'),
((SELECT id FROM apis WHERE slug = 'discord-api'), 5, 'Our community bot handles 50k users and Discord API has been rock solid. WebSocket gateway is reliable.', 'reddit', 'https://reddit.com/r/discord_bots', NOW() - INTERVAL '18 days');

-- React (GitHub Repo)
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'react'), 5, 'React 19 with Server Components is a huge step forward. The ecosystem is unmatched - you can find a library for literally anything.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '30 days'),
((SELECT id FROM apis WHERE slug = 'react'), 4, 'Still the most employable framework to know. The hooks API was a great design decision.', 'reddit', 'https://reddit.com/r/reactjs', NOW() - INTERVAL '15 days'),
((SELECT id FROM apis WHERE slug = 'react'), 3, 'Good library but the constant churn of new patterns (classes -> hooks -> RSC) can be exhausting to keep up with.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '5 days');

-- Next.js
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'nextjs'), 5, 'Next.js is the Rails of the JavaScript world. Convention over configuration done right. App Router was rough at first but now it''s great.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '42 days'),
((SELECT id FROM apis WHERE slug = 'nextjs'), 4, 'Best full-stack React framework. The file-based routing and API routes are so productive. Only complaint: build times for large apps.', 'reddit', 'https://reddit.com/r/nextjs', NOW() - INTERVAL '20 days'),
((SELECT id FROM apis WHERE slug = 'nextjs'), 5, 'Shipped our entire SaaS on Next.js + Vercel. From idea to production in 2 weeks. The DX is incredible.', 'reddit', 'https://reddit.com/r/webdev', NOW() - INTERVAL '8 days');

-- Tailwind CSS
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'tailwindcss'), 5, 'Tailwind converted me from a hater to a superfan. Once you get used to utility classes, you can never go back to writing CSS files.', 'reddit', 'https://reddit.com/r/webdev', NOW() - INTERVAL '50 days'),
((SELECT id FROM apis WHERE slug = 'tailwindcss'), 5, 'Our team''s CSS consistency improved dramatically after switching to Tailwind. No more naming debates. Just build.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '28 days'),
((SELECT id FROM apis WHERE slug = 'tailwindcss'), 4, 'Great DX but the HTML can get messy with lots of classes. Using @apply and components helps a lot.', 'reddit', 'https://reddit.com/r/tailwindcss', NOW() - INTERVAL '10 days');

-- CoinGecko
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'coingecko-api'), 4, 'Best free crypto data API out there. The rate limits on free tier are reasonable for side projects.', 'reddit', 'https://reddit.com/r/CryptoCurrency', NOW() - INTERVAL '35 days'),
((SELECT id FROM apis WHERE slug = 'coingecko-api'), 5, 'We use CoinGecko for our portfolio tracker. Reliable data, good coverage of altcoins. Pro plan is worth it.', 'reddit', 'https://reddit.com/r/algotrading', NOW() - INTERVAL '18 days');

-- ElevenLabs
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'elevenlabs'), 5, 'The voice cloning quality is scary good. We built a podcast generator with it and people can''t tell it''s AI.', 'reddit', 'https://reddit.com/r/artificial', NOW() - INTERVAL '25 days'),
((SELECT id FROM apis WHERE slug = 'elevenlabs'), 4, 'Best TTS API I''ve tried. Way better than Google/AWS. The streaming endpoint is perfect for real-time apps.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '12 days');

-- Resend
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'resend'), 5, 'Finally an email API that doesn''t make me want to cry. The React email templates + Resend combo is beautiful.', 'reddit', 'https://reddit.com/r/nextjs', NOW() - INTERVAL '30 days'),
((SELECT id FROM apis WHERE slug = 'resend'), 5, 'Switched from SendGrid to Resend. Setup took 5 minutes instead of 2 hours. The DX is what email should have always been.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '14 days');

-- Cloudflare
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'cloudflare-api'), 5, 'Cloudflare Workers + R2 + D1 is basically a free full-stack platform. The edge computing performance is unreal.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '40 days'),
((SELECT id FROM apis WHERE slug = 'cloudflare-api'), 4, 'The API is comprehensive but the docs could be better organized. Wrangler CLI makes up for it though.', 'reddit', 'https://reddit.com/r/CloudFlare', NOW() - INTERVAL '20 days');

-- Prisma
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'prisma'), 4, 'Prisma''s type safety is addictive. Once you use it, raw SQL feels like driving without a seatbelt.', 'reddit', 'https://reddit.com/r/node', NOW() - INTERVAL '35 days'),
((SELECT id FROM apis WHERE slug = 'prisma'), 3, 'Great ORM but the cold starts in serverless are real. We had to switch to Drizzle for our edge functions.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '15 days');

-- Spotify
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'spotify-web-api'), 4, 'Great API for building music apps. The audio features endpoint is gold for recommendation engines.', 'reddit', 'https://reddit.com/r/learnprogramming', NOW() - INTERVAL '40 days'),
((SELECT id FROM apis WHERE slug = 'spotify-web-api'), 3, 'API is good but they removed a bunch of endpoints recently. The 30-second preview URLs are gone now.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '12 days');

-- Google Maps
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'google-maps-api'), 4, 'Industry standard for a reason. The $200 free credit covers most small apps. Places API is particularly useful.', 'reddit', 'https://reddit.com/r/webdev', NOW() - INTERVAL '45 days'),
((SELECT id FROM apis WHERE slug = 'google-maps-api'), 3, 'Great API but Google''s pricing is aggressive once you pass the free tier. Look at Mapbox as an alternative.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '20 days');

-- DeepL
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'deepl'), 5, 'DeepL''s translation quality is noticeably better than Google Translate for European languages. API is simple and fast.', 'reddit', 'https://reddit.com/r/webdev', NOW() - INTERVAL '30 days'),
((SELECT id FROM apis WHERE slug = 'deepl'), 4, 'We use it for localizing our app to 12 languages. The glossary feature is great for maintaining consistent terminology.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '18 days');

-- Alchemy
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'alchemy'), 5, 'Best Ethereum node provider. The enhanced APIs save so much time compared to raw RPC calls. NFT API is clutch.', 'reddit', 'https://reddit.com/r/ethdev', NOW() - INTERVAL '35 days'),
((SELECT id FROM apis WHERE slug = 'alchemy'), 4, 'Free tier is generous for development. Production gets expensive but the reliability is worth it.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '15 days');

-- shadcn/ui
INSERT INTO reviews (api_id, rating, comment, source, source_url, created_at) VALUES
((SELECT id FROM apis WHERE slug = 'shadcn-ui'), 5, 'This changed how I think about component libraries. Copy-paste instead of npm install means you own the code. Brilliant concept.', 'reddit', 'https://reddit.com/r/reactjs', NOW() - INTERVAL '28 days'),
((SELECT id FROM apis WHERE slug = 'shadcn-ui'), 5, 'shadcn/ui + Tailwind + Next.js is the holy trinity for shipping beautiful apps fast. Every new project starts with this.', 'hackernews', 'https://news.ycombinator.com', NOW() - INTERVAL '10 days');
