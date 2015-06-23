using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;

namespace twitter_bootstrap_experiment.Library
{
    public class MotorcycleHelper
    {
        private static List<string> manufacturers = new List<string> { "Honda", "BMW", "Ducati", "Aprilia", "Kawasaki", "Yamaha" };
        private static List<string> modelType = new List<string> { "Superbike", "Supersport", "Touring", "Cruiser" };

        /// <summary>
        /// Randomly generated list of fake motorcycles.
        /// </summary>
        /// <param name="count"></param>
        /// <returns></returns>
        public static IList<Motorcycle> GetAll(int count)
        {
            var motos = new List<Motorcycle>();

            int yearMinimum = 2005;
            int yearMaximum = 2015;
            int priceMinimum = 4000;
            int priceMaximum = 25000;

            for (int i = 0; i < count; i++)
            {
                Thread.Sleep(20); // Need sleep to get random numbers (if happens too fast - get the same number).
                var rand = new Random();

                var moto = new Motorcycle()
                {
                    Manufacturer = manufacturers[rand.Next(manufacturers.Count - 1)],
                    Name = modelType[rand.Next(modelType.Count - 1)],
                    Year = rand.Next(yearMinimum, yearMaximum),
                    Price = rand.Next(priceMinimum, priceMaximum)
                };

                moto.MotorcycleID = Guid.NewGuid();
                moto.Sku = GenerateSku(moto);

                motos.Add(moto);
            }

            return motos;
        }

        public static IList<Motorcycle> SearchName(string modelName, int count)
        {
            if (modelName != null)
                return GetAll(count).Where(m => m.Name.ToLower().Contains(modelName.ToLower())).ToList();
            else
                return new List<Motorcycle>();
        }

        private static int GenerateSku(Motorcycle motorcycle)
        {
            return GenerateID(manufacturers.IndexOf(motorcycle.Manufacturer), modelType.IndexOf(motorcycle.Name), motorcycle.Year);
        }

        /// <summary>
        /// Generate ID - should be same ID for same input values.
        /// </summary>
        /// <param name="manufacturerIndex"></param>
        /// <param name="modelTypeIndex"></param>
        /// <param name="year"></param>
        /// <returns></returns>
        private static int GenerateID(int manufacturerIndex, int modelTypeIndex, int year)
        {
            return new Random(year + (manufacturerIndex * 10000) + (modelTypeIndex * 100000)).Next();
        }
    }
}