import Image from "next/image";

import { getPartnersSection, getPartners } from "@/lib/api";
import { TIER_ORDER, TIER_GRID_COLS } from "@/lib/constants";
import { assetUrl } from "@/lib/directus";

import Section from "./shared/Section";
import SectionHeader from "./shared/SectionHeader";

import type { Partner } from "@/lib/types";

export default async function Partners() {
  let section, partners;
  try {
    [section, partners] = await Promise.all([
      getPartnersSection(),
      getPartners(),
    ]);
  } catch {
    return null;
  }

  const tiers = TIER_ORDER.map((tier) => ({
    name: tier,
    partners: partners.filter((p: Partner) => p.tier?.toLowerCase() === tier),
  })).filter((t) => t.partners.length > 0);

  return (
    <Section bg="alt">
      <SectionHeader label={section.label} heading={section.heading} />

      <div className="flex flex-col gap-12 md:gap-16">
        {tiers.map((tier) => (
          <div key={tier.name}>
            <span className="subheading text-text-muted block mb-6">
              {tier.name} Partners
            </span>

            <div className={`grid ${TIER_GRID_COLS[tier.name]} gap-6 md:gap-8`}>
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
                        alt={partner.name ?? "Partner logo"}
                        fill
                        sizes="(max-width: 768px) 50vw, 25vw"
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
    </Section>
  );
}
