using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewPrecios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnagregar_Click(object sender, EventArgs e)
    {
        Precios usr = new Precios();
        if (txtPrecio.Text != "")
        {
            if (usr.GrabarPrecio(float.Parse(txtPrecio.Text)) > 0)
            {
                Response.Write("<script>alert('Precio guardado corectamente')</script>");
                VaciarTxt();
            }
            else
            {
                Response.Write("<script>alert('No se pudo guardar el Precio')</script>");
                VaciarTxt();
            }
        }
        else
        {
            Response.Write("<script>alert('Se debe completar todos los campos')</script>");
        }
    }
    protected void VaciarTxt()
    {
        txtPrecio.Text = "";
    }
}