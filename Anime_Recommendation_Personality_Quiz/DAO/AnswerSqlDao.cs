using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Anime_Recommendation_Personality_Quiz.Models;


namespace Anime_Recommendation_Personality_Quiz.DAO
{
    public class AnswerSqlDao : IAnswerDao
    {
        private readonly string dbConnectionString;

        public AnswerSqlDao(string dbConnString)
        {
            dbConnectionString = dbConnString;
        }

        public List<Answer> GetAnswers()
        {
            return null; // implementation pending
        }
    }
}
