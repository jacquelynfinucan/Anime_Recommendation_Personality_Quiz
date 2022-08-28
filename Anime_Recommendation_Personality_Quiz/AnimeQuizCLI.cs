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

        // Declare lists for all anime shows, quiz questions, and answers from the d/b
        List<AnimeShow> animeShows;
        List<QuizQuestion> quizQuestions;
        List<Answer> answers;

        // Declare an instance of userPersonality representing the user
        UserPersonality userPersonality = new UserPersonality();

        // Declare an int for userSelection
        int userSelection = 0;

        // Declare a lowest incompatibility variable at max value
        int lowestIncompatibility = int.MaxValue;

        // Declare a list of show matches for the user
        List<AnimeShow> showMatches = new List<AnimeShow>();

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

            Console.WriteLine("Hello, anime fans!\n");

            instantiateData();

             //Thread.Sleep(3000); //delays the script for 3 seconds in btwn so they don't appear all at once

            /*
             * The quiz runs within a foreach loop which prints the questions and answers, takes user input, 
             * and adjusts their personality class based on their answers.
            */
            foreach (QuizQuestion question in quizQuestions)
            {

                Console.WriteLine($"\nQuestion #{question.QuestionId}: "); 
                Console.WriteLine(question.QuestionText + "\n");

                //Thread.Sleep(3000);

                // Inner loop will access the list of answers associated with that question and print them
                for (int i = 0; i < question.Answers.Count; i++)
                {
                    Console.WriteLine((i + 1) + ": " + question.Answers[i].AnswerText + "\n");
                    //Thread.Sleep(2000);

                }
                userSelection = promptForSelection(question.Answers.Count);

                // The answer the user selected will be at index userSelecion -1
                adjustUserPersonalityFromAnswer(question.Answers[userSelection - 1], userPersonality);
                userSelection = 0; // Redefined so promptForSelection will run 
            }

            userPersonality.adjustScoreOutliers();

            /*
             * After each question has been answered, the user's personality is fully completed on the same scales
             * as each anime show. Another loop compares the user's scales to the anime shows' scales and sets
             * an incompatibility score for each anime show based on aggregate disparity. It will also track the
             * lowest amount of incompatibility to determine the best show match(es) for the user.
            */
            foreach(AnimeShow show in animeShows)
            {
                int showIncompatibility = show.setAnimeShowIncompatibility(userPersonality);
                if(showIncompatibility < lowestIncompatibility)
                {
                    lowestIncompatibility = showIncompatibility;
                }
            }

            /*
             * Now that we have an incompatbility score for each show, and know the value of the lowest incompatibility, 
             * we can find all of the matches with that incompatability scoore to return to the user
            */
            foreach(AnimeShow show in animeShows)
            {
                if(show.IncompatibilityScore == lowestIncompatibility)
                {
                    showMatches.Add(show);
                }
            }

            // Print only the first 3 matches if there are more than 3, both matches if 2, or the 1 and only
            if (showMatches.Count > 2)
            {
                Console.WriteLine("We found some great anime matches for you. Here are three!\n");
                showMatches[0].printShow();
                showMatches[1].printShow();
                showMatches[2].printShow();
            }
            else if (showMatches.Count == 2) 
            {
                Console.WriteLine("We found two perfect anime matches for you!");
                showMatches[0].printShow();
                showMatches[1].printShow();
            }
            else
            {
                Console.WriteLine("Great news - We found your one and only ideal anime match!");
                showMatches[0].printShow();
            }

        }

        public void instantiateData()
        {
            // Instantiate lists for all anime shows, quiz questions, and answers from the d/b
            animeShows = animeShowDao.GetAnimeShows();
            quizQuestions = quizQuestionDao.GetQuizQuestions();
            answers = answerDao.GetAnswers();

            /* 
             * This loop will populate a list of answers associated with each question and set them to that question's
             * Answers list property.
            */
            for (int i = 1; i <= quizQuestions.Count; i++)
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
        public int promptForSelection(int amountOfAnswers)
        {
            while (userSelection < 1 || userSelection > amountOfAnswers)
            {
                Console.WriteLine("Please enter the number for your selection: ");
                while (!int.TryParse(Console.ReadLine(), out userSelection))
                {
                    Console.WriteLine("Oops, we didn't catch that. Please enter the number for your selection: ");
                }
                if (userSelection < 1 || userSelection > amountOfAnswers)
                {
                    Console.WriteLine("Oops, that number doesn't match an answer.");
                }
            }
            return userSelection;
        }
        public void adjustUserPersonalityFromAnswer(Answer selectedAnswer, UserPersonality userPersonality)
        {
            userPersonality.SincerityVsSatireScore += selectedAnswer.SincerityVsSatireImpact;
            userPersonality.LightVsHeavyScore += selectedAnswer.LightVsHeavyImpact;
            userPersonality.SurfaceVsDepthScore += selectedAnswer.SurfaceVsDepthImpact;
            userPersonality.OptimismVsPessimismScore += selectedAnswer.OptimismVsPessimismImpact;
            userPersonality.FantasyVsRealityScore += selectedAnswer.FantasyVsRealityImpact;
            userPersonality.SentimentalityScore += selectedAnswer.SentimentalityImpact;
            userPersonality.HumorScore += selectedAnswer.HumorImpact;
            userPersonality.RomanceScore += selectedAnswer.RomanceImpact;
            userPersonality.ControversyScore += selectedAnswer.ControversyImpact;
        }

    }
}
