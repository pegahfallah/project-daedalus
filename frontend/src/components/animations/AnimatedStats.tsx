"use client";

import { useRef, useEffect } from "react";

import { gsap, ScrollTrigger } from "@/lib/gsap";

interface Stat {
  value: string | null | undefined;
  label: string | null | undefined;
}

function parseStat(raw: string) {
  const match = raw.match(/^([^0-9]*?)([0-9,]+)(.*)$/);
  if (!match) return null;

  const prefix = match[1];
  const numeric = parseInt(match[2].replace(/,/g, ""), 10);
  const suffix = match[3];
  const hasComma = match[2].includes(",");

  return { prefix, numeric, suffix, hasComma };
}

function formatNumber(n: number, hasComma: boolean) {
  const rounded = Math.round(n);
  return hasComma ? rounded.toLocaleString() : String(rounded);
}

export default function AnimatedStats({ stats }: { stats: Stat[] }) {
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const container = containerRef.current;
    if (!container) return;

    const valueEls = container.querySelectorAll<HTMLSpanElement>("[data-stat]");
    const tweens: gsap.core.Tween[] = [];
    const triggers: ScrollTrigger[] = [];

    valueEls.forEach((el) => {
      const raw = el.getAttribute("data-stat");
      if (!raw) return;

      const parsed = parseStat(raw);
      if (!parsed) return;

      const counter = { val: 0 };

      const trigger = ScrollTrigger.create({
        trigger: el,
        start: "top 80%",
        once: true,
        onEnter: () => {
          const tween = gsap.to(counter, {
            val: parsed.numeric,
            duration: 2,
            ease: "power2.out",
            onUpdate: () => {
              el.textContent = `${parsed.prefix}${formatNumber(counter.val, parsed.hasComma)}${parsed.suffix}`;
            },
          });
          tweens.push(tween);
        },
      });

      triggers.push(trigger);
    });

    return () => {
      triggers.forEach((t) => t.kill());
      tweens.forEach((t) => t.kill());
    };
  }, []);

  return (
    <div ref={containerRef} className="flex flex-col gap-8 md:gap-10 md:ml-auto">
      {stats.map((stat) => (
        <div
          key={stat.label}
          className="border-l border-border pl-6 md:pl-8"
        >
          <span
            className="stat-number text-text block"
            data-stat={stat.value ?? ""}
          >
            {stat.value}
          </span>
          <span className="subheading text-text-muted mt-2 block">
            {stat.label}
          </span>
        </div>
      ))}
    </div>
  );
}
