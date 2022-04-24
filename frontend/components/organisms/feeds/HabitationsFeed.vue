<template>
  <v-row
    class="mb-6"
    no-gutters
  >
    <v-col>
      <v-card
        class="mx-auto"
        color="#FFFFFF"
        max-width="400"
      >
        <v-toolbar
          background-color="cyan darken-1"
          color="white"
        >
          <v-toolbar-title
            class="ma-0 pa-0"
          >
            <v-icon>mdi-clock-time-eight</v-icon>
            習慣化目標
          </v-toolbar-title>
        </v-toolbar>
        <HabitationsCard
          v-for=" habitation in habitations" :key="habitation.id" :habitation="habitation"
        />
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import axios from 'axios';
import HabitationsCard from '~/components/molecules/cards/HabitationsCard'

export default {
  components: {
    HabitationsCard
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

<style scoped>
  .habit_target {
    padding-left: 16px;
  }
  .habitation_card__content--wrapper {
    margin: 15px 0 0 24px;
    border-collapse: collapse;
  }
  .habitation_card__content--inner {
    border-bottom: 1px solid #C4C4C4;
  }
  .habitation_card__content--heading {
    max-width: 120px;
    padding: 10px;
    /* background: #F7F7F7; */
  }
  .habitation_card__content--txt {
    width: 200px;
    padding: 10px;
  }
</style>