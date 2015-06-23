using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using twitter_bootstrap_experiment.Library;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace twitter_bootstrap_experiment.Comparison
{
    public partial class RealAjax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            SelectionResults.Items.Clear();

            SearchResultsList.DataSource = MotorcycleHelper.SearchName(SearchBox.Text, 100)
                                            .OrderBy(m => m.Name)
                                            .ThenBy(m => m.Manufacturer)
                                            .ThenBy(m => m.Year);
            SearchResultsList.DataBind();
        }

        public class Result
        {
            public bool IsSuccess { get; set; }
            public string ErrorMessage { get; set; }
        }

        [WebMethod]
        public static string SaveMotorcycleList(string motorcycleListJson)
        {
            var result = new Result();

            // Save to database...

            result.IsSuccess = true;
            result.ErrorMessage = "";

            return new JavaScriptSerializer().Serialize(result);
        }

        [WebMethod]
        public static string SearchMotorcycleByName(string searchText)
        {
            var results = MotorcycleHelper.SearchName(searchText, 100)
                                            .OrderBy(m => m.Name)
                                            .ThenBy(m => m.Manufacturer)
                                            .ThenBy(m => m.Year);

            return new JavaScriptSerializer().Serialize(results);
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            SavedItems.Items.Clear();

            foreach (RadListBoxItem selection in SelectionResults.Items)
            {
                SavedItems.Items.Add(new RadListBoxItem(selection.Text, selection.Value));
            }
        }
    }
}