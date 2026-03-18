import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import SearchBar from "@/components/SearchBar";
import ApiCard from "@/components/ApiCard";

export default async function Home() {
  const supabase = await createClient();

  const { data: categories } = await supabase
    .from("categories")
    .select("*")
    .order("name");

  const { data: topApis } = await supabase
    .from("apis")
    .select("*, category:categories(*)")
    .order("avg_rating", { ascending: false })
    .limit(9);

  const { data: recentApis } = await supabase
    .from("apis")
    .select("*, category:categories(*)")
    .order("created_at", { ascending: false })
    .limit(6);

  const { count: totalApis } = await supabase
    .from("apis")
    .select("*", { count: "exact", head: true });

  const { count: totalReviews } = await supabase
    .from("reviews")
    .select("*", { count: "exact", head: true });

  return (
    <div className="relative noise">
      {/* ===== HERO ===== */}
      <section className="relative overflow-hidden min-h-[85vh] flex items-center">
        {/* Animated blobs */}
        <div className="blob absolute top-[-20%] left-[10%] w-[500px] h-[500px] bg-violet-600/15" />
        <div className="blob blob-delay absolute top-[10%] right-[5%] w-[400px] h-[400px] bg-cyan-500/10" />
        <div className="blob blob-delay-2 absolute bottom-[-10%] left-[40%] w-[350px] h-[350px] bg-emerald-500/8" />

        {/* Grid pattern */}
        <div className="absolute inset-0 grid-pattern" />

        {/* Floating SVG decorations */}
        {/* Code bracket - left */}
        <svg className="absolute top-[15%] left-[5%] w-16 h-16 text-violet-500/10 animate-[float_6s_ease-in-out_infinite]" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1">
          <path d="M8 3L3 12l5 9M16 3l5 9-5 9" />
        </svg>

        {/* Hexagon - right */}
        <svg className="absolute top-[20%] right-[8%] w-20 h-20 text-cyan-500/8 animate-[float_8s_ease-in-out_infinite_1s]" viewBox="0 0 24 24" fill="currentColor">
          <path d="M12 2l9 5v10l-9 5-9-5V7z" />
        </svg>

        {/* Terminal icon - bottom left */}
        <svg className="absolute bottom-[25%] left-[8%] w-12 h-12 text-emerald-500/10 animate-[float_7s_ease-in-out_infinite_2s]" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5">
          <rect x="2" y="3" width="20" height="18" rx="3" />
          <path d="M7 15h4M7 9l3 3-3 3" />
        </svg>

        {/* Circle ring - top right */}
        <svg className="absolute top-[35%] right-[15%] w-24 h-24 text-violet-500/5 animate-[float_9s_ease-in-out_infinite_3s]" viewBox="0 0 100 100" fill="none" stroke="currentColor" strokeWidth="1">
          <circle cx="50" cy="50" r="45" />
          <circle cx="50" cy="50" r="30" strokeDasharray="8 4" />
        </svg>

        {/* Curly braces - bottom right */}
        <svg className="absolute bottom-[20%] right-[5%] w-14 h-14 text-amber-500/8 animate-[float_7s_ease-in-out_infinite_4s]" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5">
          <path d="M7 4a2 2 0 0 0-2 2v4a2 2 0 0 1-2 2 2 2 0 0 1 2 2v4a2 2 0 0 0 2 2M17 4a2 2 0 0 1 2 2v4a2 2 0 0 0 2 2 2 2 0 0 0-2 2v4a2 2 0 0 1-2 2" />
        </svg>

        {/* Dots cluster - left center */}
        <div className="absolute top-[50%] left-[3%] flex flex-col gap-2 opacity-[0.06]">
          {[...Array(4)].map((_, row) => (
            <div key={row} className="flex gap-2">
              {[...Array(4)].map((_, col) => (
                <div key={col} className="w-1.5 h-1.5 rounded-full bg-violet-400" />
              ))}
            </div>
          ))}
        </div>

        {/* API connector lines - right center */}
        <svg className="absolute top-[55%] right-[3%] w-16 h-32 text-cyan-500/5" viewBox="0 0 60 120" fill="none" stroke="currentColor" strokeWidth="1">
          <circle cx="10" cy="20" r="4" fill="currentColor" />
          <circle cx="50" cy="60" r="4" fill="currentColor" />
          <circle cx="10" cy="100" r="4" fill="currentColor" />
          <path d="M14 20 L46 60 M14 100 L46 60" strokeDasharray="4 3" />
        </svg>

        {/* Radial gradient overlay */}
        <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_center,transparent_20%,#0a0a0f_70%)]" />

        <div className="relative max-w-7xl mx-auto px-4 py-24 text-center w-full">
          {/* Badge */}
          <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-white/[0.03] border border-white/[0.06] text-xs font-mono mb-8">
            <span className="relative flex h-2 w-2">
              <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
              <span className="relative inline-flex rounded-full h-2 w-2 bg-emerald-500"></span>
            </span>
            <span className="text-zinc-400">{totalApis ?? 0}+ APIs &amp; Repos ready to explore</span>
          </div>

          <h1 className="text-5xl sm:text-6xl md:text-7xl font-bold tracking-tight leading-[1.1] mb-6">
            <span className="text-white">Find the right API.</span>
            <br />
            <span className="gradient-text">Ship faster.</span>
          </h1>

          <p className="text-zinc-500 text-base sm:text-lg max-w-2xl mx-auto leading-relaxed mb-4">
            Discover, compare &amp; review APIs and open source tools.
            <br className="hidden sm:block" />
            From trading bots to AI models &mdash; one platform for builders.
          </p>
          <p className="text-[10px] text-zinc-700 font-mono mb-10">
            // because reading 47 docs pages shouldn&apos;t be a prerequisite
          </p>

          <SearchBar />

          {/* Stats */}
          <div className="mt-16 grid grid-cols-3 max-w-lg mx-auto gap-8">
            {[
              { value: `${totalApis ?? 0}+`, label: "APIs & Repos", icon: "M4 6h16M4 12h16M4 18h7" },
              { value: `${categories?.length ?? 0}`, label: "Categories", icon: "M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z" },
              { value: `${totalReviews ?? 0}+`, label: "Reviews", icon: "M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" },
            ].map((stat, i) => (
              <div key={i} className="animate-count" style={{ animationDelay: `${i * 0.2}s` }}>
                <svg className="w-5 h-5 mx-auto mb-2 text-zinc-700" fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={1.5}>
                  <path strokeLinecap="round" strokeLinejoin="round" d={stat.icon} />
                </svg>
                <div className="text-2xl sm:text-3xl font-bold text-white">{stat.value}</div>
                <div className="text-[10px] text-zinc-600 font-mono uppercase tracking-widest mt-1">{stat.label}</div>
              </div>
            ))}
          </div>
        </div>

        {/* Bottom fade */}
        <div className="absolute bottom-0 left-0 right-0 h-32 bg-gradient-to-t from-[#0a0a0f] to-transparent" />
      </section>

      {/* ===== CATEGORIES ===== */}
      <section className="relative max-w-7xl mx-auto px-4 py-20">
        {/* Decorative hexagon grid */}
        <svg className="absolute right-0 top-0 w-40 h-40 text-violet-500/[0.03]" viewBox="0 0 200 200" fill="currentColor">
          <path d="M100 10 L170 50 L170 130 L100 170 L30 130 L30 50Z" />
          <path d="M100 40 L145 65 L145 115 L100 140 L55 115 L55 65Z" fill="none" stroke="currentColor" strokeWidth="0.5" opacity="0.5" />
        </svg>

        <div className="flex justify-between items-end mb-10">
          <div>
            <span className="text-[10px] font-mono text-violet-400 uppercase tracking-widest">Browse</span>
            <h2 className="text-3xl font-bold tracking-tight mt-1">Categories</h2>
          </div>
          <Link href="/categories" className="text-xs text-zinc-500 hover:text-violet-400 transition font-mono group">
            View all <span className="group-hover:translate-x-1 inline-block transition-transform">&rarr;</span>
          </Link>
        </div>

        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-5 lg:grid-cols-5 gap-3">
          {categories?.slice(0, 15).map((cat, i) => {
            const colors = [
              "from-violet-500/20 to-violet-600/5",
              "from-cyan-500/20 to-cyan-600/5",
              "from-emerald-500/20 to-emerald-600/5",
              "from-amber-500/20 to-amber-600/5",
              "from-rose-500/20 to-rose-600/5",
            ];
            const borderColors = [
              "hover:border-violet-500/20",
              "hover:border-cyan-500/20",
              "hover:border-emerald-500/20",
              "hover:border-amber-500/20",
              "hover:border-rose-500/20",
            ];
            return (
              <Link
                key={cat.id}
                href={`/categories/${cat.slug}`}
                className={`glass glass-hover rounded-xl p-5 group ${borderColors[i % 5]}`}
              >
                <div className={`w-10 h-10 rounded-lg bg-gradient-to-br ${colors[i % 5]} flex items-center justify-center text-lg mb-3 group-hover:scale-110 transition-transform`}>
                  {cat.icon}
                </div>
                <div className="text-sm font-medium text-zinc-300 group-hover:text-white transition">
                  {cat.name}
                </div>
              </Link>
            );
          })}
        </div>
      </section>

      {/* ===== SVG WAVE DIVIDER ===== */}
      <div className="relative h-24 overflow-hidden">
        <svg className="absolute bottom-0 w-full" viewBox="0 0 1440 100" fill="none" preserveAspectRatio="none">
          <path d="M0 50 C360 0 720 100 1080 50 C1260 25 1380 60 1440 50 L1440 100 L0 100Z" fill="rgba(139,92,246,0.03)" />
          <path d="M0 70 C360 30 720 90 1080 60 C1260 45 1380 75 1440 65 L1440 100 L0 100Z" fill="rgba(6,182,212,0.02)" />
        </svg>
      </div>

      {/* ===== TRENDING APIs ===== */}
      <section className="relative max-w-7xl mx-auto px-4 py-16">
        {/* Decorative circuit lines */}
        <svg className="absolute left-0 top-1/2 -translate-y-1/2 w-8 h-48 text-cyan-500/[0.04]" viewBox="0 0 30 200" fill="none" stroke="currentColor" strokeWidth="1">
          <line x1="15" y1="0" x2="15" y2="60" />
          <circle cx="15" cy="60" r="3" fill="currentColor" />
          <line x1="15" y1="66" x2="15" y2="130" strokeDasharray="4 4" />
          <circle cx="15" cy="130" r="3" fill="currentColor" />
          <line x1="15" y1="136" x2="15" y2="200" />
        </svg>

        <div className="flex justify-between items-end mb-10">
          <div>
            <span className="text-[10px] font-mono text-cyan-400 uppercase tracking-widest">Popular</span>
            <h2 className="text-3xl font-bold tracking-tight mt-1">Trending APIs</h2>
          </div>
          <Link href="/apis?sort=rating" className="text-xs text-zinc-500 hover:text-cyan-400 transition font-mono group">
            View all <span className="group-hover:translate-x-1 inline-block transition-transform">&rarr;</span>
          </Link>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
          {topApis?.map((api, i) => (
            <ApiCard key={api.id} api={api} index={i} />
          ))}
        </div>
      </section>

      {/* ===== RECENTLY ADDED ===== */}
      {recentApis && recentApis.length > 0 && (
        <section className="relative max-w-7xl mx-auto px-4 py-16 pb-24">
          <div className="flex justify-between items-end mb-10">
            <div>
              <span className="text-[10px] font-mono text-emerald-400 uppercase tracking-widest">Fresh</span>
              <h2 className="text-3xl font-bold tracking-tight mt-1">Recently Added</h2>
            </div>
            <Link href="/apis?sort=newest" className="text-xs text-zinc-500 hover:text-emerald-400 transition font-mono group">
              View all <span className="group-hover:translate-x-1 inline-block transition-transform">&rarr;</span>
            </Link>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
            {recentApis.map((api, i) => (
              <ApiCard key={api.id} api={api} index={i} />
            ))}
          </div>
        </section>
      )}

      {/* ===== MINI TERMINAL DECORATION ===== */}
      <div className="max-w-7xl mx-auto px-4 pb-12">
        <div className="glass rounded-xl p-6 max-w-lg mx-auto">
          <div className="flex items-center gap-2 mb-4">
            <div className="w-3 h-3 rounded-full bg-rose-500/60" />
            <div className="w-3 h-3 rounded-full bg-amber-500/60" />
            <div className="w-3 h-3 rounded-full bg-emerald-500/60" />
            <span className="text-[10px] text-zinc-700 font-mono ml-2">~/apihub</span>
          </div>
          <div className="font-mono text-xs space-y-1.5">
            <p><span className="text-emerald-400">$</span> <span className="text-zinc-400">curl apihub.dev/api/discover</span></p>
            <p className="text-zinc-600">{"{"} &quot;apis&quot;: {totalApis ?? 0}, &quot;status&quot;: &quot;ready&quot; {"}"}</p>
            <p><span className="text-emerald-400">$</span> <span className="text-zinc-500 animate-pulse">_</span></p>
          </div>
        </div>
      </div>

      {/* ===== CTA SECTION ===== */}
      <section className="relative overflow-hidden">
        {/* Background decoration */}
        <div className="absolute inset-0 bg-gradient-to-r from-violet-600/5 via-transparent to-cyan-600/5" />
        <svg className="absolute left-[10%] top-[20%] w-32 h-32 text-violet-500/[0.03]" viewBox="0 0 100 100" fill="none" stroke="currentColor" strokeWidth="0.5">
          <polygon points="50,5 95,27.5 95,72.5 50,95 5,72.5 5,27.5" />
          <polygon points="50,20 80,35 80,65 50,80 20,65 20,35" />
        </svg>
        <svg className="absolute right-[10%] bottom-[15%] w-24 h-24 text-cyan-500/[0.03]" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="0.5">
          <rect x="2" y="2" width="20" height="20" rx="4" />
          <rect x="6" y="6" width="12" height="12" rx="2" />
          <rect x="9" y="9" width="6" height="6" rx="1" />
        </svg>

        <div className="max-w-7xl mx-auto px-4 py-24 text-center relative">
          <h2 className="text-3xl font-bold tracking-tight mb-4">
            Got an API? Let the community rate it.
          </h2>
          <p className="text-zinc-500 mb-2 max-w-md mx-auto">
            Add your favorite tool or API service and let developers
            share their honest reviews.
          </p>
          <p className="text-[10px] text-zinc-700 font-mono mb-8">
            // PR welcome, merge guaranteed*
            <span className="text-zinc-800"> (*not really)</span>
          </p>
          <Link
            href="/login"
            className="inline-flex items-center gap-2 bg-gradient-to-r from-violet-600 to-cyan-600 text-white px-6 py-3 rounded-xl font-medium hover:opacity-90 transition shadow-lg shadow-violet-500/20"
          >
            Get Started
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 8l4 4m0 0l-4 4m4-4H3" />
            </svg>
          </Link>
        </div>
      </section>
    </div>
  );
}
