"use client";

import { useState } from "react";
import type {
  ScheduleDay,
  Session,
  SessionSpeaker,
  Speaker,
} from "@/lib/types";

function formatTime(time: string | null | undefined): string {
  if (!time) return "";
  return time.slice(0, 5);
}

function formatDate(date: string | null | undefined): {
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

function getSpeakerNames(session: Session): string {
  if (!session.speakers || !Array.isArray(session.speakers)) return "";
  return session.speakers
    .map((entry) => {
      if (typeof entry === "string") return "";
      const speaker = (entry as SessionSpeaker).speakers_id;
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

function getTypeColor(type: string | null | undefined): string {
  return typeColors[type?.toLowerCase() ?? ""] ?? "text-text";
}

interface ProgrammeTabsProps {
  days: ScheduleDay[];
}

export default function ProgrammeTabs({ days }: ProgrammeTabsProps) {
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
          const isActive = i === activeDay;
          return (
            <button
              key={day.id}
              onClick={() => setActiveDay(i)}
              className={`bg-transparent border-0 border-b-2 border-solid cursor-pointer h-20 px-4 md:px-6 -mb-px transition-colors duration-fast text-center ${
                isActive ? "border-b-accent" : "border-b-transparent"
              }`}
            >
              <span
                className={`tab-title block ${
                  isActive
                    ? "text-text font-semibold"
                    : "text-text-secondary font-medium"
                }`}
              >
                <span className="md:hidden">Day {day.day_number}</span>
                <span className="hidden md:inline">
                  Day {day.day_number} — {day.title}
                </span>
              </span>
              <span className="tab-date block mt-2 text-text-muted">
                <span className="md:hidden">{date.short}</span>
                <span className="hidden md:inline">{date.long}</span>
              </span>
            </button>
          );
        })}
      </div>

      {/* Sessions */}
      <div className="mt-8 md:mt-12">
        {sessions.map((session) => {
          const speakerNames = getSpeakerNames(session);
          return (
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
                  {speakerNames && (
                    <span className="session-meta text-text-secondary">
                      {speakerNames}
                    </span>
                  )}
                  <span
                    className={`session-type mt-1 ${getTypeColor(session.type)}`}
                  >
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
                  {speakerNames && (
                    <span className="session-meta text-text-secondary mt-1 block">
                      {speakerNames}
                    </span>
                  )}
                </div>
                <span
                  className={`session-type shrink-0 w-40 ${getTypeColor(session.type)}`}
                >
                  {session.type}
                </span>
                <span className="session-room text-gray-400 shrink-0 w-24 text-right">
                  {session.room}
                </span>
              </div>
            </div>
          );
        })}
      </div>
    </>
  );
}
