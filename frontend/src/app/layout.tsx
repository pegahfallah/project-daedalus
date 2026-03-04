import { Cormorant_Infant, Montserrat } from "next/font/google";

import Navbar from "@/components/shared/Navbar";

import type { Metadata } from "next";

import "./globals.css";

const cormorantInfant = Cormorant_Infant({
  subsets: ["latin"],
  weight: ["300", "400", "500", "600", "700"],
  style: ["normal", "italic"],
  display: "swap",
  variable: "--font-heading",
});

const montserrat = Montserrat({
  subsets: ["latin"],
  weight: ["300", "400", "500", "600", "700"],
  style: ["normal", "italic"],
  display: "swap",
  variable: "--font-body",
});

export const metadata: Metadata = {
  title: "FORMA 2026 — Architecture & Built Environment Summit",
  description:
    "FORMA 2026 is a three-day architecture and built environment conference bringing together industry leaders, innovators, and visionaries.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      className={`${cormorantInfant.variable} ${montserrat.variable}`}
    >
      <body>
        <Navbar />
        <main>{children}</main>
      </body>
    </html>
  );
}
