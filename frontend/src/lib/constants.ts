export const TIER_ORDER = ["gold", "silver", "bronze"] as const;

export type PartnerTier = (typeof TIER_ORDER)[number];

export const TIER_GRID_COLS: Record<PartnerTier, string> = {
  gold: "grid-cols-1 md:grid-cols-2",
  silver: "grid-cols-2 md:grid-cols-3",
  bronze: "grid-cols-2 md:grid-cols-4",
};

export const SESSION_TYPE_COLORS: Record<string, string> = {
  keynote: "text-accent",
  workshop: "text-type-workshop",
  talk: "text-text-muted",
  panel: "text-type-panel",
};

export const SESSION_TYPE_COLOR_DEFAULT = "text-text";
