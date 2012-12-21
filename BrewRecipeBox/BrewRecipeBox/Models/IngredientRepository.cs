using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrewRecipeBox.Models
{
    public class IngredientRepository
    {
        BrewDbEntities _db = new BrewDbEntities();

        public List<RecipeIngredientAdapter> GetIngredientsByRecipe(int recipeId)
        {
            return (from i in _db.Ingredients
                    join ri in _db.RecipeIngredients on i.IngredientId equals ri.IngredientId
                    join u in _db.Units on ri.UnitId equals u.UnitId
                    where ri.RecipeId == recipeId
                    select new RecipeIngredientAdapter
                    {
                        IngredientName = i.IngredientName,
                        IngredientDuration = ri.IngredientDuration,
                        /*AlphaMax = ri.Ingredient.AlphaMax,
                        AlphaMin = ri.Ingredient.AlphaMin,
                        AttenuationMax = ri.Ingredient.AttenuationMax,
                        AttenuationMin = ri.Ingredient.AttenuationMin,
                        BetaMax = ri.Ingredient.BetaMax,
                        BetaMin = ri.Ingredient.BetaMin,
                        Flocculation = ri.Ingredient.Flocculation,
                        LovibondMax = ri.Ingredient.LovibondMax,
                        LovibondMin = ri.Ingredient.LovibondMin,
                        YeastTempMax = ri.Ingredient.TempMax,
                        YeastTempMin = ri.Ingredient.TempMin,
                        PlatoMax = ri.Ingredient.PlatoMax,
                        PlatoMin = ri.Ingredient.PlatoMin,
                        */IngredientQuantity = ri.IngredientQuantity.Value,
                        IngredientUnit = u.UnitName
                    }).ToList();
        }
    }
}