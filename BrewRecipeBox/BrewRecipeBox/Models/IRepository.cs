using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrewRecipeBox.Models
{
    public interface IRepository
    {

        List<RecipeAdapter> GetRecipeSummariesByUser(int userId);
        List<RecipeIngredientAdapter> GetIngredientsByRecipe(int recipeId);

    }
}