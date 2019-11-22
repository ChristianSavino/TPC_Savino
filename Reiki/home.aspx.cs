using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Usuarios u = new Usuarios();
        u = (Usuarios)Session["Usuario"];
        string text = "Bievenido Reikista: " + u.getNombre() + "!";
        welcometext.Text = text;
        u = null;
        text = null;
    }
}