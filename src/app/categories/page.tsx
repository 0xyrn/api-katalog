import Link from "next/link";
import { createClient } from "@/lib/supabase/server";

export const metadata = {
  title: "Categories - APIhub",
};

export default async function CategoriesPage() {
  const supabase = await createClient();

  const { data: categories } = await supabase
    .from("categories")
    .select("*, apis(count)")
    .order("name");

  const colors = [
    "from-violet-500/20 to-violet-600/5",
    "from-cyan-500/20 to-cyan-600/5",
    "from-emerald-500/20 to-emerald-600/5",
    "from-amber-500/20 to-amber-600/5",
    "from-rose-500/20 to-rose-600/5",
  ];

  return (
    <div className="max-w-7xl mx-auto px-4 py-12">
      <div className="mb-10">
        <span className="text-[10px] font-mono text-violet-400 uppercase tracking-widest">Browse</span>
        <h1 className="text-3xl font-bold tracking-tight mt-1">All Categories</h1>
        <p className="text-sm text-zinc-600 mt-2">
          Find the right API for your next project.
          <span className="text-zinc-700 font-mono text-[10px] ml-2">// or procrastinate by browsing all of them</span>
        </p>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-3">
        {categories?.map((cat, i) => {
          const apiCount =
            (cat.apis as unknown as { count: number }[])?.[0]?.count ?? 0;
          return (
            <Link
              key={cat.id}
              href={`/categories/${cat.slug}`}
              className="glass glass-hover rounded-xl p-6 transition-all duration-300 group"
            >
              <div className={`w-12 h-12 rounded-xl bg-gradient-to-br ${colors[i % 5]} flex items-center justify-center text-2xl mb-4 group-hover:scale-110 transition-transform`}>
                {cat.icon}
              </div>
              <h2 className="text-base font-semibold text-zinc-200 group-hover:text-white transition">
                {cat.name}
              </h2>
              <p className="text-xs text-zinc-600 mt-1 line-clamp-2 leading-relaxed">
                {cat.description}
              </p>
              <div className="mt-4 text-[10px] text-violet-400 font-mono">
                {apiCount} {apiCount === 1 ? "item" : "items"} &rarr;
              </div>
            </Link>
          );
        })}
      </div>
    </div>
  );
}
