# Quiz Application

This project is a Quiz Application built using Vue.js for the frontend and Laravel for the backend. It allows users to take quizzes, view questions, and see their results.

## Features
1. User Authentication
2. Quiz Taking
3. Question Viewing
4. Result Viewing


## APIs:
1. Login
2. getQuiz

Project Structure:
 ### Frontend
* Login component
* Quiz component
  * Question component
    * Answer component
* Result component
 ### Backend
* User model
* Quiz model
* Question model
* Answer model
  * QuizService
    * QuizController


## Personal Notes
1. The new components I created are built with the Vue Composition API. I used the Options API where it was already used.
2. Since the database was already migrated in the file, I used a sql script to create my tables and seed them
I added a command in the Make file to run this script.
3. The default user credentials are in the app service provider. (credentials will not usually be pushed to git)
4. It was an interesting and fun project, I learned a lot. Thanks for the opportunity.