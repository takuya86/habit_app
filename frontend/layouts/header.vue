<template>
  <header>
    <v-app-bar app dark>
      <v-toolbar-title>
        {{ appName }}
      </v-toolbar-title>
      <v-spacer />
      <v-btn v-if="!this.$auth.loggedIn" color="#FFF" plain to="/users/login">ログイン</v-btn>
      <v-btn v-if="!this.$auth.loggedIn" color="#FFF" plain to="/users/signup">新規登録</v-btn>
      <v-btn v-if="!this.$auth.loggedIn" color="#FFF" plain>マイページ</v-btn>
      <v-btn v-if="this.$auth.loggedIn" rounded color="primary" dark>＋目標追加</v-btn>
    </v-app-bar>
  </header>
</template>

<script>
export default {
  data({ $config: { appName } }) {
    return {
      appName,
      drawer: false,
    }
  },
}
</script>
