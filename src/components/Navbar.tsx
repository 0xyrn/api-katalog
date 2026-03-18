"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import type { User } from "@supabase/supabase-js";

export default function Navbar() {
  const [user, setUser] = useState<User | null>(null);
  const [menuOpen, setMenuOpen] = useState(false);
  const supabase = createClient();

  useEffect(() => {
    supabase.auth.getUser().then(({ data: { user } }) => setUser(user));

    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null);
    });

    return () => subscription.unsubscribe();
  }, []);

  const handleSignOut = async () => {
    await supabase.auth.signOut();
    window.location.href = "/";
  };

  return (
    <nav className="glass sticky top-0 z-50 border-b border-white/5">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center h-14">
          <div className="flex items-center gap-8">
            <Link href="/" className="flex items-center gap-2 group">
              <div className="w-7 h-7 rounded-lg bg-gradient-to-br from-violet-500 to-cyan-500 flex items-center justify-center text-white font-bold text-xs group-hover:shadow-lg group-hover:shadow-violet-500/20 transition">
                &lt;/&gt;
              </div>
              <span className="text-sm font-bold tracking-tight">
                API<span className="text-zinc-600">hub</span>
                <span className="text-violet-500">.</span>
              </span>
            </Link>
            <div className="hidden md:flex gap-1">
              <Link href="/categories" className="px-3 py-1.5 text-xs text-zinc-500 hover:text-white hover:bg-white/5 rounded-lg transition font-mono">
                /categories
              </Link>
              <Link href="/apis" className="px-3 py-1.5 text-xs text-zinc-500 hover:text-white hover:bg-white/5 rounded-lg transition font-mono">
                /explore
              </Link>
            </div>
          </div>

          <div className="flex items-center gap-3">
            {user ? (
              <div className="relative">
                <button
                  onClick={() => setMenuOpen(!menuOpen)}
                  className="w-8 h-8 rounded-full bg-gradient-to-br from-violet-500/20 to-cyan-500/20 border border-violet-500/20 text-violet-400 flex items-center justify-center text-xs font-medium hover:border-violet-500/40 transition"
                >
                  {user.email?.[0]?.toUpperCase() ?? "U"}
                </button>
                {menuOpen && (
                  <div className="absolute right-0 mt-2 w-48 glass rounded-xl py-1 shadow-2xl">
                    <div className="px-4 py-2 border-b border-white/5">
                      <p className="text-[10px] text-zinc-600 font-mono truncate">{user.email}</p>
                    </div>
                    <Link
                      href="/profile"
                      className="block px-4 py-2.5 text-xs text-zinc-400 hover:text-white hover:bg-white/5 transition"
                      onClick={() => setMenuOpen(false)}
                    >
                      Profile
                    </Link>
                    <button
                      onClick={handleSignOut}
                      className="block w-full text-left px-4 py-2.5 text-xs text-red-400 hover:text-red-300 hover:bg-white/5 transition"
                    >
                      Sign Out
                    </button>
                  </div>
                )}
              </div>
            ) : (
              <Link
                href="/login"
                className="bg-gradient-to-r from-violet-600 to-violet-500 text-white px-4 py-1.5 rounded-lg text-xs font-medium hover:from-violet-500 hover:to-violet-400 transition shadow-lg shadow-violet-500/15"
              >
                Sign In
              </Link>
            )}
          </div>
        </div>
      </div>
    </nav>
  );
}
