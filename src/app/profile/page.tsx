import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import StarRating from "@/components/StarRating";
import Link from "next/link";

export const metadata = {
  title: "Profile - APIhub",
};

export default async function ProfilePage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) redirect("/login");

  const { data: reviews } = await supabase
    .from("reviews")
    .select("*, api:apis(name, slug)")
    .eq("user_id", user.id)
    .order("created_at", { ascending: false });

  const { data: favorites } = await supabase
    .from("favorites")
    .select("*, api:apis(name, slug, avg_rating, pricing_info)")
    .eq("user_id", user.id)
    .order("created_at", { ascending: false });

  return (
    <div className="max-w-4xl mx-auto px-4 py-12">
      {/* Profile Info */}
      <div className="glass rounded-xl p-6 mb-8">
        <div className="flex items-center gap-4">
          <div className="w-16 h-16 rounded-full bg-gradient-to-br from-violet-500/20 to-cyan-500/20 border border-white/10 text-violet-400 flex items-center justify-center text-2xl font-bold">
            {user.email?.[0]?.toUpperCase() ?? "U"}
          </div>
          <div>
            <h1 className="text-xl font-bold">
              {user.user_metadata?.full_name ?? user.email}
            </h1>
            <p className="text-xs text-zinc-500 font-mono">{user.email}</p>
            <p className="text-[10px] text-zinc-700 font-mono mt-1">
              Joined {new Date(user.created_at).toLocaleDateString("en-US", { month: "short", year: "numeric" })}
            </p>
          </div>
        </div>
      </div>

      {/* My Reviews */}
      <section className="mb-8">
        <h2 className="text-lg font-bold mb-4">
          My Reviews
          <span className="text-zinc-600 font-mono text-sm ml-2">({reviews?.length ?? 0})</span>
        </h2>
        {reviews && reviews.length > 0 ? (
          <div className="space-y-3">
            {reviews.map((review) => {
              const api = review.api as unknown as { name: string; slug: string } | null;
              return (
                <div key={review.id} className="glass rounded-xl p-4">
                  <div className="flex items-center justify-between mb-2">
                    <Link href={`/apis/${api?.slug}`} className="text-sm font-medium text-violet-400 hover:text-violet-300 transition">
                      {api?.name}
                    </Link>
                    <span className="text-[10px] text-zinc-700 font-mono">
                      {new Date(review.created_at).toLocaleDateString("en-US")}
                    </span>
                  </div>
                  <StarRating rating={review.rating} size="sm" />
                  {review.comment && <p className="text-sm text-zinc-400 mt-2">{review.comment}</p>}
                </div>
              );
            })}
          </div>
        ) : (
          <p className="text-zinc-700 text-sm font-mono">No reviews yet. Go explore some APIs!</p>
        )}
      </section>

      {/* Favorites */}
      <section>
        <h2 className="text-lg font-bold mb-4">
          Favorites
          <span className="text-zinc-600 font-mono text-sm ml-2">({favorites?.length ?? 0})</span>
        </h2>
        {favorites && favorites.length > 0 ? (
          <div className="space-y-3">
            {favorites.map((fav) => {
              const api = fav.api as unknown as { name: string; slug: string; avg_rating: number; pricing_info: string } | null;
              return (
                <Link key={fav.id} href={`/apis/${api?.slug}`} className="block glass glass-hover rounded-xl p-4">
                  <div className="flex items-center justify-between">
                    <span className="font-medium text-zinc-300">{api?.name}</span>
                    <span className="text-[10px] text-violet-400 font-mono">{api?.pricing_info}</span>
                  </div>
                </Link>
              );
            })}
          </div>
        ) : (
          <p className="text-zinc-700 text-sm font-mono">
            No favorites yet.
            <span className="text-zinc-800"> // your bookmarks bar called, it&apos;s lonely</span>
          </p>
        )}
      </section>
    </div>
  );
}
