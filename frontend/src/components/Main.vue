<template>
    <div>
        <MainVideo />
        <Ads />
    </div>
</template>

<script>
import { Fragment } from 'vue-fragment'
import MainVideo from './MainVideo'
import Ads from './Ads'
export default {
  components: { Ads, MainVideo, Fragment },
  name: 'Main'
}
</script>
