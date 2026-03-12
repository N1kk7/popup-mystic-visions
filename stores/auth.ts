import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({
    role: null as string | null
  }),
  actions: {
    setRole(role: string) {
      this.role = role
    },
    clearRole() {
      this.role = null
    }
  }
})