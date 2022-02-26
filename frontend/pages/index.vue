<template>
  <v-container>
    <h1>ハビット！</h1>
    <p>習慣化を記録するアプリです。</p>
    <h2>ログイン状態:{{ $auth.loggedIn }}</h2>
    <h2>ユーザー情報:{{ $store.state.auth.user }}</h2>
    <HabitationsCard />
  </v-container>
</template>

<script>
import HabitationsCard from '~/components/molecules/cards/HabitationsCard'
export default {
  components: {
    HabitationsCard,
  },
  async asyncData({ $axios }) {
    const response = await $axios.$get("/api/v1/habitations")
      .catch( errer => {
        console.log("response erre", errer)
        return false
      })
    return { data: response.data }
  }
}
</script>
