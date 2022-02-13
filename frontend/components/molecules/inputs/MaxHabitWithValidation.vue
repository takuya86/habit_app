<template>
  <ValidationProvider
    :name="$attrs.label"
    :rules="rules"
    v-slot="{ errors, valid }"
    :vid="$attrs.label"
  >
    <v-text-field
      v-model="min_target"
      label="ミニマム目標"
      rules="max:255|required"
    >
    </v-text-field>
    <v-text-field
      v-model="max_target"
      label="マックス目標"
      rules="max:255|required"
    >
    </v-text-field>
    <v-textarea
      v-model="inputValue"
      :error-messages="errors"
      :success="valid"
      v-bind="$attrs"
      v-on="$listeners"
    >
    </v-textarea>
  </ValidationProvider>
</template>
<script>
export default {
  props: {
    rules: {
      type: [Object, String],
      default: ''
    },
    value: {
      type: null
    }
  },
  data() {
    return {
    }
  },
  computed: {
    inputValue: {
      get() {
        return this.value
      },
      set(value) {
        this.$emit("input", value)
      }
    }
  },
}
</script>