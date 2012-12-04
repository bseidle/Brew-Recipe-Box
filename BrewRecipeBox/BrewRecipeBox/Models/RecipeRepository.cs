using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrewRecipeBox.Models
{
    public class RecipeRepository : IRecipeRepository
    {
        BrewDbEntities _db = new BrewDbEntities();

        public List<RecipeSummary> GetRecipeSummariesByUser(int userId)
        {
            IngredientRepository myIngredients = new IngredientRepository();

            List<RecipeSummary> myRecipes = 
                    (from r in _db.Recipes
                    join ri in _db.RecipeIngredients on r.RecipeId equals ri.RecipeId
                    join i in _db.Ingredients on ri.IngredientId equals i.IngredientId
                    //join rs in _db.RecipeSteps on r.RecipeId equals rs.RecipeId
                    where r.UserId == userId
                    select new RecipeSummary
                    {
                        RecipeId = r.RecipeId,
                        Name = r.RecipeName,
                    }).ToList();

            foreach (RecipeSummary myRecipeSummary in myRecipes)
            {
                myRecipeSummary.IngredientList = myIngredients.GetIngredientsByRecipe(myRecipeSummary.RecipeId);
            }

            return myRecipes;
        }
    }
}