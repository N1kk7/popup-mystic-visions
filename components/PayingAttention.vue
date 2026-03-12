<template>
  <section class="secondary" ref="sectionRef">
    <div class="conntainer">
      <div class="secondary_content">
        <NuxtImg
          class="secondary_avatar"
          src="/images/secondary_avatar.webp"
          alt="avatar"
          height="185"
          width="185"
          priority
        />

        <p class="secondary_text">
          You're already paying attention to the shifts in the world around you.
          The Pillars of Wisdom is where you look closer and start seeing a
          clearer shape.
        </p>

        <NuxtLink
          to="https://shop.thepillarsofwisdom.com/checkouts/cn/hWN8UBm15mmSdZ5SDVmoFZEf/en-mx?_r=AQABVX5lbPhibVv4dceNQAZf2w0Ow0PoV4tK4Sip59bW_Co&auto_redirect=false&edge_redirect=true&skip_shop_pay=true"
          target="_blank"
          class="secondary_link"
        >
          Grab your copy
        </NuxtLink>
      </div>
    </div>
  </section>
</template>

<script setup>
import { onMounted, nextTick, ref } from "vue";
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

const sectionRef = ref(null);

onMounted(async () => {
  await nextTick();

  const section = sectionRef.value;
  if (!section) return;

  const avatar = section.querySelector(".secondary_avatar");
  const text = section.querySelector(".secondary_text");
  const link = section.querySelector(".secondary_link");

  const tl = gsap.timeline({
    scrollTrigger: {
      trigger: section,
      start: "top 60%",
      toggleActions: "play none none none",
    },
  });

  tl.from(avatar, {
    opacity: 0,
    y: -60,
    scale: 0.85,
    duration: 0.9,
    ease: "power3.out",
  })
    .from(
      text,
      {
        opacity: 0,
        y: 40,
        duration: 0.8,
        ease: "power3.out",
      },
      "-=0.4",
    )
    .from(
      link,
      {
        opacity: 0,
        y: 30,
        scale: 0.95,
        duration: 0.8,
        ease: "power3.out",
      },
      "-=0.3",
    );
});
</script>

<style lang="scss">
.secondary {
  width: 100%;
  height: auto;
  position: relative;
  background: #edf0f4;
  padding-block: 128px;

  &_content {
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    max-width: 768px;
    margin: 0 auto;
    gap: 48px;
  }

  &_avatar {
    width: 185px;
    height: 185px;
    border-radius: 50%;
    border: 4px solid #7033ff;
    aspect-ratio: 1 / 1;
    object-fit: cover;
  }

  &_text {
    text-align: center;
    font-family: "Josefin Sans", sans-serif;
    font-size: 1.875rem;
    font-weight: 300;
    line-height: 2.25rem;

    @media screen and (max-width: 480px) {
      font-size: 1.5rem;
    }
  }

  &_link {
    margin-top: 24px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: "Libre Baskerville", sans-serif;

    font-weight: 700;
    background: #f7ac0b;
    border-radius: 20px;
    color: white;
    font-size: 1rem;
    padding: 16px 32px;

    @media screen and (min-width: 1024px) {
      &:hover {
        background: #f0a607;
        transition: all ease 0.3s;
      }
    }

    &:active {
      background: #f0a607;
      transition: all ease 0.3s;
    }
  }

  @media screen and (max-width: 1024px) {
    padding-block: 100px;
  }

  @media screen and (max-width: 768px) {
    padding-block: 80px;
  }

  @media screen and (max-width: 425px) {
    padding-block: 70px;
  }

  @media screen and (max-width: 375px) {
    padding-block: 60px;
  }
}
</style>
