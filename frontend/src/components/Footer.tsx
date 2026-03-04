import { getFooter, getHero } from "@/lib/api";

import Button from "./shared/Button";

export default async function Footer() {
  let footer, hero;
  try {
    [footer, hero] = await Promise.all([getFooter(), getHero()]);
  } catch {
    return null;
  }

  const socials = [
    { label: "Twitter / X", mobileLabel: "X", url: footer.twitter_url },
    { label: "Instagram", mobileLabel: "Instagram", url: footer.instagram_url },
    { label: "LinkedIn", mobileLabel: "LinkedIn", url: footer.linkedin_url },
  ].filter((s) => s.url);

  return (
    <footer id="contact" className="bg-black px-6 md:px-16 lg:px-32 xl:px-64">
      {/* CTA block */}
      <div className="flex flex-col items-center py-16 md:py-32 gap-8">
        <p className="footer-heading text-white max-w-3xl">
          <span className="md:hidden">
            {footer.cta_text_mobile ?? footer.cta_text}
          </span>
          <span className="hidden md:inline">{footer.cta_text}</span>
        </p>

        {footer.cta_label && (
          <Button href={footer.cta_url ?? "#"} className="w-full md:w-auto">
            {footer.cta_label}
          </Button>
        )}
      </div>

      {/* Divider */}
      <div className="h-px bg-gray-800" />

      {/* Bottom bar */}
      <div className="flex flex-col gap-6 py-8 md:py-10">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-6">
          <div>
            <span className="logo-type text-white block">
              FORMA <span className="text-accent">2026</span>
            </span>
            <div className="detail text-gray-400 mt-3 flex flex-col gap-1">
              <span>{hero.dates}</span>
              <span>{hero.venue}</span>
            </div>
          </div>

          <nav aria-label="Social links" className="flex items-center gap-8">
            {socials.map((social) => (
              <a
                key={social.label}
                href={social.url ?? "#"}
                rel="noopener noreferrer"
                target="_blank"
                className="speaker-company text-gray-400 no-underline hover:text-white transition-colors duration-fast"
              >
                <span className="md:hidden">{social.mobileLabel}</span>
                <span className="hidden md:inline">{social.label}</span>
              </a>
            ))}
          </nav>
        </div>
      </div>
    </footer>
  );
}
