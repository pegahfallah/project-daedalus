import type { ButtonHTMLAttributes, AnchorHTMLAttributes } from "react";

type ButtonProps = ButtonHTMLAttributes<HTMLButtonElement> & {
  href?: undefined;
  variant?: "primary" | "outline";
};

type LinkProps = AnchorHTMLAttributes<HTMLAnchorElement> & {
  href: string;
  variant?: "primary" | "outline";
};

const base =
  "btn-text inline-flex items-center justify-center md:justify-start gap-2 px-8 py-4 no-underline border border-transparent cursor-pointer transition-colors duration-fast";

const variants = {
  primary: "bg-accent text-bg hover:bg-accent-hover",
  outline: "bg-transparent text-text border-text hover:bg-text hover:text-bg",
};

export default function Button({
  variant = "primary",
  className,
  ...props
}: ButtonProps | LinkProps) {
  const cls = [base, variants[variant], className].filter(Boolean).join(" ");

  if ("href" in props && props.href) {
    return <a className={cls} {...(props as LinkProps)} />;
  }

  return <button className={cls} {...(props as ButtonProps)} />;
}
