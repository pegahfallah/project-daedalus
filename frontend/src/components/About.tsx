import { getAbout } from "@/lib/api";

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

        <div className="flex flex-col gap-8 md:gap-10 md:ml-auto">
          {stats.map((stat) => (
            <div
              key={stat.label}
              className="border-l border-border pl-6 md:pl-8"
            >
              <span className="stat-number text-text block">{stat.value}</span>
              <span className="subheading text-text-muted mt-2 block">
                {stat.label}
              </span>
            </div>
          ))}
        </div>
      </div>
    </Section>
  );
}
