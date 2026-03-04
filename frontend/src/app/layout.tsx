import { Cormorant_Infant, Montserrat } from "next/font/google";

import Navbar from "@/components/shared/Navbar";

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

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      className={`${cormorantInfant.variable} ${montserrat.variable} scroll-smooth`}
    >
      <body>
        <Navbar />
        <main>{children}</main>
      </body>
    </html>
  );
}
