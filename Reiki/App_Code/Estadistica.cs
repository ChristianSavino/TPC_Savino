using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class Estadistica
{
    public Estadistica()
    {
         
         DataSet pagos = new DataSet();
    }

    public DataTable getPersonas()
    {
        Conexion con = new Conexion();

        DataTable personas = con.ObtenerTabla("personas", "Select COUNT(id) as 'Cant', sexo from pacientes GROUP BY sexo");

        return personas;
    }

    public DataTable getRecaudo()
    {
        Conexion con = new Conexion();

        DataTable recaudo = con.ObtenerTabla("Monto", "SELECT MONTH(t.fecha) AS Mes, Convert(int,SUM(p.precio)) AS TotalR FROM precios AS p INNER JOIN tickets AS t ON p.id = t.idprecio WHERE Year(t.fecha) = YEAR(GETDATE()) GROUP BY MONTH(t.fecha)");

        return recaudo;
    }
}