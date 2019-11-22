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
}