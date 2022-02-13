<template>
  <v-app style="background-color: #ECEFF1;">
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
export default {
  components: {
    Header,
  },
}
</script>
