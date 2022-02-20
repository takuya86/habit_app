<template>
  <v-container>
    <h1>ハビット！</h1>
    <p>習慣化を記録するアプリです。</p>
    <h2>ログイン状態:{{ $auth.loggedIn }}</h2>
    <HabitationsCard />
  </v-container>
</template>

<script>
import HabitationsCard from '~/components/molecules/cards/HabitationsCard'
export default {
  components: {
    HabitationsCard,
  },
}
</script>
