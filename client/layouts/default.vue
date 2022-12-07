<template>
  <client-only>
    <div>
      <Nav />
      <notifications style="margin-top:60px;" />
      <Nuxt />
  </div>
  </client-only>
</template>

<script>
import Nav from './partials/Nav.vue'
export default {
  components: {
    Nav
  },
 
}
</script>

<style>

</style>
