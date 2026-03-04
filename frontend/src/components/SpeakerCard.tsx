import Image from "next/image";
import { assetUrl } from "@/lib/directus";
import type { Speaker } from "@/lib/types";

export default function SpeakerCard({ speaker }: { speaker: Speaker }) {
  return (
    <div>
      {speaker.headshot && (
        <div className="relative aspect-[3/4] overflow-hidden">
          <Image
            src={assetUrl(speaker.headshot)}
            alt={speaker.name ?? ""}
            fill
            className="object-cover"
          />
        </div>
      )}

      <h3 className="speaker-name text-white mt-4 mb-2">{speaker.name}</h3>

      <p className="speaker-role text-gray-400 m-0">{speaker.role}</p>

      {speaker.company && (
        <a
          href={speaker.company_url ?? "#"}
          className="speaker-company text-accent no-underline hover:text-accent-hover transition-colors duration-fast inline-block"
        >
          {speaker.company}
        </a>
      )}
    </div>
  );
}
