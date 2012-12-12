using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BrewRecipeBox.Models;

namespace BrewRecipeBox.Controllers
{
    public class RecipeSummaryController : Controller
    {
        RecipeRepository repository = new RecipeRepository();
        //
        // GET: /RecipeSummary/

        public ActionResult Index()
        {
            var model = repository.GetRecipeSummariesByUser(1);
            
            return View(model);
        }

        //
        // GET: /RecipeSummary/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /RecipeSummary/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /RecipeSummary/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /RecipeSummary/Edit/5

        public ActionResult Edit(int id)
        {
            var model = repository.GetRecipeSummariesByUser(id).FirstOrDefault();

            return View(model);
            //return View();
        }

        //
        // POST: /RecipeSummary/Edit/5

        [HttpPost]
        public ActionResult Edit(RecipeSummary recipeSummary, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
                if (ModelState.IsValid)
                {
                    repository.SaveRecipeEdits(recipeSummary);
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /RecipeSummary/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /RecipeSummary/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
