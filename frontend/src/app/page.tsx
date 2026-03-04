import Hero from "@/components/Hero";
import About from "@/components/About";
import Speakers from "@/components/Speakers";
import Programme from "@/components/Programme";
import Partners from "@/components/Partners";
import Footer from "@/components/Footer";

export default function Home() {
  return (
    <section>
      <Hero />
      <About />
      <Speakers />
      <Programme />
      <Partners />
      <Footer />
    </section>
  );
}
