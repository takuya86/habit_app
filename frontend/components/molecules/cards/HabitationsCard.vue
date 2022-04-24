<template>
  <v-container>
    <v-card
      class="mx-auto habitcards"
      color="#FFFFFF"
      max-width="400"
    >
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
      <table class="habitation_card__content--wrapper">
        <tr class="habitation_card__content--inner">
          <td class="habitation_card__content--heading">
            ミニマム目標
          </td>
          <td class="habitation_card__content--txt">
            {{ habitation.min_target }}
          </td>
        </tr>
        <tr class="habitation_card__content--inner">
          <td class="habitation_card__content--heading">
            マックス目標
          </td>
          <td class="habitation_card__content--txt">
            {{ habitation.max_target }}
          </td>
        </tr>
      </table>
    </v-card>
  </v-container>
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
  .habitcards {
    padding: 15px;
  }
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