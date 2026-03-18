"use client";

import { useState } from "react";

interface StarRatingProps {
  rating: number;
  onRate?: (rating: number) => void;
  size?: "sm" | "md" | "lg";
  interactive?: boolean;
}

export default function StarRating({
  rating,
  onRate,
  size = "md",
  interactive = false,
}: StarRatingProps) {
  const [hoverRating, setHoverRating] = useState(0);

  const sizeClasses = {
    sm: "text-xs",
    md: "text-lg",
    lg: "text-xl",
  };

  return (
    <div className="flex items-center gap-0.5">
      {[1, 2, 3, 4, 5].map((star) => (
        <button
          key={star}
          type="button"
          disabled={!interactive}
          className={`${sizeClasses[size]} ${
            interactive ? "cursor-pointer hover:scale-110 transition" : "cursor-default"
          }`}
          onMouseEnter={() => interactive && setHoverRating(star)}
          onMouseLeave={() => interactive && setHoverRating(0)}
          onClick={() => interactive && onRate?.(star)}
        >
          <span
            className={
              star <= (hoverRating || rating)
                ? "text-amber-400"
                : "text-zinc-700"
            }
          >
            ★
          </span>
        </button>
      ))}
    </div>
  );
}
