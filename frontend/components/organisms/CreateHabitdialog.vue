<template>
  <v-dialog
    v-model="dialog"
    width="500"
  >
    <template v-slot:activator="{ on, attrs }">
      <v-btn
        rounded
        color="primary"
        dark
        v-bind="attrs"
        v-on="on"
      >
        ＋目標追加
      </v-btn>
    </template>

    <v-card>
      <v-toolbar
        class="cyan darken-1"
        flat
      >
        <v-toolbar-title
          class="white--text font-weight-bold"
        >
          投稿する
        </v-toolbar-title>
        <v-spacer></v-spacer>
        <v-icon
          dark
          @click="closeDialog"
        >
          mdi-close
        </v-icon>
      </v-toolbar>
      <v-form>
        <v-card-text>
          <v-container>
            <ValidationObserver v-slot="ObserverProps">
              <v-row>
                <v-col cols="12">
                  <MinHabitWithValidation
                    v-model="min_target"
                    label="ミニマム目標"
                    rules="max:120|required"
                  />
                </v-col>
                <v-col cols="12">
                  <MaxHabitWithValidation
                    v-model="min_target"
                    label="マックス目標"
                    rules="max:120|required"
                  />
                </v-col>
                <!-- <v-col cols="12">
                  <TagsForm
                    v-model="tag"
                    :initTags="tags"
                    @tags-changed="newTags => tags = newTags"
                  />
                </v-col> -->
                <v-col cols="12">
                  <v-row justify="center">
                    <v-btn
                      color="success"
                      class="white--text"
                      @click="createPost"
                      :disabled="ObserverProps.invalid"
                    >送信
                    </v-btn>
                  </v-row>
                </v-col>
              </v-row>
            </ValidationObserver>
          </v-container>
        </v-card-text>
      </v-form>
    </v-card>
  </v-dialog>
</template>

<script>
import MinHabitWithValidation from '~/components/molecules/inputs/MinHabitWithValidation.vue'
import MaxHabitWithValidation from '~/components/molecules/inputs/MaxHabitWithValidation.vue'
export default {
  components: {
    MinHabitWithValidation,
    MaxHabitWithValidation,
  },
  data () {
    return {
      min_target: '',
      max_target: '',
    }
  },
  closeDialog () {
    this.$emit('closeDialog')
    this.description = ''
    this.tags = []
  },
}
</script>