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
      <v-tab
        @change="changeNewPosts"
        class="ma-0 pa-0"
      >
        習慣化目標
        <v-icon>mdi-clock-time-eight</v-icon>
      </v-tab>
        <v-tabs
          fixed-tabs
          centered
          background-color="cyan darken-1"
          color="white"
          slider-color="orange"
          icons-and-text
        >
        </v-tabs>
        <v-tabs-items v-model="tab" touchless>
          <v-tab-item class="pa-1">
            <HabitationsCard
              v-for=" habitation in habitations" :key="habitation.id" :habitation="habitation"
            />
          </v-tab-item>
          <v-tab-item class="pa-1">
            <FollowingUsers
              v-if="$store.state.modules.user.data"
              :load="loadFollowingUsers"
            />
            <v-card flat v-else class="text-center">
              <span>ログインするとフォローユーザーのつぶやきを一覧表示します。</span>
            </v-card>
          </v-tab-item>
        </v-tabs-items>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import HabitationsCard from '~/components/molecules/cards/HabitationsCard.vue'
export default {
  components: {
    HabitationsCard
  },
  props: {
    habitation: {
      type: Object,
      default: {}
    }
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
    background: #F7F7F7;
  }
  .habitation_card__content--txt {
    width: 200px;
    padding: 10px;
  }
</style>