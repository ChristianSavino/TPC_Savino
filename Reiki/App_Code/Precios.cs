using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Precios
/// </summary>
public class Precios
{
    public Precios()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    private float Precio;
    Conexion con = new Conexion();
    public float getPrecio()
    {
        return Precio;
    }
    public void setPrecio(float idUsuario)
    {
        Precio = idUsuario;
    }
    public SqlCommand getPrecioscmd()
    {
        return con.DevuelveComando("Select * from precios");
    }
    //datos para el chart 
    public SqlCommand getPrecioscmdchart()
    {
        return con.DevuelveComando("SELECT MONTH(t.fecha) AS Mes, SUM(p.precio) AS TotalR FROM precios AS p INNER JOIN tickets AS t ON p.id = t.idprecio GROUP BY t.fecha, p.precio");
    }
    public SqlCommand getSexocmdchart()
    {
        return con.DevuelveComando("select COUNT(sexo) as cant, sexo from pacientes group by sexo");
    }
    //Guarda precio
    public int GrabarPrecio(float pre)
    {
        int valor = 0;
        Conexion datos = new Conexion();
        SqlConnection cn = datos.ObtenerConexion();
        if (cn != null)
        {
            SqlCommand cmd;
            String sql = "Insert into precios values(";
            sql += "'" + pre + "')";
            cmd = new SqlCommand(sql, cn);
            try
            {
                cmd.ExecuteNonQuery();
                valor = 1;
                return valor;

            }
            catch (SqlException ex)
            {
                return valor;
            }
            finally
            {
                cn.Close();
            }
        }
        else
            return valor;

    }
}