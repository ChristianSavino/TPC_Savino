using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class homePaciente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Paciente p = new Paciente();
        p = (Paciente)Session["Paciente"];
        string text = "Bievenido Paciente: " + p.getNombre() + "!";
        welcometext.Text = text;
        p = null;
        text = null;
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int pos = Convert.ToInt32(e.CommandArgument.ToString());
            this.Session["idfactura"] = GridView1.Rows[pos].Cells[1].Text;
            Response.Redirect("verTicketm.aspx");
        }
    }
}