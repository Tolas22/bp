<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Quiz;
use App\Services\QuizService;

class QuizController extends Controller
{
    protected $quizService;

    public function __construct(QuizService $quizService)
    {
        $this->quizService = $quizService;
    }
    public function getQuiz(): \Illuminate\Http\JsonResponse
    {
        $quiz = $this->quizService->getQuiz();
        if (!$quiz) {
            return response()->json(['message' => 'No quizzes available'], 404);
        }
        return response()->json($quiz);
    }
}
