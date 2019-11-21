using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewTickets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = int.Parse(Session["idticket"].ToString());
        Tickets tck = new Tickets();
        tck = tck.getTicketImpresion(id);
        numTicket.Text = "TICKET NUMERO: " + tck.getId();
        fechaTicket.Text = tck.getFecha().ToString();
        horaTicket.Text = DateTime.Now.Hour + ":" + DateTime.Now.Minute;
        Monto.Text = "$" + tck.getPrecio();
    }
}