"use client";

import { useRef, useEffect } from "react";

import { gsap } from "@/lib/gsap";

export default function HeroTextReveal({
  children,
  className,
}: {
  children: React.ReactNode;
  className?: string;
}) {
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el) return;

    const items = el.children;

    gsap.set(items, { opacity: 0, y: 40 });

    gsap.to(items, {
      opacity: 1,
      y: 0,
      duration: 0.9,
      ease: "power3.out",
      stagger: 0.15,
      delay: 0.3,
    });
  }, []);

  return <div ref={ref} className={className}>{children}</div>;
}
