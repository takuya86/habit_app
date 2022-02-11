<template>
  <div>
    <Header />
    <div v-if="this.$auth.loggedIn">
      テスト
    </div>
  </div>
</template>

<script>
import Header from '~/layouts/Header'
export default {
  components: {
    Header,
  },
}
</script>
