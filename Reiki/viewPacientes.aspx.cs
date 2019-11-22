using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewPacientes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            VincularSexo();
        }
    }
    protected void btnagregar_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtDni.Text != "" && txtNombre.Text != "" && txtApellido.Text != "" && txtTel.Text != "" && txtDate.Text != "" && ddlSexo.SelectedIndex != 0 && txtMail.Text != "" && txtClave.Text != "")
            {
                Paciente p = new Paciente();
                p.setDni(int.Parse(txtDni.Text));
                p.setNombre(txtNombre.Text);
                p.setApellido(txtApellido.Text);
                p.setTelefono(int.Parse(txtTel.Text));
                p.setFecha(DateTime.Parse(txtDate.Text));
                if (ddlSexo.SelectedIndex == 1)
                {
                    p.setSexo("F");
                }
                else
                {
                    p.setSexo("M");
                }
                p.setEmail(txtMail.Text);
                p.setClave(txtClave.Text);
                p.agregarPaciente(p);
                Response.Write("<script>alert('Paciente cargado')</script>");
            }
            else
            {
                Response.Write("<script>alert('Se debe completar todos los campos')</script>");
            }

        }
        catch (Exception)
        {
            Response.Write("<script>alert('Hubo un problema')</script>");
            throw;
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
        ddlSexo.SelectedIndex = 0;
        txtMail.Text = "";
        txtClave.Text = "";
    }
}