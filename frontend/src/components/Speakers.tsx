import { getSpeakersSection, getSpeakers } from "@/lib/api";
import type { Speaker } from "@/lib/types";
import SpeakerCard from "./SpeakerCard";
import Divider from "./shared/Divider";

export default async function Speakers() {
  const [section, speakers] = await Promise.all([
    getSpeakersSection(),
    getSpeakers(),
  ]);

  return (
    <section className="bg-black px-6 md:px-16 lg:px-32 xl:px-64 py-24 md:py-32">
      <span className="subheading text-accent">{section.label}</span>

      <h2 className="h2-section text-white mt-4 max-w-[800px]">
        {section.heading}
      </h2>

      <Divider className="my-8" />

      <div className="grid grid-cols-2 md:grid-cols-3 gap-x-6 md:gap-x-8 gap-y-12 md:gap-y-16">
        {speakers.map((speaker: Speaker) => (
          <SpeakerCard key={speaker.id} speaker={speaker} />
        ))}
      </div>
    </section>
  );
}
