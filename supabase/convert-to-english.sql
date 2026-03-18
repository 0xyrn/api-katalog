-- ============================================================================
-- convert-to-english.sql
-- Converts all Turkish category names/descriptions and API descriptions to English
-- Generated: 2026-03-12
-- Usage: psql -f convert-to-english.sql  OR  run via Supabase SQL Editor
-- ============================================================================

-- ==========================================================================
-- CATEGORY UPDATES (15 categories)
-- ==========================================================================

UPDATE categories SET name = 'Finance & Trading', slug = 'finance-trading', description = 'Crypto, stock exchange, payment, and financial data API services' WHERE slug = 'finans-trading';
UPDATE categories SET name = 'AI & Machine Learning', description = 'Artificial intelligence, NLP, image processing, and ML API services' WHERE slug = 'ai-ml';
UPDATE categories SET name = 'Developer Tools', slug = 'developer-tools', description = 'Auth, messaging, cloud, and DevOps API services' WHERE slug = 'gelistirici-araclari';
UPDATE categories SET name = 'Social Media', slug = 'social-media', description = 'Social media platforms and content API services' WHERE slug = 'sosyal-medya';
UPDATE categories SET name = 'E-commerce', slug = 'e-commerce', description = 'Payment, shipping, product, and store API services' WHERE slug = 'e-ticaret';
UPDATE categories SET name = 'Maps & Location', slug = 'maps-location', description = 'Maps, geocoding, and location-based API services' WHERE slug = 'harita-konum';
UPDATE categories SET name = 'Weather', slug = 'weather', description = 'Weather and meteorology API services' WHERE slug = 'hava-durumu';
UPDATE categories SET name = 'Communication', slug = 'communication', description = 'Email, SMS, push notification, and messaging API services' WHERE slug = 'iletisim';
UPDATE categories SET name = 'Entertainment', slug = 'entertainment', description = 'Gaming, music, movies, and entertainment API services' WHERE slug = 'eglence';
UPDATE categories SET name = 'Health', slug = 'health', description = 'Health, fitness, and medical data API services' WHERE slug = 'saglik';
UPDATE categories SET name = 'Education', slug = 'education', description = 'Education, courses, and learning platform API services' WHERE slug = 'egitim';
UPDATE categories SET name = 'Security', slug = 'security', description = 'Cybersecurity, encryption, and verification API services' WHERE slug = 'guvenlik';
UPDATE categories SET name = 'GitHub Repos', slug = 'github-repos', description = 'Popular open source projects, frameworks, and libraries' WHERE slug = 'github-repolari';
UPDATE categories SET name = 'Blockchain & Web3', description = 'Blockchain, DeFi, NFT, and Web3 development API services' WHERE slug = 'blockchain-web3';
UPDATE categories SET name = 'Media & Files', slug = 'media-files', description = 'Image processing, file storage, and CDN services' WHERE slug = 'medya-dosya';

-- ==========================================================================
-- UPDATE category_id references in apis table to match new category slugs
-- (This is needed because we changed the slugs above)
-- ==========================================================================

-- No action needed here since category_id is a foreign key referencing the id column,
-- which does not change when slugs are updated.

-- ==========================================================================
-- FINANCE & TRADING APIs (10)
-- ==========================================================================

UPDATE apis SET description = 'Alpaca is an API platform that enables commission-free stock and cryptocurrency trading. It provides a robust infrastructure for developing algorithmic trading bots and offers paper trading support for risk-free testing.' WHERE slug = 'alpaca';

UPDATE apis SET description = 'Plaid is a fintech API platform that enables secure connections to bank accounts. It provides easy access to banking data such as account balance inquiries, transaction history, and identity verification.' WHERE slug = 'plaid';

UPDATE apis SET description = 'Coinbase API allows you to execute cryptocurrency buy and sell transactions and manage your portfolio. It offers comprehensive features including real-time price data, wallet management, and payment integration.' WHERE slug = 'coinbase';

UPDATE apis SET description = 'Kraken is one of the most trusted cryptocurrency exchanges globally and offers an advanced trading API. It caters to professional traders with a wide range of features including spot and futures trading, margin trading, and staking.' WHERE slug = 'kraken';

UPDATE apis SET description = 'TradingView is a platform that provides advanced charting and technical analysis tools for financial markets. You can integrate professional charting solutions into your own application using its widgets and charting library.' WHERE slug = 'tradingview';

UPDATE apis SET description = 'Alpha Vantage provides a free financial data API for stocks, forex, and cryptocurrencies. It serves as a comprehensive financial data source with technical indicators, fundamental analysis data, and time series data.' WHERE slug = 'alpha-vantage';

UPDATE apis SET description = 'Moralis offers a comprehensive blockchain data API for Web3 developers. It provides access to a wide variety of blockchain data including NFT data, token prices, wallet balances, and DeFi data through a single API.' WHERE slug = 'moralis';

UPDATE apis SET description = 'Polygon.io is an enterprise-grade financial data API that provides real-time and historical market data for stocks, options, forex, and cryptocurrencies. It delivers instant price streams via WebSocket support.' WHERE slug = 'polygon-io';

UPDATE apis SET description = 'IEX Cloud is a platform that provides financial data and infrastructure services. It offers easy access to comprehensive data including stock prices, company information, financial statements, and market statistics.' WHERE slug = 'iex-cloud';

UPDATE apis SET description = 'Yahoo Finance API (unofficial) provides programmatic access to Yahoo Finance data. It offers access to comprehensive financial information including stock prices, historical data, financial statements, and market news.' WHERE slug = 'yahoo-finance-api';

-- ==========================================================================
-- AI & ML APIs (10)
-- ==========================================================================

UPDATE apis SET description = 'Replicate allows you to easily run open-source machine learning models in the cloud. You can use Stable Diffusion, LLaMA, and thousands of other models via the API within seconds.' WHERE slug = 'replicate';

UPDATE apis SET description = 'Stability AI is the company behind the Stable Diffusion models and offers powerful image generation APIs. It provides advanced AI capabilities including text-to-image conversion, image editing, upscaling, and video generation.' WHERE slug = 'stability-ai';

UPDATE apis SET description = 'Cohere is an AI platform that provides enterprise-grade natural language processing (NLP) APIs. It offers models optimized for NLP tasks such as text generation, embeddings, classification, and reranking.' WHERE slug = 'cohere';

UPDATE apis SET description = 'Mistral AI is Europe''s leading artificial intelligence company, offering open-weight language models. It delivers high-performance text generation and code writing through models like Mistral, Mixtral, and Codestral.' WHERE slug = 'mistral-ai';

UPDATE apis SET description = 'Groq provides ultra-fast AI inference using LPU (Language Processing Unit) technology. It runs open-source models like Llama, Mixtral, and Gemma at unmatched speeds, delivering instant response times.' WHERE slug = 'groq';

UPDATE apis SET description = 'DeepL is the world''s most accurate AI-powered translation API. It offers professional-level text translation and document translation services with support for over 30 languages.' WHERE slug = 'deepl';

UPDATE apis SET description = 'AssemblyAI is a powerful AI API that converts speech to text. It offers advanced audio processing features including automatic speech recognition, speaker diarization, sentiment analysis, and content moderation.' WHERE slug = 'assemblyai';

UPDATE apis SET description = 'ElevenLabs is a platform that provides realistic AI-powered voice generation and text-to-speech conversion. It offers advanced voice technologies including voice cloning, multilingual speech synthesis, and voice dubbing.' WHERE slug = 'elevenlabs';

UPDATE apis SET description = 'Perplexity AI offers an AI API enhanced with internet search capabilities. It delivers superior performance in research and information retrieval tasks by generating AI responses that can access up-to-date information and cite sources.' WHERE slug = 'perplexity';

UPDATE apis SET description = 'Together AI is a cloud platform optimized for running open-source AI models with high performance. It offers support for over 100 models, fine-tuning capabilities, and custom model training.' WHERE slug = 'together-ai';

-- ==========================================================================
-- DEVELOPER TOOLS APIs (10)
-- ==========================================================================

UPDATE apis SET description = 'Vercel API provides programmatic access to Vercel platform features such as deployment management, domain configuration, and project settings. It offers powerful tools for CI/CD automation and serverless function management.' WHERE slug = 'vercel-api';

UPDATE apis SET description = 'Netlify API allows you to control Netlify platform features including website deployments, form submissions, split testing, and build hooks. It is ideal for automatically managing JAMstack applications.' WHERE slug = 'netlify-api';

UPDATE apis SET description = 'Cloudflare API enables you to programmatically control Cloudflare services such as DNS management, CDN configuration, firewall rules, and Workers. It provides comprehensive tools for web performance and security.' WHERE slug = 'cloudflare-api';

UPDATE apis SET description = 'Docker Hub API allows you to programmatically search, pull, and manage container images. It offers features such as repository management, image tags, and automated build configuration.' WHERE slug = 'docker-hub-api';

UPDATE apis SET description = 'NPM Registry API provides programmatic access to millions of packages in the Node.js package ecosystem. It offers features including package search, version information, download statistics, and dependency analysis.' WHERE slug = 'npm-registry';

UPDATE apis SET description = 'Sentry is a comprehensive platform for application error tracking and performance monitoring. It enables you to quickly detect and resolve errors with real-time error reporting, stack trace analysis, and user session replays.' WHERE slug = 'sentry';

UPDATE apis SET description = 'PostHog is an open-source product analytics platform that offers comprehensive tools including event tracking, session recording, feature flags, and A/B testing. It ensures data privacy with the option to self-host on your own servers.' WHERE slug = 'posthog';

UPDATE apis SET description = 'Supabase provides PostgreSQL-based backend services as an open-source alternative to Firebase. It offers comprehensive features including database, authentication, file storage, real-time subscriptions, and Edge Functions.' WHERE slug = 'supabase-api';

UPDATE apis SET description = 'PlanetScale is a MySQL-compatible serverless database platform that offers Git-like branching capabilities. It is ideal for modern application development with zero-downtime schema changes, automatic scaling, and global deployment.' WHERE slug = 'planetscale';

UPDATE apis SET description = 'Neon is a serverless PostgreSQL database platform that offers modern features such as automatic scaling, branching, and scale-to-zero capability. It provides deep integration with Vercel and other platforms.' WHERE slug = 'neon';

-- ==========================================================================
-- SOCIAL MEDIA APIs (8)
-- ==========================================================================

UPDATE apis SET description = 'Twitter/X API provides programmatic access to core features of the X platform including posting tweets, querying user information, reading timelines, and real-time streaming. It is widely used for bot development and social media analytics.' WHERE slug = 'twitter-x-api';

UPDATE apis SET description = 'Discord API provides access to all Discord platform features including server management, messaging, voice channels, and bot development. You can create rich bot experiences using slash commands, webhooks, and Gateway connections.' WHERE slug = 'discord-api';

UPDATE apis SET description = 'Telegram Bot API is the official API for creating and managing bots on the Telegram platform. It offers comprehensive bot development tools including message sending, inline queries, payment integration, and group management.' WHERE slug = 'telegram-bot-api';

UPDATE apis SET description = 'Reddit API provides programmatic access to Reddit platform features such as accessing subreddits, creating posts, reading comments, and querying user data. It is used for content analysis and community management.' WHERE slug = 'reddit-api';

UPDATE apis SET description = 'YouTube Data API provides access to YouTube platform data including video search, channel information, playlists, and comment management. It is offered through Google Cloud for video analytics and content management.' WHERE slug = 'youtube-data-api';

UPDATE apis SET description = 'Instagram Graph API provides access to features such as media management, profile information, and comment moderation for business and creator accounts. It is the official API offered through the Meta Developer Platform.' WHERE slug = 'instagram-graph-api';

UPDATE apis SET description = 'TikTok API allows you to integrate TikTok platform features into your applications, including video sharing, user data access, and advertising management. It offers tools such as Login Kit and Share Kit.' WHERE slug = 'tiktok-api';

UPDATE apis SET description = 'LinkedIn API allows you to integrate LinkedIn''s professional networking features into your applications, including profile information access, post sharing, company page management, and messaging.' WHERE slug = 'linkedin-api';

-- ==========================================================================
-- E-COMMERCE APIs (6)
-- ==========================================================================

UPDATE apis SET description = 'WooCommerce REST API allows you to programmatically manage your WordPress-based e-commerce store. It provides API access to comprehensive store operations including product, order, customer, and coupon management.' WHERE slug = 'woocommerce';

UPDATE apis SET description = 'Paddle is a platform that provides a complete payment infrastructure for SaaS companies. It simplifies complex payment processes including subscription management, tax calculation, invoicing, and global payment processing.' WHERE slug = 'paddle';

UPDATE apis SET description = 'Gumroad API is a simple e-commerce platform used for digital product sales and subscription management. It offers features including product creation, sales tracking, license verification, and webhook integration.' WHERE slug = 'gumroad';

UPDATE apis SET description = 'LemonSqueezy is a modern payment platform for digital products and SaaS subscriptions. It offers comprehensive sales tools including tax compliance, subscription management, licensing, and checkout experience.' WHERE slug = 'lemonsqueezy';

UPDATE apis SET description = 'PayPal API is the programmatic interface of one of the world''s most widely used payment platforms for online payment processing, invoicing, and money transfers. It offers comprehensive payment tools including checkout integration, subscription management, and dispute resolution.' WHERE slug = 'paypal-api';

UPDATE apis SET description = 'Square API provides comprehensive commerce solutions including payment processing, inventory management, customer relations, and employee management. It offers an omnichannel commerce infrastructure that unifies physical and online points of sale.' WHERE slug = 'square-api';

-- ==========================================================================
-- MAPS & LOCATION APIs (4)
-- ==========================================================================

UPDATE apis SET description = 'Mapbox is a powerful mapping platform that provides customizable maps, navigation, geocoding, and location-based services. It offers high-performance map rendering and data visualization tools for mobile and web applications.' WHERE slug = 'mapbox';

UPDATE apis SET description = 'HERE API is an enterprise-grade location platform that provides location services, map display, route calculation, and traffic information. It is optimized for industrial use cases such as logistics, transportation, and fleet tracking.' WHERE slug = 'here-api';

UPDATE apis SET description = 'TomTom API is a location technology platform that provides navigation, traffic information, map display, and geocoding services. It stands out with real-time traffic data and EV charging station information.' WHERE slug = 'tomtom';

UPDATE apis SET description = 'Leaflet is the most popular open-source JavaScript library for mobile-friendly interactive maps. It is ideal for developing web mapping applications with its lightweight structure, extensive plugin ecosystem, and ease of use.' WHERE slug = 'leaflet';

-- ==========================================================================
-- WEATHER APIs (3)
-- ==========================================================================

UPDATE apis SET description = 'WeatherAPI is a comprehensive weather API that provides current weather conditions, forecasts, historical data, and astronomy information. It offers rich data sets including 3-day free forecasts, air quality index, and sports suitability.' WHERE slug = 'weatherapi';

UPDATE apis SET description = 'Visual Crossing Weather API provides historical, current, and forecast weather data through a single API. It delivers comprehensive meteorological data with a 50-year historical data archive, hourly forecasts, and weather event alerts.' WHERE slug = 'visual-crossing';

UPDATE apis SET description = 'Tomorrow.io (formerly Climacell) is an advanced weather API that provides minute-by-minute precipitation forecasts, air quality data, and severe weather alerts. It delivers high-resolution local forecasts using micro-weather technology.' WHERE slug = 'tomorrow-io';

-- ==========================================================================
-- COMMUNICATION APIs (6)
-- ==========================================================================

UPDATE apis SET description = 'SendGrid (Twilio) is a reliable email API used for high-volume email delivery. It offers comprehensive features including transactional and marketing emails, template management, analytics, and deliverability optimization.' WHERE slug = 'sendgrid';

UPDATE apis SET description = 'Mailgun is a powerful email delivery API designed for developers. It provides high deliverability rates with advanced features such as email validation, routing, tracking, and log analysis.' WHERE slug = 'mailgun';

UPDATE apis SET description = 'Postmark is a fast and reliable email delivery service optimized for transactional emails. It stands out with high deliverability rates, detailed analytics, and message stream management.' WHERE slug = 'postmark';

UPDATE apis SET description = 'Resend is a next-generation email API designed for modern developers. It works seamlessly with React Email, enabling you to create component-based email templates and easily send emails through SDKs.' WHERE slug = 'resend';

UPDATE apis SET description = 'Pusher is a communication platform used for real-time notifications, live updates, and WebSocket connections. It provides instant data transmission for web and mobile applications through its Channels and Beams products.' WHERE slug = 'pusher';

UPDATE apis SET description = 'OneSignal is a multi-channel communication platform for web and mobile push notifications, email, and SMS delivery. It enables you to manage personalized notification campaigns with segmentation, A/B testing, and automation tools.' WHERE slug = 'onesignal';

-- ==========================================================================
-- ENTERTAINMENT APIs (5)
-- ==========================================================================

UPDATE apis SET description = 'Spotify Web API provides programmatic access to Spotify''s rich music data, including music search, playlist management, artist information queries, and user library access.' WHERE slug = 'spotify-web-api';

UPDATE apis SET description = 'The Movie Database (TMDB) API provides access to comprehensive entertainment data including movie and TV show information, cast data, images, and user ratings. It offers a large community-supported database.' WHERE slug = 'tmdb';

UPDATE apis SET description = 'IGDB (Internet Game Database) API is a Twitch-backed platform that provides comprehensive information about video games. It offers an extensive data set including game details, platforms, companies, and user ratings.' WHERE slug = 'igdb';

UPDATE apis SET description = 'Tenor (Google) is one of the world''s largest GIF platforms, offering a GIF search and sharing API. It enables you to add GIF support to your applications with features like keyword search, trending GIFs, and category filtering.' WHERE slug = 'tenor';

UPDATE apis SET description = 'Giphy API is a popular media platform that offers GIF and sticker search, trending content, and random GIF selection. It enables you to add fun content to your applications with its extensive GIF library and easy integration.' WHERE slug = 'giphy';

-- ==========================================================================
-- HEALTH APIs (3)
-- ==========================================================================

UPDATE apis SET description = 'Fitbit Web API provides access to users'' activity, sleep, heart rate, and nutrition data. It offers detailed biometric data collected from Fitbit devices for developing health and fitness applications.' WHERE slug = 'fitbit-api';

UPDATE apis SET description = 'Apple HealthKit is Apple''s official health data framework that provides access to health and fitness data from iOS and watchOS devices. It offers comprehensive health data including step counts, heart rhythm, sleep analysis, and medical records.' WHERE slug = 'apple-healthkit';

UPDATE apis SET description = 'FHIR (Fast Healthcare Interoperability Resources) is an international standard for health data exchange. It enables sharing of health information such as patient records, medical history, medication details, and clinical data in standardized formats.' WHERE slug = 'fhir-api';

-- ==========================================================================
-- EDUCATION APIs (3)
-- ==========================================================================

UPDATE apis SET description = 'Udemy API provides programmatic access to educational content on the Udemy platform, including course search, course details, and instructor information. It enables you to develop educational applications with affiliate integration and course recommendations.' WHERE slug = 'udemy-api';

UPDATE apis SET description = 'Khan Academy API is an interface that provides access to free educational content. It offers educational resources including video lessons, exercises, and progress tracking across subjects such as math, science, programming, and more.' WHERE slug = 'khan-academy-api';

UPDATE apis SET description = 'edX API provides access to online courses and programs offered by the world''s leading universities. It offers programmatic access to educational data including the course catalog, enrollment management, and certificate information.' WHERE slug = 'edx-api';

-- ==========================================================================
-- SECURITY APIs (5)
-- ==========================================================================

UPDATE apis SET description = 'Let''s Encrypt is an automated certificate authority that provides free SSL/TLS certificates. It enables you to programmatically obtain, renew, and revoke certificates through the ACME protocol.' WHERE slug = 'lets-encrypt';

UPDATE apis SET description = 'Cloudflare Security API enables you to programmatically manage security features such as DDoS protection, WAF rules, bot management, and threat analysis. It provides comprehensive protection with Zero Trust access control and security analytics.' WHERE slug = 'cloudflare-security';

UPDATE apis SET description = 'Have I Been Pwned API allows you to check whether email addresses have been involved in data breaches. It provides security verification tools including password leak checks, breach information, and domain-based search.' WHERE slug = 'haveibeenpwned';

UPDATE apis SET description = 'VirusTotal API enables you to scan files, URLs, domains, and IP addresses with over 70 antivirus engines. It provides a comprehensive platform for malware analysis, threat intelligence, and security research.' WHERE slug = 'virustotal';

UPDATE apis SET description = 'Snyk API is a security platform that enables you to detect and fix vulnerabilities in software dependencies. It analyzes security risks in open-source libraries, container images, and IaC configurations.' WHERE slug = 'snyk';

-- ==========================================================================
-- BLOCKCHAIN & WEB3 APIs (6)
-- ==========================================================================

UPDATE apis SET description = 'Alchemy is one of the most popular blockchain infrastructure platforms for Web3 developers. It offers node services, advanced APIs, and developer tools for Ethereum, Polygon, Arbitrum, and other EVM chains.' WHERE slug = 'alchemy';

UPDATE apis SET description = 'Infura (ConsenSys) is an infrastructure platform that provides reliable access to Ethereum and IPFS networks. It is a fundamental tool for developing Web3 applications with high availability, automatic scaling, and multi-network support.' WHERE slug = 'infura';

UPDATE apis SET description = 'Etherscan API is the most popular blockchain explorer API used for querying transactions, contracts, token transfers, and gas prices on the Ethereum blockchain. It provides detailed on-chain data analysis.' WHERE slug = 'etherscan';

UPDATE apis SET description = 'Chainlink is a decentralized oracle network that securely delivers real-world data to blockchain applications. It provides critical Web3 services including price feeds, verifiable random number generation (VRF), and cross-chain communication.' WHERE slug = 'chainlink';

UPDATE apis SET description = 'The Graph is a decentralized protocol that indexes blockchain data and enables querying via GraphQL. It uses subgraphs to quickly and efficiently query data from DeFi, NFT, and other Web3 applications.' WHERE slug = 'the-graph';

UPDATE apis SET description = 'QuickNode is a fast and reliable Web3 infrastructure platform that provides access to over 25 blockchain networks. It offers a comprehensive blockchain development experience with dedicated nodes, advanced APIs, and marketplace add-ons.' WHERE slug = 'quicknode';

-- ==========================================================================
-- MEDIA & FILES APIs (5)
-- ==========================================================================

UPDATE apis SET description = 'Cloudinary is a comprehensive cloud media platform for image and video management. It enables you to professionally manage your media files with automatic optimization, transformations, AI-based cropping, and CDN delivery.' WHERE slug = 'cloudinary';

UPDATE apis SET description = 'Imgix is a media platform that provides real-time image processing and CDN delivery. It offers the ability to instantly resize, crop, apply filters, and optimize images through URL-based transformations.' WHERE slug = 'imgix';

UPDATE apis SET description = 'Uploadthing is a modern file upload platform designed for Next.js and React applications. It simplifies file upload processes with a type-safe API, file validation, and automatic optimization.' WHERE slug = 'uploadthing';

UPDATE apis SET description = 'Amazon S3 (Simple Storage Service) is the world''s most widely used object storage service. It meets all file storage needs with unlimited scalability, high durability, and various storage classes.' WHERE slug = 'aws-s3';

UPDATE apis SET description = 'Bunny CDN is an affordable and high-performance content delivery network. It enables you to serve your web content quickly worldwide with global CDN, image optimization, video streaming, and DNS services.' WHERE slug = 'bunny-cdn';

-- ==========================================================================
-- GITHUB REPOS (30)
-- ==========================================================================

UPDATE apis SET description = 'React is the world''s most popular JavaScript library for building user interfaces, developed by Meta. It has become the standard for developing modern web applications with its component-based architecture, virtual DOM, and rich ecosystem.' WHERE slug = 'react';

UPDATE apis SET description = 'Vue.js is a progressive JavaScript framework for building user interfaces and single-page applications. It offers developers a flexible development experience with its easy learning curve, Composition API, and reactive data binding.' WHERE slug = 'vuejs';

UPDATE apis SET description = 'Next.js is a React-based full-stack web framework developed by Vercel. It is the most popular solution for building production-quality web applications with server-side rendering, static site generation, API routes, and App Router.' WHERE slug = 'nextjs';

UPDATE apis SET description = 'Svelte is an innovative UI framework that runs at compile time and does not use a virtual DOM. It enables you to build high-performance web applications with minimal boilerplate, true reactivity, and small bundle size.' WHERE slug = 'svelte';

UPDATE apis SET description = 'Tailwind CSS is a CSS framework that enables rapid UI development with a utility-first approach. It is the most popular tool for building modern web interfaces with predefined utility classes, responsive design, and dark mode support.' WHERE slug = 'tailwindcss';

UPDATE apis SET description = 'shadcn/ui is a reusable component collection built on Radix UI and Tailwind CSS. It provides full control with a copy-paste approach, offering customizable components that are added directly to your project rather than as an npm package.' WHERE slug = 'shadcn-ui';

UPDATE apis SET description = 'Prisma is a modern database ORM for Node.js and TypeScript. It greatly simplifies database operations with type-safe database queries, automatic migrations, and a visual database management tool (Prisma Studio).' WHERE slug = 'prisma';

UPDATE apis SET description = 'tRPC is a framework that enables you to build end-to-end type-safe APIs with TypeScript. It elevates the developer experience by providing full type safety between server and client without requiring code generation or schema definitions.' WHERE slug = 'trpc';

UPDATE apis SET description = 'Zustand is a minimal and flexible state management library for React applications. It stands out as a lightweight alternative to Redux with its simple API, middleware support, and boilerplate-free structure.' WHERE slug = 'zustand';

UPDATE apis SET description = 'TanStack Query (formerly React Query) is a powerful data fetching library for server state management. It offers advanced data management features including automatic caching, background refetching, pagination, and infinite scroll.' WHERE slug = 'tanstack-query';

UPDATE apis SET description = 'Zod is a TypeScript-first schema validation library. It enables you to safely validate API inputs, form data, and configuration files with runtime data validation, type inference, and composition support.' WHERE slug = 'zod';

UPDATE apis SET description = 'Drizzle ORM is a lightweight and performant database ORM for TypeScript. It provides modern database access with an SQL-like query builder, zero dependencies, and a structure optimized for serverless environments.' WHERE slug = 'drizzle-orm';

UPDATE apis SET description = 'Bun is a fast runtime, package manager, and bundler for JavaScript and TypeScript. It is an all-in-one tool that accelerates the development experience with Node.js-compatible APIs, a built-in test runner, and SQLite support.' WHERE slug = 'bun';

UPDATE apis SET description = 'Deno is a secure JavaScript and TypeScript runtime developed by Ryan Dahl, the creator of Node.js. It offers modern server-side development with built-in TypeScript support, a permission-based security model, and a standard library.' WHERE slug = 'deno';

UPDATE apis SET description = 'Rust is a systems programming language that offers memory safety and high performance. It enables you to develop safe and efficient software with its ownership model, zero-cost abstractions, and strong type system.' WHERE slug = 'rust-lang';

UPDATE apis SET description = 'Go (Golang) is a simple, efficient, and reliable programming language developed by Google. It is ideal for cloud services and microservices with built-in concurrency support, fast compilation times, and a powerful standard library.' WHERE slug = 'go-lang';

UPDATE apis SET description = 'FastAPI is a modern web framework for building high-performance APIs with Python. It offers a fast and reliable API development experience with automatic OpenAPI documentation, type validation, and async support.' WHERE slug = 'fastapi';

UPDATE apis SET description = 'Django is Python''s most comprehensive web framework, offering built-in ORM, admin panel, authentication, and security tools with its "batteries included" philosophy. It embraces rapid development and clean design principles.' WHERE slug = 'django';

UPDATE apis SET description = 'Laravel is the most popular PHP web framework, targeting rapid application development with its elegant syntax. It provides full-stack PHP development with Eloquent ORM, Blade template engine, queue system, and comprehensive ecosystem.' WHERE slug = 'laravel';

UPDATE apis SET description = 'Ruby on Rails is a web framework built with the Ruby programming language that embraces the "convention over configuration" principle. It offers rapid prototyping and full-stack development with tools like Active Record, Action Cable, and Turbo.' WHERE slug = 'ruby-on-rails';

UPDATE apis SET description = 'Express.js is a minimalist and flexible web application framework for Node.js. It is the most widely used Node.js framework for building RESTful APIs and web applications with its middleware architecture, routing system, and extensive plugin ecosystem.' WHERE slug = 'expressjs';

UPDATE apis SET description = 'NestJS is a Node.js framework designed for building scalable server-side applications with TypeScript. It provides enterprise-grade backend development with Angular-inspired modular architecture, dependency injection, and decorator-based structure.' WHERE slug = 'nestjs';

UPDATE apis SET description = 'Astro is a modern web framework designed for building content-focused websites. It enables you to develop ultra-fast static sites and SSR applications with zero JavaScript by default, island architecture, and multi-framework support.' WHERE slug = 'astro';

UPDATE apis SET description = 'Remix is a React-based full-stack web framework that focuses on web standards. It enables you to develop performant and accessible web applications with nested routing, progressive enhancement, and server-side rendering.' WHERE slug = 'remix';

UPDATE apis SET description = 'Nuxt is a Vue.js-based full-stack web framework that offers comprehensive features including automatic routing, SSR, SSG, and an API layer. It brings Vue applications to production quality with its module ecosystem and Nitro server engine.' WHERE slug = 'nuxt';

UPDATE apis SET description = 'Electron is a framework that enables you to build desktop applications using HTML, CSS, and JavaScript. Built on Chromium and Node.js, it forms the foundation of popular applications such as VS Code, Slack, and Discord.' WHERE slug = 'electron';

UPDATE apis SET description = 'Tauri is a framework that enables you to build lightweight and secure desktop applications using Rust and web technologies. It stands out from Electron with significantly smaller bundle sizes, lower memory usage, and a security-focused architecture.' WHERE slug = 'tauri';

UPDATE apis SET description = 'Flutter is an open-source UI toolkit developed by Google that enables you to build iOS, Android, web, and desktop applications from a single codebase. It offers fast cross-platform development with the Dart language, widget-based architecture, and hot reload.' WHERE slug = 'flutter';

UPDATE apis SET description = 'React Native is a framework developed by Meta that enables you to build native mobile applications with React. It allows you to develop performant mobile applications for both iOS and Android from a single JavaScript codebase.' WHERE slug = 'react-native';

UPDATE apis SET description = 'Expo is a comprehensive platform for developing, building, and deploying React Native applications. It greatly simplifies the React Native development experience with Expo Router, EAS Build, and rich SDK modules.' WHERE slug = 'expo';

-- ==========================================================================
-- ALSO UPDATE APIs FROM schema.sql (original seed data - 12 APIs)
-- ==========================================================================

UPDATE apis SET description = 'The world''s largest cryptocurrency exchange API service. Supports spot, futures, and margin trading along with comprehensive market data.' WHERE slug = 'binance-api';

UPDATE apis SET description = 'Online payment infrastructure API. Provides credit card processing, subscription billing, invoicing, and payment management.' WHERE slug = 'stripe-api';

UPDATE apis SET description = 'Comprehensive cryptocurrency data API. Provides prices, volume, market cap, and historical data for thousands of cryptocurrencies.' WHERE slug = 'coingecko-api';

UPDATE apis SET description = 'Access GPT-4, DALL-E, and Whisper models. Provides text generation, image creation, and speech recognition capabilities.' WHERE slug = 'openai-api';

UPDATE apis SET description = 'Anthropic''s Claude model API. A safe and helpful AI assistant API service for building intelligent applications.' WHERE slug = 'claude-api';

UPDATE apis SET description = 'Access thousands of ML models via Hugging Face. Supports NLP, computer vision, audio processing, and more.' WHERE slug = 'huggingface-api';

UPDATE apis SET description = 'Google''s application development platform. Provides Auth, Firestore, Hosting, Cloud Functions, and more for building and scaling apps.' WHERE slug = 'firebase';

UPDATE apis SET description = 'SMS, voice calls, video, and WhatsApp messaging API service. A comprehensive communication platform for building customer engagement solutions.' WHERE slug = 'twilio-api';

UPDATE apis SET description = 'Maps, directions, geocoding, and place information API service. The industry-standard mapping platform for web and mobile applications.' WHERE slug = 'google-maps-api';

UPDATE apis SET description = 'Weather data API providing current conditions, forecasts, historical data, and weather maps. A reliable source for weather-dependent applications.' WHERE slug = 'openweather-api';

UPDATE apis SET description = 'E-commerce platform API service. Provides product, order, customer, and store management for building online retail solutions.' WHERE slug = 'shopify-api';

UPDATE apis SET description = 'Authentication and authorization platform. Provides OAuth, SSO, and MFA support for securing applications and managing user identities.' WHERE slug = 'auth0';

-- ============================================================================
-- CONVERSION COMPLETE
-- All 15 categories and 114+ API descriptions converted to English
-- ============================================================================
