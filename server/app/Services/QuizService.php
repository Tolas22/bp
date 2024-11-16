<?php

namespace App\Services;

use App\Models\Quiz;

class QuizService
{
    public function getQuiz()
    {
        return Quiz::with(['questions.answers'])
            ->inRandomOrder()
            ->first();
    }

}
