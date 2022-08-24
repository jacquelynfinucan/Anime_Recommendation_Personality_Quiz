using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Anime_Recommendation_Personality_Quiz.Models
{
    public class AnimeShow
    {
        private int ShowId { get; set; }
        private string ShowTitle { get; set; }
        private string ShowDescription { get; set; }
        private int SincerityVsSatireScore { get; set; }
        private int LightVsHeavyScore { get; set; }
        private int SurfaceVsDepthScore { get; set; }
        private int OptimismVsPessimismScore { get; set; }
        private int FantasyVsRealityScore { get; set; }
        private int SentimentalityScore { get; set; }
        private int HumorScore { get; set; }
        private int RomanceScore { get; set; }
        private int ControversyScore { get; set; }

        /*
         * Incompatability score is an aggregate total of the UserPersonality scales' disparity with the fixed scores on the same scales
         * for each instance of anime show. This score will be determined after comparing the user's personality class to each show
         * after the quiz is completed. All of an anime show's scale scores are passed into the constructor; Incompatability score is
         * instatiated at 0.
         */
        private int IncompatibilityScore { get; set; } = 0; 

        public AnimeShow(int showId, string showTitle, int sincerityVsSatireScore, int lightVsHeavyScore, int surfaceVsDepthScore, 
            int optimismVsPessimismScore, int fantasyVsRealityScore, int sentimentalityScore, int humorScore, int romanceScore, 
            int controversyScore, string showDescription)
        {
            this.ShowId = showId;
            this.ShowTitle = showTitle;
            this.SincerityVsSatireScore = sincerityVsSatireScore;
            this.LightVsHeavyScore = lightVsHeavyScore;
            this.SurfaceVsDepthScore = surfaceVsDepthScore;
            this.OptimismVsPessimismScore = optimismVsPessimismScore;
            this.FantasyVsRealityScore = fantasyVsRealityScore;
            this.SentimentalityScore = sentimentalityScore;
            this.HumorScore = humorScore;
            this.RomanceScore = romanceScore;
            this.ControversyScore = controversyScore;
            this.ShowDescription = showDescription;
        }
    }
}
