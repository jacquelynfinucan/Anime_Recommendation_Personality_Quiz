using System;
using System.Threading;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Anime_Recommendation_Personality_Quiz.DAO;
using Anime_Recommendation_Personality_Quiz.Models;
using System.IO;

namespace Anime_Recommendation_Personality_Quiz
{
    public class AnimeQuizCLI
    {
        private readonly IAnimeShowDao animeShowDao;
        private readonly IQuizQuestionDao quizQuestionDao;
        private readonly IAnswerDao answerDao;

        public AnimeQuizCLI(IAnimeShowDao animeShowDao, IQuizQuestionDao quizQuestionDao, IAnswerDao answerDao)
        {
            this.animeShowDao = animeShowDao;
            this.quizQuestionDao = quizQuestionDao;
            this.answerDao = answerDao;
        }

        public void Run()
        {
            

            Console.BackgroundColor = ConsoleColor.Blue;
            Console.Clear(); //required to make entire background the color
            Console.ForegroundColor = ConsoleColor.Black;

            Console.WriteLine("Hello, anime fans!");

            Console.WriteLine();
            instantiateData();

            Thread.Sleep(3000); //delays the script for 3 seconds in btwn so they don't appear all at once
            

            //Environment.Exit(0); //exits the console application

            //And we're just getting started!



        }

        public void instantiateData() 
        {
            // Instantiate lists for all anime shows, quiz questions, and answers from the d/b
            List<AnimeShow> animeShows = animeShowDao.GetAnimeShows();
            List<QuizQuestion> quizQuestions = quizQuestionDao.GetQuizQuestions();
            List<Answer> answers = answerDao.GetAnswers();

            /* 
             * This loop will populate a list of answers associated with each question and set them to that question's
             * Answers list property.
            */
            for (int i = 1; i < quizQuestions.Count; i++)
            {
                List<Answer> questionAnswers = new List<Answer>();
                foreach (Answer answer in answers)
                {
                    if (answer.QuestionId == i)
                    {
                        questionAnswers.Add(answer);
                    }
                }
                quizQuestions[i - 1].Answers = questionAnswers;
            }
            //Console.WriteLine(quizQuestions.Count);
            //Console.WriteLine(answers.Count);
            //Console.WriteLine(animeShows.Count);
        }
    }
}
