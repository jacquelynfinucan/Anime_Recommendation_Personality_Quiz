using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Anime_Recommendation_Personality_Quiz.Models;


namespace Anime_Recommendation_Personality_Quiz.DAO
{
    public class AnimeShowSqlDao : IAnimeShowDao
    {
        private readonly string dbConnectionString;

        public AnimeShowSqlDao(string dbConnString)
        {
            dbConnectionString = dbConnString;
        }

        public List<AnimeShow> GetAnimeShows()
        {
            return null; // implementation pending
        }
    }
}
