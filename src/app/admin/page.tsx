import { createClient } from "@/lib/supabase/server";
import { redirect } from "next/navigation";
import Link from "next/link";

export const metadata = {
  title: "Admin Panel - API Katalog",
};

// Basit admin kontrolü - Supabase'de admin rolü ayarlanmalı
const ADMIN_EMAILS = ["admin@apikatalog.com"]; // Buraya kendi emailini ekle

export default async function AdminPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user || !ADMIN_EMAILS.includes(user.email ?? "")) {
    redirect("/");
  }

  const { data: apis, count: apiCount } = await supabase
    .from("apis")
    .select("*, category:categories(name)", { count: "exact" })
    .order("created_at", { ascending: false });

  const { count: reviewCount } = await supabase
    .from("reviews")
    .select("*", { count: "exact", head: true });

  const { count: categoryCount } = await supabase
    .from("categories")
    .select("*", { count: "exact", head: true });

  return (
    <div className="max-w-7xl mx-auto px-4 py-12">
      <h1 className="text-3xl font-bold text-gray-900 mb-8">Admin Panel</h1>

      {/* İstatistikler */}
      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 mb-8">
        <div className="bg-white border border-gray-200 rounded-xl p-6">
          <div className="text-3xl font-bold text-blue-600">{apiCount ?? 0}</div>
          <div className="text-sm text-gray-500 mt-1">Toplam API</div>
        </div>
        <div className="bg-white border border-gray-200 rounded-xl p-6">
          <div className="text-3xl font-bold text-green-600">{categoryCount ?? 0}</div>
          <div className="text-sm text-gray-500 mt-1">Kategori</div>
        </div>
        <div className="bg-white border border-gray-200 rounded-xl p-6">
          <div className="text-3xl font-bold text-purple-600">{reviewCount ?? 0}</div>
          <div className="text-sm text-gray-500 mt-1">Yorum</div>
        </div>
      </div>

      {/* Aksiyonlar */}
      <div className="flex gap-3 mb-8">
        <Link
          href="/admin/apis/new"
          className="bg-blue-600 text-white px-4 py-2 rounded-lg font-medium hover:bg-blue-700 transition"
        >
          + Yeni API Ekle
        </Link>
      </div>

      {/* API Listesi */}
      <div className="bg-white border border-gray-200 rounded-xl overflow-hidden">
        <table className="w-full">
          <thead className="bg-gray-50">
            <tr>
              <th className="text-left px-6 py-3 text-xs font-medium text-gray-500 uppercase">
                API
              </th>
              <th className="text-left px-6 py-3 text-xs font-medium text-gray-500 uppercase">
                Kategori
              </th>
              <th className="text-left px-6 py-3 text-xs font-medium text-gray-500 uppercase">
                Puan
              </th>
              <th className="text-left px-6 py-3 text-xs font-medium text-gray-500 uppercase">
                İşlem
              </th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-100">
            {apis?.map((api) => {
              const category = api.category as unknown as { name: string } | null;
              return (
                <tr key={api.id} className="hover:bg-gray-50">
                  <td className="px-6 py-4">
                    <div className="font-medium text-gray-900">{api.name}</div>
                    <div className="text-xs text-gray-400">{api.slug}</div>
                  </td>
                  <td className="px-6 py-4 text-sm text-gray-500">
                    {category?.name}
                  </td>
                  <td className="px-6 py-4 text-sm text-gray-500">
                    {Number(api.avg_rating).toFixed(1)} ({api.review_count})
                  </td>
                  <td className="px-6 py-4">
                    <Link
                      href={`/admin/apis/${api.id}/edit`}
                      className="text-blue-600 hover:text-blue-700 text-sm"
                    >
                      Düzenle
                    </Link>
                  </td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>
    </div>
  );
}
