<template>
  <section class="reviews" id="reviews">
    <div class="conntainer">
      <div class="reviews_content" ref="reviewsRef">
        <ClientOnly>
          <Swiper
            @swiper="onSwiper"
            :modules="modules"
            navigation
            pagination
            mousewheel
            keyboard
            :autoplay="{
              delay: 12000,
              disableOnInteraction: false,
              pauseOnMouseEnter: false,
            }"
            :breakpoints="breakpoints"
            @pointerenter="handleHover"
            @pointerleave="handleSLiderBlur"
            loop
            class="mySwiper"
          >
            <SwiperSlide v-for="slide in reviewData" :key="slide.id">
              <div class="reviews_content_item">
                <div class="card_top">
                  <div class="reviews_content_item_avatar_wrapper">
                    <img
                      class="reviews_content_item_avatar"
                      :src="slide.avatar"
                      :alt="slide.name"
                      width="50"
                      height="50"
                    />
                  </div>
                  <p v-html="slide.html"></p>
                </div>
                <div class="card_bottom">
                  <strong>{{ slide.name }}</strong>
                  <div class="card_position">
                    {{ slide.position }}
                  </div>
                </div>
              </div>
            </SwiperSlide>
          </Swiper>
        </ClientOnly>
      </div>
    </div>
  </section>
</template>

<script setup>
import { Swiper, SwiperSlide } from "swiper/vue";
import { Navigation, Pagination, Autoplay } from "swiper/modules";
import { ref, onMounted, nextTick, onUnmounted } from "vue";
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";

const modules = [Navigation, Pagination, Autoplay];

const breakpoints = {
  300: { slidesPerView: 1, spaceBetween: 10 },
  768: { slidesPerView: 2, spaceBetween: 20 },
  1024: { slidesPerView: 3, spaceBetween: 30 },
};

gsap.registerPlugin(ScrollTrigger);

const reviewData = ref([
  {
    id: 1,
    avatar: "/images/rach.webp",
    html: `"<strong>You should buy it.</strong> GLO’s prose is lively and engaging, his practical advice useful and actionable, 
          and his broader narrative sophisticated and compelling. This isn’t the tepid grainy Denny’s coffee you 
          usually get with Manosphere books. Also the cover art is genuinely quite beautiful and fun to look at, 
          which says a lot coming from me because I often find it difficult to appreciate visual art."`,
    name: "Rach",
    position: "Graphical Designer — UK",
  },

  {
    id: 2,
    avatar: "/images/alain.webp",
    html: `"<strong>If I could travel back in time to my early 20s, the book I’d give my younger 
            self is The Pillars of Wisdom by The Great GLO.</strong>  I’d recommend it to anyone feeling 
            adrift and plotting their next move. GLO avoids lingering in abstraction, pivoting 
            quickly to strategies for exploiting systemic flaws and prioritizing surplus energy 
            and time. Had I encountered this book younger, I’d have sidestepped suboptimal 
            choices and spared myself hard-learned lessons."`,
    name: "Alan B.",
    position: "Financial Consultant — Spain",
  },
  {
    id: 3,
    avatar: "/images/robert.webp",
    html: `"There’s usually a guy you meet after you’re out of your parents’ home who is able to put some of the finishing touches on you 
            by imparting knowledge that can’t really come from your father. Instead of the official and nominal knowledge he will bestow 
            you with some of the more esoteric and pragmatic tips that make life significantly better. If you’re Justin Bieber, it’s P. 
            Diddy. But if you’re Luke Skywalker, it’s Obi-Wan. <strong>And if you’re one of the endless number of contemporary young men noticing 
            that the world is outwardly hostile to you in both easy- and hard-to-understand ways, GLO is your guy.</strong>"`,
    name: "Robert S.",
    position: "Executive Sales Manager — USA",
  },
  {
    id: 4,
    avatar: "/images/walt.webp",
    html: `"<strong>At the end of the day GLO is encouraging guys to be agentic and opportunistic and 
            forward-thinking—to think of themselves as capable predators instead of as victims.</strong> 
            The practical strategies he offers are effective and attractively presented to the 
            sort of feller who’d benefit from buying the book. Meanwhile a lot of the ideas 
            in Pillars are genuinely compelling, and represent an actual step forward in a 
            discourse space where “innovation” usually resembles trying to fix a clogged toilet 
            by sloshing around in the stagnant miasma. Unlike the other guys GLO actually has a plunger."`,
    name: "Walt B.",
    position: "Writer — USA",
  },

  {
    id: 5,
    avatar: "/images/anthony.jpg",
    html: `"<strong>For years now I’ve basically maintained that anyone who DOESN’T aggressively leverage asymmetric strategies 
            in 21st century America is just sort of stupid</strong>, and that anyone who helps young men do so effectively is a lovely winner."`,
    name: "Anthony R.",
    position: "Programmer — Argentina",
  },

  {
    id: 6,
    avatar: "/images/liam_s.webp",
    html: `"<strong>Before this, I had no clear structure.</strong> I knew I
              wanted to lower costs, work remotely, and change my living
              situation, but I didn't know how to organize those goals."`,
    name: "Liam S.",
    position: "Remote Software Engineer — United States",
  },
  {
    id: 7,
    avatar: "/images/sean_m.webp",
    html: `"What stood out most was how my thinking changed.
              <strong>The ideas weren't abstract.</strong> They helped me see my
              situation more clearly and make better decisions."`,
    name: "Sean M.",
    position: "Independent Consultant — United States",
  },
  {
    id: 8,
    avatar: "/images/alexander_k.webp",
    html: `"I didn't need more motivation.
              <strong>I needed to place my effort correctly.</strong> Once I
              understood that, my decisions became simpler and my actions more
              deliberate."`,
    name: "Alexander K.",
    position: "Product & Operations Manager — Germany",
  },
]);

const reviewsRef = ref(null);
const isDesktop = ref(false);
const swiperInstance = ref(null);

const onSwiper = (swiper) => {
  swiperInstance.value = swiper;
  swiper.autoplay.stop();

  if (isDesktop.value) {
    swiper.autoplay.start();
  }
};

const handleHover = () => {
  if (!isDesktop.value) return;
  swiperInstance.value?.autoplay.stop();
};

const handleSLiderBlur = () => {
  if (!isDesktop.value) return;
  swiperInstance.value?.autoplay.start();
};

onMounted(async () => {
  await nextTick();

  const checkDesktop = () => {
    const desktopValue = window.innerWidth >= 1024;

    if (desktopValue === isDesktop.value) return;
    isDesktop.value = desktopValue;

    if (!swiperInstance.value) return;

    if (desktopValue) {
      swiperInstance.value.autoplay.start();
    } else {
      swiperInstance.value.autoplay.stop();
    }
  };

  checkDesktop();
  window.addEventListener("resize", checkDesktop);

  gsap.set(reviewsRef.value, {
    opacity: 0,
    y: 40,
    scale: 0.95,
    willChange: "transform, opacity",
  });

  ScrollTrigger.refresh();

  gsap.to(reviewsRef.value, {
    opacity: 1,
    y: 0,
    scale: 1,
    duration: 0.8,
    ease: "power3.out",
    scrollTrigger: {
      trigger: reviewsRef.value,
      start: "top 70%",
      toggleActions: "play none none none",
      once: true,
    },
  });
});

onUnmounted(() => {
  window.removeEventListener("resize", () => {
    isDesktop.value = window.innerWidth >= 1024;
  });
});
</script>

<style lang="scss">
.reviews {
  width: 100%;
  height: auto;
  position: relative;
  padding-block: 128px;

  &_content {
    gap: 48px;

    .mySwiper {
      --swiper-navigation-color: #fff;
      --swiper-pagination-bullet-inactive-color: rgba(255, 255, 255, 0.8);
      --swiper-pagination-color: #7033ff;
      padding-bottom: 70px;
      margin-bottom: 0;

      .swiper-button-next,
      .swiper-button-prev {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: rgba(0, 0, 0, 0.7);
        opacity: 0;
        pointer-events: none;
        transition:
          opacity 0.25s ease,
          transform 0.25s ease;

        svg {
          width: 15px;
          height: 15px;
        }
      }

      .swiper-pagination-bullet {
        background: #7033ff;
        width: 13px;
        height: 13px;
      }

      .swiper-pagination-bullet-active {
        width: 40px;
        border-radius: 10px;
      }

      @media screen and (min-width: 1024px) {
        &:hover {
          .swiper-button-next,
          .swiper-button-prev {
            opacity: 1;
            pointer-events: auto;
            transform: translateY(-50%) scale(0.95);
          }
        }
      }
    }

    .swiper-slide {
      width: 100%;
      height: auto;
      position: relative;
    }

    &_item {
      box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);

      display: flex;
      flex-direction: column;
      justify-content: space-between;
      align-items: center;
      border: 1px solid #d4d4db;
      height: 100%;
      border-radius: 22px;
      padding: 32px;
      gap: 24px;

      &_avatar_wrapper {
        width: 96px;
        height: 96px;
        border-radius: 50%;
        border: 4px solid #7033ff;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
        position: relative;

        img {
          width: 100%;
          height: 100%;
          object-fit: cover;
        }
      }

      @media screen and (max-width: 768px) {
        box-sizing: border-box;
        width: 100%;
      }
    }

    @media screen and (max-width: 1024px) {
      gap: clamp(10px, 3vw, 48px);
    }

    @media screen and (max-width: 768px) {
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      align-items: center;
      gap: 24px;
    }
  }

  .card_top {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    gap: 24px;

    p {
      font-family: "Josefin Sans", sans-serif;
      font-size: 1.125rem;
      line-height: 150%;
      font-weight: 400;
      font-style: normal;
    }
  }

  .card_bottom {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 5px;

    .card_author {
      font-family: "Josefin Sans", sans-serif;
      font-size: 1.125rem;
      line-height: 150%;
      font-weight: 500;
      font-style: normal;
    }

    .card_position {
      font-family: "Josefin Sans", sans-serif;
      font-size: 0.9rem;
      line-height: 150%;
      font-weight: 400;
      font-style: normal;
      text-align: center;
    }
  }
  .card_position {
    font-size: 0.85rem;
    font-weight: 400;
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
