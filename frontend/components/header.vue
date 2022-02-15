<template>
  <v-app-bar app dark>
    <v-toolbar-title>
      {{ appName }}
    </v-toolbar-title>
    <v-spacer />
    <v-btn v-if="!this.$auth.loggedIn" color="#FFF" plain to="/auth/login">ログイン</v-btn>
    <v-btn v-if="!this.$auth.loggedIn" color="#FFF" plain to="/auth/signup">新規登録</v-btn>
    <v-btn v-if="this.$auth.loggedIn" color="#FFF" plain to="/users/mypage">マイページ</v-btn>
    <v-btn v-if="this.$auth.loggedIn" rounded color="primary" dark>＋目標追加</v-btn>
    <CreateHabitDialog />
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
