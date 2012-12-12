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



        /**/
        //BrewDbEntities _db = new BrewDbEntities();
/*
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
                     }).Distinct().ToList();

            foreach (RecipeSummary myRecipeSummary in myRecipes)
            {
                myRecipeSummary.IngredientList = new List<IngredientSummary>(myIngredients.GetIngredientsByRecipe(myRecipeSummary.RecipeId));
            }

            return myRecipes;
        }
 */ 
        public List<IngredientSummary> GetIngredientsByRecipe(int recipeId)
        {
            return (from i in _db.Ingredients
                    join ri in _db.RecipeIngredients on i.IngredientId equals ri.IngredientId
                    join u in _db.Units on ri.UnitId equals u.UnitId
                    where ri.RecipeId == recipeId
                    select new IngredientSummary
                    {
                        IngredientName = i.IngredientName,
                        IngredientDuration = ri.IngredientDuration,
                        AlphaMax = ri.Ingredient.AlphaMax,
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
                        IngredientQuantity = ri.IngredientQuantity.Value,
                        Unit = u.UnitName
                    }).ToList();
        }

        public void SaveRecipeEdits(RecipeSummary recipeSummary)
        {
            //_db.RecipeIngredients.NameAddObject(recipeSummary);
            //_db.RecipeIngredients.AddObject(recipeIngredient);

            //_db.Recipes.Name = recipeSummary.Name;


            //_db.RecipeIngredients = recipeSummary.IngredientList;



            _db.SaveChanges();
            //return RedirectToAction("Index");


            //return View(ingredient);
            throw new NotImplementedException();
        }
    }
}