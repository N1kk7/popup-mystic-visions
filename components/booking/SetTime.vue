<template>
  <div v-if="loader" class="loader mt-20">
    <SharedLoader />
  </div>

  <div v-else class="slot_wrapper">
    <div v-if="slots && slots.length">
      <h2>Select time for {{ userDate }}</h2>
      <ul class="slot_list">
        <li
          v-for="(slot, index) in slots"
          :key="index"
          class="slot_item"
          :class="{ active_slot: modelValue?.utc === slot.utc }"
        >
          <button @click="() => selectTimeHandler(slot)">
            {{ slot.local }}
          </button>
        </li>
      </ul>
    </div>
    <div
      class="w-full h-[-webkit-fill-available] flex justify-center items-center mt-10"
      v-else
    >
      <p>No available slots for this date</p>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onBeforeUnmount, watch } from "vue";
import dayjs from "dayjs";
import utc from "dayjs/plugin/utc";
import timezone from "dayjs/plugin/timezone";

dayjs.extend(utc);
dayjs.extend(timezone);

const selectedDate = ref<string | null>(null);
const selectedTime = ref<string | null>(null);
const userDate = ref<string | null>(null);
const slots = ref<{ utc: string; mexico: string; local: string }[]>([]);
const loader = ref(true);

const modelValue = defineModel<{
  utc: string;
  mexico: string;
  local: string;
} | null>({
  default: null,
});
const isValid = defineModel<boolean>("valid", { default: false });

const BASE_TIMEZONE = "America/Mexico_City";
// "America/Mexico_City"
// const BASE_TIMEZONE = "Europe/Kyiv"

const props = defineProps<{
  modelValue: string | null;
  valid: boolean;
  bookingData: {
    date: Date | null;
    time: string | null;
    contact: {
      name: string;
      email: string;
      phone: string;
      method: string;
    };
  };
}>();

const selectTimeHandler = (slot: {
  utc: string;
  mexico: string;
  local: string;
}) => {
  modelValue.value = slot;
  selectedTime.value = slot.local;
};

const handleClickOutside = (event: MouseEvent) => {
  const slotWrapper = document.querySelector(".slot_wrapper");
  if (slotWrapper && !slotWrapper.contains(event.target as Node)) {
    modelValue.value = null;
  }
};

function mapSlots(
  rawSlots: string[],
  dateStr: string,
  userTimezone: string,
  baseTz = BASE_TIMEZONE
) {
  const nowBase = dayjs().tz(baseTz);
  const dayInBase = dayjs.tz(dateStr, "YYYY-MM-DD", baseTz);

  console.log("nowBase", nowBase.format());
  console.log("dayInBase", dayInBase.format());

  if (dayInBase.isBefore(nowBase, "day")) return [];

  const isTodayInBase = dayInBase.isSame(nowBase, "day");

  return (
    rawSlots
      .map((time) => {
        let slotBase = dayjs.tz(
          `${dateStr} ${time}`,
          "YYYY-MM-DD HH:mm",
          baseTz
        );
        if (!slotBase.isValid()) {
          slotBase = dayjs.tz(`${dateStr} ${time}`, "YYYY-MM-DD H:mm", baseTz);
        }
        if (!slotBase.isValid()) return null;

        const slotUser = slotBase.tz(userTimezone);

        return {
          utc: slotBase.utc().format(),
          mexico: slotBase.tz(baseTz).format("HH:mm"),
          local: slotUser.format("HH:mm"),
          _slotBase: slotBase,
        };
      })
      .filter(Boolean)
      // .filter(({ _slotBase }) => {
      //   if (isTodayInBase) return _slotBase.isAfter(nowBase)
      //   return _slotBase.isAfter(nowBase, "day")
      // })
      .filter(
        ({ _slotBase }) =>
          _slotBase.isAfter(nowBase) || _slotBase.isSame(nowBase)
      )
      .sort((a, b) => a._slotBase.valueOf() - b._slotBase.valueOf())
      .map(({ utc, mexico, local }) => ({ utc, mexico, local }))
  );
}

async function getFreeSlots(date: string) {
  try {
    const res = await $fetch("/api/bookingCall", {
      method: "GET",
      params: {
        method: "getAvailableSlots",
        date: date,
      },
    });
    return res.data as string[];
  } catch (error) {
    console.log(error, "error getFreeSlots");
    return [];
  }
}

onMounted(async () => {
  document.addEventListener("click", handleClickOutside);

  if (props.bookingData.date) {
    const dateOnly = dayjs(props.bookingData.date).format("YYYY-MM-DD");
    const baseDateStr = dayjs
      .tz(dateOnly, "YYYY-MM-DD", BASE_TIMEZONE)
      .format("YYYY-MM-DD");

    selectedDate.value = baseDateStr;

    const userTimezone =
      Intl.DateTimeFormat().resolvedOptions().timeZone || dayjs.tz.guess();
    userDate.value = dayjs(props.bookingData.date)
      .tz(userTimezone)
      .format("MMMM D, YYYY");

    const receivedSlots = await getFreeSlots(baseDateStr);
    slots.value = mapSlots(
      receivedSlots,
      baseDateStr,
      userTimezone,
      BASE_TIMEZONE
    );

    loader.value = false;
  }

  loader.value = false;
});

onBeforeUnmount(() => {
  document.removeEventListener("click", handleClickOutside);
});

watch(modelValue, (val) => {
  isValid.value = !!val;
});
</script>

<style lang="scss">
.loader {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
}

.slot_wrapper {
  width: 100%;
  height: 100%;
  overflow-y: scroll;
  h2 {
    text-align: center;
    margin-bottom: 1.5em;
  }
}

.slot_list {
  display: flex;

  flex-wrap: wrap;
  gap: 0.5em 1em;
}
.slot_item {
  display: flex;
  align-items: center;
  justify-content: center;
  border: 1px solid black;
  border-radius: 10px;
  margin-bottom: 0.25em;
  // flex: 0 0 calc(33.333% - 1em);
  flex: 0 0 calc((100% - 2em) / 3);
  box-sizing: border-box;
  position: relative;
  button {
    padding-block: 0.5em;

    width: 100%;
    height: 100%;
  }
}

.active_slot {
  background: var(--text-color);
  color: white;
}
</style>
