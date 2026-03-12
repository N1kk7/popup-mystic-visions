<template>
  <div class="layout">
    <Header />

    <main class="">
      <slot />
    </main>

    <ModalsModal>
      <template #default="{ openModal, closeModal }">
        <component
          :is="currentModal"
          v-bind="modalProps"
          :openModal="openModal"
          :closeModal="closeModal"
        />
      </template>
    </ModalsModal>

    <Footer />
  </div>
</template>

<script setup>
const modalStore = useModalStore();
const currentModal = computed(() => modalStore.currentModal);
const modalProps = computed(() => modalStore.modalProps);
</script>

<style scoped>
.dark .layout {
  background-color: var(--dark-component-color);
}
.layout {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  background-color: #f4f4f4;
}
main {
  flex: 1;
  overflow: hidden;
}
</style>
