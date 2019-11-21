using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{

    protected void btnIngresar_Onclick(object sender, EventArgs e)
    {
        Usuarios u = new Usuarios();
        u.setEmail(mail.Text);
        u.setClave(pass.Text);
        bool logincorrecto = u.getloginUsuario(u);
        if (logincorrecto)
        {
            Response.Redirect("VerTurnos.aspx");
        }
        else
        {
            Response.Write("<script>alert('Login Incorrecto');</script>");
        }
    }

        protected void Page_Load(object sender, EventArgs e)
    {

    }
}