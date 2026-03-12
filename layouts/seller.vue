<template>

    <div class="layout">
        <main class="border-t border-solid border-[var(--main-accent)]">
            <slot />
        </main>

    </div>


     <ModalsModal >

      <template #default="{ openModal, closeModal }">
        <component
          :is="currentModal"
          v-bind="modalProps"
          :openModal="openModal"
          :closeModal="closeModal"
        />
      </template>
    </ModalsModal>

</template>

<script setup>


    const modalStore = useModalStore();
    const currentModal = computed(() => modalStore.currentModal);
    const modalProps = computed(() => modalStore.modalProps);


</script>



<style scoped>

.dark .layout{
  background-color: var(--dark-component-color);
}
.layout {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}
main {
  flex: 1;
}
</style>