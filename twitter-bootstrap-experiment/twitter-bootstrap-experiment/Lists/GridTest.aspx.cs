using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace twitter_bootstrap_experiment.Lists
{
    public partial class GridTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Grid_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                var Filter = (GridFilteringItem)e.Item;
                Filter["MotorcycleID"].CssClass = "bm-responsive-column";
                Filter["Sku"].CssClass = "bm-responsive-column";
            }
        }
    }
}