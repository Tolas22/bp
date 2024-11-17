<script setup>
import Navigator from "@/components/compositions/navigator/Navigator.vue";
import Question from "@/components/base/question/Question.vue";

const props = defineProps({
  quiz: {
    type: Object,
    required: true
  },
  score: {
    type: Number,
    required: true
  }
})

</script>

<template>
  <div class="results_container">
    <Navigator
        :items="[
  { text: props.quiz.title, to: `/feature/quiz` },
  { text: 'Quiz', to: '' }
  ]"
    />
    <div class="score">
      <h2>Scored: {{ props.score }}/{{ props.quiz.questions.length }}</h2>
    </div>
    <div class="results" >
      <div class="result" v-for="(question, index) in props.quiz.questions" :key="index">
      <Question :quiz="props.quiz" :question-index="index" :results="true"></Question>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.results_container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.score {
  width: 100%;
  background-color: #ecfdfe;
  position: absolute;
  top: 70px;
  left: 0;
  padding: 12px;
  display: flex;
  gap: 0.5rem;
  justify-content: center;
}


.results {
  margin-top: 120px;
  flex: 1;
  padding: 20px;

}
.result {
  position: relative;
  width: 100%;
  padding-bottom: 1px;
}
.result::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 50%;
  width: 100vw;
  height: 1px;
  background-color: grey;
  transform: translateX(-50%);
}
</style>