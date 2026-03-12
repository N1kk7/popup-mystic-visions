<template>

    <div class="modal">
    <div class="modal_wrapper">
      <SharedModalHead @cancelBtnMethod="clearAllData">
        {{ steps[currentStep].titleName }}
      </SharedModalHead>
      <div class="booking_content">


        <component
          :is="steps[currentStep].component"
          v-model="steps[currentStep].value"
          v-model:valid="steps[currentStep].valid"
          :booking-data="bookingData"
        />
      </div>
      <div class="booking_btn" v-if="currentStep < 3">
        <DefaultBtn @click="prevStep" v-if="currentStep > 0"> Prev </DefaultBtn>
        <DefaultBtn @click="blankHandler" v-if="currentStep === 0"> Get full price book </DefaultBtn>
        <DefaultBtn
          class="step_disabled"
          style="pointer-events: none; opacity: 0.5"
          v-if="steps[currentStep].valid === false"
        >
          {{ steps[currentStep].nameBtn }}
        </DefaultBtn>
        <DefaultBtn
          class="step_active"
          v-else
          @click="nextStep(steps[currentStep].method)"
        >
          {{ steps[currentStep].nameBtn }}
        </DefaultBtn>
      </div>
     
    </div>
  </div>

</template>




<script setup lang="ts">
import DefaultBtn from "../shared/DefaultBtn.vue";
import { ref, computed, watch, reactive, markRaw } from "vue";

const modalStore = useModalStore();
const currentStep = ref(0);
const reservationId = ref("");
const bookOrdered = ref(false);


const steps = reactive([
  {
    id: 0,
    component: markRaw(resolveComponent("BookDiscountSkoolOffer") as Component),
    titleName: "Discount",
    method: "next-step",
    nameBtn: "Next",
    value: null,
    valid: true,
  },
  {
    id: 1,
    component: markRaw(resolveComponent("BookDiscountSkoolSubscribe") as Component),
    titleName: "Skool subscription",
    method: "reserve-book",
    nameBtn: "Subscribe to skool",
    value: null,
    valid: false,
  },
  {
    id: 2,
    component: markRaw(resolveComponent("BookDiscountSummary") as Component),
    titleName: "Summary",
    method: "next-step",
    nameBtn: "Next",
    value: null,
    valid: false,
  },
  
]);

const clearAllData = () => {
  currentStep.value = 0;
  // reservationId.value = "";
  bookOrdered.value = false;

  steps[0].value = null;
  steps[1].value = null;
  steps[2].value = null;


  modalStore.closeModal();
};


const bookingData = computed(() => ({
  date: steps[0].value,
  time: steps[1].value,
  contact: steps[2].value,
  bookOrdered: bookOrdered.value,
}));

const blankHandler = () => {
   window.open(
    "https://shop.thepillarsofwisdom.com/cart/49305684803752:1",
    "_blank"
  );
}



const reserveBook = async () => {


    const { email, variantId, userName } = steps[1].value;

    try{

        const sendData = await $fetch("/api/skool", {
            method: "PATCH",
            params: {
                method: "reserve-discount-book",
            },
            headers: {
              "Content-Type": "application/json",
            },
            body: {
                variantId: variantId,
                userEmail: email,
                userName: userName

            }
        })

        console.log(sendData, "sendData");
        bookOrdered.value = true;
        currentStep.value++;

    } catch (err) {

        console.log(`Something went wrong: ${err}`)



    }




}


const nextStep = async (method: string) => {
  switch (method) {
    case "next-step":
      currentStep.value++;
      break;
    case "reserve-book":
      reserveBook();
    break;
  }

  if (currentStep.value > 1) {
    return;
  }
};

const prevStep = () => {
  if (currentStep.value < 1) {
    return;
  }

  if (currentStep.value === 1) {
    steps[0].value = null;
    steps[1].value = null;
    steps[0].valid = true;
  }

  if (currentStep.value === 2) {
    steps[1].value = null;
    steps[1].valid = false;
    steps[2].valid = false;
    steps[2].value = {
      name: "",
      email: "",
      phone: "",
      method: "",
    };
  }
  currentStep.value--;
};
</script>



<style scoped lang="scss">

.modal {
  width: 100%;
  margin: 0 auto;
  height: 100%;
  background-color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;

  @media screen and (max-width: 768px) {
    & {
      align-items: baseline;
    }
  }

  .modal_wrapper {
    width: 80vw;
    max-width: 1200px;
    min-height: 50vh;
    margin: 0 auto;
    border: 1px solid var(--text-color);
    border-radius: 15px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: normal;
    position: relative;
    overflow: hidden;
    @media screen and (max-width: 1024px) {
      & {
        width: 90vw;
      }
    }
    @media screen and (max-width: 768px) {
      & {
        width: 95vw;
        height: 95dvh;
      }
    }
  }

  .booking_content {
    padding: 1em;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    position: relative;
    width: 100%;
    height: 100%;
    height: inherit;
    min-height: 60vh;
    gap: 1em;
    @media screen and (max-width: 375px) {
      padding: 0.5em;
    }

    .progress_bar {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      position: relative;
      width: 100%;
      margin-top: 1.5em;
      gap: 1em;
      @media screen and (max-width: 768px) {
        & {
          margin-top: 0.5em;
        }
      }

      .progress_description {
        width: 100%;
        height: auto;
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        .el {
          display: flex;
          justify-content: center;
          color: rgb(224, 224, 224);
          align-items: center;
          gap: 0.5em;
          svg {
            width: 25px;
            height: 25px;
            fill: rgb(224, 224, 224);
            @media screen and (max-width: 768px) {
              & {
                width: clamp(15px, 4vw, 25px);
                height: clamp(15px, 4vw, 25px);
              }
            }
          }
          @media screen and (max-width: 768px) {
            & {
              span {
                font-size: clamp(13px, 3vw, 16px);
              }
            }
          }
        }
        .active_el {
          color: var(--text-color);
          svg {
            fill: var(--text-color);
          }
        }
      }
      .progress {
        background-color: rgb(224, 224, 224);
        border-radius: 15px;
        width: 90%;
        height: 5px;
        @media screen and (max-width: 1024px) {
          & {
            width: 95%;
          }
        }
      }
      .progress_value {
        background-color: var(--text-color);
        border-radius: 15px;
        // width: 0%;
        height: 5px;
        transition: all ease 0.3s;
      }
    }
  }
  .booking_btn {
    padding: 1em;
    display: flex;
    justify-content: flex-end;
    align-items: center;
    border-top: 1px solid var(--text-color);
    white-space: nowrap;
    gap: 1em;
    @media screen and (max-width: 375px) {
      &{
        justify-content: center;
        // padding: 1em, 0.5em;
        gap: 0.5em;
        
      }
      .button {
        flex: 1;
      }
    }
  }
  .discount_btn {
    display: flex;
    justify-content: flex-end;
    position: absolute;
    align-items: center;
    width: 100%;
    padding: 1em;
    gap: 1em;
    bottom: 0;
    left: 0;

    

    .btn {
      padding: 0.5em 1em;
      border-radius: 5px;
      color: black;
      border: 1px solid lightgray;
      transition: all ease 0.3s;
      font-weight: bold;
      cursor: pointer;
      @media screen and (max-width: 768px) {
        & {
          box-shadow: unset;
        }
      }
    }

    .accept {
      @media screen and (min-width: 1024px) {
        &:hover {
          background: rgb(153, 255, 0);
          transition: all ease 0.3s;
          border: 1px solid transparent;
        }
      }
    }
    .decline {
      @media screen and (min-width: 1024px) {
        &:hover {
          background: rgb(255, 0, 0);
          transition: all ease 0.3s;
          color: white;
          border: 1px solid transparent;
        }
      }
    }
  }
  .booking_btn,
  .discount_btn {
    @media screen and (max-width: 768px) {
      & {
        padding: 1em;
        z-index: 2;

        button {
          min-width: 100px;
          padding-inline: 5px;
          font-size: 14px;
          height: 35px;
        }
      }
    }
    @media screen and (max-width: 425px) {
      &{
        padding: 1em 0.5em;
      }
      
    }
  }
}


</style>