import { getSpeakersSection, getSpeakers } from "@/lib/api";

import SpeakerCard from "./SpeakerCard";
import Section from "./shared/Section";
import SectionHeader from "./shared/SectionHeader";

import type { Speaker } from "@/lib/types";

export default async function Speakers() {
  let section, speakers;
  try {
    [section, speakers] = await Promise.all([
      getSpeakersSection(),
      getSpeakers(),
    ]);
  } catch {
    return null;
  }

  return (
    <Section id="speakers" bg="dark">
      <SectionHeader
        label={section.label}
        heading={section.heading}
        headingColor="text-white"
      />

      <div className="grid grid-cols-2 md:grid-cols-3 gap-x-6 md:gap-x-8 gap-y-12 md:gap-y-16">
        {speakers.map((speaker: Speaker) => (
          <SpeakerCard key={speaker.id} speaker={speaker} />
        ))}
      </div>
    </Section>
  );
}
