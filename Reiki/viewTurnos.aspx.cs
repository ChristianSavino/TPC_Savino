using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class viewTurnos : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            VincularPacientes();
        }
    }
    private void VincularPacientes()
    {
        Paciente ct = new Paciente();
        SqlCommand cmd = ct.getPacientescmd();

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count != 0)
        {
            ddlPacientes.DataSource = dt;
            ddlPacientes.DataTextField = "Apellido y nombre";
            ddlPacientes.DataValueField = "id";
            ddlPacientes.DataBind();
            ddlPacientes.Items.Insert(0, new ListItem("-Seleccionar-", "0"));
        }
    }
    protected void VaciarTxt()
    {
        txtFecha.Text = "";
        txtTime.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Turnos usr = new Turnos();
        if (txtFecha.Text != "" && txtTime.Text != "")
        {
            usr.getPaciente(txtFecha.Text, txtTime.Text, ddlPacientes.SelectedIndex);
            Usuarios u = new Usuarios();
            u = (Usuarios)Session["Usuario"];

            if (usr.agregarTurno(usr,u) > 0)
            {
                Response.Write("<script>alert('Turno guardado corectamente')</script>");
                VaciarTxt();
            }
            else
            {
                Response.Write("<script>alert('No se pudo guardar el Turno')</script>");
                VaciarTxt();
            }
        }
        else
        {
            Response.Write("<script>alert('Se debe completar todos los campos')</script>");
        }
    }
}