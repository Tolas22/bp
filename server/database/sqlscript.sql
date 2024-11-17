-- Drop Tables if exist
DROP TABLE IF EXISTS quizzes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS answers;

-- Create the quiz table
CREATE TABLE quizzes (
                         id INTEGER PRIMARY KEY AUTOINCREMENT,
                         title TEXT NOT NULL
);

-- Create the questions table
CREATE TABLE questions (
                           id INTEGER PRIMARY KEY AUTOINCREMENT,
                           quiz_id INTEGER,
                           question_text TEXT NOT NULL,
                           FOREIGN KEY (quiz_id) REFERENCES quizzes(id)
);

-- Create the answers table
CREATE TABLE answers (
                         id INTEGER PRIMARY KEY AUTOINCREMENT,
                         question_id INTEGER,
                         answer_text TEXT NOT NULL,
                         is_correct BOOLEAN NOT NULL,
                         FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- Insert quizzes
INSERT INTO quizzes (title) VALUES
                                ('Guitar Quiz'),
                                ('Snowboarding Quiz');

-- Insert questions and answers for Guitar Quiz
INSERT INTO questions (quiz_id, question_text) VALUES
                                                   (1, 'What is the standard number of strings on a guitar?'),
                                                   (1, 'Which of these is not a common type of guitar?'),
                                                   (1, 'What is the name of the device used to change the pitch of guitar strings?'),
                                                   (1, 'Which wood is commonly used for guitar fretboards?'),
                                                   (1, 'What does "ESP" stand for in the guitar brand ESP?');

INSERT INTO answers (question_id, answer_text, is_correct) VALUES
                                                               (1, '4', 0), (1, '5', 0), (1, '6', 1), (1, '7', 0),
                                                               (2, 'Acoustic', 0), (2, 'Electric', 0), (2, 'Bass', 0), (2, 'Trumpet', 1),
                                                               (3, 'Capo', 0), (3, 'Whammy bar', 1), (3, 'Pick', 0), (3, 'Strap', 0),
                                                               (4, 'Pine', 0), (4, 'Rosewood', 1), (4, 'Oak', 0), (4, 'Birch', 0),
                                                               (5, 'Electric String Production', 1), (5, 'Extra Special Performance', 0), (5, 'Enhanced Sound Power', 0), (5, 'Excellent String Precision', 0);

-- Insert questions and answers for Snowboarding Quiz
INSERT INTO questions (quiz_id, question_text) VALUES
                                                   (2, 'What is the term for riding with your left foot forward?'),
                                                   (2, 'Which of these is not a snowboarding style?'),
                                                   (2, 'What does "POW" mean in snowboarding slang?'),
                                                   (2, 'Which of these is not a common snowboard shape?'),
                                                   (2, 'What is the purpose of waxing a snowboard?');

INSERT INTO answers (question_id, answer_text, is_correct) VALUES
                                                               (6, 'Regular', 1), (6, 'Goofy', 0), (6, 'Switch', 0), (6, 'Fakie', 0),
                                                               (7, 'Freestyle', 0), (7, 'Freeride', 0), (7, 'All-mountain', 0), (7, 'Speedride', 1),
                                                               (8, 'Power', 0), (8, 'Powder', 1), (8, 'Push', 0), (8, 'Pull', 0),
                                                               (9, 'Directional', 0), (9, 'Twin', 0), (9, 'Asymmetrical', 0), (9, 'Circular', 1),
                                                               (10, 'To make it shiny', 0), (10, 'To protect it from rust', 0), (10, 'To reduce friction', 1), (10, 'To increase weight', 0);
