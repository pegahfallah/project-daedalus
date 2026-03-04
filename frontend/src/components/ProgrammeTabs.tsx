"use client";

import { useState } from "react";
import type { ScheduleDay, Session, SessionSpeaker, Speaker } from "@/lib/types";

function formatTime(time: string | null | undefined) {
  if (!time) return "";
  return time.slice(0, 5);
}

function formatDate(date: string | null | undefined) {
  if (!date) return { short: "", long: "" };
  const d = new Date(date + "T00:00:00");
  const day = d.getDate();
  const monthShort = d.toLocaleDateString("en-GB", { month: "short" }).toUpperCase();
  const monthLong = d.toLocaleDateString("en-GB", { month: "long" }).toUpperCase();
  return { short: `${day} ${monthShort}`, long: `${day} ${monthLong}` };
}

function getSpeakerNames(session: Session): string {
  if (!session.speakers || !Array.isArray(session.speakers)) return "";
  return session.speakers
    .map((s) => {
      if (typeof s === "string") return "";
      const speaker = (s as SessionSpeaker).speakers_id;
      if (!speaker || typeof speaker === "string") return "";
      return (speaker as Speaker).name ?? "";
    })
    .filter(Boolean)
    .join(", ");
}

const typeColors: Record<string, string> = {
  keynote: "text-accent",
  workshop: "text-type-workshop",
  talk: "text-text-muted",
  panel: "text-type-panel",
};

function getTypeColor(type: string | null | undefined) {
  return typeColors[type?.toLowerCase() ?? ""] ?? "text-text";
}

export default function ProgrammeTabs({ days }: { days: ScheduleDay[] }) {
  const [activeDay, setActiveDay] = useState(0);

  const currentDay = days[activeDay];
  const sessions = (currentDay?.sessions ?? []).filter(
    (s): s is Session => typeof s !== "string"
  );

  return (
    <>
      {/* Day tabs */}
      <div className="flex border-b border-border">
        {days.map((day, i) => {
          const date = formatDate(day.date);
          return (
            <button
              key={day.id}
              onClick={() => setActiveDay(i)}
              className={`bg-transparent border-0 border-b-2 border-solid cursor-pointer h-20 px-4 md:px-6 -mb-px transition-colors duration-fast text-center ${
                i === activeDay
                  ? "border-b-accent"
                  : "border-b-transparent"
              }`}
            >
              <span
                className={`block font-body leading-none ${
                  i === activeDay ? "text-text font-semibold" : "text-text-secondary font-medium"
                }`}
              >
                <span className="text-[13px] md:hidden">
                  Day {day.day_number}
                </span>
                <span className="hidden md:inline detail">
                  Day {day.day_number} — {day.title}
                </span>
              </span>
              <span className="subheading block mt-2 text-text-muted !text-[10px] !tracking-[1px] md:!text-xs md:!tracking-[1.8px]">
                <span className="md:hidden">{date.short}</span>
                <span className="hidden md:inline">{date.long}</span>
              </span>
            </button>
          );
        })}
      </div>

      {/* Sessions */}
      <div className="mt-8 md:mt-12">
        {sessions.map((session) => (
          <div
            key={session.id}
            className="border-b border-border py-6 md:py-8"
          >
            {/* Mobile layout */}
            <div className="flex gap-6 md:hidden">
              <span className="session-time text-text-secondary shrink-0 w-16">
                {formatTime(session.start_time)}
              </span>
              <div className="flex flex-col gap-1.5">
                <span className="h3-small text-text">
                  {session.title}
                </span>
                <span className="session-meta text-text-secondary">
                  {getSpeakerNames(session)}
                </span>
                <span className={`session-type mt-1 ${getTypeColor(session.type)}`}>
                  {session.type}
                </span>
                <span className="session-room text-text-muted">
                  {session.room}
                </span>
              </div>
            </div>

            {/* Desktop layout */}
            <div className="hidden md:flex items-baseline">
              <span className="session-time text-text-secondary w-24 shrink-0">
                {formatTime(session.start_time)}
              </span>
              <div className="flex-1">
                <span className="h3-small text-text block">
                  {session.title}
                </span>
                <span className="session-meta text-text-secondary mt-1 block">
                  {getSpeakerNames(session)}
                </span>
              </div>
              <span className={`session-type shrink-0 w-40 ${getTypeColor(session.type)}`}>
                {session.type}
              </span>
              <span className="session-room text-gray-400 shrink-0 w-24 text-right">
                {session.room}
              </span>
            </div>
          </div>
        ))}
      </div>
    </>
  );
}
