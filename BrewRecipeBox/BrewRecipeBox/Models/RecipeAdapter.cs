using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrewRecipeBox.Models
{
    public class RecipeAdapter
    {
        
        public int RecipeId { get; set; }
        public string Name { get; set; }
        public string Style { get; set; }
        public User User { get; set; }
        public List<RecipeIngredientAdapter> RecipeIngredientList { get; set; }
        public List<Step> StepList { get; set; }
        public IbuCalculator IbuCalculator; // holds the appropriate calculation method for IBU
        public SrmCalculator SrmCalculator;
        public decimal BatchVolume { get; set; }
        
        public RecipeAdapter () 
        {
            getIbuCalculator();
            getSrmCalculator();            
        }

        private IbuCalculator getIbuCalculator()
        {
            if (User.UserSettings != null)
            {
                foreach (UserSetting mySetting in User.UserSettings)
                {
                    if (mySetting.UserSettingKey == "IBU_Calculator")
                    {
                        if (mySetting.UserSettingValue.ToUpper() == "RAGER")
                            return new IbuCalculatorRager();
                        else if (mySetting.UserSettingValue.ToUpper() == "TINSETH")
                            return new IbuCalculatorTinseth();
                        else return new IbuCalculatorRager();
                    }
                    else return new IbuCalculatorRager();
                }
            }
            return new IbuCalculatorRager();            
        }

        private SrmCalculator getSrmCalculator()
        {
            if (User.UserSettings != null)
            {
                foreach (UserSetting mySetting in User.UserSettings)
                {
                    if (mySetting.UserSettingKey == "SRM_Calculator")
                    {
                        if (mySetting.UserSettingValue.ToUpper() == "MOSHER")
                            return new SrmCalculatorMosher();
                        else if (mySetting.UserSettingValue.ToUpper() == "DANIELS")
                            return new SrmCalculatorDaniels();
                    }
                    else return new SrmCalculatorDefault();
                }
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