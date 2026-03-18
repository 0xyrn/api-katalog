"use client";

import { useState } from "react";
import { createClient } from "@/lib/supabase/client";
import StarRating from "@/components/StarRating";
import type { Review } from "@/lib/types";

export default function ReviewSection({
  apiId,
  reviews: initialReviews,
}: {
  apiId: string;
  reviews: Review[];
}) {
  const [reviews, setReviews] = useState(initialReviews);
  const [rating, setRating] = useState(0);
  const [comment, setComment] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const supabase = createClient();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");

    if (rating === 0) {
      setError("Please select a rating.");
      return;
    }

    setLoading(true);

    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
      setError("You need to sign in to leave a review.");
      setLoading(false);
      return;
    }

    const { data, error: insertError } = await supabase
      .from("reviews")
      .insert({ user_id: user.id, api_id: apiId, rating, comment, source: "user" })
      .select()
      .single();

    if (insertError) {
      if (insertError.code === "23505") {
        setError("You already reviewed this API.");
      } else {
        setError("Something went wrong. Try again.");
      }
      setLoading(false);
      return;
    }

    setReviews([{ ...data, user_email: user.email }, ...reviews]);
    setRating(0);
    setComment("");
    setLoading(false);
  };

  const sourceIcons: Record<string, { label: string; color: string }> = {
    reddit: { label: "Reddit", color: "text-orange-400" },
    hackernews: { label: "Hacker News", color: "text-amber-400" },
    user: { label: "User", color: "text-violet-400" },
  };

  return (
    <div>
      {/* Write Review */}
      <div className="glass rounded-xl p-6 mb-8">
        <h3 className="text-sm font-medium text-zinc-300 mb-1">Leave a review</h3>
        <p className="text-[10px] text-zinc-600 font-mono mb-4">// honest opinions only, no cap</p>
        <form onSubmit={handleSubmit}>
          <div className="mb-4">
            <StarRating rating={rating} onRate={setRating} size="lg" interactive />
          </div>
          <textarea
            value={comment}
            onChange={(e) => setComment(e.target.value)}
            placeholder="What's your experience with this API?"
            className="w-full p-4 bg-white/[0.02] border border-white/5 rounded-lg resize-none focus:border-violet-500/30 focus:ring-1 focus:ring-violet-500/10 outline-none text-zinc-300 placeholder-zinc-700 text-sm"
            rows={3}
          />
          {error && <p className="text-red-400 text-xs mt-2 font-mono">{error}</p>}
          <button
            type="submit"
            disabled={loading}
            className="mt-3 bg-gradient-to-r from-violet-600 to-violet-500 text-white px-5 py-2 rounded-lg text-sm font-medium hover:from-violet-500 hover:to-violet-400 transition disabled:opacity-50 shadow-lg shadow-violet-500/10"
          >
            {loading ? "Submitting..." : "Submit Review"}
          </button>
        </form>
      </div>

      {/* Review List */}
      <div className="space-y-3">
        {reviews.length === 0 ? (
          <div className="text-center py-16 text-zinc-700 font-mono text-sm">
            No reviews yet. Be the first! {/* easter egg */}
            <br />
            <span className="text-zinc-800 text-[10px]">// first reviewer gets bragging rights</span>
          </div>
        ) : (
          reviews.map((review) => {
            const source = sourceIcons[review.source] || sourceIcons.user;
            return (
              <div key={review.id} className="glass rounded-xl p-5">
                <div className="flex items-center justify-between mb-3">
                  <div className="flex items-center gap-3">
                    {review.source !== "user" ? (
                      <div className={`text-[10px] font-mono ${source.color} flex items-center gap-1`}>
                        <span className="w-5 h-5 rounded bg-white/[0.05] flex items-center justify-center">
                          {review.source === "reddit" ? "R" : "Y"}
                        </span>
                        {source.label}
                      </div>
                    ) : (
                      <div className="flex items-center gap-2">
                        <div className="w-6 h-6 rounded-full bg-gradient-to-br from-violet-500/20 to-cyan-500/20 border border-white/5 text-violet-400 flex items-center justify-center text-[10px] font-medium">
                          {(review.user_email ?? "U")[0].toUpperCase()}
                        </div>
                        <span className="text-xs text-zinc-500 font-mono">
                          {review.user_email ?? "Anonymous"}
                        </span>
                      </div>
                    )}
                  </div>
                  <span className="text-[10px] text-zinc-700 font-mono">
                    {new Date(review.created_at).toLocaleDateString("en-US", {
                      month: "short",
                      day: "numeric",
                      year: "numeric",
                    })}
                  </span>
                </div>
                <StarRating rating={review.rating} size="sm" />
                {review.comment && (
                  <p className="text-zinc-400 text-sm mt-2 leading-relaxed">
                    {review.source !== "user" && (
                      <span className="text-zinc-600">&quot;</span>
                    )}
                    {review.comment}
                    {review.source !== "user" && (
                      <span className="text-zinc-600">&quot;</span>
                    )}
                  </p>
                )}
                {review.source_url && (
                  <a
                    href={review.source_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className={`inline-block mt-2 text-[10px] font-mono ${source.color} hover:underline`}
                  >
                    source &rarr;
                  </a>
                )}
              </div>
            );
          })
        )}
      </div>
    </div>
  );
}
