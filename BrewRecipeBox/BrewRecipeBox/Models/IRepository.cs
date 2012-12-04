using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrewRecipeBox.Models
{
    public interface IRepository
    {

        List<RecipeSummary> GetRecipeSummariesByUser(int userId);
        List<IngredientSummary> GetIngredientsByRecipe(int recipeId);

    }
}