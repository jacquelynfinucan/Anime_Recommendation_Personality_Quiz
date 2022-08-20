using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Anime_Recommendation_Personality_Quiz
{
    public class Answer
    {
        private int AnswerId { get; set; }
        private string AnswerText { get; set; }
        private Dictionary<string, int> ScaleImpactScores { get; set; }

        public Answer() { }

        public Answer(int answerId, string answerText, Dictionary<string, int> scaleImpactScores) 
        {
            this.AnswerId = answerId;
            this.AnswerText = answerText;
            this.ScaleImpactScores = scaleImpactScores;
        }
    }
}
