# FORMA 2026 — Developer Assessment Brief

## Overview

You've been asked to build a **single-page conference landing site** for **FORMA 2026** — a fictional architecture & built environment summit. You'll set up the content schema in Directus, populate it with provided content, and build the frontend that consumes the API.

This task is designed to take **approximately 1 day**. Don't over-engineer — we value clean, working code over perfect code.

---

## The Task

1. **Start the backend** — Follow the setup instructions in `/backend/README.md`
2. **Design a Directus schema** — Model the content shown in the Figma design as collections, fields, and relationships in Directus
3. **Populate the schema** — Use the provided content (`content/copy.md`) and images (`content/speakers/`, `content/sponsors/`, `content/hero/`)
4. **Build the frontend** — Create the page consuming the Directus REST or GraphQL API
5. **Apply the design system** — Use the provided CSS tokens (`design-tokens.css`)
6. **Add animations** — Scroll-triggered reveals, transitions, hover states

---

## Technical Requirements

| Area        | Requirement |
| ----------- | ----------- |
| **Framework** | Vue.js / Nuxt.js **or** React / Next.js |
| **Styling** | Use the provided design tokens (CSS custom properties). Additional CSS approach is your choice — Tailwind, SCSS, CSS Modules, styled-components, etc. |
| **Animation** | Library-agnostic — GSAP, anime.js, Framer Motion, CSS transitions, or any approach you prefer |
| **API** | Directus REST API or GraphQL — your choice |
| **Responsive** | The page should work on desktop and mobile |
| **AI Usage** | Allowed and encouraged — use whatever tools help you work effectively |

---

## Figma Design

**[Figma Link →](https://www.figma.com/design/Q8mCWIiKjzvmuPhCpEJHht/FORMA-2026-%E2%80%94-Design)**

The Figma file contains:
- Desktop layout — primary target
- Mobile layout
- Hover states and interactions are your choice
- any other animation is your choice

---

## Page Sections

Build all sections as shown in the Figma design:

### 1. Hero
Event title, dates, venue, tagline, hero image, and a CTA button.

### 2. About
Event description with key statistics — number of attendees, speakers, and countries represented.

### 3. Speakers
A grid of speaker cards. Each card shows headshot, name, role, and company.

### 4. Schedule
A multi-day schedule with:
- **Day tabs** to switch between days (3 days total)
- **Session list** for each day
- Each session shows: time, title, speaker(s), and room
- Some sessions are **panels with multiple speakers** — make sure your data model handles this

### 5. Sponsors
Sponsor logos grouped by tier — Gold, Silver, and Bronze. Each logo links to the sponsor's website.

### 6. Footer
A registration CTA, event details summary, and social media links.

---

## What We Provide

| Asset | Location |
| ----- | -------- |
| Docker backend (PostgreSQL + Directus) | `/backend/` |
| Figma design | Link above |
| CSS design tokens | `/frontend/design-tokens.css` |
| All text content | `/frontend/content/copy.md` |
| Speaker headshots | `/frontend/content/speakers/` |
| Sponsor logos | `/frontend/content/sponsors/` |
| Hero imagery | `/frontend/content/hero/` |
| Directus admin credentials | See `/backend/README.md` |

## What You Design

- **The entire Directus schema** — collections, fields, relationships, and how data is structured
- **How you fetch and structure the data** on the frontend
- **Frontend architecture** — component structure, state management, routing
- **Animation approach** — what animates, how, and why

The schema design is a core part of this assessment. We're interested in how you think about data modeling, not just UI implementation.

---

## Submission

1. **Export your Directus data** and commit it to the repo:
   ```bash
   # Schema snapshot (structure only)
   docker exec daedalus_directus npx directus schema snapshot /tmp/schema.yaml
   docker cp daedalus_directus:/tmp/schema.yaml ./backend/schema.yaml

   # Database dump (all content)
   docker exec daedalus_postgres pg_dump -U daedalus daedalus > ./backend/dump.sql

   # Uploaded files (images)
   docker cp daedalus_directus:/directus/uploads ./backend/uploads
   ```
2. Include a **README** in your frontend directory with:
   - How to run the project
   - Brief notes on your **schema design decisions**
   - Any tradeoffs or things you'd improve with more time
3. Push your work to your own GitHub repository
4. Share the repo link with us

---

## Time Expectation

This is designed as a **1-day task**. Focus on demonstrating your thinking process and delivering a working, well-structured result. We'd rather see a clean, considered implementation than one that tries to cover every edge case.

Good luck.
