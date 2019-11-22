using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{

    public void btnIngresar_Onclick(object sender, EventArgs e)
    {
        try
        {
            Usuarios u = new Usuarios();
            u.setEmail(mail.Text);
            u.setClave(pass.Text);
            u = u.getUsuario(u);
            if (u != null)
            {
                Session["Usuario"] = u;
                Response.Redirect("home.aspx");
            }
            else
            {
                u = null;
                Paciente p = new Paciente();
                p.setEmail(mail.Text);
                p.setClave(pass.Text);
                p = p.getPacientelogin(p);
                if(p != null)
                {
                    Session["Paciente"] = p;
                    Response.Redirect("homePaciente.aspx");
                }

            }
            Response.Write("<script>alert('Login Incorrecto');</script>");
        }
        catch (Exception )
        {

        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}