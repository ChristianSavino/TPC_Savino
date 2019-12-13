using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class verTurnos : System.Web.UI.Page
{
    Turnos gTurnos = new Turnos();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cargarGridView();
        }
    }

    private void cargarGridView()
    {
        Usuarios u = (Usuarios)Session["Usuario"];
        gvTurnos.DataSource = gTurnos.getTurnos(u.getIdUsuario());
        gvTurnos.DataBind();
    }

    protected void Paginar(object sender, GridViewPageEventArgs e)
    {
        gvTurnos.PageIndex = e.NewPageIndex;
        cargarGridView();
    }

    protected void gvTurnos_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvTurnos.EditIndex = e.NewEditIndex;

            int id = Convert.ToInt32(gvTurnos.DataKeys[e.NewEditIndex].Value);
            DataRow row = gTurnos.getTablaTurnos(id);

            cargarGridView();

            DropDownList combo = gvTurnos.Rows[e.NewEditIndex].FindControl("ddlEstado") as DropDownList;

            combo.SelectedValue = Convert.ToString(row["estado"]);
        }
        catch (Exception ex)
        {
            throw;
        }
    }
    protected void gvTurnos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvTurnos.EditIndex = -1;
        cargarGridView();
    }
    protected void gvTurnos_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gvTurnos.DataKeys[e.RowIndex].Value);

        DropDownList combo = gvTurnos.Rows[e.RowIndex].FindControl("ddlEstado") as DropDownList;
        string estado = combo.SelectedValue;


        gTurnos.ActualizarEstado(id, estado);

        gvTurnos.EditIndex = -1;
        cargarGridView();
    }
}