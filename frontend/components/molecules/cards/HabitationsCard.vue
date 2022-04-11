<template>
  <v-col >
    <v-card
      class="mx-auto"
      color="#FFFFFF"
      max-width="400"
    >
      <v-toolbar
          class="blue-grey lighten-1"
          flat
        >
          <v-toolbar-title
            class="white--text font-weight-bold"
          >
            習慣化目標
          </v-toolbar-title>
        </v-toolbar>
          <v-card-title>
            <span>ミニマム目標</span>
          </v-card-title>
          <div class="habit_target">
            {{ habitation.min_target }}
          </div>
          <v-card-title>
            <span>マックス目標</span>
          </v-card-title>
          <div class="habit_target">
            {{ habitation.max_target }}
          </div>
      <v-card-actions>
        <v-list-item class="grow">
          <v-list-item-content>
            <v-list-item-title>{{ habitation.user.name }}</v-list-item-title>
          </v-list-item-content>
          <v-row
            align="center"
            justify="end"
          >
            <v-icon class="mr-1">
              mdi-heart
            </v-icon>
            <span class="subheading mr-2">256</span>
          </v-row>
        </v-list-item>
      </v-card-actions>
    </v-card>
  </v-col>
</template>

<script>
export default {
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
</style>