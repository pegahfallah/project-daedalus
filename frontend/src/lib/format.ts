import type { Session, SessionSpeaker, Speaker } from "./types";

export function formatTime(time: string | null | undefined): string {
  if (!time) return "";
  return time.slice(0, 5);
}

export function formatDate(date: string | null | undefined): {
  short: string;
  long: string;
} {
  if (!date) return { short: "", long: "" };
  const d = new Date(date + "T00:00:00");
  const day = d.getDate();
  const monthShort = d
    .toLocaleDateString("en-GB", { month: "short" })
    .toUpperCase();
  const monthLong = d
    .toLocaleDateString("en-GB", { month: "long" })
    .toUpperCase();
  return { short: `${day} ${monthShort}`, long: `${day} ${monthLong}` };
}

function isSessionSpeaker(entry: unknown): entry is SessionSpeaker {
  return typeof entry === "object" && entry !== null && "speakers_id" in entry;
}

function isSpeaker(value: unknown): value is Speaker {
  return typeof value === "object" && value !== null && "name" in value;
}

export function getSpeakerNames(session: Session): string {
  if (!session.speakers || !Array.isArray(session.speakers)) return "";
  return session.speakers
    .map((entry) => {
      if (!isSessionSpeaker(entry)) return "";
      const speaker = entry.speakers_id;
      if (!isSpeaker(speaker)) return "";
      return speaker.name ?? "";
    })
    .filter(Boolean)
    .join(", ");
}
