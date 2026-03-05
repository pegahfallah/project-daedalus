"use client";

export default function Error({
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen px-6 bg-bg text-text">
      <h2 className="h2-section mb-4">Something went wrong</h2>
      <p className="body-text text-text-secondary mb-8 text-center max-w-md">
        We couldn&apos;t load the page. This is usually temporary — please try
        again.
      </p>
      <button
        onClick={reset}
        className="btn-text bg-accent text-bg px-8 py-4 border-none cursor-pointer hover:bg-accent-hover transition-colors duration-fast"
      >
        Try again
      </button>
    </div>
  );
}
