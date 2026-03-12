<template>
  <div class="items-section h-[100vh]">
    <div class="admin-container mx-2 pb-2 flex flex-col">
      <div class="top-block flex justify-between items-start mt-8 mb-10">
        <div class="page-name">
          <h1 class="mb-0 font-bold text-white">Sellers / couches page</h1>
        </div>
        <div class="flex items-center xl:hidden">
          <SharedDashBurger />
        </div>
      </div>

      <div class="w-full px-6 py-6 max-md:px-1 mx-auto h-full min-h-[500px]">
        <div class="flex flex-wrap -mx-3 w-full h-full max-md:-mx-0">
          <div class="flex-none w-full max-w-full px-3 max-md:px-0">
            <div
              class="relative h-full flex flex-col min-w-0 mb-6 break-words bg-white dark:bg-[var(--dark-grey)] dark:border dark:border-[var(--dark-border-color)] border-0 border-transparent border-solid shadow-xl dark:bg-slate-850 dark:shadow-dark-xl rounded-2xl bg-clip-border overflow-hidden"
              ref="productElem"
            >
              <div
                class="flex items-center justify-between p-6 pb-0 mb-0 border-b-0 border-b-solid rounded-t-2xl border-b-transparent"
              >
                <h6 class="text-[var(--text-color)] text-xl dark:text-white">
                  Sellers / couches list
                </h6>
              </div>

              <div class="w-full h-full" v-if="loader">
                <SharedLoader />
              </div>

              <div class="sellers_wrapper" v-else>

                <div
                  v-if="data.length === 0"
                  class="w-full h-full flex justify-center items-start text-[var(--text-color)] text-lg absolute mt-24"
                >
                  There are no sellers ...
                </div>


                <div
                  v-else
                  v-for="(seller, idx) in data"
                  class="seller_card"
                  :key="idx"
                >
                  <div class="content_wrapper">
                    <img src="/public/icons/default-user.webp" alt="user" />
                    <div class="short_info">
                      <div class="info_head">
                        <span class="name"> {{ seller.name }} </span>
                        <span class="last_name"> {{ seller.lastName }} </span>
                      </div>

                      <ul class="details">
                        <li>
                          <span>Active users</span>

                          <span class="value">{{ seller.users.length }}</span>
                        </li>

                        <li>
                          <span>Pending links</span>
                          <span class="value">{{ seller.pendingCount }}</span>
                        </li>
                      </ul>
                    </div>
                  </div>

                  <!-- {{ console.log(seller, 'seller') }} -->
                  <button
                    @click="
                      () =>
                        modalStore.showModal('ShowSellerDetails', { seller })
                    "
                  >
                    View details
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref, onMounted } from "vue";

const modalStore = useModalStore();
const activeGroup = ref("subscriptions");
const subscriptionsList = ref("");

const loader = ref(true);

const data = ref();

onMounted(async () => {
  try {
    const fetchSellersList = await $fetch("/api/sellers", {
      method: "GET",
      params: {
        method: "get-sellers-list",
      },
    });

    data.value = fetchSellersList.data.map((seller: any) => ({
      ...seller,
      pendingCount: seller.sessions.filter(
        (session: any) => session.status.toUpperCase() === "PENDING"
      ).length,
    }));
  } catch (err) {
    console.log(`Something went wrong ${err}`);
  }

  loader.value = false;
});

definePageMeta({
  layout: "admin",
});
</script>

<style lang="scss" scoped>
.sellers_wrapper {
  display: grid;
  gap: 1.5rem;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  align-items: stretch;
  padding: 2em;

  @media screen and (max-width: 768px) {
    & {
      padding: 1em;
    }
  }
}

.seller_card {
  background: #ecf0f3;
  border-radius: 16px;
  padding: 1em;
  transition: all 0.3s ease;
  box-shadow: 9px 9px 16px #d1d9e6, -9px -9px 16px #ffffff;

  width: 100%;
  max-width: none;

  position: relative;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  gap: 3em;

  @media screen and (max-width: 768px) {
    & {
      padding: 0.5em;
    }
  }

  img {
    width: clamp(40px, 7vw, 70px);
    height: auto;
  }

  .content_wrapper {
    display: flex;
    justify-content: flex-start;
    align-items: flex-start;
    width: 100%;
    gap: 1em;
  }

  .short_info {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: flex-start;
    gap: 10px;
  }

  .info_head {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: flex-start;
    flex-wrap: wrap;
    // gap: 5px;
    span {
      padding-right: 5px;
      text-transform: capitalize;
      font-size: 1.2em;
      font-weight: 600;
    }
  }

  .details {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: flex-start;
    gap: 5px;
    li {
      display: flex;
      justify-content: flex-start;
      align-items: center;
      gap: 5px;
      span {
        font-weight: 500;
      }
      .value {
        font-size: 16px;
        font-weight: 600;
      }
    }
  }

  // .bottom_content{
  //   width: 100%;
  //   display: flex;
  //   justify-content: center;
  //   align-items: center;

  // }
  button {
    width: 100%;
    height: auto;
    background: black;
    color: #fff;
    padding-block: 0.5em;
    border-radius: 10px;
  }

  //   h3 {
  //     font-size: 18px;
  //     font-weight: 600;
  //     color: #333;
  //   }

  //   p {
  //     font-size: 14px;
  //     color: #777;
  //   }

  //   .stats {
  //     display: flex;
  //     flex-direction: column;
  //     gap: 8px;

  //     .row {
  //       display: flex;
  //       justify-content: space-between;
  //       font-size: 14px;
  //       color: #555;

  //       span:first-child {
  //         font-weight: 500;
  //       }
  //     }
  //   }

  @media screen and (max-width: 1024px) {
    &:hover {
      transform: scale(1.02);
      box-shadow: 6px 6px 12px #d1d9e6, -6px -6px 12px #ffffff;
    }
  }
}
</style>
