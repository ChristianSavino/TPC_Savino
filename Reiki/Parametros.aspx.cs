using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Parametros : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Horario h = (Horario)Session["Horario"];
            if (h != null)
            {
                txtdesde.Text = h.GetHoraDesde().ToString();
                txthasta.Text = h.GetHoraHasta().ToString();
            }
        }
    }

    protected void btnSolicitar_click(object sender, EventArgs e)
    {
        try
        {
            Horario h = new Horario();
            h.SetHoraDesde(int.Parse(txtdesde.Text));
            h.SetHoraHasta(int.Parse(txthasta.Text));
            if (h.GetHoraDesde() > h.GetHoraHasta())
            {
                Response.Write("<script>alert('Horario desde no puede ser mayor')</script>");
            }
            else if (h.GetHoraDesde() < 0 || h.GetHoraDesde() > 23)
            {
                Response.Write("<script>alert('Horario desde tiene que estar entre 0-23')</script>");
            }
            else if (h.GetHoraHasta() < 0 || h.GetHoraHasta() > 23)
            {
                Response.Write("<script>alert('Horario hasta tiene que estar entre 0-23')</script>");
            }
            else
            {
                if (h.ActHorario(h) == 1)
                {
                    Session["Horario"] = h;
                    Response.Write("<script>alert('Horario Actualizado')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Falló')</script>");
                }
            }

        }
        catch (Exception)
        {
            
        }

    }
}