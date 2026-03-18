import Link from "next/link";
import StarRating from "./StarRating";
import type { Api } from "@/lib/types";

const accentColors = [
  { border: "border-l-violet-500/50", bg: "from-violet-500/10", text: "text-violet-400" },
  { border: "border-l-cyan-500/50", bg: "from-cyan-500/10", text: "text-cyan-400" },
  { border: "border-l-emerald-500/50", bg: "from-emerald-500/10", text: "text-emerald-400" },
  { border: "border-l-amber-500/50", bg: "from-amber-500/10", text: "text-amber-400" },
  { border: "border-l-rose-500/50", bg: "from-rose-500/10", text: "text-rose-400" },
];

export default function ApiCard({ api, index = 0 }: { api: Api; index?: number }) {
  const color = accentColors[index % accentColors.length];
  const isRepo = (api as unknown as { is_repo?: boolean }).is_repo;
  const stars = (api as unknown as { github_stars?: number }).github_stars;

  return (
    <Link
      href={`/apis/${api.slug}`}
      className={`group block glass glass-hover rounded-xl p-5 border-l-2 ${color.border}`}
    >
      <div className="flex items-start gap-4">
        <div className={`w-10 h-10 rounded-lg bg-gradient-to-br ${color.bg} to-transparent flex items-center justify-center text-base font-bold ${color.text} shrink-0 group-hover:scale-110 transition-transform`}>
          {api.logo_url ? (
            <img src={api.logo_url} alt={api.name} className="w-7 h-7 rounded object-contain" />
          ) : (
            api.name[0]
          )}
        </div>
        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2">
            <h3 className="font-semibold text-zinc-200 group-hover:text-white transition truncate">
              {api.name}
            </h3>
            {isRepo && (
              <span className="text-[9px] px-1.5 py-0.5 rounded bg-emerald-500/10 text-emerald-400 font-mono shrink-0">
                REPO
              </span>
            )}
          </div>
          <p className="text-xs text-zinc-500 mt-1.5 line-clamp-2 leading-relaxed">
            {api.description}
          </p>
          <div className="flex items-center gap-3 mt-3">
            <StarRating rating={Math.round(api.avg_rating)} size="sm" />
            <span className="text-[10px] text-zinc-700 font-mono">
              {api.review_count} reviews
            </span>
            {isRepo && stars ? (
              <span className="text-[10px] px-2 py-0.5 bg-amber-500/10 text-amber-400 rounded-full ml-auto font-mono flex items-center gap-1">
                <svg className="w-3 h-3" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
                {stars > 1000 ? `${(stars / 1000).toFixed(0)}k` : stars}
              </span>
            ) : (
              <span className="text-[10px] px-2 py-0.5 bg-white/[0.03] text-zinc-500 rounded-full ml-auto font-mono">
                {api.pricing_info}
              </span>
            )}
          </div>
        </div>
      </div>
    </Link>
  );
}
