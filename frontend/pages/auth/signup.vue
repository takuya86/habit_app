<template>
  <article>
    <v-form>
      <Notification :message="error" v-if="error" class="mb-4 pb-3" />
      <v-card width="400px">
        <v-card-title class="headline">新規登録</v-card-title>
        <v-card-text>
          <v-text-field
            v-model="user.name"
            label="名前"
            prepend-icon="mdi-account"
          >
          </v-text-field>
          <v-text-field
            v-model="user.email"
            label="メールアドレス"
            prepend-icon="mdi-mail"
          >
          </v-text-field>
          <v-text-field
            v-model="user.password"
            label="パスワード"
            prepend-icon="mdi-lock"
            :append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
            :type="show ? 'text' : 'password'"
            hint="最小6文字"
            counter
            @click:append="show = !show"
          >
          </v-text-field>
        </v-card-text>
        <!-- アクションボタン -->
        <v-card-actions>
          <v-btn @click="signup">新規登録</v-btn>
        </v-card-actions>
      </v-card>
    </v-form>
  </article>
</template>

<script>
import Header from '~/components/Header'
export default {
  components: {
    Header,
  },
  auth: false,
  data() {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        error: null,
      },
      show: false,
    }
  },
  methods: {
    async signup() {
      try {
        await this.$axios.post('http://localhost:5000/api/v1/auth', {
          name: this.user.name,
          email: this.user.email,
          password: this.user.password,
        })
        await this.$auth.loginWith('local', {
          data: {
            email: this.user.email,
            password: this.user.password,
          },
        })
      } catch (e) {
        console.log(e), (this.error = e.response.data.errors.full_messages)
        console.log(e.response.data)
      }
    },
  },
}
</script>