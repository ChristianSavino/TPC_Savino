using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Formulario : System.Web.UI.Page
{
    public string ChartLabels = null;
    public string ChartData1 = null;
    public string ChartData2 = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.ChartData1 = "[600, 500, 400, 100, 300, 100, 200]";
        this.ChartData2 = "[1, 2]";

        //Call the Javascript function from C#
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DrawChart()", true);
    }
}