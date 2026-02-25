# Project Daedalus

A technical assessment for mid-weight full-stack developer candidates. Candidates design a CMS schema, populate it with content, and build a frontend consuming the API — all in one day.

The fictional project is **FORMA 2026**, an architecture & built environment conference landing page.

## Quick Start

### 1. Clone the repo

```bash
git clone <repo-url>
cd project-daedalus
```

### 2. Start the backend

```bash
cd backend
cp .env.example .env
docker compose up -d
```

Directus admin panel will be available at [http://localhost:8055](http://localhost:8055).

### 3. Read the brief

The full assessment is in [`frontend/BRIEF.md`](frontend/BRIEF.md).

All content, images, and design tokens are in the `frontend/` directory — everything you need to get started.

## Tech Stack

| Layer     | Technology              |
| --------- | ----------------------- |
| CMS       | Directus 11             |
| Database  | PostgreSQL 15           |
| Infra     | Docker & Docker Compose |
| Frontend  | Candidate's choice (Vue/Nuxt or React/Next) |

## Repo Structure

```
project-daedalus/
├── README.md                      ← You are here
├── backend/
│   ├── docker-compose.yml         ← PostgreSQL + Directus
│   ├── .env.example               ← Environment variables
│   └── README.md                  ← Backend setup & API reference
├── frontend/
│   ├── BRIEF.md                   ← The assessment brief
│   ├── EVALUATION.md              ← Evaluation criteria (transparent)
│   ├── design-tokens.css          ← CSS custom properties
│   └── content/
│       ├── copy.md                ← All text content by section
│       ├── speakers/              ← Speaker headshot images
│       ├── sponsors/              ← Sponsor logo SVGs
│       └── hero/                  ← Hero/event imagery
└── .gitignore
```
