<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;

class QuizContorller extends Controller
{
    protected $quizService;

    public function __construct(QuizService $quizService)
    {
        $this->quizService = $quizService;
    }
    public function show()
    {
        return view('quiz');
    }
}
