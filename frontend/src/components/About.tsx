import { getAbout } from "@/lib/api";

export default async function About() {
  const about = await getAbout();

  const stats = [
    { value: about.stat_1_value, label: about.stat_1_label },
    { value: about.stat_2_value, label: about.stat_2_label },
    { value: about.stat_3_value, label: about.stat_3_label },
  ].filter((s) => s.value);

  return (
    <section className="bg-bg px-6 md:px-16 lg:px-32 xl:px-64 py-24 md:py-32">
      <span className="subheading text-accent">{about.label}</span>

      <h2 className="h2-section text-text mt-4 max-w-3xl">{about.heading}</h2>

      <div className="w-15 h-px bg-accent mt-8 mb-10" />

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
    </section>
  );
}
