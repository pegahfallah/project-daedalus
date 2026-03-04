import Divider from "./Divider";

interface SectionHeaderProps {
  label: string | null | undefined;
  heading: string | null | undefined;
  headingColor?: string;
}

export default function SectionHeader({
  label,
  heading,
  headingColor = "text-text",
}: SectionHeaderProps) {
  return (
    <>
      <span className="subheading text-accent">{label}</span>
      <h2 className={`h2-section mt-4 max-w-[800px] ${headingColor}`}>
        {heading}
      </h2>
      <Divider className="my-8" />
    </>
  );
}
