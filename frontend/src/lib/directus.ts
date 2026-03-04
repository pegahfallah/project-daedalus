const DIRECTUS_URL =
  process.env.NEXT_PUBLIC_DIRECTUS_URL || "http://localhost:8055";

export function directusUrl(path: string): string {
  return `${DIRECTUS_URL}${path}`;
}

export function assetUrl(fileId: string | null | undefined): string {
  if (!fileId) return "";
  return `${DIRECTUS_URL}/assets/${fileId}`;
}

export async function directusFetch<T>(path: string): Promise<T> {
  const url = directusUrl(path);
  const res = await fetch(url, { next: { revalidate: 60 } });

  if (!res.ok) {
    throw new Error(`Directus fetch failed: ${res.status} ${res.statusText} — ${url}`);
  }

  const json = await res.json();
  return json.data as T;
}
