<template>
  <div class="date_wrapper">
    <div class="description content_item">
      <div class="title">
        <span> Mystic Visions </span>
        <h1>Here's Your Next Step...</h1>
      </div>
      <span class="time">
        <svg class="svg-icon">
          <use href="#contact-time"></use>
        </svg>
        30 min
      </span>
      <p>
        We're offering you personalized feedback on applying The Pillars of
        Wisdom in a free 30-minute strategy session.
      </p>
      <p>
        *92% of readers say this session helped them get a better grasp on the
        book.
      </p>
    </div>
    <div class="content_item calendar">
      <VDatePicker
        v-model="modelValue"
        :min-date="today"
        :disabled-dates="disabledDates"
        :first-day-of-week="2"
        mode="date"
        locale="en"
        class="calendar"
        is-required
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, watch, computed } from "vue";

const modelValue = defineModel<Date | null>({ default: null });
const isValid = defineModel<boolean>("valid", { default: false });
const today = new Date();
today.setHours(0, 0, 0, 0);

const disabledDates = [{ repeat: { weekdays: [1] } }];

watch(modelValue, (val) => {
  isValid.value = !!val;
});
</script>

<style lang="scss" scoped>
.date_wrapper {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  height: -webkit-fill-available;
  overflow-x: hidden;
  width: 90%;
  gap: 2em;
  flex: 1;
  @media screen and (max-width: 1024px) {
    & {
      width: 95%;
    }
  }
  @media screen and (max-width: 768px) {
    & {
      flex-direction: column-reverse;
      gap: 0;
      height: 100%;
      overflow-y: scroll;
      padding-bottom: 2em;
    }
  }
}

.calendar {
  display: flex;
  align-items: center;
  justify-content: center;
}

.content_item {
  flex: 1;
}

.description {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;
  gap: 24px;

  @media screen and (max-width: 768px) {
    & {
      gap: 16px;
    }
  }
}

.title {
  span {
    font-weight: bold;
    font-size: 16px;
    line-height: 24px;
    color: rgba(26, 26, 26, 0.61);
  }
  h1 {
    margin: 0;
    font-weight: bold;
    font-size: 28px;
    line-height: 32px;
    @media screen and (max-width: 768px) {
      & {
        font-size: clamp(16px, 5vw, 28px);
      }
    }
  }
}
.time {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  gap: 10px;
  color: rgba(26, 26, 26, 0.61);
  svg {
    width: 20px;
    height: 20px;
  }
}
p {
  margin: 0;
  padding: 0;
  font-size: 16px;
  font-family: "Proxima Nova", sans-serif;
  line-height: 1.5;

  @media screen and (max-width: 768px) {
    & {
      font-size: clamp(13px, 3vw, 16px);
    }
  }
}

.vc-bordered {
  border: none !important;
  width: clamp(300px, 35vw, 420px) !important;
  @media screen and (max-width: 768px) {
    & {
      width: clamp(280px, 85vw, 380px) !important;
    }
  }
}
.vc-header {
  margin-bottom: 20px !important;
  @media screen and (max-width: 768px) {
    & {
      margin-bottom: 15px !important;
    }
  }
}
</style>
