<template>
  <section ref="section" class="parallax" id="author">
    <div ref="bg" class="parallax__bg">
      <div class="parallax_overlay"></div>
    </div>
    <div class="parallax_text">
      <strong class="strong_top" ref="text1"> I'm GLO. </strong>

      <p ref="text2">
        My book, The Pillars of Wisdom, is the culmination of over a decade of
        one-on one-coaching over hundreds of men.
      </p>

      <p ref="text3">
        My clients include Wallstreet bankers, Military officers,
        multi-millionaire CEOs, and the founder of an aerospace company. It is
        the distillation of the most potent economic and psychoanalytic theory,
        written in an easy to understand BroSpeak, for easy application.
      </p>

      <strong class="strong_bottom" ref="text4">
        My book revolutionized the lives of thousands of men and it can help
        revolutionize yours.
      </strong>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, onUnmounted, nextTick } from "vue";
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

const section = ref(null);
const bg = ref(null);
const text1 = ref(null);
const text2 = ref(null);
const text3 = ref(null);
const text4 = ref(null);

let ticking = false;

const handleScroll = () => {
  if (!section.value || !bg.value || ticking) return;

  ticking = true;

  requestAnimationFrame(() => {
    const rect = section.value.getBoundingClientRect();
    const vh = window.innerHeight;

    const progress = Math.min(
      1,
      Math.max(0, (vh - rect.top) / (vh + rect.height)),
    );

    const maxTranslate = bg.value.offsetHeight - section.value.offsetHeight;

    bg.value.style.transform = `translateY(${-maxTranslate * progress}px)`;

    ticking = false;
  });
};

onMounted(async () => {
  handleScroll();
  window.addEventListener("scroll", handleScroll, { passive: true });

  await nextTick();

  const texts = [text1.value, text2.value, text3.value, text4.value];

  gsap.set(texts, {
    opacity: 0,
    y: 40,
  });

  gsap.to(texts, {
    opacity: 1,
    y: 0,
    duration: 0.8,
    ease: "power3.out",
    stagger: 0.4,
    scrollTrigger: {
      trigger: section.value,
      start: "top 40%",
      toggleActions: "play none none none",
    },
  });
});

onUnmounted(() => {
  window.removeEventListener("scroll", handleScroll);
});
</script>

<style lang="scss">
.parallax {
  width: 100%;
  height: auto;
  position: relative;
  color: white;
  padding: 400px 0 70px;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;

  &_overlay {
    width: 100%;
    height: 100%;
    position: absolute;
    background: rgba(0, 0, 0, 0.45);
    top: 0;
    left: 0;
    z-index: 1;
  }

  &__bg {
    position: absolute;
    left: 0;
    top: 10%;
    width: 100%;
    height: 140%;
    transform: translateY(-50%);
    background-image: url("@/public/images/parallax_bg.webp");
    background-size: cover;
    background-position: center;
    will-change: transform;
    background-repeat: no-repeat;
  }

  &_text {
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;
    font-size: clamp(0.9rem, 2.3vw, 1.3rem);

    font-family: "Josefin Sans", sans-serif;
    font-weight: 400;
    line-height: 130%;
    max-width: 90%;
    gap: 20px;
    z-index: 1;
    will-change: transform;
    background: rgba(0, 0, 0, 0.7);
    border: 1px solid rgba(255, 255, 255, 0.3);
    backdrop-filter: blur(10px);
    text-align: start;
    border-radius: 40px;
    padding: 5%;

    .strong_top {
      padding-bottom: 20px;
      font-size: clamp(0.95rem, 2.5vw, 1.6rem);
      font-family: "Libre Baskerville", sans-serif;
      font-weight: 700;
      line-height: 130%;
      margin: 0 auto;
      @media screen and (max-width: 768px) {
        padding-bottom: 10px;
      }
    }

    .strong_bottom {
      font-size: clamp(0.75rem, 2.1vw, 1.3rem);
      // text-align: center;
      font-family: "Libre Baskerville", sans-serif;
      font-weight: 700;
      line-height: 130%;
      margin: 10px auto 0;
    }

    // @media screen and (max-width: 1024px) {
    //   max-width: 90%;
    // }

    @media screen and (max-width: 768px) {
      line-height: 120%;
    }

    @media screen and (max-width: 480px) {
      max-width: 95%;
      line-height: 110%;
      padding: 5% 4%;
    }
    @media screen and (max-width: 375px) {
      // font-size: 1.25rem;
    }
  }
}
</style>
