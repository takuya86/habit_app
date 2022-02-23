<template>
  <v-app style="background-color: #ECEFF1;">
    <Flash />
    <Header />
    <v-main>
      <v-container>
        <nuxt />
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import Header from '~/components/Header'
import Flash from '~/components/atoms/Flash.vue'
export default {
  components: {
    Header,
    Flash,
  },
  computed: {
  }
}
</script>