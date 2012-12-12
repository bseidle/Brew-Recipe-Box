using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BrewRecipeBox;
using BrewRecipeBox.Models;
using NUnit.Framework;

namespace BrewRecipeBox_Test
{
    [TestFixture]
    public class RecipeRepositoryTest
    {
        
        
        [Test]
        public void GetRecipeSummariesByUser ()
        {
            //RecipeRepository myRepository = new RecipeRepository();
            //List<RecipeSummary> mySummaries = myRepository.GetRecipeSummariesByUser(1);

            //Assert.AreEqual(mySummaries.First().Name, "Brown Ale");

        }
        
        [Test]
        public void IbuCalculatorRager() 
        {
            IbuCalculatorRager myRager = new IbuCalculatorRager();
            Assert.AreEqual(23.080728306647853, myRager.CalculateIbu(1.0m, 5.0m, 1.010m, 60.0m, 5.0m));
            //Assert.AreEqual(18, myRager.CalculateIbu(1.0, 5.0, 1.010, 60.0, 5));

        }

        [Test]
        public void IbuCalculatorTinseth()
        {
            IbuCalculatorTinseth myTinseth = new IbuCalculatorTinseth();
            Assert.AreEqual(24.750580058918263411789564816, myTinseth.CalculateIbu(1m, 5m, 1.010m, 60m, 5.0m));
        }

        [Test]
        public void IbuCalculatorRagerNotEqualToTinseth()
        {
            IbuCalculatorRager myRager = new IbuCalculatorRager();
            IbuCalculatorTinseth myTinseth = new IbuCalculatorTinseth();

            Assert.AreNotEqual(myRager.CalculateIbu(1m, 5m, 1.010m, 60m, 5m), myTinseth.CalculateIbu(1m, 5m, 1.010m, 60m, 5m));
        }

        [Test]
        public void SrmCalculatorDefault()
        {
            SrmCalculatorDefault mySrm = new SrmCalculatorDefault();
            Assert.AreEqual(2.05983736438040541,mySrm.CalculateSrm(10m, 0.8m, 5.0m));
        }
        [Test]
        public void SrmCalculatorMosher()
        {
            SrmCalculatorMosher mySrm = new SrmCalculatorMosher();
            Assert.AreEqual(5.18m /*8.7200000000000006*/, mySrm.CalculateSrm(10m, 0.8m, 5.0m));
        }
        [Test]
        public void SrmCalculatorDaniels()
        {
            SrmCalculatorDaniels mySrm = new SrmCalculatorDaniels();
            Assert.AreEqual(8.72m/*5.1799999998999997*/, mySrm.CalculateSrm(10m, 0.8m, 5.0m));
        }
    }
}
