import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import user from './modules/user'

Vue.use(Vuex)

// Vuexの設定
export default new Vuex.Store({
  // ストアをモジュールに分けている場合。vuexのモジュールを指定
  modules: {
    user,
  },

  // `createPersistedState()`でインスタンス作成。引数に設定を書く
  plugins: [createPersistedState(
    { // ストレージのキーを指定。デフォルトではvuex
      key: 'HabiApp',

      // 管理対象のステートを指定。pathsを書かない時は`modules`に書いたモジュールに含まれるステート全て。`[]`の時はどれも保存されない
      paths: [
      ],

      // ストレージの種類を指定する。デフォルトではローカルストレージ
      storage: window.localStrage
    }
  )]
})