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
        Paciente usr = new Paciente();
        if (txtApellido.Text != "" && txtDate.Text != "" && txtDni.Text != "" && txtNombre.Text != "" && txtTel.Text != "")
        {
            usr.getPaciente(int.Parse(txtDni.Text), txtNombre.Text, txtApellido.Text, int.Parse(txtTel.Text), DateTime.Parse(txtDate.Text), ddlSexo.SelectedIndex.ToString());
            if (usr.getSexo() == "1")
            {
                usr.setSexo("F");
            }
            else
            {
                usr.setSexo("M");
            }
            if (usr.agregarPaciente(usr) > 0)
            {
                Response.Write("<script>alert('Usuario guardado corectamente')</script>");
                VaciarTxt();
            }
            else
            {
                Response.Write("<script>alert('No se pudo guardar el Usuario')</script>");
                VaciarTxt();
            }
        }
        else
        {
            Response.Write("<script>alert('Se debe completar todos los campos')</script>");
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
}