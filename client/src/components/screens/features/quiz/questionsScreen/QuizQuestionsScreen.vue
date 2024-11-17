<template>
  <div class="questions_container">
  <Navigator
      :items="[
        { text: quiz.title, to: `/feature/quiz` },
        { text: 'Quiz', to: '' }
      ]"
  />

<Question :quiz="quiz" :questionIndex="questionIndex" :results="false"></Question>
  </div>
  <div class="footer">
    <div class="navigation-buttons">
      <BaseButton v-if="questionIndex> 0" :theme="BUTTON_THEMES.INVERTED" @click="back">Back</BaseButton>
      <BaseButton v-if="questionIndex < quiz.questions.length - 1" :theme="BUTTON_THEMES.SECONDARY" @click="next">Next</BaseButton>
      <BaseButton v-else :theme="BUTTON_THEMES.SECONDARY" @click="$emit('submitQuiz')">Submit</BaseButton>
    </div>
  </div>
</template>

<script>

import {THEMES as BUTTON_THEMES} from '@/components/base/button/config.js'
import Navigator from "@/components/compositions/navigator/Navigator.vue";
import BaseButton from "@/components/base/button/BaseButton.vue";
import Question from "@/components/base/question/Question.vue";

export default {
  name: 'QuizQuestionsScreen',
  components: {Question, BaseButton, Navigator},
  emits: ['submitQuiz'],
  props: {
    quiz: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      questionIndex: 0,
      BUTTON_THEMES,
    }
  },
  methods: {
    next() {
      if (this.questionIndex < this.quiz.questions.length - 1) {
        this.questionIndex++
      }
    },
    back() {
      if (this.questionIndex > 0) {
        this.questionIndex--
      }
    },
  }
}
</script>

<style lang="scss" scoped>
@import '@/utilities/css/vars/vars.scss';
.questions_container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  color: #343a41;
}
.footer {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  padding: 10px;
  background-color: #fff;
  border-top: 1px solid #e0e0e0;
  display: flex;
  justify-content: flex-end;
}
.navigation-buttons {
  display: flex;
  gap: 1rem;
  margin-right: 20px;
}

</style>
