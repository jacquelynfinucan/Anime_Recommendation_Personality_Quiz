using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Anime_Recommendation_Personality_Quiz.Models
{
    public class UserPersonality
    {
        /*
         * All user personality score defaults (on a scale of 0-20) are assumed to be the the most neutral position for the given scale,
         * and are moved in either direction based on how the user answers the questions of the personality quiz.
         * Some default values are marginally biased towards one extreme or the other on a given scale. This is to account for 
         * the varying amount of opportunities to move the scale in either direction when answering the quiz questions.
         */
        private int Sincerity_vs_Satire_Score { get; set; } = 10;
        private int Light_vs_Heavy_Score { get; set; } = 8;
        private int Surface_vs_Depth_Score { get; set; } = 8;
        private int Optimism_vs_Pessimism_Score { get; set; } = 10;
        private int Fantasy_vs_Reality_Score { get; set; } = 10;
        private int Sentimentality_Score { get; set; } = 10;
        private int Humor_Score { get; set; } = 0;
        private int Romance_Score { get; set; } = 0;
        private int Controversy_Score { get; set; } = 5;
    }

    public UserPersonality() { }
}
