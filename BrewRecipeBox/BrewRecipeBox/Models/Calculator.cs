using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

// IBU Formulas found at:
//http://www.rooftopbrew.net/ibu.php
//http://www.rockhoppersbrewclub.com/wiki/calculating-ibus

//SRM formula found at:
//http://www.homebrewtalk.com/f12/srm-calculations-promash-64792/


namespace BrewRecipeBox.Models
{
    public abstract class IbuCalculator
    {
        public abstract decimal CalculateIbu(decimal hopWeightOz, decimal volumeGal, decimal gravity, decimal time, decimal alphaAcid);
    }

    public class IbuCalculatorRager : IbuCalculator
    {
        public override decimal CalculateIbu(decimal hopWeightOz, decimal volumeGal, decimal gravity, decimal time, decimal alphaAcid)
        {
            decimal utilization = 18.11m + 13.86m * (decimal)System.Math.Tanh((double)((time - 31.32m) / 18.27m));
            decimal boilgravity = 0;

            if (gravity > 1.050m)
                boilgravity = (gravity - 1.050m) / .2m;

            return (hopWeightOz * utilization / 100 * alphaAcid / 100 * 7489) / (volumeGal * 1 + boilgravity);
        }
    }

    public class IbuCalculatorTinseth : IbuCalculator
    {
        public override decimal CalculateIbu(decimal hopWeightOz, decimal volumeGal, decimal gravity, decimal time, decimal alphaAcid)
        {
            //return (hopWeightOz * time * alphaAcid * 7489) / (volumeGal * gravity);
            return (decimal)(1.65m * (decimal)System.Math.Pow(0.000125, ((double)gravity - 1))) * (decimal)(1 - System.Math.Pow(Math.E, (double)(-0.04m * time))) / 4.15m * (decimal)((alphaAcid / 100 * hopWeightOz * 7490) / volumeGal);
        }
    }

    public abstract class SrmCalculator
    {
        public abstract decimal CalculateSrm(decimal grainWeightPounds, decimal lovibondRating, decimal gallons);
    }

    public class SrmCalculatorDefault : SrmCalculator
    {
        public override decimal CalculateSrm(decimal grainWeightPounds, decimal lovibondRating, decimal gallons)
        {
            decimal mcu = grainWeightPounds * lovibondRating / gallons;
            decimal srm = 1.4922m * (decimal)(System.Math.Pow((double)mcu, 0.6859)); 
            return srm;
        }
    }

    public class SrmCalculatorMosher: SrmCalculator
    {
        public override decimal CalculateSrm(decimal grainWeightPounds, decimal lovibondRating, decimal gallons)
        {
            decimal mcu = grainWeightPounds * lovibondRating / gallons;
            decimal srm = (mcu * .3m) + 4.7m;
            return srm;
        }
    }

    public class SrmCalculatorDaniels : SrmCalculator
    {
        public override decimal CalculateSrm(decimal grainWeightPounds, decimal lovibondRating, decimal gallons)
        {
            decimal mcu = grainWeightPounds * lovibondRating / gallons;
            decimal srm = (mcu * .2m) + 8.4m;
            return srm;
        }
    }
}