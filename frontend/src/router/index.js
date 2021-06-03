import Vue from 'vue'
import Router from 'vue-router'
import Main from '@/components/Main'
import Products from '@/components/Products'
import ShoppingCart from '@/components/ShoppingCart'

Vue.use(Router)

export default new Router({
  mode: 'hash',
  routes: [
    {
      path: '/',
      name: 'Main',
      component: Main,
      props: true
    },
    {
      path: '/product/:id',
      name: 'Products',
      component: Products,
      props: true
    },
    {
      path: '/product/:id',
      name: 'Products',
      component: {default: Products},
      props: {default: true}
    },
    {
      path: '/soppingcart',
      name: 'ShoppingCart',
      component: ShoppingCart,
      props: true
    }
  ]
})
