<template>
  <div class="quiz_container">
    <div v-if="data">
      <QuizStartScreen v-if="quizState === QUIZ_STATES.START" :name="quiz.title" :questionsLength="quiz.questions.length" @start="start"></QuizStartScreen>
      <QuizQuestionsScreen v-if="quizState === QUIZ_STATES.QUESTIONS" :quiz="quiz" @submitQuiz="submitQuiz"></QuizQuestionsScreen>
      <QuizResultsScreen v-if="quizState === QUIZ_STATES.RESULT" :quiz="quiz" :score="score"></QuizResultsScreen>
    </div>
    <div v-else>Loading...</div>
  </div>
</template>

<script>
import QuizStartScreen from './startScreen/QuizStartScreen.vue'
import QuizQuestionsScreen from './questionsScreen/QuizQuestionsScreen.vue'
import QuizResultsScreen from "./resultsScreen/QuizResultsScreen.vue";
import {useUserStore} from "@/stores/user/index.js";


const QUIZ_STATES = {
  START: 'start',
  QUESTIONS: 'questions',
  RESULT: 'result'
}

export default {
  name: 'Quiz',
  components: {
    QuizResultsScreen,
    QuizStartScreen,
    QuizQuestionsScreen
  },
  props: {
    data: {
      type: Object,
      required: false
    }
  },
  data() {
    return {
      QUIZ_STATES,
      quizState: QUIZ_STATES.START,
      quiz:{},
      score: 0,
    }
  },
  methods: {
    start() {
      this.quizState = QUIZ_STATES.QUESTIONS
    },
    //fetch data
    async getQuiz() {
      try {
        const store = useUserStore()
        const token = store.token
        if (token) {
          const headers = {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': `Bearer ${token}`
          };
          fetch('/api/getQuiz', {
            method: 'GET',
            headers: headers
          })
              .then(response => response.json())
              .then(data => {
                this.quiz = data;
                console.log('Received data:', this.quiz);
              });
        }
      } catch (error) {
        console.error("Could not fetch quiz:", error);
      }

    },
    submitQuiz() {
      this.quiz.questions.forEach(question => {
        const selectedAnswer = question.answers.find(answer => answer.selected === true);
        if (selectedAnswer.is_correct) {
         this.score++
        }
      })
      this.quizState = QUIZ_STATES.RESULT
    }
  },
  mounted() {
    this.getQuiz()
  }
}
</script>

<style lang="scss" scoped>

</style>
