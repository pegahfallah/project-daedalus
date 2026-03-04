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
  "inline-flex items-center justify-center gap-2 px-8 py-3 font-body text-sm font-semibold tracking-wide uppercase no-underline border border-transparent cursor-pointer transition-colors duration-150";

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
