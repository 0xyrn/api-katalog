export interface Category {
  id: string;
  name: string;
  slug: string;
  description: string;
  icon: string;
  api_count?: number;
}

export interface Api {
  id: string;
  name: string;
  slug: string;
  description: string;
  logo_url: string | null;
  website_url: string;
  affiliate_url: string | null;
  pricing_info: string;
  category_id: string;
  avg_rating: number;
  review_count: number;
  created_at: string;
  category?: Category;
  // v2 fields
  tags: string[];
  features: string[];
  code_example: string;
  is_repo: boolean;
  github_url: string | null;
  github_stars: number;
  github_forks: number;
}

export interface Review {
  id: string;
  user_id: string | null;
  api_id: string;
  rating: number;
  comment: string;
  created_at: string;
  user_email?: string;
  user_name?: string;
  source: "user" | "reddit" | "hackernews";
  source_url: string | null;
}

export interface Favorite {
  id: string;
  user_id: string;
  api_id: string;
  created_at: string;
}
