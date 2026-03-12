<template>
  <div class="summary_wrapper">
    <div class="summary_head">
      <img src="/success.png" alt="success" />

      <h1>Thank you!</h1>
    </div>

    <div class="info" v-if="bookOrderedState">
      <p>
        We’ll send your exclusive discount link  <br>
        <span> straight to your email as soon as you join our Skool community. </span>
      </p>
      <p>
        Get ready! You’ll be redirected to our Skool community in: <br> 
        <span class="redirect_time">
          {{ redirectTime }} s.
        </span>
      </p>
    </div>

    <div class="info" v-else>
      <p>
        We setting our meeting for {{ dateMeeting }} at {{ timeMeeting }} <br>
        <span> Additional information we send to your email. </span>
      </p>
    </div>
  </div>
</template>

<script setup lang="ts">
interface BookingContact {
  name: string;
  email: string;
  phone: string;
  method: string;
}

type BookingDate =
  | Date
  | string
  | {
      utc: string;
      mexico: string;
      local: string;
    }
  | null;

interface BookingData {
  date: BookingDate;
  time: BookingTime | null;
  contact: BookingContact;
  bookOrdered: boolean;
}
interface BookingTime {
  local: string;
  mexico: string;
  utc: string;
}

interface Props {
  modelValue: string | null;
  valid: boolean;
  bookingData: BookingData;
}


import { onMounted, ref } from "vue";

const bookOrderedState = ref(null);
const dateMeeting = ref(null);
const timeMeeting = ref(null);

const redirectTime = ref(5);

let intervalId: ReturnType<typeof setInterval> | null = null;


const props = defineProps<Props>();
const redirectHandler = () => {
  if (intervalId) return;

  intervalId = setInterval(() => {
    redirectTime.value--;

    if (redirectTime.value <= 0) {
      clearInterval(intervalId!);
      intervalId = null;
      window.location.href = "https://www.skool.com/empyrean-3776/about?ref=e81b05e0f4fc48acbb9f5293bcbda45f";
    }
  }, 1000);
};

const formatBookingDate = (date: BookingDate): string | null => {
  if (!date) return null;


  if (typeof date === "object" && "utc" in date) {
    return new Date(date.utc).toLocaleDateString("en-US", {
      year: "numeric",
      month: "long",
      day: "numeric",
    });
  }


  if (typeof date === "string") {
    return new Date(date).toLocaleDateString("en-US", {
      year: "numeric",
      month: "long",
      day: "numeric",
    });
  }


  if (date instanceof Date) {
    return date.toLocaleDateString("en-US", {
      year: "numeric",
      month: "long",
      day: "numeric",
    });
  }

  return null;
};


onMounted(() => {

  console.log(props, 'props')



   bookOrderedState.value = props.bookingData.bookOrdered;

   if (bookOrderedState.value) {
     redirectHandler();
   }

  if (props.bookingData.date) {


  dateMeeting.value = formatBookingDate(props.bookingData.date);


  } else {
    dateMeeting.value = null;
  }

  timeMeeting.value = props.bookingData.time?.local ?? null;
});
</script>

<style lang="scss">
.summary_wrapper {
  position: relative;
  width: 100%;
  height: 100%;
  min-height: 50vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 30px;
}

.summary_head {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 30px;
  img {
    width: 100px;
    height: 100px;
  }

  h1 {
    font-size: 2em;
    font-weight: 600;
    color: var(--text-color);
    @media screen and (max-width: 768px) {
      & {
        font-size: clamp(1.5em, 5vw, 2em);
      }
    }
  }
}

.info {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 10px;

  p {
    font-size: 1.2em;
    text-align: center;
    color: var(--text-color);
    @media screen and (max-width: 768px) {
      & {
        font-size: clamp(1em, 4vw, 1.2em);
      }
    }
   
  }

  .redirect_time {
    margin-top: 1rem;
    font-weight: 600;
    color: green;
    font-size: 2rem;
   
  }
}
</style>
