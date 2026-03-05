"use client";

import { useRef, useEffect } from "react";

import { gsap, ScrollTrigger } from "@/lib/gsap";

export default function HeroParallax({
  children,
}: {
  children: React.ReactNode;
}) {
  const sectionRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const section = sectionRef.current;
    if (!section) return;

    const img = section.querySelector("img");
    if (!img) return;

    gsap.set(img, { scale: 1.15 });

    const tween = gsap.to(img, {
      yPercent: 20,
      ease: "none",
      scrollTrigger: {
        trigger: section,
        start: "top top",
        end: "bottom top",
        scrub: true,
      },
    });

    return () => {
      tween.scrollTrigger?.kill();
      tween.kill();
    };
  }, []);

  return <div ref={sectionRef}>{children}</div>;
}
