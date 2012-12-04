using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BrewRecipeBox.Models;

namespace BrewRecipeBox.Controllers
{
    public class IngredientController : Controller
    {
        private BrewDbEntities db = new BrewDbEntities();

        //
        // GET: /Ingredient/

        public ActionResult Index()
        {
            return View(db.Ingredients.ToList());
        }

        //
        // GET: /Ingredient/Details/5

        public ActionResult Details(int id = 0)
        {
            Ingredient ingredient = db.Ingredients.Single(i => i.IngredientId == id);
            if (ingredient == null)
            {
                return HttpNotFound();
            }
            return View(ingredient);
        }

        //
        // GET: /Ingredient/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Ingredient/Create

        [HttpPost]
        public ActionResult Create(Ingredient ingredient)
        {
            if (ModelState.IsValid)
            {
                db.Ingredients.AddObject(ingredient);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(ingredient);
        }

        //
        // GET: /Ingredient/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Ingredient ingredient = db.Ingredients.Single(i => i.IngredientId == id);
            if (ingredient == null)
            {
                return HttpNotFound();
            }
            return View(ingredient);
        }

        //
        // POST: /Ingredient/Edit/5

        [HttpPost]
        public ActionResult Edit(Ingredient ingredient)
        {
            if (ModelState.IsValid)
            {
                db.Ingredients.Attach(ingredient);
                db.ObjectStateManager.ChangeObjectState(ingredient, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(ingredient);
        }

        //
        // GET: /Ingredient/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Ingredient ingredient = db.Ingredients.Single(i => i.IngredientId == id);
            if (ingredient == null)
            {
                return HttpNotFound();
            }
            return View(ingredient);
        }

        //
        // POST: /Ingredient/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Ingredient ingredient = db.Ingredients.Single(i => i.IngredientId == id);
            db.Ingredients.DeleteObject(ingredient);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}