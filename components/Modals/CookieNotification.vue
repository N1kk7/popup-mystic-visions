<template>
  <div class="cookie_modal_overlay">
    <div class="cookie_modal">
      <div class="cookie_content">
        <h3>We use cookies to improve your experience on our website.</h3>

        <!-- <div class="text">
        <h3>We use cookies to improve your experience on our website.</h3>

        <p>
          We use cookies and other technologies to store and access personal
          data on your device (such as IP addresses and unique identifiers) to
          keep the site reliable and secure, tailor your experience, measure
          site performance and present relevant offers and advertisements, as
          described in our privacy policy and cookie policy.
        </p>

        <p>
          Some of our partners process personal data on the basis of legitimate
          interest. You can object to such processing at any time.
        </p>
      </div> -->

        <div class="buttons">
          <button @click="cookieSettingsHandler" class="secondary">
            Manage Preferences
          </button>

          <button @click="modalStore.closeModal" class="primary">Accept All</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted } from "vue";

const modalStore = useModalStore();

onMounted(() => {
  const overlayEl = document.getElementsByClassName("modal-overlay")[0];
  // overlayEl.style('align-items: flex-end')
  overlayEl.style.width = "fit-content";
  overlayEl.style.height = "auto";
  overlayEl.style.top = "unset";
  overlayEl.style.left = "unset";
  overlayEl.style.bottom = "0";
  overlayEl.style.right = "0";


  // console.log(overlayEl)

  // console.log(document.getElementsByClassName('modal-overlay'))
});

const cookieSettingsHandler = () => {
  modalStore.closeModal();
  modalStore.showModal("CookieSettings", {}, true);
};
</script>

<style lang="scss" scoped>

.cookie_modal_overlay {
  width: 100%;
  height: 100%;
  position: relative;
  display: flex;
  justify-content: flex-end;
  align-items: flex-end;
}


.cookie_modal {
  width: fit-content;
  height: auto;
  display: flex;
  justify-content: flex-end;
  padding: 0 1.5vw 1.5vw 0;


  @media screen and (max-width: 768px) {
    padding: 0 2vw 2vw;
    position: absolute;
    bottom: 15px;
  }
}

.cookie_content {
  background: white;
  border-radius: 8px;
  padding: 15px 20px;
  max-width: 80%;
  width: 100%;

  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 30px;
border: 1px solid rgba(55, 28, 71, 0.2);
  position: relative;

     h3 {
      font-size: clamp(0.75rem, 3.8vw, 1rem);
      font-weight: 700;
      font-family: "Libre Baskerville", sans-serif;
      font-style: normal;
      line-height: 150%;
      text-align: center;

      @media screen and (max-width: 768px) {
        // font-size: 1.6rem;
        line-height: 130%;
      }

      // @media screen and (max-width: 480px) {
      //   font-size: 1.5rem;
      // }

      // @media screen and (max-width: 375px) {
      //   font-size: 1.4rem;
      // }
    }

  // .text {
  //   display: flex;
  //   flex-direction: column;
  //   justify-content: flex-start;
  //   align-items: flex-start;
  //   gap: 20px;
  //   // max-width: 700px;

  //   h3 {
  //     font-size: 2rem;
  //     font-weight: 700;
  //     font-family: "Libre Baskerville", sans-serif;
  //     font-style: normal;
  //     line-height: 150%;
  //     text-align: center;

  //     @media screen and (max-width: 768px) {
  //       font-size: 1.6rem;
  //       line-height: 130%;
  //     }

  //     @media screen and (max-width: 480px) {
  //       font-size: 1.5rem;
  //     }

  //     @media screen and (max-width: 375px) {
  //       font-size: 1.4rem;
  //     }
  //   }

  //   p {
  //     font-size: 1.25rem;
  //     font-weight: 400;
  //     font-family: "Josefin Sans", sans-serif;

  //     font-style: normal;
  //     line-height: 150%;

  //     @media screen and (max-width: 768px) {
  //       font-size: 1.125rem;
  //       line-height: 130%;
  //     }

  //     @media screen and (max-width: 480px) {
  //       font-size: clamp(0.8rem, 3.8vw, 1.2rem);
  //     }
  //   }
  // }

  .buttons {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    gap: 12px;

    button {
      width: fit-content;
      padding: 10px 18px;
      border-radius: 6px;
      font-weight: 700;
      white-space: nowrap;
      border: none;
      cursor: pointer;

      font-size: 1rem;
      font-weight: 400;
      font-family: "Josefin Sans", sans-serif;

      font-style: normal;
      line-height: 150%;
      transition: all ease 0.3s;

      @media screen and (max-width: 768px) {
        // flex: 1;
        width: 100%;
        font-size: 1.125rem;
        line-height: 130%;
      }

      @media screen and (max-width: 480px) {
        font-size: clamp(0.8rem, 3.8vw, 1.2rem);
        padding: 8px 12px;
      }
    }

    .primary {
      background: #f7ac0b;
      color: white;
      @media screen and (min-width: 1024px) {
        &:hover {
          background: #f0a607;

          transition: all ease 0.3s;
        }
      }
    }

    .secondary {
      color: #333;
      background: #edf0f4;

      @media screen and (min-width: 1024px) {
        &:hover {
          background: #e6e9ed;

          //   color: white;

          transition: all ease 0.3s;
        }
      }
    }

    @media screen and (max-width: 768px) {
      width: 100%;
      height: auto;

    }
  }

  @media screen and (max-width: 1024px) {
    max-width: 90%;
  }

  @media screen and (max-width: 768px) {
    flex-direction: column;
    padding: 25px 20px;
    max-width: 100%;
    gap: 15px;

  }
  @media screen and (max-width: 480px) {
    padding: 20px 15px;
  }
}
</style>
