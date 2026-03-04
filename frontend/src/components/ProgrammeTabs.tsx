"use client";

import { useRef, useState } from "react";

import { formatDate } from "@/lib/format";

import SessionRow from "./SessionRow";

import type { ScheduleDay, Session } from "@/lib/types";

interface ProgrammeTabsProps {
  days: ScheduleDay[];
}

export default function ProgrammeTabs({ days }: ProgrammeTabsProps) {
  const [activeDay, setActiveDay] = useState(0);
  const tabRefs = useRef<(HTMLButtonElement | null)[]>([]);

  const currentDay = days[activeDay];
  const sessions = (currentDay?.sessions ?? []).filter(
    (s): s is Session => typeof s !== "string",
  );

  function handleTabKeyDown(e: React.KeyboardEvent<HTMLButtonElement>) {
    let nextIndex: number | null = null;

    if (e.key === "ArrowRight") {
      nextIndex = activeDay < days.length - 1 ? activeDay + 1 : 0;
    } else if (e.key === "ArrowLeft") {
      nextIndex = activeDay > 0 ? activeDay - 1 : days.length - 1;
    } else if (e.key === "Home") {
      nextIndex = 0;
    } else if (e.key === "End") {
      nextIndex = days.length - 1;
    }

    if (nextIndex !== null) {
      e.preventDefault();
      setActiveDay(nextIndex);
      tabRefs.current[nextIndex]?.focus();
    }
  }

  return (
    <>
      {/* Day tabs */}
      <div
        role="tablist"
        aria-label="Schedule days"
        className="flex border-b border-border"
      >
        {days.map((day, i) => {
          const date = formatDate(day.date);
          const isActive = i === activeDay;
          return (
            <button
              key={day.id}
              ref={(el) => {
                tabRefs.current[i] = el;
              }}
              role="tab"
              aria-selected={isActive}
              aria-controls={`tabpanel-${day.id}`}
              id={`tab-${day.id}`}
              tabIndex={isActive ? 0 : -1}
              onClick={() => setActiveDay(i)}
              onKeyDown={handleTabKeyDown}
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
      <div
        role="tabpanel"
        id={`tabpanel-${currentDay?.id}`}
        aria-labelledby={`tab-${currentDay?.id}`}
        className="mt-8 md:mt-12"
      >
        {sessions.map((session) => (
          <SessionRow key={session.id} session={session} />
        ))}
      </div>
    </>
  );
}
