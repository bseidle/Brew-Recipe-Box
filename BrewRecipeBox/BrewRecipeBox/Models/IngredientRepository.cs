using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrewRecipeBox.Models
{
    public class IngredientRepository
    {
        BrewDbEntities _db = new BrewDbEntities();

        public List<IngredientSummary> GetIngredientsByRecipe(int recipeId)
        {
            return (from i in _db.Ingredients
                    join ri in _db.RecipeIngredients on i.IngredientId equals ri.IngredientId
                    join u in _db.Units on ri.UnitId equals u.UnitId
                    where ri.RecipeId == recipeId
                    select new IngredientSummary
                    {
                        Name = i.IngredientName,
                        Quantity = ri.IngredientQuantity.Value,
                        Unit = u.UnitName
                    }).ToList();
        }
    }
}