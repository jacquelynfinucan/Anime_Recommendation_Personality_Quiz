using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Anime_Recommendation_Personality_Quiz.Models;


namespace Anime_Recommendation_Personality_Quiz.DAO
{
    public class QuizQuestionSqlDao : IQuizQuestionDao
    {
        private readonly string dbConnectionString;

        public QuizQuestionSqlDao(string dbConnString)
        {
            dbConnectionString = dbConnString;
        }

        public List<QuizQuestion> GetQuizQuestions()
        {
            return null; // implementation pending
        }
    }
}
