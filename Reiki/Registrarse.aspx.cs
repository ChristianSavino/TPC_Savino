using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registrarse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            VincularSexo();
        }
    }

    private void VincularSexo()
    {
        ListItem i;
        i = new ListItem("-Seleccionar-", "0");
        ddlSexo.Items.Add(i);
        i = new ListItem("Femenino", "F");
        ddlSexo.Items.Add(i);
        i = new ListItem("Masculino", "M");
        ddlSexo.Items.Add(i);
    }

    protected void VaciarTxt()
    {
        txtApellido.Text = "";
        txtDni.Text = "";
        txtDate.Text = "";
        txtNombre.Text = "";
        txtTel.Text = "";
    }

    public void btnRegistrar_Onclick(object sender, EventArgs e)
    {
        Usuarios u = new Usuarios();
        u.setNombre(txtNombre.Text);
        u.setTipo(2);
    }
}