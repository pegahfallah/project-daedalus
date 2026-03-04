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
            alt={speaker.name ? `Photo of ${speaker.name}` : "Speaker photo"}
            fill
            sizes="(max-width: 768px) 50vw, 33vw"
            className="object-cover"
          />
        </div>
      )}

      <h3 className="h3-small text-white mt-4 mb-2">{speaker.name}</h3>

      <p className="speaker-role text-gray-400 m-0">
        <span className="md:hidden">{speaker.role_mobile ?? speaker.role}</span>
        <span className="hidden md:inline">{speaker.role}</span>
      </p>

      {speaker.company && (
        <a
          href={speaker.company_url ?? "#"}
          className="speaker-company text-accent no-underline hover:text-accent-hover transition-colors duration-fast inline-block"
        >
          <span className="md:hidden">
            {speaker.company_mobile ?? speaker.company}
          </span>
          <span className="hidden md:inline">{speaker.company}</span>
        </a>
      )}
    </div>
  );
}
