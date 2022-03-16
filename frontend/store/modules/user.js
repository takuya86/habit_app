export const strict = false

export const state = () => ({
  user: null
})

export const mutations = {
  setUser(state, payload) {
    state.user = payload
  },
  logout(state) {
    state.user = null
  }
}

export const actions = {
  setUser(context, user) {
    context.commit('setUser', user)
  },
}