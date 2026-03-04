"use client";

import { useCallback, useEffect, useRef, useState } from "react";

import Button from "./Button";

import type { Navigation } from "@/lib/types";

export default function MobileMenu({
  links,
  cta,
}: {
  links: Navigation[];
  cta?: Navigation;
}) {
  const [open, setOpen] = useState(false);
  const menuRef = useRef<HTMLDivElement>(null);
  const toggleRef = useRef<HTMLButtonElement>(null);

  const close = useCallback(() => {
    setOpen(false);
    toggleRef.current?.focus();
  }, []);

  // Close on Escape
  useEffect(() => {
    if (!open) return;

    function handleKeyDown(e: KeyboardEvent) {
      if (e.key === "Escape") {
        close();
      }
    }

    document.addEventListener("keydown", handleKeyDown);
    return () => document.removeEventListener("keydown", handleKeyDown);
  }, [open, close]);

  // Trap focus within menu when open
  useEffect(() => {
    if (!open || !menuRef.current) return;

    const menu = menuRef.current;
    const focusable = menu.querySelectorAll<HTMLElement>(
      'a[href], button, [tabindex]:not([tabindex="-1"])',
    );
    if (focusable.length === 0) return;

    const first = focusable[0];
    const last = focusable[focusable.length - 1];
    first.focus();

    function handleTab(e: KeyboardEvent) {
      if (e.key !== "Tab") return;

      if (e.shiftKey && document.activeElement === first) {
        e.preventDefault();
        last.focus();
      } else if (!e.shiftKey && document.activeElement === last) {
        e.preventDefault();
        first.focus();
      }
    }

    document.addEventListener("keydown", handleTab);
    return () => document.removeEventListener("keydown", handleTab);
  }, [open]);

  return (
    <div className="md:hidden">
      <button
        ref={toggleRef}
        onClick={() => setOpen(!open)}
        aria-label={open ? "Close menu" : "Open menu"}
        aria-expanded={open}
        className="flex flex-col justify-center items-center w-8 h-8 gap-[6px] cursor-pointer bg-transparent border-none p-0"
      >
        <span
          aria-hidden="true"
          className={`block w-6 h-[2.5px] bg-text transition-transform duration-normal ease-brand-in-out ${open ? "translate-y-[8.5px] rotate-45" : ""}`}
        />
        <span
          aria-hidden="true"
          className={`block w-6 h-[2.5px] bg-text transition-opacity duration-normal ease-brand-in-out ${open ? "opacity-0" : ""}`}
        />
        <span
          aria-hidden="true"
          className={`block w-6 h-[2.5px] bg-text transition-transform duration-normal ease-brand-in-out ${open ? "-translate-y-[8.5px] -rotate-45" : ""}`}
        />
      </button>

      {open && (
        <nav
          ref={menuRef}
          aria-label="Mobile navigation"
          className="absolute top-full left-0 right-0 bg-bg border-b border-border px-6 py-8 flex flex-col gap-6"
        >
          {links.map((item) => (
            <a
              key={item.id}
              href={item.url ?? "#"}
              onClick={close}
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
        </nav>
      )}
    </div>
  );
}
