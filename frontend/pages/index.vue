<template>
  <v-container>
    <h1>Habi appで学習を習慣化しよう。</h1>
    <p>習慣化目標を記録するアプリです。</p>
    <div>
      <HabitationsFeed/>
    </div>
  </v-container>
</template>

<script>
import HabitationsFeed from '~/components/organisms/feeds/HabitationsFeed'

export default {
  components: {
    HabitationsFeed,
  },
}
</script>
