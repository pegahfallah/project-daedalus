"use client";

import { useRef, useEffect } from "react";

import { gsap, ScrollTrigger } from "@/lib/gsap";

export default function FadeIn({ children }: { children: React.ReactNode }) {
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el) return;

    gsap.set(el, { opacity: 0, y: 30 });

    const trigger = ScrollTrigger.create({
      trigger: el,
      start: "top 85%",
      once: true,
      onEnter: () => {
        gsap.to(el, {
          opacity: 1,
          y: 0,
          duration: 0.8,
          ease: "power2.out",
        });
      },
    });

    return () => {
      trigger.kill();
    };
  }, []);

  return <div ref={ref}>{children}</div>;
}
