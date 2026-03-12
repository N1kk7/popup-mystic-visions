<template>
  <section class="hero">
    <div class="hero_content">
      <div class="hero_overlay"></div>
      <video
        ref="videoRef"
        class="hero_video"
        playsinline
        autoplay
        muted
        loop
        preload="auto"
        poster="../public/images/video_preview.webp"
      >
        <!-- <source 
                src="../public/videos/hero-final-cropped1.mp4" 
                type="video/mp4" 
            /> -->
        <!-- src="../public/videos/video_web.mp4"  -->

        <source
          src="https://pub-0a8d6c93bd2743669515202d259de491.r2.dev/video_web.mp4"
          type="video/mp4"
        />
        Your browser does not support the video tag.
      </video>

      <div class="conntainer">
        <div class="text_content" ref="contentRef">
          <h1 class="h1_title" style="opacity: 0">
            I’m going to let you in on a little secret that most people avoid
            saying out loud.
          </h1>
          <div class="text_wrapper">
            <p class="text_start" style="opacity: 0">
              You already know it, and you’ve seen it play out: The rules don’t
              work the way you were taught.
            </p>
            <p class="text_second" style="opacity: 0">
              It's not that you failed the system, you simply noticed this
              mismatch between effort and result.
            </p>
          </div>

          <div class="link_wrapper">
            <NuxtLink
              style="opacity: 0"
              class="hero_link"
              to="
                https://shop.thepillarsofwisdom.com/checkouts/cn/hWN8UBm15mmSdZ5SDVmoFZEf/en-mx?_r=AQABVX5lbPhibVv4dceNQAZf2w0Ow0PoV4tK4Sip59bW_Co&auto_redirect=false&edge_redirect=true&skip_shop_pay=true
              "
              target="_blank"
            >
              Read The Pillars of Wisdom
            </NuxtLink>
            <div class="link_description" style="opacity: 0">
              $19.99 With Free Shipping to NA & EU
            </div>
          </div>

         
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, nextTick } from "vue";
import { gsap } from "gsap";

const contentRef = ref(null);
const videoRef = ref(null);

function startAnimation() {
  if (!contentRef.value) return;

  const contentEls = contentRef.value.querySelectorAll(
    ".h1_title, .text_start, .text_second, .hero_link, .link_description",
  );

  if (!contentEls.length) return;

  gsap.fromTo(
    contentEls,
    { opacity: 0, y: 30 },
    {
      opacity: 1,
      y: 0,
      delay: 0,
      stagger: 0.2,
      duration: 0.7,
      ease: "power3.out",
      clearProps: "all",
    },
  );
}

onMounted(async () => {
  await nextTick();
  startAnimation();
});
</script>

<style lang="scss">
.hero {
  width: 100vw;
  height: 100vh;
  position: relative;
  display: block;

  &_overlay {
    position: absolute;
    background: rgba(0, 0, 0, 0.35);
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    z-index: 1;
  }

  &_content {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
  }

  &_video {
    width: 100%;
    height: 100%;
    padding-top: var(--header-height);
    transition: all ease 0.3s;
    position: absolute;
    object-fit: cover;
    top: 0;
    left: 0;
  }

  .text_content {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: white;
    position: relative;
    padding-top: 10%;
    z-index: 1;
    width: 100%;
    height: 100%;
    gap: 40px;

    @media screen and (max-width: 480px) {
      gap: 25px;
    }
    @media screen and (max-width: 375px) {
      gap: 15px;
    }
  }

  h1 {
    font-family: "Libre Baskerville", sans-serif;
    font-size: clamp(1.5rem, 5vw, 4.5rem);
    font-weight: 700;
    text-align: center;
    line-height: 1.2;
  }

  .text_wrapper {
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;
    font-family: "Josefin Sans", sans-serif;
    font-weight: 400;
    font-size: 1.5rem;
    gap: 24px;

    @media screen and (max-width: 768px) {
      text-align: center;

      font-size: clamp(1.125rem, 2vw, 1.5rem);
    }
  }

  .link_wrapper {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 8px;
  }

  .hero_link {
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: "Libre Baskerville", sans-serif;

    background: #f7ac0b;

    font-weight: 700;
    margin-top: 20px;
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

    @media screen and (max-width: 480px) {
      padding: 12px 20px;
      font-size: 0.8rem;
    }
    @media screen and (max-width: 375px) {
      padding: 8px 10px;
      font-size: 0.7rem;
    }

    &:active {
      background: #f0a607;

      transition: all ease 0.3s;
    }
  }
}
</style>
