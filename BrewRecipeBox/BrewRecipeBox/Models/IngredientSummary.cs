using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrewRecipeBox.Models
{
    public class IngredientSummary
    {
        public string Name { get; set; }
        public Decimal Quantity { get; set; }
        public string Unit { get; set; }
    }
}