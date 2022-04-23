<template>
  <v-container>
    <h1>Habi appで学習を習慣化しよう。</h1>
    <p>習慣化目標を記録するアプリです。</p>
    <div>
      <HabitationsCard/>
    </div>
  </v-container>
</template>

<script>
import axios from 'axios';
import HabitationsCard from '~/components/organisms/feeds/HabitationsFeed'

export default {
  components: {
    HabitationsCard,
  },
  data () {
    return {
      habitations: [],
    }
  },
  created() {
    axios.get(`http://localhost:5000/api/v1/habitations`)
      .then(res => {
        this.habitations = res.data
        console.log(this.habitations)
      })
  }
}
</script>
