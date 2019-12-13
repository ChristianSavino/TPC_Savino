using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Reiki : System.Web.UI.MasterPage
{
    public string ChartLabels = null;
    public string ChartData1 = null;
    public string ChartData2 = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        Estadistica es = new Estadistica();
        DataTable personas = es.getPersonas();
        DataTable recaudado = es.getRecaudo();
        string a = "[" + personas.Rows[0][0].ToString() + "," + personas.Rows[1][0].ToString() + "]";
        string b = null;
        b = "[";
        for (int i = 1; i < 13; i++)
        {
            if (i > 1)
            {
                b += ",";
            }
            for(int j = 0; j < recaudado.Rows.Count; j++)
            {
                int z = int.Parse(recaudado.Rows[(j)][0].ToString());
                if (z == i)
                {
                    string c = (recaudado.Rows[(j)][1].ToString());
                    b += c;
                    break;
                }
                if ((j+1) == recaudado.Rows.Count)
                {
                    b += "0";
                }
            }
        }
        b += "]";
        this.ChartData1 = b;
        this.ChartData2 = a;
        //Call the Javascript function from C#
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DrawChart()", true);

    }
}
