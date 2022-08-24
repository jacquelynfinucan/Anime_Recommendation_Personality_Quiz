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
        public int QuestionId { get; set; }
        private string AnswerText { get; set; }
        private int SincerityVsSatireImpact { get; set; }
        private int LightVsHeavyImpact { get; set; }
        private int SurfaceVsDepthImpact { get; set; }
        private int OptimismVsPessimismImpact { get; set; }
        private int FantasyVsRealityImpact { get; set; }
        private int SentimentalityImpact { get; set; }
        private int HumorImpact { get; set; }
        private int RomanceImpact { get; set; }
        private int ControversyImpact { get; set; }

        public Answer() { }

        public Answer(int answerId, int questionId, string answerText, int sincerityVsSatireImpact, int lightVsHeavyImpact,
            int surfaceVsDepthImpact, int optimismVsPessimismImpact, int fantasyVsRealityImpact, int sentimentalityImpact,
            int humorImpact, int romanceImpact, int controversyImpact) 
        {
            this.AnswerId = answerId;
            this.QuestionId = questionId;
            this.AnswerText = answerText;
            this.SincerityVsSatireImpact = sincerityVsSatireImpact;
            this.LightVsHeavyImpact = lightVsHeavyImpact;
            this.SurfaceVsDepthImpact = surfaceVsDepthImpact;
            this.OptimismVsPessimismImpact = optimismVsPessimismImpact;
            this.FantasyVsRealityImpact = fantasyVsRealityImpact;
            this.SentimentalityImpact = sentimentalityImpact;
            this.HumorImpact = humorImpact;
            this.RomanceImpact = romanceImpact;
            this.ControversyImpact = controversyImpact;
           }
    }
}
