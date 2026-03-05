import Link from "next/link";

export default function NotFound() {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen px-6 bg-bg text-text">
      <span className="logo-type text-text mb-8">
        FORMA <span className="text-accent">2026</span>
      </span>
      <h2 className="h2-section mb-4">Page not found</h2>
      <p className="body-text text-text-secondary mb-8 text-center max-w-md">
        The page you&apos;re looking for doesn&apos;t exist or has been moved.
      </p>
      <Link
        href="/"
        className="btn-text bg-accent text-bg px-8 py-4 no-underline hover:bg-accent-hover transition-colors duration-fast"
      >
        Back to Home
      </Link>
    </div>
  );
}
