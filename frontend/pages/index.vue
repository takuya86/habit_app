<template>
  <v-container>
    <h1>ハビット！</h1>
    <p>習慣化を記録するアプリです。</p>
    <h2>ログイン状態:{{ $auth.loggedIn }}</h2>
    <h2>ユーザー情報:{{ $auth.user }}</h2>
    <div>
      <HabitationsCard  v-for=" habitation in habitations" :key="habitation.id" :habitation="habitation" />
    </div>
  </v-container>
</template>

<script>
import axios from 'axios';
import HabitationsCard from '~/components/molecules/cards/HabitationsCard'

export default {
  components: {
    HabitationsCard,
  },
  data () {
    return {
      habitations: [],
    }
  },
  // props: {
  //   habitations: {
  //     type: Object,
  //     required: true,
  //   },
  // },
  created() {
    axios.get(`http://localhost:5000/api/v1/habitations`)
      .then(res => {
        this.habitations = res.data
        console.log(this.habitations)
        console.log(this.$auth)
      })
  }
}
</script>
