<template>
    <div>
        <OrderForm />
    </div>
</template>

<script>
import { Fragment } from 'vue-fragment'
import OrderForm from './OrderForm'
export default {
  components: { OrderForm, Fragment },
  name: 'Main'
}
</script>
