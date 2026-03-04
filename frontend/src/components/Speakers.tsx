import { getSpeakersSection, getSpeakers } from "@/lib/api";
import type { Speaker } from "@/lib/types";
import SpeakerCard from "./SpeakerCard";
import SectionHeader from "./shared/SectionHeader";

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
    <section className="bg-black px-6 md:px-16 lg:px-32 xl:px-64 py-24 md:py-32">
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
    </section>
  );
}
