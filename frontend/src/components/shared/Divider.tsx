export default function Divider({ className }: { className?: string }) {
  return <div className={`w-15 h-px bg-accent ${className ?? ""}`} />;
}
