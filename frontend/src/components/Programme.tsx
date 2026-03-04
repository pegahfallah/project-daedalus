import { getProgrammeSection, getScheduleDays } from "@/lib/api";
import ProgrammeTabs from "./ProgrammeTabs";
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
    <section className="bg-bg px-6 md:px-16 lg:px-32 xl:px-64 py-24 md:py-32">
      <SectionHeader label={section.label} heading={section.heading} />

      <ProgrammeTabs days={days} />
    </section>
  );
}
