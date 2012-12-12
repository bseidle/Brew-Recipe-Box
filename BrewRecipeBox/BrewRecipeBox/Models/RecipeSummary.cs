using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrewRecipeBox.Models
{
    public class RecipeSummary
    {
        
        public int RecipeId { get; set; }
        public string Name { get; set; }
        public string Style { get; set; }
        private User User { get; set; }
        public List<IngredientSummary> IngredientList { get; set; }
        public List<Step> StepList { get; set; }
        public IbuCalculator IbuCalculator; // holds the appropriate calculation method for IBU
        public SrmCalculator SrmCalculator;
        public decimal BatchVolume { get; set; }
        
        public RecipeSummary () 
        {
            getSrmCalculator();
            getIbuCalculator();
        }

        private IbuCalculator getIbuCalculator()
        {
            foreach (UserSetting mySetting in User.UserSettings)
            {
                if (mySetting.UserSettingKey == "IBU_Calculator")
                {
                    if(mySetting.UserSettingValue.ToUpper() == "RAGER")
                        return new IbuCalculatorRager();
                    else if (mySetting.UserSettingValue.ToUpper() == "TINSETH")
                        return new IbuCalculatorTinseth();
                    else return new IbuCalculatorRager();
                }
                else return new IbuCalculatorRager();
            }
            return new IbuCalculatorRager();            
        }

        private SrmCalculator getSrmCalculator()
        {
            foreach (UserSetting mySetting in User.UserSettings)
            {
                if (mySetting.UserSettingKey == "SRM_Calculator")
                {
                    if (mySetting.UserSettingValue.ToUpper() == "MOSHER")
                        return new SrmCalculatorMosher();
                    else if (mySetting.UserSettingValue.ToUpper() == "DANIELS")
                        return new SrmCalculatorDaniels();
                    else return new SrmCalculatorDefault();
                }
                else return new SrmCalculatorDefault();
            }
            return new SrmCalculatorDefault();
        }

        public decimal GetSrm()
        {
            decimal srm = 0;
          /* 
            decimal lovibond = 0;
            foreach(IngredientSummary myIngredient in IngredientList)
            {
                lovibond = (myIngredient.LovibondMin + myIngredient.LovibondMax)/2;
                srm += SrmCalculator.CalculateSrm(myIngredient.IngredientQuantity, lovibond, this.BatchVolume);
            }
            */
            return srm;
        }
        public decimal GetIbu() {
            return 0;
        }
    }
    
}