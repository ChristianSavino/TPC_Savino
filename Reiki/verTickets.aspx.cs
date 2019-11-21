using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verTickets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            if (this.Session["idticket"] == null)
            {
                // Creo un DataTable sobre la variable session
                int pos = Convert.ToInt32(e.CommandArgument.ToString());
                this.Session["idticket"] = GridView1.Rows[pos].Cells[1].Text;
            }
            Response.Redirect("viewTickets.aspx");
        }
    }
}