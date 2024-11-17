<template>
  <form class="login_form" @submit.prevent="submit">
    <BaseInput v-model="email" label="Username" />
    <BaseInput v-model="password" label="Password" type="password" />
    <span v-if="store.error" class="error">{{ store.error.data.message }}</span>
    <BaseButton type="submit" fullWidth>Log in</BaseButton>
  </form>
</template>

<script>
// COMPONENTS
import BaseInput from '@/components/base/input/BaseInput.vue'
import BaseButton from '@/components/base/button/BaseButton.vue'
import {useUserStore} from "@/stores/user/index.js";

export default {
  name: 'LoginForm',
  emits: ['submit'],
  components: {
    BaseInput,
    BaseButton
  },
  data() {
    return {
      email: '',
      password: '',
      store: useUserStore()
    }
  },
  methods: {
    submit() {
      this.$emit('submit', {
        email: this.email,
        password: this.password
      })
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/utilities/css/vars/vars.scss';
.login_form {
  width: 60%;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 20px;
  color: $ESSENTIALS_BLUE2;
  margin-block-start: 50px;
}
.error {
  color: red;
}
</style>
