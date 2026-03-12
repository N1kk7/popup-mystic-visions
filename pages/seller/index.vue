<template>
  <div class="subscription">
    <div class="container">
      <div class="subscription_wrapper">
        <div class="subscriptions_head">
          <div class="title">
            <h1>Active subscriptions</h1>
            <span>
              Get the email from client and generate the link and provide it to
              the client
            </span>

            <!-- <h2 class="text-5xl mt-5 text-rose-500">FOR TESTING USE COACHING/778 PER MONTH</h2> -->
          </div>
        </div>

        <div class="subscription_items">
          <div class="w-full h-full" v-if="loader">
            <SharedLoader />
          </div>
          <div
            v-for="(item, idx) in planStore.plans"
            :key="idx"
            v-else
            class="subscription_item"
          >
            <div class="item_head">
              <h3>{{ item.subName }}</h3>
              <span>{{ item.subStatus }}</span>
            </div>

            <div class="item_body">
              <span class="currency">$</span>
              <span class="amount"> {{ item.amount }} / </span>
              <div class="period">
                <span>Month</span>
              </div>
            </div>

            <div class="item_footer">
              <button
                @click="
                  modalStore.showModal('GetSubscriptionLink', {
                    priceId: item.priceId,
                  })
                "
              >
                Get payment link
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, watch, onMounted } from "vue";

const planStore = usePlanStore();
const modalStore = useModalStore();

const loader = ref(true);

const isMonthly = ref(false);

onMounted(async () => {
  await planStore.fetchPlans();


  loader.value = false;
});

definePageMeta({
  layout: "seller",
});
</script>

<style scoped lang="scss">

.title {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;
  gap: 1.2em;
}
.subscription {
  width: 100%;
  min-height: 100vh;
  background-color: #ededed;
  position: relative;
}

.subscription_wrapper {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  flex-direction: column;
  padding-block: 5em;
  width: 100%;
  height: 100%;
  gap: 1em;
}

.subscriptions_head {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  gap: 5em;
  h1 {
    width: 60%;
  }
  .toggle_switch {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 1em;
  }
}

.subscription_items {
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  width: 100%;
  height: fit-content;
  padding-block: 5em;
  gap: 2em;
}

.subscription_item {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  gap: 2em;
  width: 20%;
  height: fit-content;
  background: #fff;
  padding: 1em;
  border-radius: 10px;
  position: relative;
  flex: 1 0 225px;

  .item_head {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    width: 100%;
    h3 {
      font-weight: 700;
      font-size: 1.5em;
    }
    span {
      font-weight: 200;
      color: grey;
    }
  }

  .item_body {
    width: 100%;
    height: auto;
    display: flex;
    justify-content: flex-start;
    position: relative;
    align-items: flex-start;
    gap: 0.7em;
    span {
      font-weight: 700;
      font-size: 1.5em;
    }
    .amount {
      white-space: nowrap;
      font-weight: 700;
      font-size: 2.5em;
    }
    .period {
      height: -webkit-fill-available;
      display: flex;
      justify-content: flex-start;
      align-items: flex-end;
      max-height: 60px;
    }
  }

  .item_footer {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    button {
      width: 100%;
      height: auto;
      background: black;
      color: #fff;
      padding-block: 0.5em;
      border-radius: 10px;
    }
  }
}
</style>
