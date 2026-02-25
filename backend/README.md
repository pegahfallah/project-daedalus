# Backend — Directus + PostgreSQL

The backend runs Directus (headless CMS) backed by PostgreSQL, all containerised with Docker.

## Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop/) (v20+)
- [Docker Compose](https://docs.docker.com/compose/) (v2+, bundled with Docker Desktop)

## Setup

1. **Copy the environment file**

   ```bash
   cp .env.example .env
   ```

2. **Start the containers**

   ```bash
   docker compose up -d
   ```

   First run will pull images and initialise the database — this may take a minute.

3. **Access the Directus admin panel**

   Open [http://localhost:8055](http://localhost:8055) and log in with:

   | Field    | Value                        |
   | -------- | ---------------------------- |
   | Email    | `admin@projectdaedalus.dev`  |
   | Password | `admin123`                   |

## API Endpoints

Once Directus is running, these endpoints are available:

| Endpoint                          | Description               |
| --------------------------------- | ------------------------- |
| `GET /items/{collection}`         | List items in a collection |
| `GET /items/{collection}/:id`     | Get a single item          |
| `GET /assets/{file-id}`           | Get an uploaded file/image |
| `GET /fields/{collection}`        | Inspect collection fields  |

Full API reference: [Directus REST API Docs](https://docs.directus.io/reference/introduction.html)

### Fetching relational data

Use the `fields` parameter to retrieve nested relationships:

```
GET /items/sessions?fields=*,speakers.speakers_id.*
```

### Filtering and sorting

```
GET /items/sessions?filter[day][_eq]=1&sort=start_time
```

## Stopping & Resetting

```bash
# Stop containers (data persists)
docker compose down

# Stop and remove all data (fresh start)
docker compose down -v
```

## Troubleshooting

**Port conflict on 5432 or 8055**
If you have a local PostgreSQL or another service on these ports, change `POSTGRES_PORT` or `DIRECTUS_PORT` in your `.env` file.

**Directus won't start**
Check that PostgreSQL is healthy first:
```bash
docker compose logs postgres
```
