import { createClient } from "@/lib/supabase/server";
import ApiCard from "@/components/ApiCard";
import SearchBar from "@/components/SearchBar";

export const metadata = {
  title: "Explore APIs - APIhub",
};

export default async function ApisPage({
  searchParams,
}: {
  searchParams: Promise<{ q?: string; sort?: string }>;
}) {
  const { q, sort } = await searchParams;
  const supabase = await createClient();

  let query = supabase
    .from("apis")
    .select("*, category:categories(*)");

  if (q) {
    query = query.or(`name.ilike.%${q}%,description.ilike.%${q}%`);
  }

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

  return (
    <div className="max-w-7xl mx-auto px-4 py-12">
      <div className="mb-8">
        <span className="text-[10px] font-mono text-cyan-400 uppercase tracking-widest">Explore</span>
        <h1 className="text-3xl font-bold tracking-tight mt-1">
          {q ? (
            <>
              <span className="text-zinc-500">Results for</span>{" "}
              <span className="gradient-text">&quot;{q}&quot;</span>
            </>
          ) : (
            "All APIs & Repos"
          )}
        </h1>
        <p className="text-xs text-zinc-600 mt-1 font-mono">
          {apis?.length ?? 0} items found
          {!q && <span className="text-zinc-700"> // that&apos;s a lot of endpoints</span>}
        </p>
      </div>

      <div className="mb-8">
        <SearchBar />
      </div>

      {/* Sort */}
      <div className="flex gap-2 mb-6">
        {[
          { label: "Name", value: "" },
          { label: "Top Rated", value: "rating" },
          { label: "Newest", value: "newest" },
          { label: "Most Stars", value: "stars" },
        ].map((option) => (
          <a
            key={option.value}
            href={`/apis?${q ? `q=${q}&` : ""}${option.value ? `sort=${option.value}` : ""}`}
            className={`px-3 py-1.5 text-[10px] rounded-lg border font-mono transition ${
              (sort ?? "") === option.value
                ? "bg-violet-500/20 text-violet-400 border-violet-500/30"
                : "text-zinc-500 border-white/5 hover:border-violet-500/20 hover:text-violet-400"
            }`}
          >
            {option.label}
          </a>
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
          {q ? (
            <>
              No APIs match your search.
              <br />
              <span className="text-zinc-800 text-[10px]">// have you tried turning it off and on again?</span>
            </>
          ) : (
            "No APIs added yet."
          )}
        </div>
      )}
    </div>
  );
}
