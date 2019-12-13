using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verTicketm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = int.Parse(Session["idfactura"].ToString());
        Tickets tck = new Tickets();
        Paciente paciente = (Paciente)Session["Paciente"];
        tck = tck.getTicketImpresion(id);

        lblNumero.Text = tck.getId().ToString();
        lblFecha.Text = DateTime.Now.Date.ToString();
        lblId.Text = paciente.getId().ToString();//Id del paciente
        lblNombre.Text = paciente.getNombre()+" "+ paciente.getApellido();//Nombre y apellido del paciente
        lblTotal.Text = "$" + tck.getPrecio().ToString();

        //numTicket.Text = "TICKET NUMERO: " + tck.getId();
        //fechaTicket.Text = tck.getFecha().ToString();
        //horaTicket.Text = DateTime.Now.Hour + ":" + DateTime.Now.Minute;
        //Monto.Text = "$" + tck.getPrecio();
    }
}