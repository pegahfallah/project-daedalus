import { Suspense } from "react";

import { getPage } from "@/lib/api";

import Hero from "@/components/Hero";
import About from "@/components/About";
import Speakers from "@/components/Speakers";
import Programme from "@/components/Programme";
import Partners from "@/components/Partners";
import Footer from "@/components/Footer";

import type { Metadata } from "next";

export async function generateMetadata(): Promise<Metadata> {
  try {
    const page = await getPage();
    return {
      title: page.seo_title ?? "FORMA 2026 — Architecture & Built Environment Summit",
      description:
        page.seo_description ??
        "FORMA 2026 is a three-day architecture and built environment conference bringing together industry leaders, innovators, and visionaries.",
      openGraph: {
        title: page.seo_title ?? "FORMA 2026",
        description: page.seo_description ?? undefined,
      },
    };
  } catch {
    return {
      title: "FORMA 2026 — Architecture & Built Environment Summit",
      description:
        "FORMA 2026 is a three-day architecture and built environment conference bringing together industry leaders, innovators, and visionaries.",
    };
  }
}

export default function Home() {
  return (
    <>
      <Suspense>
        <Hero />
      </Suspense>
      <Suspense>
        <About />
      </Suspense>
      <Suspense>
        <Speakers />
      </Suspense>
      <Suspense>
        <Programme />
      </Suspense>
      <Suspense>
        <Partners />
      </Suspense>
      <Suspense>
        <Footer />
      </Suspense>
    </>
  );
}
