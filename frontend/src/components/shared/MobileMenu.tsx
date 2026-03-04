"use client";

import { useState } from "react";
import type { Navigation } from "@/lib/types";
import Button from "./Button";

export default function MobileMenu({
  links,
  cta,
}: {
  links: Navigation[];
  cta?: Navigation;
}) {
  const [open, setOpen] = useState(false);

  return (
    <div className="md:hidden">
      <button
        onClick={() => setOpen(!open)}
        aria-label="Toggle menu"
        className="flex flex-col justify-center items-center w-8 h-8 gap-[6px] cursor-pointer bg-transparent border-none p-0"
      >
        <span
          className={`block w-6 h-[2.5px] bg-text transition-transform duration-normal ease-brand-in-out ${open ? "translate-y-[8.5px] rotate-45" : ""}`}
        />
        <span
          className={`block w-6 h-[2.5px] bg-text transition-opacity duration-normal ease-brand-in-out ${open ? "opacity-0" : ""}`}
        />
        <span
          className={`block w-6 h-[2.5px] bg-text transition-transform duration-normal ease-brand-in-out ${open ? "-translate-y-[8.5px] -rotate-45" : ""}`}
        />
      </button>

      {open && (
        <div className="absolute top-full left-0 right-0 bg-bg border-b border-border px-6 py-8 flex flex-col gap-6">
          {links.map((item) => (
            <a
              key={item.id}
              href={item.url ?? "#"}
              onClick={() => setOpen(false)}
              className="nav-link text-text-secondary no-underline hover:text-text transition-colors duration-normal ease-brand-in-out"
            >
              {item.label}
            </a>
          ))}
          {cta && (
            <Button href={cta.url ?? "#"} className="self-start">
              {cta.label}
            </Button>
          )}
        </div>
      )}
    </div>
  );
}
