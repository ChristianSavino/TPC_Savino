using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reiki : System.Web.UI.MasterPage
{
    public string ChartLabels = null;
    public string ChartData1 = null;
    public string ChartData2 = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.ChartData1 = "[0, 0, 0, 100, 300, 0, 0]";
        this.ChartData2 = "[2, 2]";

        //Call the Javascript function from C#
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DrawChart()", true);
    }
}
