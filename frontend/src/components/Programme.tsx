import { getProgrammeSection, getScheduleDays } from "@/lib/api";

import ProgrammeTabs from "./ProgrammeTabs";
import Section from "./shared/Section";
import SectionHeader from "./shared/SectionHeader";

export default async function Programme() {
  let section, days;
  try {
    [section, days] = await Promise.all([
      getProgrammeSection(),
      getScheduleDays(),
    ]);
  } catch {
    return null;
  }

  return (
    <Section id="programme">
      <SectionHeader label={section.label} heading={section.heading} />
      <ProgrammeTabs days={days} />
    </Section>
  );
}
