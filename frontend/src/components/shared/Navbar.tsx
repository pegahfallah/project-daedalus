import { getNavigation } from "@/lib/api";
import type { Navigation } from "@/lib/types";
import Button from "./Button";
import MobileMenu from "./MobileMenu";
import Link from "next/link";

export default async function Navbar() {
  let items;
  try {
    items = await getNavigation();
  } catch {
    return null;
  }

  const links = items.filter((item: Navigation) => !item.is_cta);
  const cta = items.find((item: Navigation) => item.is_cta);

  return (
    <nav className="z-nav fixed top-0 left-0 right-0 w-full bg-bg/92 border-b border-border px-5 md:px-16 lg:px-32 xl:px-64 transition-all duration-normal ease-brand-in-out">
      <div className="flex items-center justify-between h-[52px] md:h-[88px]">
        <Link
          href="/"
          className="logo-type text-text no-underline whitespace-nowrap shrink-0"
        >
          FORMA <span className="text-accent">2026</span>
        </Link>

        <ul className="hidden md:flex items-center gap-10 list-none m-0 p-0">
          {links.map((item: Navigation) => (
            <li key={item.id}>
              <a
                href={item.url ?? "#"}
                className="nav-link text-text-secondary no-underline hover:text-text transition-colors duration-normal ease-brand-in-out"
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
