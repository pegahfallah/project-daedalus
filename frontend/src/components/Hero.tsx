import Image from "next/image";
import { getHero } from "@/lib/api";
import { assetUrl } from "@/lib/directus";
import Button from "./shared/Button";

export default async function Hero() {
  let hero;
  try {
    hero = await getHero();
  } catch {
    return null;
  }

  return (
    <section className="relative w-full h-[667px] md:h-screen flex items-end overflow-hidden">
      {hero.image && (
        <Image
          src={assetUrl(hero.image)}
          alt=""
          fill
          priority
          className="object-cover"
        />
      )}

      <div className="absolute inset-0 bg-black/40" />

      <div className="relative z-above w-full px-6 md:px-16 lg:px-32 xl:px-64 pb-16 md:pb-24 flex flex-col gap-6">
        <span className="subheading text-white/80">
          <span className="md:hidden">
            {hero.subtitle_mobile ?? hero.subtitle}
          </span>
          <span className="hidden md:inline">{hero.subtitle}</span>
        </span>

        <h1 className="h1-display text-white">
          {hero.title}
        </h1>

        <p className="tagline text-white/80">
          {hero.tagline}
        </p>

        <div className="detail text-white/70 mt-2 flex flex-col gap-2 md:flex-row md:items-center md:gap-6">
          <span>{hero.dates}</span>
          <span className="hidden md:block w-px h-4 bg-white/40" />
          <span>{hero.venue}</span>
        </div>

        {hero.cta_label && (
          <Button href={hero.cta_url ?? "#"} className="mt-4 w-full md:w-auto">
            {hero.cta_label}
          </Button>
        )}
      </div>
    </section>
  );
}
