import { createClient } from "@/lib/supabase/server";
import { notFound } from "next/navigation";
import Link from "next/link";
import StarRating from "@/components/StarRating";
import ReviewSection from "./ReviewSection";
import TabContent from "./TabContent";

export async function generateMetadata({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const supabase = await createClient();
  const { data: api } = await supabase.from("apis").select("name").eq("slug", slug).single();
  return { title: api ? `${api.name} - API Katalog` : "API Detay" };
}

export default async function ApiDetailPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const supabase = await createClient();

  const { data: api } = await supabase
    .from("apis")
    .select("*, category:categories(*)")
    .eq("slug", slug)
    .single();

  if (!api) notFound();

  const { data: reviews } = await supabase
    .from("reviews")
    .select("*")
    .eq("api_id", api.id)
    .order("created_at", { ascending: false });

  const { data: similarApis } = await supabase
    .from("apis")
    .select("name, slug, avg_rating, pricing_info, is_repo, github_stars")
    .eq("category_id", api.category_id)
    .neq("id", api.id)
    .order("avg_rating", { ascending: false })
    .limit(5);

  return (
    <div className="relative noise">
      {/* ===== HERO BANNER ===== */}
      <section className="relative overflow-hidden border-b border-white/5">
        {/* Background */}
        <div className="absolute inset-0 bg-gradient-to-br from-violet-600/8 via-transparent to-cyan-600/5" />
        <div className="absolute top-0 right-0 w-[500px] h-[300px] bg-violet-500/5 rounded-full blur-[100px]" />

        <div className="relative max-w-7xl mx-auto px-4 pt-8 pb-10">
          {/* Breadcrumb */}
          <div className="flex items-center gap-2 text-[10px] text-zinc-600 font-mono mb-8">
            <Link href="/" className="hover:text-violet-400 transition">home</Link>
            <span>/</span>
            <Link href="/categories" className="hover:text-violet-400 transition">kategoriler</Link>
            <span>/</span>
            <Link href={`/categories/${api.category?.slug}`} className="hover:text-violet-400 transition">
              {api.category?.slug}
            </Link>
            <span>/</span>
            <span className="text-zinc-400">{api.slug}</span>
          </div>

          <div className="flex flex-col sm:flex-row items-start gap-6">
            {/* Logo */}
            <div className="w-20 h-20 rounded-2xl bg-gradient-to-br from-violet-500/10 to-cyan-500/10 border border-white/5 flex items-center justify-center text-4xl font-bold text-violet-400 shrink-0">
              {api.logo_url ? (
                <img src={api.logo_url} alt={api.name} className="w-14 h-14 rounded-xl object-contain" />
              ) : (
                api.name[0]
              )}
            </div>

            <div className="flex-1">
              <div className="flex items-center gap-3 flex-wrap">
                <h1 className="text-3xl sm:text-4xl font-bold tracking-tight">{api.name}</h1>
                {api.is_repo && (
                  <span className="text-[10px] px-2 py-1 rounded-md bg-emerald-500/10 text-emerald-400 font-mono border border-emerald-500/20">
                    OPEN SOURCE
                  </span>
                )}
              </div>

              <div className="flex items-center gap-4 mt-3 flex-wrap">
                <div className="flex items-center gap-2">
                  <StarRating rating={Math.round(api.avg_rating)} size="md" />
                  <span className="text-sm text-zinc-500 font-mono">
                    {Number(api.avg_rating).toFixed(1)}
                  </span>
                  <span className="text-xs text-zinc-700">({api.review_count} reviews)</span>
                </div>

                {api.is_repo && api.github_stars > 0 && (
                  <>
                    <span className="text-zinc-800">|</span>
                    <span className="flex items-center gap-1 text-xs text-amber-400 font-mono">
                      <svg className="w-3.5 h-3.5" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
                      {api.github_stars > 1000 ? `${(api.github_stars / 1000).toFixed(1)}k` : api.github_stars} stars
                    </span>
                    {api.github_forks > 0 && (
                      <span className="flex items-center gap-1 text-xs text-zinc-500 font-mono">
                        <svg className="w-3.5 h-3.5" fill="currentColor" viewBox="0 0 24 24"><path d="M6 3a3 3 0 1 0 0 6 3 3 0 0 0 0-6zM18 3a3 3 0 1 0 0 6 3 3 0 0 0 0-6zM12 18a3 3 0 1 0 0 6 3 3 0 0 0 0-6zM6 9v3a3 3 0 0 0 3 3h6a3 3 0 0 0 3-3V9M12 15v3"/></svg>
                        {api.github_forks > 1000 ? `${(api.github_forks / 1000).toFixed(1)}k` : api.github_forks}
                      </span>
                    )}
                  </>
                )}
              </div>

              {/* Tags */}
              {api.tags && api.tags.length > 0 && (
                <div className="flex gap-2 mt-4 flex-wrap">
                  {api.tags.map((tag: string) => (
                    <span key={tag} className="text-[10px] px-2 py-0.5 rounded-md bg-white/[0.03] text-zinc-500 font-mono border border-white/5">
                      {tag}
                    </span>
                  ))}
                </div>
              )}
            </div>

            {/* CTA Buttons */}
            <div className="flex flex-col gap-2 shrink-0 w-full sm:w-auto">
              <a
                href={api.affiliate_url || api.website_url}
                target="_blank"
                rel="noopener noreferrer"
                className="bg-gradient-to-r from-violet-600 to-violet-500 text-white text-center px-6 py-3 rounded-xl font-medium hover:from-violet-500 hover:to-violet-400 transition shadow-lg shadow-violet-500/20 text-sm"
              >
                {api.is_repo ? "View on GitHub" : "Use this API"} &rarr;
              </a>
              <a
                href={api.github_url || api.website_url}
                target="_blank"
                rel="noopener noreferrer"
                className="text-center px-6 py-2.5 rounded-xl border border-white/10 text-zinc-400 hover:text-white hover:border-white/20 transition text-sm"
              >
                Documentation
              </a>
            </div>
          </div>
        </div>
      </section>

      {/* ===== CONTENT ===== */}
      <div className="max-w-7xl mx-auto px-4 py-10">
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Sol: Tab Content */}
          <div className="lg:col-span-2">
            <TabContent api={api} reviews={reviews ?? []} />
          </div>

          {/* Sag Sidebar */}
          <div className="space-y-6">
            {/* Quick Info */}
            <div className="glass rounded-xl p-6">
              <h3 className="text-xs font-mono text-zinc-500 uppercase tracking-widest mb-4">Info</h3>
              <div className="space-y-4">
                <div className="flex justify-between items-center">
                  <span className="text-xs text-zinc-600">Category</span>
                  <Link href={`/categories/${api.category?.slug}`} className="text-xs text-violet-400 hover:text-violet-300 transition">
                    {api.category?.icon} {api.category?.name}
                  </Link>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-xs text-zinc-600">Pricing</span>
                  <span className="text-xs text-zinc-300 font-mono">{api.pricing_info}</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-xs text-zinc-600">Rating</span>
                  <span className="text-xs text-amber-400 font-mono">{Number(api.avg_rating).toFixed(1)} / 5.0</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-xs text-zinc-600">Reviews</span>
                  <span className="text-xs text-zinc-300 font-mono">{api.review_count}</span>
                </div>
                {api.is_repo && (
                  <>
                    <div className="flex justify-between items-center">
                      <span className="text-xs text-zinc-600">Stars</span>
                      <span className="text-xs text-amber-400 font-mono">{api.github_stars?.toLocaleString()}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-xs text-zinc-600">Forks</span>
                      <span className="text-xs text-zinc-300 font-mono">{api.github_forks?.toLocaleString()}</span>
                    </div>
                  </>
                )}
              </div>
            </div>

            {/* Benzer */}
            <div className="glass rounded-xl p-6">
              <h3 className="text-xs font-mono text-zinc-500 uppercase tracking-widest mb-4">Similar</h3>
              {similarApis && similarApis.length > 0 ? (
                <div className="space-y-1">
                  {similarApis.map((s) => (
                    <Link
                      key={s.slug}
                      href={`/apis/${s.slug}`}
                      className="flex items-center justify-between p-2.5 rounded-lg hover:bg-white/[0.03] transition group"
                    >
                      <span className="text-sm text-zinc-400 group-hover:text-white transition truncate">
                        {s.name}
                      </span>
                      <div className="flex items-center gap-2 shrink-0">
                        {s.is_repo && s.github_stars > 0 ? (
                          <span className="text-[10px] text-amber-400 font-mono">
                            {s.github_stars > 1000 ? `${(s.github_stars / 1000).toFixed(0)}k` : s.github_stars}★
                          </span>
                        ) : (
                          <span className="text-[10px] text-zinc-600 font-mono">{Number(s.avg_rating).toFixed(1)}</span>
                        )}
                      </div>
                    </Link>
                  ))}
                </div>
              ) : (
                <p className="text-xs text-zinc-700">No similar items found.</p>
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
