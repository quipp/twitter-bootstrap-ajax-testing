using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace twitter_bootstrap_experiment.Library
{
    public class Motorcycle
    {
        public Guid MotorcycleID { get; set; }
        public string Name { get; set; }
        public string Manufacturer { get; set; }
        public int Year { get; set; }
        public decimal Price { get; set; }
        public int Sku { get; set; }
        public string FullName { get { return string.Format("{0} - {1} - {2} - {3}", Manufacturer, Name, Year, MotorcycleID);  } }
    }
}