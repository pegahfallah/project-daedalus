import { directusFetch } from "./directus";
import type {
  Hero,
  About,
  Navigation,
  SpeakersSection,
  Speaker,
  ProgrammeSection,
  ScheduleDay,
  PartnersSection,
  Partner,
  Footer,
  Page,
} from "./types";

export function getHero() {
  return directusFetch<Hero>("/items/hero");
}

export function getAbout() {
  return directusFetch<About>("/items/about");
}

export function getNavigation() {
  return directusFetch<Navigation[]>("/items/navigation?sort=sort");
}

export function getSpeakersSection() {
  return directusFetch<SpeakersSection>("/items/speakers_section");
}

export function getSpeakers() {
  return directusFetch<Speaker[]>(
    "/items/speakers?fields=*,headshot.*&sort=sort&filter[status][_eq]=published"
  );
}

export function getProgrammeSection() {
  return directusFetch<ProgrammeSection>("/items/programme_section");
}

export function getScheduleDays() {
  return directusFetch<ScheduleDay[]>(
    "/items/schedule_days?fields=*,sessions.*,sessions.speakers.speakers_id.*&sort=sort&deep[sessions][_sort]=start_time"
  );
}

export function getPartnersSection() {
  return directusFetch<PartnersSection>("/items/partners_section");
}

export function getPartners() {
  return directusFetch<Partner[]>(
    "/items/partners?fields=*,logo.*&sort=sort&filter[status][_eq]=published"
  );
}

export function getFooter() {
  return directusFetch<Footer>("/items/footer");
}

export function getPage() {
  return directusFetch<Page>("/items/pages");
}
