<template>
  <div class="cookie_modal">
    <div class="cookie_content">
      <div class="text">
        <h3>We value your privacy</h3>

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
      </div>

      <div class="buttons">
        <button @click="cookieSettingsHandler" class="secondary">Customize</button>

        <button @click="modalStore.closeModal" class="primary">Agree</button>
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
  overlayEl.style.alignItems = "flex-end";
  overlayEl.style.paddingBottom = "20px";

  // console.log(overlayEl)

  // console.log(document.getElementsByClassName('modal-overlay'))
});


const cookieSettingsHandler = () => {
    modalStore.closeModal();
modalStore.showModal('CookieSettings');
}
</script>

<style lang="scss" scoped>
// .cookie_modal {
//     width: 95vw;
//     height: auto;
//     display: flex;
//     justify-content: center;
//     align-items: center;
//     gap: 20px;
// }

// .cookie_content {
//     display: flex;
//     align-items: center;
//     justify-content: space-between;
//     padding-top: 20px;
//     position: relative;
//     width: 100%;
//     height: auto;

//     .buttons {
//         display: flex;
//         justify-content: center;
//         align-items: center;
//         gap: 15px;

//         button {
//             padding: 10px 15px;
//             background: orange;
//             border-radius: 15px;
//             color: white;
//             font-weight: 600;
//         }
//     }

//     .close_button {
//         position: absolute;
//         display: flex;
//         justify-content: center;
//         align-items: center;
//         top: 0px;
//         right: 0px;

//         aspect-ratio: 1 / 1;

//         button {
//             width: 100%;
//             height: 100%;
//             aspect-ratio: 1 / 1;
//                    border: 1px solid black;
//         border-radius: 50%;
//         display: flex;
//         justify-content: center;
//         align-items: center;
//         padding: 5px;
//         font-size: 0.75rem;
//         }
//     }
// }

.cookie_modal {
  width: 95vw;
  height: auto;
  display: flex;
  justify-content: center;

  @media screen and (max-width: 768px) {
    position: absolute;
    bottom: 15px;
  }
}

.cookie_content {
  background: white;
  border-radius: 8px;
  padding: 25px 30px;
  width: 100%;

  display: flex;
  justify-content: space-between;
  flex-direction: column;
  align-items: center;
  gap: 30px;

  position: relative;

  .text {
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;
    gap: 20px;
    // max-width: 700px;

    h3 {
      font-size: 2rem;
      font-weight: 700;
      font-family: "Libre Baskerville", sans-serif;
      font-style: normal;
      line-height: 150%;
      text-align: center;

      @media screen and (max-width: 768px) {
        font-size: 1.6rem;
        line-height: 130%;
      }

      @media screen and (max-width: 480px) {
        font-size: 1.5rem;
      }

      @media screen and (max-width: 375px) {
        font-size: 1.4rem;
      }
    }

    p {
      font-size: 1.25rem;
      font-weight: 400;
      font-family: "Josefin Sans", sans-serif;

      font-style: normal;
      line-height: 150%;

      @media screen and (max-width: 768px) {
        font-size: 1.125rem;
        line-height: 130%;
      }

      @media screen and (max-width: 480px) {
        font-size: clamp(0.8rem, 3.8vw, 1.2rem);
      }
    }
  }

  .buttons {
    width: 100%;
    height: auto;
    display: flex;
    justify-content: flex-end;
    align-items: center;
    gap: 12px;

    button {
      width: fit-content;
      padding: 10px 18px;
      border-radius: 6px;
      font-weight: 700;
      border: none;
      cursor: pointer;

      font-size: 1.25rem;
      font-weight: 400;
      font-family: "Josefin Sans", sans-serif;

      font-style: normal;
      line-height: 150%;
      transition: all ease 0.3s;

      @media screen and (max-width: 768px) {
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
  }

  @media screen and (max-width: 768px) {
    padding: 25px 20px;
  }
  @media screen and (max-width: 480px) {
    padding: 20px 15px;
    
  }
}
</style>
