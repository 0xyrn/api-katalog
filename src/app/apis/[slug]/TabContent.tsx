"use client";

import { useState } from "react";
import ReviewSection from "./ReviewSection";
import type { Api, Review } from "@/lib/types";

export default function TabContent({ api, reviews }: { api: Api; reviews: Review[] }) {
  const [tab, setTab] = useState<"overview" | "reviews">("overview");

  const tabs = [
    { key: "overview" as const, label: "Overview" },
    { key: "reviews" as const, label: `Reviews (${reviews.length})` },
  ];

  return (
    <div>
      {/* Tab Navigation */}
      <div className="flex gap-1 border-b border-white/5 mb-8">
        {tabs.map((t) => (
          <button
            key={t.key}
            onClick={() => setTab(t.key)}
            className={`px-4 py-3 text-sm font-medium transition relative ${
              tab === t.key
                ? "text-white tab-active"
                : "text-zinc-500 hover:text-zinc-300"
            }`}
          >
            {t.label}
          </button>
        ))}
      </div>

      {/* Overview Tab */}
      {tab === "overview" && (
        <div className="space-y-8">
          {/* Description */}
          <div>
            <p className="text-zinc-400 leading-relaxed">{api.description}</p>
          </div>

          {/* Features */}
          {api.features && api.features.length > 0 && (
            <div>
              <h3 className="text-sm font-semibold text-zinc-300 mb-4">Features</h3>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
                {api.features.map((f: string) => (
                  <div key={f} className="flex items-center gap-2 text-sm text-zinc-400">
                    <svg className="w-4 h-4 text-emerald-400 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                    </svg>
                    {f}
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Code Example */}
          {api.code_example && (
            <div>
              <h3 className="text-sm font-semibold text-zinc-300 mb-4 flex items-center gap-2">
                Quick Start
                <span className="text-[10px] text-zinc-600 font-mono font-normal">// copy-paste & go</span>
              </h3>
              <div className="relative group">
                <pre className="glass rounded-xl p-5 overflow-x-auto text-sm font-mono text-zinc-300 leading-relaxed">
                  <code>{api.code_example}</code>
                </pre>
                <button
                  onClick={() => navigator.clipboard.writeText(api.code_example)}
                  className="absolute top-3 right-3 p-2 rounded-lg bg-white/[0.05] text-zinc-500 hover:text-white hover:bg-white/[0.1] transition opacity-0 group-hover:opacity-100"
                  title="Copy to clipboard"
                >
                  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z" />
                  </svg>
                </button>
              </div>
            </div>
          )}

          {/* Pricing Info */}
          <div>
            <h3 className="text-sm font-semibold text-zinc-300 mb-4">Pricing</h3>
            <div className="glass rounded-xl p-5">
              <div className="text-sm text-zinc-400">{api.pricing_info}</div>
              <a
                href={api.website_url}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-block mt-3 text-xs text-violet-400 hover:text-violet-300 font-mono transition"
              >
                See full pricing &rarr;
              </a>
            </div>
          </div>
        </div>
      )}

      {/* Reviews Tab */}
      {tab === "reviews" && (
        <ReviewSection apiId={api.id} reviews={reviews} />
      )}
    </div>
  );
}
