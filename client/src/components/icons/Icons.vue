<template>
  <img
      v-if="props.visible"
      :class="{'result-icon': true}"
      :src="iconSrc"
      :alt="isCorrect ? 'Correct' : 'Incorrect'"
      :style="iconStyle"
      class="result-icon"
  />
</template>

<script setup>
import { computed } from 'vue';
// in charge of the icons output
const props = defineProps({
  visible: Boolean,
  isCorrect: Boolean,
});

const iconSrc = computed(() => {
  return props.isCorrect
      ? new URL('@/assets/check_circle.svg', import.meta.url).href
      : new URL('@/assets/times_circle.svg', import.meta.url).href;
});

// calculates the icon color
const iconStyle = computed(() => {
  return {
    fill: props.isCorrect ? 'green' : 'red',
  };
});
</script>

<style scoped>
.result-icon-success svg{
  fill: green;
}

.result-icon-fail svg{
  fill: red;
}
.result-icon {
  width: 20px;
  height: 20px;
  margin-left: 10px;
}
</style>
