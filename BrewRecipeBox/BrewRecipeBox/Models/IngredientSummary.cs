using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrewRecipeBox.Models
{
    public class IngredientSummary 
    {
        public int IngredientId { get; set; }
        public string IngredientName { get; set; }
        public int IngredientTypeId { get; set; }
        public string IngredientNote { get; set; }
        public decimal? AlphaMin { get; set; }
        public decimal? AlphaMax { get; set; }
        public decimal? LovibondMin { get; set; }
        public decimal? LovibondMax { get; set; }
        public decimal? BetaMin { get; set; }
        public decimal? BetaMax { get; set; }
        public decimal? AttenuationMax { get; set; }
        public decimal? AttenuationMin { get; set; }
        public decimal? PlatoMin { get; set; }
        public decimal? PlatoMax { get; set; }
        public string Flocculation { get; set; }
        public decimal? YeastTempMin { get; set; }
        public decimal? YeastTempMax { get; set; }
        public decimal IngredientQuantity { get; set; }
        public decimal? IngredientDuration { get; set; }
        public string Unit { get; set; }
        

    }

    public class MyIngredient
    {
        Ingredient theIngredient = new Ingredient();
        RecipeIngredient theRecipeIngredient = new RecipeIngredient();

 
    }
}