using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrewRecipeBox.Models
{
    public class RecipeSummary
    {
        
        public int RecipeId { get; set; }
        public string Name { get; set; }
        public string Style { get; set; }
        private User User { get; set; }
        public List<IngredientSummary> IngredientList { get; set; }
        public List<Step> StepList { get; set; }

        public double calculate_SRM()
        {
            int myDouble;
            return myDouble = 0;
        }
        public double calculate_IBU()
        {
            int myDouble;
            return myDouble = 0;
        }
        public double calculate_ABV()
        {
            int myDouble;
            return myDouble = 0;
        }
        public double calculate_OG()
        {
            int myDouble;
            return myDouble = 0;
        }
        public double calculate_FG()
        {
            int myDouble;
            return myDouble = 0;
        }
    }
    
}