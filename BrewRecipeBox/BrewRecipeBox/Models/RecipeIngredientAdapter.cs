using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrewRecipeBox.Models
{
    public class RecipeIngredientAdapter 
    {
        public int IngredientId { get; set; }
        public string IngredientName { get; set; }
        public int IngredientTypeId { get; set; }
        public int? IngredientDuration {get; set; }
        public decimal IngredientQuantity { get; set; }
        public string IngredientUnit { get; set; }
        public List<IngredientProperty> RecipeIngredientProps;
    
    }
}