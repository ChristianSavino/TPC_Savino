using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class ModificarReikis : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            VincularTipo();
            Cargardatos();
        }
    }

    void Cargardatos()
    {
        Usuarios u = (Usuarios)Session["Usuario"];
        txtNombre.Text = u.getNombre();
        txtApellido.Text = u.getApellido();
        txtMail.Text = u.getEmail();
        txtClave.Text = u.getClave();
        ddlTipo.SelectedIndex = u.getTipo();
        u = null;
    }
    protected void btnmodificar_Click(object sender, EventArgs e)
    {
        Usuarios usr = (Usuarios)Session["Usuario"];
        if (txtApellido.Text != "" && txtClave.Text != "" && txtMail.Text != "" && txtNombre.Text != "")
        {
            usr.getUsuarios(int.Parse(ddlTipo.SelectedIndex.ToString()), txtNombre.Text, txtApellido.Text, txtMail.Text, txtClave.Text);

            if (usr.ModificarUsuario(usr) > 0)
            {
                Response.Write("<script>alert('Usuario actualizado corectamente')</script>");
                Session["Usuario"] = usr;
            }
            else
            {
                Response.Write("<script>alert('No se pudo actualizar el Usuario')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Se debe completar todos los campos')</script>");
        }
    }
    private void VincularTipo()
    {
        Tipos ct = new Tipos();
        SqlCommand cmd = ct.getTiposcmd();

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count != 0)
        {
            ddlTipo.DataSource = dt;
            ddlTipo.DataTextField = "nombre";
            ddlTipo.DataValueField = "id";
            ddlTipo.DataBind();
            ddlTipo.Items.Insert(0, new ListItem("-Seleccionar-", "0"));
        }
    }

    protected void VaciarTxt()
    {
        txtApellido.Text = "";
        txtClave.Text = "";
        txtMail.Text = "";
        txtNombre.Text = "";
    }
}