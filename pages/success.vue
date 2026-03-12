<template>
  <div class="success-page">

    <h1>Payment completed! </h1>

    <img src="/success.png" alt="success" width="50" height="50">

    <div class="wrapper_info">

        <div 
            class="head_info"
            v-if="!loading"
        >
            <img src="/images/sphinks.webp" alt="sphinks" width="50" height="50">
            <span>
                Thank you !
            </span>

        </div>


        <div v-if="loading">Loading information about payment...</div>
        <div v-else-if="error" class="error">Error: {{ error }}</div>
        <div 
            class="details_content"
            v-else
        >
            <span class="order_details">
                Order details:
            </span>
            <p>Status: {{ session.payment_status }}</p>
            <p>Amount: {{ session.amount_total / 100 }} {{ session.currency.toUpperCase() }}</p>
            <p>Order id: {{ session.id }}</p>

        </div>

    </div>

    
  </div>
</template>


<script setup lang="ts">
import { useRoute } from "vue-router";
import { onMounted, ref } from "vue";

const route = useRoute();
const sessionId = route.query.session_id as string | undefined;

const loading = ref(true);
const error = ref<string | null>(null);
const session = ref<any>(null);

onMounted(async () => {
  if (!sessionId) {
    error.value = "Session_id not found";
    loading.value = false;
    return;
  }

  try {
    session.value = await $fetch(`/api/payments`, {
      method: "GET",
      params: { method: "get-checkout-session" },
      query: { session_id: sessionId },
    });
  } catch (e: any) {
    error.value = e.message || "Error while fetching session";
  } finally {
    loading.value = false;
  }

  console.log(session.value, "session");
});
</script>



<style scoped lang="scss">
.success-page {
  max-width: 60vw;
  height: -webkit-fill-available;
  min-height: 50vh;
  margin: 50px auto;
  text-align: center;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  gap: 2em;
}
.error {
  color: red;
}

.wrapper_info{
    /* border: 1px solid #d6d6d6; */
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    border: 1px solid var(--text-color);

    border-radius: 10px;
    padding: 15px;
    gap: 2em;
}

.head_info{
    display: flex;
    justify-content: center;
    align-items: flex-end;
    gap: 1em;
    
    span{
        font-size: 1.5em;
        font-weight: 600;
        color: var(--text-color);
    }
}
.details_content{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    gap: 1em;
    .order_details{
        font-size: 1.2em;
        font-weight: 600;
        color: var(--text-color);
    }
}




</style>