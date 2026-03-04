const DIRECTUS_URL =
  process.env.NEXT_PUBLIC_DIRECTUS_URL || "http://localhost:8055";

export function directusUrl(path: string): string {
  return `${DIRECTUS_URL}${path}`;
}

export function assetUrl(fileId: string | null | undefined): string {
  if (!fileId) return "";
  return `${DIRECTUS_URL}/assets/${fileId}`;
}

export class DirectusError extends Error {
  constructor(
    message: string,
    public readonly status?: number,
    public readonly url?: string
  ) {
    super(message);
    this.name = "DirectusError";
  }
}

export async function directusFetch<T>(path: string): Promise<T> {
  const url = directusUrl(path);

  let res: Response;
  try {
    res = await fetch(url, { next: { revalidate: 60 } });
  } catch (err) {
    throw new DirectusError(
      `Network error: unable to reach Directus at ${url}`,
      undefined,
      url
    );
  }

  if (!res.ok) {
    throw new DirectusError(
      `Directus responded with ${res.status} ${res.statusText}`,
      res.status,
      url
    );
  }

  let json: { data: T; errors?: { message: string }[] };
  try {
    json = await res.json();
  } catch {
    throw new DirectusError("Invalid JSON response from Directus", res.status, url);
  }

  if (json.errors?.length) {
    throw new DirectusError(
      `Directus error: ${json.errors[0].message}`,
      res.status,
      url
    );
  }

  return json.data;
}
