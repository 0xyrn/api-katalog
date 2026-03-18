import { createClient } from "@/lib/supabase/server";
import ApiCard from "@/components/ApiCard";
import Link from "next/link";
import { notFound } from "next/navigation";

export async function generateMetadata({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const supabase = await createClient();
  const { data: category } = await supabase
    .from("categories")
    .select("name")
    .eq("slug", slug)
    .single();
  return { title: category ? `${category.name} - APIhub` : "Category" };
}

export default async function CategoryDetailPage({
  params,
  searchParams,
}: {
  params: Promise<{ slug: string }>;
  searchParams: Promise<{ sort?: string }>;
}) {
  const { slug } = await params;
  const { sort } = await searchParams;
  const supabase = await createClient();

  const { data: category } = await supabase
    .from("categories")
    .select("*")
    .eq("slug", slug)
    .single();

  if (!category) notFound();

  let query = supabase
    .from("apis")
    .select("*, category:categories(*)")
    .eq("category_id", category.id);

  if (sort === "rating") {
    query = query.order("avg_rating", { ascending: false });
  } else if (sort === "newest") {
    query = query.order("created_at", { ascending: false });
  } else if (sort === "stars") {
    query = query.order("github_stars", { ascending: false });
  } else {
    query = query.order("name");
  }

  const { data: apis } = await query;

  const isGithub = slug === "github-repos";

  return (
    <div className="max-w-7xl mx-auto px-4 py-12">
      <div className="flex items-center gap-2 text-[10px] text-zinc-600 font-mono mb-8">
        <Link href="/categories" className="hover:text-violet-400 transition">categories</Link>
        <span>/</span>
        <span className="text-zinc-400">{category.slug}</span>
      </div>

      <div className="flex items-center gap-4 mb-10">
        <div className="w-14 h-14 rounded-xl glass flex items-center justify-center text-3xl">
          {category.icon}
        </div>
        <div>
          <h1 className="text-2xl font-bold tracking-tight">{category.name}</h1>
          <p className="text-sm text-zinc-500">{category.description}</p>
        </div>
      </div>

      {/* Sort */}
      <div className="flex gap-2 mb-6">
        {[
          { label: "Name", value: "" },
          { label: "Top Rated", value: "rating" },
          { label: "Newest", value: "newest" },
          ...(isGithub ? [{ label: "Most Stars", value: "stars" }] : []),
        ].map((option) => (
          <Link
            key={option.value}
            href={`/categories/${slug}${option.value ? `?sort=${option.value}` : ""}`}
            className={`px-3 py-1.5 text-[10px] rounded-lg border font-mono transition ${
              (sort ?? "") === option.value
                ? "bg-violet-500/20 text-violet-400 border-violet-500/30"
                : "text-zinc-500 border-white/5 hover:border-violet-500/20 hover:text-violet-400"
            }`}
          >
            {option.label}
          </Link>
        ))}
      </div>

      {apis && apis.length > 0 ? (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
          {apis.map((api, i) => (
            <ApiCard key={api.id} api={api} index={i} />
          ))}
        </div>
      ) : (
        <div className="text-center py-20 text-zinc-700 font-mono text-sm">
          No items in this category yet.
          <br />
          <span className="text-zinc-800 text-[10px]">// 404: APIs not found, try refreshing your life</span>
        </div>
      )}
    </div>
  );
}
