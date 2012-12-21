using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrewRecipeBox.Models
{
    public class RecipeRepository : IRecipeRepository
    {
        BrewDbEntities _db = new BrewDbEntities();

        public List<RecipeAdapter> GetRecipeSummariesByUser(int userId)
        {
            IngredientRepository myIngredients = new IngredientRepository();

            List<RecipeAdapter> myRecipes = 
                    (from r in _db.Recipes
                    join ri in _db.RecipeIngredients on r.RecipeId equals ri.RecipeId
                    join i in _db.Ingredients on ri.IngredientId equals i.IngredientId
                    //join rs in _db.RecipeSteps on r.RecipeId equals rs.RecipeId
                    where r.UserId == userId
                    select new RecipeAdapter
                    {
                        RecipeId = r.RecipeId,
                        Name = r.RecipeName,
                        User = r.User
                    }).ToList();

            foreach (RecipeAdapter myRecipeSummary in myRecipes)
            {
                myRecipeSummary.RecipeIngredientList = myIngredients.GetIngredientsByRecipe(myRecipeSummary.RecipeId);
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
                        IngredientQuantity = ri.IngredientQuantity.Value,
                        IngredientUnit = u.UnitName
                    }).ToList();
        }

        public void SaveRecipeEdits(RecipeAdapter recipeSummary)
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