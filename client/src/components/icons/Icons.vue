<template>
  <component
      :is="iconComponent"
      v-if="props.visible"
      :class="['result-icon',
      props.isCorrect ? 'result-icon-success' : 'result-icon-fail'
      ]"
      :aria-label="isCorrect ? 'Correct' : 'Incorrect'"
      role="img"
  />
</template>

<script setup>
import { computed } from 'vue';
import CheckCircle from '@/assets/check_circle.svg?component';
import TimesCircle from '@/assets/times_circle.svg?component';
// in charge of the icons output
const props = defineProps({
  visible: Boolean,
  isCorrect: Number,
});

const iconComponent = computed(() => {
  return props.isCorrect ? CheckCircle : TimesCircle;
});

</script>

<style scoped>
.result-icon-success {
  color: green;
}

.result-icon-fail {
  color: red;
}
.result-icon {
  width: 20px;
  height: 20px;
  margin-left: 10px;
}
</style>
