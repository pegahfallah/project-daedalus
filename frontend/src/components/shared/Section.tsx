import type { ReactNode } from "react";

interface SectionProps {
  children: ReactNode;
  id?: string;
  as?: "section" | "footer" | "div";
  bg?: "default" | "alt" | "dark";
  className?: string;
}

const bgClasses = {
  default: "bg-bg",
  alt: "bg-bg-alt",
  dark: "bg-black",
} as const;

export default function Section({
  children,
  id,
  as: Tag = "section",
  bg = "default",
  className,
}: SectionProps) {
  return (
    <Tag
      id={id}
      className={`${bgClasses[bg]} px-6 md:px-16 lg:px-32 xl:px-64 py-24 md:py-32 ${className ?? ""}`}
    >
      {children}
    </Tag>
  );
}
