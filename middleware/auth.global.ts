

import { useAuthStore } from '../stores/auth'

export default defineNuxtRouteMiddleware((to) => {
  const auth = useAuthStore()
  const cookieRole = useCookie<string | null>('role').value

  if (!auth.role && cookieRole) {
    auth.setRole(cookieRole)
  }

  const role = auth.role

  if (to.path.startsWith('/admin') && to.path !== '/admin/login' && role !== 'admin') {
    return navigateTo('/admin/login')
  }

  if (to.path.startsWith('/seller') && to.path !== '/seller/login' && role !== 'seller') {
    return navigateTo('/seller/login')
  }
})