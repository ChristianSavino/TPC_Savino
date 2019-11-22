using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class viewPagos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            VincularPaciente();
            VincularTipoPago();
            VincularPrecios();
        }
    }
    private void VincularPaciente()
    {
        Paciente ct = new Paciente();
        SqlCommand cmd = ct.getPacientesturnoscmd();

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count != 0)
        {
            ddlPaciente.DataSource = dt;
            ddlPaciente.DataTextField = "Apellido y nombre";
            ddlPaciente.DataValueField = "id";
            ddlPaciente.DataBind();
            ddlPaciente.Items.Insert(0, new ListItem("-Seleccionar-", "0"));
        }
    }
    private void VincularTipoPago()
    {
        Pagos ct = new Pagos();
        SqlCommand cmd = ct.getPagoscmd();

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count != 0)
        {
            ddlTipoPago.DataSource = dt;
            ddlTipoPago.DataTextField = "nombre";
            ddlTipoPago.DataValueField = "id";
            ddlTipoPago.DataBind();
            ddlTipoPago.Items.Insert(0, new ListItem("-Seleccionar-", "0"));
        }
    }
    private void VincularPrecios()
    {
        Precios ct = new Precios();
        SqlCommand cmd = ct.getPrecioscmd();

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count != 0)
        {
            ddlPago.DataSource = dt;
            ddlPago.DataTextField = "precio";
            ddlPago.DataValueField = "id";
            ddlPago.DataBind();
            ddlPago.Items.Insert(0, new ListItem("-Seleccionar-", "0"));
        }
    }
    protected void btnagregar_Click(object sender, EventArgs e)
    {
        Tickets usr = new Tickets();
        if (ddlPaciente.SelectedIndex != 0 && ddlTipoPago.SelectedIndex != 0 && ddlPago.SelectedIndex != 0)
        {
            usr.getTicket(int.Parse(ddlPaciente.SelectedItem.Value), int.Parse(ddlPago.SelectedIndex.ToString()), int.Parse(ddlTipoPago.SelectedIndex.ToString()));
            Turnos t = new Turnos();
            t.setIdPaciente(int.Parse(ddlPaciente.SelectedItem.Value));
            if (usr.agregarTicket(usr) > 0)
            {
                t.ActualizarMarca(t);
                Response.Write("<script>alert('Pago guardado corectamente')</script>");
            }
            else
            {
                Response.Write("<script>alert('No se pudo guardar el Pago')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Se debe completar todos los campos')</script>");
        }        
    }
}