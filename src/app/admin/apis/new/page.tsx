"use client";

import { useState, useEffect } from "react";
import { createClient } from "@/lib/supabase/client";
import { useRouter } from "next/navigation";
import type { Category } from "@/lib/types";

export default function NewApiPage() {
  const [categories, setCategories] = useState<Category[]>([]);
  const [loading, setLoading] = useState(false);
  const [form, setForm] = useState({
    name: "",
    slug: "",
    description: "",
    website_url: "",
    affiliate_url: "",
    pricing_info: "Ücretsiz",
    category_id: "",
    logo_url: "",
  });

  const supabase = createClient();
  const router = useRouter();

  useEffect(() => {
    supabase
      .from("categories")
      .select("*")
      .order("name")
      .then(({ data }) => setCategories(data ?? []));
  }, []);

  const handleNameChange = (name: string) => {
    const slug = name
      .toLowerCase()
      .replace(/[^a-z0-9\s-]/g, "")
      .replace(/\s+/g, "-")
      .replace(/-+/g, "-")
      .trim();
    setForm({ ...form, name, slug });
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);

    const { error } = await supabase.from("apis").insert({
      name: form.name,
      slug: form.slug,
      description: form.description,
      website_url: form.website_url,
      affiliate_url: form.affiliate_url || null,
      pricing_info: form.pricing_info,
      category_id: form.category_id,
      logo_url: form.logo_url || null,
    });

    if (error) {
      alert("Hata: " + error.message);
      setLoading(false);
      return;
    }

    router.push("/admin");
  };

  return (
    <div className="max-w-2xl mx-auto px-4 py-12">
      <h1 className="text-2xl font-bold text-gray-900 mb-8">Yeni API Ekle</h1>

      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            API Adı
          </label>
          <input
            type="text"
            required
            value={form.name}
            onChange={(e) => handleNameChange(e.target.value)}
            className="w-full px-4 py-2 border border-gray-200 rounded-lg focus:border-blue-500 outline-none text-gray-800"
            placeholder="Örn: Stripe API"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Slug
          </label>
          <input
            type="text"
            required
            value={form.slug}
            onChange={(e) => setForm({ ...form, slug: e.target.value })}
            className="w-full px-4 py-2 border border-gray-200 rounded-lg focus:border-blue-500 outline-none text-gray-600 bg-gray-50"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Açıklama
          </label>
          <textarea
            required
            value={form.description}
            onChange={(e) => setForm({ ...form, description: e.target.value })}
            rows={4}
            className="w-full px-4 py-2 border border-gray-200 rounded-lg focus:border-blue-500 outline-none resize-none text-gray-800"
            placeholder="API'nin ne yaptığını açıklayın..."
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Kategori
          </label>
          <select
            required
            value={form.category_id}
            onChange={(e) => setForm({ ...form, category_id: e.target.value })}
            className="w-full px-4 py-2 border border-gray-200 rounded-lg focus:border-blue-500 outline-none text-gray-800"
          >
            <option value="">Kategori seçin</option>
            {categories.map((cat) => (
              <option key={cat.id} value={cat.id}>
                {cat.icon} {cat.name}
              </option>
            ))}
          </select>
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Website URL
          </label>
          <input
            type="url"
            required
            value={form.website_url}
            onChange={(e) => setForm({ ...form, website_url: e.target.value })}
            className="w-full px-4 py-2 border border-gray-200 rounded-lg focus:border-blue-500 outline-none text-gray-800"
            placeholder="https://example.com/docs"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Affiliate URL (Opsiyonel)
          </label>
          <input
            type="url"
            value={form.affiliate_url}
            onChange={(e) =>
              setForm({ ...form, affiliate_url: e.target.value })
            }
            className="w-full px-4 py-2 border border-gray-200 rounded-lg focus:border-blue-500 outline-none text-gray-800"
            placeholder="https://example.com?ref=apikatalog"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Logo URL (Opsiyonel)
          </label>
          <input
            type="url"
            value={form.logo_url}
            onChange={(e) => setForm({ ...form, logo_url: e.target.value })}
            className="w-full px-4 py-2 border border-gray-200 rounded-lg focus:border-blue-500 outline-none text-gray-800"
            placeholder="https://example.com/logo.png"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Fiyatlandırma
          </label>
          <input
            type="text"
            required
            value={form.pricing_info}
            onChange={(e) =>
              setForm({ ...form, pricing_info: e.target.value })
            }
            className="w-full px-4 py-2 border border-gray-200 rounded-lg focus:border-blue-500 outline-none text-gray-800"
            placeholder="Ücretsiz / $9.99/ay / Kullanım bazlı"
          />
        </div>

        <div className="flex gap-3 pt-4">
          <button
            type="submit"
            disabled={loading}
            className="bg-blue-600 text-white px-6 py-2 rounded-lg font-medium hover:bg-blue-700 transition disabled:opacity-50"
          >
            {loading ? "Kaydediliyor..." : "API Ekle"}
          </button>
          <button
            type="button"
            onClick={() => router.back()}
            className="px-6 py-2 border border-gray-200 rounded-lg text-gray-600 hover:bg-gray-50 transition"
          >
            İptal
          </button>
        </div>
      </form>
    </div>
  );
}
