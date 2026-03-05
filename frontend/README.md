This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.


## Schema design decision/tradeoffs/next steps

I researched Directus best practices before designing the schema. The common approach I saw was M2A block builder relationships, but I went with a singleton per section instead. This is a fixed-layout single page where sections do not reorder, so M2A would add nested API queries and complexity.

My main goal was to minimise friction for whoever uses the CMS. Thats why I went with singletons where you can draft content without deleting anything.

I also split section headings from section content. `speakers_section` holds the heading and label while `speakers` holds the actual speaker records. An editor can rename the section without touching any speaker data.

The `pages` collection exists for SEO fields. It works as a detached SEO config for a single-page site, and can later become a proper routing collection if the project expanded to more pages.

On the frontend, I wanted to keep a single consistent styling pattern, so I wanted to integrate the provided design tokens with Tailwind rather than scattering var() calls throughout the codebase. I registered the colours, spacing, and scale values directly into Tailwind's theme to make them usable as native utilities. The exception was typography, eg. a heading style requires font size, line height, letter spacing, and weight together, so those had to be named CSS classes instead.

If I had more time, I'd give editors more control over things like section visibility, background variants, or button copy that are currently hardcoded in the frontend. I would basically want to have a schema where the design can be adjusted from the CMS without touching code.