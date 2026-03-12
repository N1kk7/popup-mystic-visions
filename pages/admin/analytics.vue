<template>
  <div class="mx-6 pt-12 pb-28">

    <div class="head flex items-center justify-between px-5 py-5">
        <h1 class="mb-0 font-bold text-white">
            Analitycs
        </h1>
        <div class="flex items-center xl:hidden">
          <SharedDashBurger/>


        </div>
    </div>

    <section
      class="bg-white rounded-lg py-8 mt-20 antialiased dark:bg-[var(--dark-grey)] dark:border dark:border-[var(--dark-border-color)] md:py-16"
    >
      <div class="mx-auto max-w-screen-xl px-4 2xl:px-0">
        <div class="mx-auto max-w-5xl">
          <div class="gap-4 sm:flex sm:items-center sm:justify-between">
            <h2
              class="text-xl font-semibold text-gray-900 dark:text-white sm:text-2xl"
            >
              Active orders:
            </h2>

            <div
              class="mt-6 gap-4 space-y-4 sm:mt-0 sm:flex sm:items-center sm:justify-end sm:space-y-0"
            >
              <div>
                <label
                  for="order-type"
                  class="sr-only mb-2 block text-sm font-medium text-gray-900 dark:text-white"
                  >Select order type</label
                >
                <select
                  id="order-type"
                  class="block w-full min-w-[8rem] rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm text-gray-900 focus:border-primary-500 focus:ring-primary-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder:text-gray-400 dark:focus:border-primary-500 dark:focus:ring-primary-500"
                >
                  <option selected>All orders</option>
                  <option value="pre-order">Pre-order</option>
                  <option value="transit">In transit</option>
                  <option value="confirmed">Confirmed</option>
                  <option value="cancelled">Cancelled</option>
                </select>
              </div>

              <span class="inline-block text-gray-500 dark:text-gray-400">
                from
              </span>

              <div>
                <label
                  for="duration"
                  class="sr-only mb-2 block text-sm font-medium text-gray-900 dark:text-white"
                  >Select duration</label
                >
                <select
                  id="duration"
                  class="block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm text-gray-900 focus:border-primary-500 focus:ring-primary-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder:text-gray-400 dark:focus:border-primary-500 dark:focus:ring-primary-500"
                >
                  <option selected>this week</option>
                  <option value="this month">this month</option>
                  <option value="last 3 months">the last 3 months</option>
                  <option value="lats 6 months">the last 6 months</option>
                  <option value="this year">this year</option>
                </select>
              </div>
            </div>
          </div>

          <div class="chart-wrapper grid grid-cols-2 gap-4 mt-4">
            <ChartsActiveUsersChart/>
            <ChartsGeographyStats/>
           





          </div>
          <div class="chart-wrapper grid grid-cols-1 gap-4 mt-4">

            <ChartsProductStats/>

          </div>
          <div class="chart-wrapper grid grid-cols-2 gap-4 mt-4">
            <ChartsPeriodComparison/>
            <ChartsReturnsStats/>
            <ChartsSalesFunnel/>
            <ChartsSalesStats/>
            <ChartsUserStats/>
          </div>

        </div>
      </div>
    </section>

    </div>



   
</template>


<script setup>


    definePageMeta({
        layout: 'admin'
    })

</script>