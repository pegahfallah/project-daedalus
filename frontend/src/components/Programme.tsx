import { getProgrammeSection, getScheduleDays } from "@/lib/api";
import ProgrammeTabs from "./ProgrammeTabs";
import Divider from "./shared/Divider";

export default async function Programme() {
  const [section, days] = await Promise.all([
    getProgrammeSection(),
    getScheduleDays(),
  ]);

  return (
    <section className="bg-bg px-6 md:px-16 lg:px-32 xl:px-64 py-24 md:py-32">
      <span className="subheading text-accent">{section.label}</span>

      <h2 className="h2-section text-text mt-4 max-w-[800px]">
        {section.heading}
      </h2>

      <Divider className="my-8" />

      <ProgrammeTabs days={days} />
    </section>
  );
}
