import { getNavigation } from "@/lib/api";
import type { Navigation } from "@/lib/types";
import Button from "./Button";
import MobileMenu from "./MobileMenu";
import Link from "next/link";

export default async function Navbar() {
  const items = await getNavigation();

  const links = items.filter((item: Navigation) => !item.is_cta);
  const cta = items.find((item: Navigation) => item.is_cta);

  return (
    <nav className="fixed top-0 left-0 right-0 z-nav w-full bg-white/92 backdrop-blur-sm border-b border-border px-6 md:px-16 lg:px-32 xl:px-64 transition-all duration-normal ease-in-out">
      <div className="flex items-center justify-between h-[88px]">
        <Link
          href="/"
          className="font-heading text-md font-semibold leading-none tracking-[3.6px] uppercase text-text no-underline whitespace-nowrap shrink-0"
        >
          FORMA <span className="text-accent">2026</span>
        </Link>

        <ul className="hidden md:flex items-center gap-10 list-none m-0 p-0">
          {links.map((item: Navigation) => (
            <li key={item.id}>
              <a
                href={item.url ?? "#"}
                className="font-body text-sm font-medium tracking-wider uppercase text-text-secondary no-underline hover:text-text transition-colors duration-normal ease-in-out"
              >
                {item.label}
              </a>
            </li>
          ))}
        </ul>

        <div className="hidden md:flex items-center">
          {cta && (
            <Button href={cta.url ?? "#"}>
              {cta.label}
            </Button>
          )}
        </div>

        <MobileMenu links={links} cta={cta} />
      </div>
    </nav>
  );
}
