import type { components } from "../../types.d";

export type DirectusFile = components["schemas"]["Files"];
export type Hero = components["schemas"]["ItemsHero"];
export type About = components["schemas"]["ItemsAbout"];
export type Navigation = components["schemas"]["ItemsNavigation"];
export type SpeakersSection = components["schemas"]["ItemsSpeakersSection"];
export type Speaker = components["schemas"]["ItemsSpeakers"];
export type Session = components["schemas"]["ItemsSessions"];
export type SessionSpeaker = components["schemas"]["ItemsSessionsSpeakers"];
export type ScheduleDay = components["schemas"]["ItemsScheduleDays"];
export type ProgrammeSection = components["schemas"]["ItemsProgrammeSection"];
export type PartnersSection = components["schemas"]["ItemsPartnersSection"];
export type Partner = components["schemas"]["ItemsPartners"];
export type Footer = components["schemas"]["ItemsFooter"] & {
  cta_text_mobile?: string | null;
};
export type Page = components["schemas"]["ItemsPages"];
