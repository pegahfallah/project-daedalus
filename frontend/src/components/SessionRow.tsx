import {
  SESSION_TYPE_COLORS,
  SESSION_TYPE_COLOR_DEFAULT,
} from "@/lib/constants";
import { formatTime, getSpeakerNames } from "@/lib/format";

import type { Session } from "@/lib/types";

function getTypeColor(type: string | null | undefined): string {
  return (
    SESSION_TYPE_COLORS[type?.toLowerCase() ?? ""] ?? SESSION_TYPE_COLOR_DEFAULT
  );
}

interface SessionRowProps {
  session: Session;
}

export default function SessionRow({ session }: SessionRowProps) {
  const speakerNames = getSpeakerNames(session);

  return (
    <div className="border-b border-border py-6 md:py-8">
      {/* Mobile layout */}
      <div className="flex gap-6 md:hidden">
        <span className="session-time text-text-secondary shrink-0 w-16">
          {formatTime(session.start_time)}
        </span>
        <div className="flex flex-col gap-1.5">
          <span className="h3-small text-text">{session.title}</span>
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
}
