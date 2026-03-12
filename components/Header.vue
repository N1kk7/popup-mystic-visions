<template>
  <div
    ref="headerRef"
    class="header"
    :class="activeHeaderState ? 'active_header' : ''"
  >
    <div class="header_container">
      <div class="header_content">
        <img
          :class="activeTitleState ? 'logo_active' : ''"
          src="/images/logo.png"
          alt="logo"
        />

        <div class="right_items">
          <nav class="header_nav">
            <ul :class="activeTitleState ? 'active_nav' : ''">
              <li>
                <NuxtLink to="/#framework">Framework</NuxtLink>
              </li>
              <li>
                <NuxtLink to="/#book">The Book</NuxtLink>
              </li>
              <li>
                <NuxtLink to="/#author">Author</NuxtLink>
              </li>
              <li>
                <NuxtLink to="/#reviews"> Reviews </NuxtLink>
              </li>
            </ul>
          </nav>

          <NuxtLink
            class="link_btn"
            to="
              https://shop.thepillarsofwisdom.com/checkouts/cn/hWN8UBm15mmSdZ5SDVmoFZEf/en-mx?_r=AQABVX5lbPhibVv4dceNQAZf2w0Ow0PoV4tK4Sip59bW_Co&auto_redirect=false&edge_redirect=true&skip_shop_pay=true
            "
            target="_blank"
          >
            Get the Book
          </NuxtLink>

          <button @click="burgerMenuHandler" class="mobile_burger">
            <svg
              version="1.0"
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 512.000000 512.000000"
              preserveAspectRatio="xMidYMid meet"
            >
              <g
                transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
                fill="#f0a607"
                stroke="none"
                stroke-width="2"
              >
                <path
                  d="M735 3826 c-67 -29 -105 -106 -91 -181 9 -47 59 -102 104 -115 26 -8
            593 -10 1834 -8 l1797 3 27 21 c53 39 69 71 69 134 0 63 -16 95 -69 134 l-27
            21 -1807 2 c-1487 2 -1812 0 -1837 -11z"
                />
                <path
                  d="M735 2706 c-67 -29 -105 -106 -91 -181 9 -47 59 -102 104 -115 26 -8
            593 -10 1834 -8 l1797 3 27 21 c53 39 69 71 69 134 0 63 -16 95 -69 134 l-27
            21 -1807 2 c-1487 2 -1812 0 -1837 -11z"
                />
                <path
                  d="M735 1586 c-67 -29 -105 -106 -91 -181 9 -47 59 -102 104 -115 26 -8
            593 -10 1834 -8 l1797 3 27 21 c53 39 69 71 69 134 0 63 -16 95 -69 134 l-27
            21 -1807 2 c-1487 2 -1812 0 -1837 -11z"
                />
              </g>
            </svg>
          </button>

          <nav
            class="mobile_menu"
            :class="burgerState ? 'mobile_menu_active' : ''"
          >
            <button
              @click="burgerMenuHandler"
              class="close_btn"
              aria-label="Close menu"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="22"
                height="22"
                viewBox="0 0 22 22"
                fill="none"
              >
                <path
                  d="M5.86683 17.4167L4.5835 16.1333L9.71683 11L4.5835 5.86667L5.86683 4.58333L11.0002 9.71667L16.1335 4.58333L17.4168 5.86667L12.2835 11L17.4168 16.1333L16.1335 17.4167L11.0002 12.2833L5.86683 17.4167Z"
                  fill="black"
                />
              </svg>
            </button>
            <ul>
              <li @click="burgerMenuHandler">
                <NuxtLink to="/#framework">Framework</NuxtLink>
              </li>
              <li @click="burgerMenuHandler">
                <NuxtLink to="/#book">The Book</NuxtLink>
              </li>
              <li @click="burgerMenuHandler">
                <NuxtLink to="/#author">Author</NuxtLink>
              </li>
              <li @click="burgerMenuHandler">
                <NuxtLink to="/#reviews"> Reviews </NuxtLink>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>

// https://shop.thepillarsofwisdom.com/checkouts/cn/hWN7tonVpbDOa9dDloNf0Veb/en-mx?_r=AQABpJ7nq5P6Qh6hehgo-XLUTSYHqH0Dn0u1owxTiPAR99A&auto_redirect=false&edge_redirect=true&skip_shop_pay=true
import { ref, onMounted, onUnmounted, nextTick } from "vue";

const activeHeaderState = ref(false);
const activeTitleState = ref(false);
const screenHeight = ref(0);
const headerRef = ref(null);
const burgerState = ref(false);

const route = useRoute();

const handleScroll = () => {
  if (route.path === "/return-policy" || route.path === "/privacy-policy") return;
  activeHeaderState.value = window.scrollY > 50;
  activeHeaderState.value && screenHeight.value >= window.scrollY
    ? (activeTitleState.value = true)
    : (activeTitleState.value = false);
};

const burgerMenuHandler = () => {
  burgerState.value = !burgerState.value;
  document.body.style.overflow = burgerState.value ? "hidden" : "auto";
};

const setHeaderHeight = () => {
  if (!headerRef.value) return;

  const height = headerRef.value.offsetHeight;
  document.documentElement.style.setProperty("--header-height", `${height}px`);
};

onMounted(async () => {
  screenHeight.value = window.innerHeight;

  window.addEventListener("scroll", handleScroll);

  await nextTick();
  setHeaderHeight();
  window.addEventListener("resize", setHeaderHeight);
});

onUnmounted(() => {
  window.removeEventListener("scroll", handleScroll);
  window.removeEventListener("resize", setHeaderHeight);
});
</script>

<style scoped lang="scss">
.header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: auto;
  color: black;
  background-color: white;
  transition: all ease 0.3s;
  height: 90px;
  max-height: 90px;
  font-weight: 300;
  z-index: 15;

  &_container {
    width: clamp(800px, 80vw, 1300px);
    height: 100%;
    margin: 0 auto;
    @media screen and (max-width: 1024px) {
      width: 95vw;
    }
  }

  &_content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-block: 24px;
    height: 100%;
    gap: clamp(30px, 3vw, 50px);

    img {
      max-height: 24px;
      max-width: 400px;
      width: clamp(100px, 30vw, 400px);
      transition: all ease 0.3s;
      flex: 1;

      @media screen and (max-width: 1024px) {
        flex: unset;
      }

      @media screen and (max-width: 768px) {
        flex: 1;
      }
    }

    .logo_active {
      filter: invert(1);
      mix-blend-mode: lighten;
      transition: all ease 0.3s;
    }

    .right_items {
      display: flex;
      justify-content: flex-end;
      align-items: center;
      gap: 25px;

      @media screen and (max-width: 768px) {
        gap: 15px;
      }
    }

    .header_nav ul {
      display: flex;
      flex-direction: row;
      align-items: center;
      justify-content: center;
      gap: clamp(10px, 1.3vw, 20px);
      transition: all ease 0.3s;

      li {
        font-family: "Libre Baskerville", sans-serif;
        font-size: clamp(0.7rem, 1.2vw, 0.9rem);
        color: black;
        font-weight: 600;
        text-align: center;
        line-height: 1;
        text-transform: uppercase;
        text-decoration: unset;
        white-space: nowrap;
        transition: all ease 0.3s;

        @media screen and (min-width: 1024px) {
          &:hover {
            color: #d09618;
            text-decoration: underline;
            transition: all ease 0.3s;
          }
        }
      }
    }
    .header_nav .active_nav {
      li {
        color: white;
        transition: all ease 0.3s;
      }
    }

    .header_nav {
      transform: translateY(2px);
      @media screen and (max-width: 768px) {
        display: none;
      }
    }

    .mobile_burger {
      display: none;

      svg {
        width: clamp(35px, 7.5vw, 50px);
        height: clamp(35px, 7.5vw, 50px);
      }

      @media screen and (max-width: 768px) {
        display: flex;
        justify-content: center;
        align-items: center;
      }
    }

    .link_btn {
      padding: 10px clamp(15px, 1.5vw, 30px);
      display: flex;
      justify-content: center;
      align-items: center;
      background: #f7ac0b;
      color: white;
      font-family: "Libre Baskerville", sans-serif;
      font-size: 1rem;
      font-weight: 600;
      border-radius: 30px;
      white-space: nowrap;
      transition: all ease 0.3s;

      @media screen and (min-width: 1024px) {
        &:hover {
          background: #f0a607;
          transition: all ease 0.3s;
        }
      }

      @media screen and (max-width: 768px) {
        padding: clamp(5px, 1vw, 7px) clamp(15px, 1.5vw, 30px);
      }

      @media screen and (max-width: 480px) {
        padding: clamp(5px, 1vw, 7px) 10px;

        font-size: 0.8rem;
      }
      @media screen and (max-width: 375px) {
        padding: clamp(5px, 1vw, 7px) 5px;

        font-size: 0.7rem;
      }

      &:active {
        background: #f0a607;

        transition: all ease 0.3s;
      }
    }

    @media screen and (max-width: 480px) {
      padding-block: 16px;
    }
    @media screen and (max-width: 400px) {
      gap: 25px;
    }
    @media screen and (max-width: 375px) {
      gap: 15px;

      padding-block: 12px;
    }
  }

  @media screen and (max-width: 480px) {
    max-height: 65px;
  }
  @media screen and (max-width: 375px) {
    max-height: 45px;
  }
}

.active_header {
  backdrop-filter: blur(20px);
  transition: all ease 0.3s;
  background: rgba(255, 255, 255, 0.25);
  height: 80px;

  @media screen and (max-width: 480px) {
    max-height: 60px;
  }
  @media screen and (max-width: 375px) {
    max-height: 40px;
  }
}

.mobile_menu {
  position: fixed;
  background: white;
  padding: 42px 32px 40px;
  transition: all ease 0.3s;
  top: 0;
  right: -100%;

  .close_btn {
    position: absolute;
    top: 12px;
    right: 12px;
    cursor: pointer;
  }

  ul {
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;
    gap: 24px;

    li {
      font-size: 1rem;
      color: var(--text-primary);
      font-weight: 400;
      line-height: 150%;
      font-family: "Roboto", sans-serif;
      padding: 10px;
      cursor: pointer;
    }
  }

  @media screen and (min-width: 768px) {
    display: none;
  }
}

.mobile_menu_active {
  right: 0;
  transition: all ease 0.3s;
}
</style>
