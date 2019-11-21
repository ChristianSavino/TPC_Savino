using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Conexion
/// </summary>
public class Conexion
{
	public Conexion()
	{
        // TODO: Agregar aquí la lógica del constructor
	}
    private string rutaBD = "Data Source=localhost\\sqlexpress;Initial Catalog=Savino_DB;Integrated Security=True";
    public SqlConnection ObtenerConexion()
    {
        SqlConnection cn = new SqlConnection(rutaBD);
        try
        {
            cn.Open();
            return cn;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public SqlConnection Conexiondb()
    {
        SqlConnection cn = new SqlConnection(rutaBD);
        try
        {
            cn.Open();
            return cn;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    private SqlDataAdapter ObtenerAdaptador(String consultaSql, SqlConnection cn)
    {
        SqlDataAdapter adaptador;
        try
        {
            adaptador = new SqlDataAdapter(consultaSql, rutaBD);
            return adaptador;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public DataTable ObtenerTabla(String NombreTabla, String Sql)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlConnection Conexion = ObtenerConexion();
            SqlDataAdapter adp = ObtenerAdaptador(Sql, Conexion);
            adp.Fill(ds, NombreTabla);
            Conexion.Close();
            return ds.Tables[NombreTabla];
        }
        catch (Exception ex)
        {
            return null;
        }

    }

    public int EjecutarSP(SqlCommand Comando, String NombreSP)
    {
        //int FilasCambiadas;
        SqlConnection Conexion = ObtenerConexion();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd = Comando;
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            int FilasCambiadas = int.Parse(cmd.ExecuteScalar().ToString());
            Conexion.Close();
            return FilasCambiadas;
        }
        catch (Exception ex)
        {
            string msj = ex.Message;
            return 0;
        }
    }
    public int EjecutarSPInserta(SqlCommand Comando, String NombreSP)
    {
        int FilasCambiadas;
        SqlConnection Conexion = ObtenerConexion();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd = Comando;
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            FilasCambiadas = cmd.ExecuteNonQuery();
            Conexion.Close();
            return FilasCambiadas;
        }
        catch (Exception ex)
        {
            string msj = ex.Message;
            return 0;
        }
    }
    public SqlDataReader ObtenerReader(SqlCommand Comando, String ConsultaSQL)
    {
        SqlConnection con = ObtenerConexion();
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd = Comando;
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = ConsultaSQL;
            SqlDataReader reader = cmd.ExecuteReader();
            return reader;
        }
        catch (Exception)
        {
            throw;
        }
    }
    public SqlCommand DevuelveComando(string consulta)
    {
        try
        {
            SqlConnection con = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, con);

            //cmd.ExecuteReader();
            return cmd;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
}