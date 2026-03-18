import Link from "next/link";

export default function Footer() {
  return (
    <footer className="border-t border-white/5 mt-auto">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          <div className="md:col-span-2">
            <div className="flex items-center gap-2 mb-3">
              <div className="w-6 h-6 rounded-md bg-gradient-to-br from-violet-500 to-cyan-500 flex items-center justify-center text-white font-bold text-[8px]">
                &lt;/&gt;
              </div>
              <span className="text-sm font-bold tracking-tight">
                API<span className="text-zinc-700">hub</span>
                <span className="text-violet-500">.</span>
              </span>
            </div>
            <p className="text-xs text-zinc-700 leading-relaxed max-w-xs">
              The API discovery platform for developers who&apos;d rather
              ship than scroll through docs all day.
            </p>
            <p className="text-[10px] text-zinc-800 font-mono mt-3">
              // built with Next.js, Supabase &amp; too much coffee
            </p>
          </div>
          <div>
            <h4 className="text-[10px] font-mono text-zinc-600 uppercase tracking-widest mb-3">
              Explore
            </h4>
            <ul className="space-y-2">
              <li>
                <Link href="/categories" className="text-xs text-zinc-600 hover:text-violet-400 transition">
                  Categories
                </Link>
              </li>
              <li>
                <Link href="/apis" className="text-xs text-zinc-600 hover:text-violet-400 transition">
                  All APIs
                </Link>
              </li>
              <li>
                <Link href="/apis?sort=rating" className="text-xs text-zinc-600 hover:text-violet-400 transition">
                  Top Rated
                </Link>
              </li>
            </ul>
          </div>
          <div>
            <h4 className="text-[10px] font-mono text-zinc-600 uppercase tracking-widest mb-3">
              Legal
            </h4>
            <ul className="space-y-2">
              <li><span className="text-xs text-zinc-700">Terms of Service</span></li>
              <li><span className="text-xs text-zinc-700">Privacy Policy</span></li>
            </ul>
          </div>
        </div>
        <div className="mt-10 pt-6 border-t border-white/[0.03] flex flex-col sm:flex-row justify-between items-center gap-2">
          <span className="text-[10px] text-zinc-800 font-mono">
            &copy; {new Date().getFullYear()} APIhub. All rights reserved.
          </span>
          <span className="text-[10px] text-zinc-800 font-mono">
            Made with mass amounts of ctrl+c ctrl+v
          </span>
        </div>
      </div>
    </footer>
  );
}
