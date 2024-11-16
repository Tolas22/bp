<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Services\QuizService;
use App\Models\Quiz;
use App\Models\Question;
use App\Models\Answer;

class QuizServiceTest extends TestCase
{
    use RefreshDatabase;

    protected $quizService;

    protected function setUp(): void
    {
        parent::setUp();
        $this->quizService = new QuizService();
    }

    public function testGetQuiz()
    {
        $quiz = Quiz::factory()->create();
        $question = Question::factory()->create(['quiz_id' => $quiz->id]);
        $answer = Answer::factory()->create(['question_id' => $question->id]);

        $result = $this->quizService->getQuiz();

        $this->assertEquals($quiz->id, $result->id);
        $this->assertEquals($question->id, $result->questions[0]->id);
        $this->assertEquals($answer->id, $result->questions[0]->answers[0]->id);
    }
}
