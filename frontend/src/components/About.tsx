import { getAbout } from "@/lib/api";

import AnimatedStats from "./animations/AnimatedStats";
import Section from "./shared/Section";
import SectionHeader from "./shared/SectionHeader";

export default async function About() {
  let about;
  try {
    about = await getAbout();
  } catch {
    return null;
  }

  const stats = [
    { value: about.stat_1_value, label: about.stat_1_label },
    { value: about.stat_2_value, label: about.stat_2_label },
    { value: about.stat_3_value, label: about.stat_3_label },
  ].filter((s) => s.value);

  return (
    <Section id="about">
      <SectionHeader label={about.label} heading={about.heading} />

      <div className="flex flex-col md:flex-row gap-12 md:gap-16">
        <div className="body-text text-gray-700 max-w-lg whitespace-pre-line">
          {about.body}
        </div>

        <AnimatedStats stats={stats} />
      </div>
    </Section>
  );
}
