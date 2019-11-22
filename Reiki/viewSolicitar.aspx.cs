using System;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class viewSolicitar : System.Web.UI.Page
{
    private void VincularUsuario()
    {
        Usuarios ct = new Usuarios();
        SqlCommand cmd = ct.getusuariocmd();

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count != 0)
        {
            ddlUsuario.DataSource = dt;
            ddlUsuario.DataTextField = "Apellido y nombre";
            ddlUsuario.DataValueField = "id";
            ddlUsuario.DataBind();
            ddlUsuario.Items.Insert(0, new ListItem("-Seleccionar-", "0"));
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            VincularUsuario();
        }
    }

    protected void btnSolicitar_click(object sender, EventArgs e)
    {
        Turnos t = new Turnos();
        Usuarios u = new Usuarios();
        Paciente p = new Paciente();
        p = (Paciente)Session["Paciente"];
        if (ddlUsuario.SelectedIndex != 0)
        {
            u.setIdUsuario(int.Parse(ddlUsuario.SelectedItem.Value));
            t.setFecha(txtFecha.Text);
            t.setHora(txtTime.Text);
            t.setIdPaciente(p.getId());
            if (t.agregarTurno(t,u) > 0)
            {
                Response.Write("<script>alert('Turno solicitado corectamente')</script>");
            }
            else
            {
                Response.Write("<script>alert('No se pudo solicitar el turno')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Se debe completar todos los campos')</script>");
        }
    }
}