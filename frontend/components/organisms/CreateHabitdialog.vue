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
                    v-model="max_target"
                    label="マックス目標"
                    rules="max:120|required"
                  />
                </v-col>
                <v-col cols="12">
                  <v-row justify="center">
                    <v-btn
                      color="success"
                      class="white--text"
                      @click="createHabitaion"
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
import { mapActions } from 'vuex'
import MinHabitWithValidation from '~/components/molecules/inputs/MinHabitWithValidation.vue'
import MaxHabitWithValidation from '~/components/molecules/inputs/MaxHabitWithValidation.vue'
export default {
  components: {
    MinHabitWithValidation,
    MaxHabitWithValidation,
  },
  props: {
    dialog: {
      type: Boolean,
      required: true
    },
  },
  data () {
    return {
      dialogStatus: this.dialog,
      min_target: '',
      max_target: '',
    }
  },
  watch: {
    dialog (newValue) {
      this.dialogStatus = newValue
    },
  },
  methods: {
    ...mapActions({
      setFlash: "modules/info/setFlash",
    }),
    async createHabitaion () {
      const data = new FormData()
      const config = {
        headders: {
          'content-type': 'multipart/form-data'
        }
      }
      data.append('min_target', this.min_target)
      data.append('max_target', this.max_target)
      data.append('user_id', this.$store.state.user.data.data.id)
      this.$axios.$post(process.env.BROWSER_BASE_URL + '/api/v1/habitations', data, config)
        .then(res => {
          console.log('投稿に成功しました')
          this.$emit('createHabitaion', res)
          this.$emit('closeDialog')
          this.description = ''
          this.setFlash({
            status: true,
            message: "投稿に成功しました"
          })
          setTimeout(() => {
            this.setFlash({
              status: false,
              message: ""
            })
          }, 2000)
        })
        .catch((error) => {
          console.log('投稿に失敗しました')
          console.log(error)
        })
    },
  },
  closeDialog () {
    this.$emit('closeDialog')
    console.log('クローズ')
  },
}
</script>