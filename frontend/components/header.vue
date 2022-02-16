<template>
  <v-app-bar app dark>
    <v-toolbar-title>
      {{ appName }}
    </v-toolbar-title>
    <v-spacer />
    <v-btn v-if="!this.$auth.loggedIn" color="#FFF" plain to="/auth/signin">ログイン</v-btn>
    <v-btn v-if="!this.$auth.loggedIn" color="#FFF" plain to="/auth/signup">新規登録</v-btn>
    <v-btn v-if="this.$auth.loggedIn" color="#FFF" plain >マイページ</v-btn>
    <CreateHabitDialog />
    <v-btn v-if="this.$auth.loggedIn" color="#FFF" plain @click="$auth.logout()">ログアウト</v-btn>
  </v-app-bar>
</template>

<script>
import CreateHabitDialog from '~/components/organisms/CreateHabitDialog'
export default {
  components: {
    CreateHabitDialog,
  },
  data({ $config: { appName } }) {
    return {
      appName,
      drawer: false,
    }
  },
}
</script>
