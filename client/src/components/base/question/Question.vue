<script setup>
import Answer from "@/components/base/answer/Answer.vue";

const props = defineProps({
  quiz: Object,
  questionIndex: Number,
  results: Boolean
})


const selectAnswer = (answer) => {
  if (!props.results) {
    props.quiz.questions[props.questionIndex].answers.forEach(a => a.selected = false)
    answer.selected = true;
  }

}
</script>

<template>
  <div class="questions">
    <div class="question_title">
      <h2>{{ props.questionIndex + 1 }}</h2>
      <p>{{ quiz.questions[props.questionIndex].question_text }}</p>
    </div>
    <ul>
      <li v-for="(answer, index) in quiz.questions[questionIndex].answers" :key="index">
        <Answer :letter="String.fromCharCode(65 + index)"
                :answer="answer.answer_text"
                :selected="answer.selected"
                :correct="answer.is_correct"
                :results="results"
                @select="selectAnswer(answer)"></Answer>
      </li>
    </ul>
  </div>
</template>

<style scoped lang="scss">
.question_title {
  display: flex;
  align-items: center;
}

.question_title h2 {
  font-size: 2rem;
  margin-right: 1rem;
}
</style>