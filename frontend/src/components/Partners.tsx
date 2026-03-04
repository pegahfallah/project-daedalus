import Image from "next/image";
import { getPartnersSection, getPartners } from "@/lib/api";
import { assetUrl } from "@/lib/directus";
import type { Partner } from "@/lib/types";
import SectionHeader from "./shared/SectionHeader";

const tierOrder = ["gold", "silver", "bronze"] as const;

const tierGridCols: Record<string, string> = {
  gold: "grid-cols-1 md:grid-cols-2",
  silver: "grid-cols-2 md:grid-cols-3",
  bronze: "grid-cols-2 md:grid-cols-4",
};

export default async function Partners() {
  const [section, partners] = await Promise.all([
    getPartnersSection(),
    getPartners(),
  ]);

  const tiers = tierOrder
    .map((tier) => ({
      name: tier,
      partners: partners.filter(
        (p: Partner) => p.tier?.toLowerCase() === tier
      ),
    }))
    .filter((t) => t.partners.length > 0);

  return (
    <section className="bg-bg-alt px-6 md:px-16 lg:px-32 xl:px-64 py-24 md:py-32">
      <SectionHeader label={section.label} heading={section.heading} />

      <div className="flex flex-col gap-12 md:gap-16">
        {tiers.map((tier) => (
          <div key={tier.name}>
            <span className="subheading text-text-muted block mb-6">
              {tier.name} Partners
            </span>

            <div className={`grid ${tierGridCols[tier.name]} gap-6 md:gap-8`}>
              {tier.partners.map((partner: Partner) => (
                <a
                  key={partner.id}
                  href={partner.website ?? "#"}
                  className="no-underline"
                >
                  {partner.logo && (
                    <div className="relative h-12 md:h-16">
                      <Image
                        src={assetUrl(partner.logo)}
                        alt={partner.name ?? ""}
                        fill
                        className="object-contain object-left"
                      />
                    </div>
                  )}
                </a>
              ))}
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}
