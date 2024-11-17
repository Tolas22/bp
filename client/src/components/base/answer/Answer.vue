<script setup>


const props = defineProps({
  answer: String,
  letter: String,
  selected: Boolean,
  results: Boolean,
  correct: Number,
})



</script>

<template>
  <div class="answer-container">
    <button class="answer-button"
            :class="{
              'selected': selected && !results,
              'correct': results && selected && correct,
              'incorrect': results && selected && !correct
            }"
            @click="$emit('select')"
            >
      <span class="answer-letter" :class="{'letter-selected':selected}">{{ letter }}</span>
      <span class="answer-text">{{ answer }}</span>
    </button>
  </div>
</template>

<style scoped lang="scss">
.answer-container {
  display: flex;
  align-items: center;
  width: 100%;
}
.answer-button {
  display: flex;
  align-items: center;
  width: 50px;
  background-color: white;
  border: 1px solid #ddd;
  box-shadow: 1px 2px 4px rgba(0, 0, 0, 0.1);
  border-radius: 12px;
  padding: 12px;
  margin-bottom: 10px;
  text-align: left;
  transition: all 0.3s ease;
  cursor: pointer;
  flex-grow: 1;
  position: relative;

  &:disabled {
    cursor: default;
    opacity: 0.7;
  }

  &:hover:not(:disabled) {
    background-color: #e0e0e0;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }
}

.answer-button:hover {
  background-color: #e0e0e0;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.answer-letter {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 30px;
  height: 30px;
  border: solid 2px #ddd;
  border-radius: 50%;
  margin-right: 15px;
  font-weight: bold;
  text-transform: uppercase;
}

.answer-text {
  flex-grow: 1;
  font-size: 16px;
}

.selected {
  background-color: #ecfdfe;
  border: 1px solid blue;
}

.correct {
  border: 2px solid green;
  background-color: #f1fff0;
}

.incorrect {
  border: 2px solid red;
  background-color: #fdf7f7;
}

.letter-selected {
  background-color: #ecfdfe;
  border: solid 2px #048281;
}

</style>