using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class Horario
{
    private int horadesde;
    private int horahasta;

    public int GetHoraDesde()
    {
        return horadesde;
    }

    public void SetHoraDesde(int h)
    {
        horadesde = h;
    }

    public int GetHoraHasta()
    {
        return horahasta;
    }

    public void SetHoraHasta(int h)
    {
        horahasta = h;
    }

    public Horario GetHorario()
    {
        try
        {
            Horario h = new Horario();
            Conexion con = new Conexion();
            SqlCommand Comando = new SqlCommand();
            string query = "select horadesde,horahasta from horario;";
            SqlDataReader reader = con.ObtenerReader(Comando, query);
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    h.SetHoraDesde(reader.GetInt32(reader.GetOrdinal("horadesde")));
                    h.SetHoraHasta(reader.GetInt32(reader.GetOrdinal("horahasta")));
                    return h;
                }
            }
            return null;
        }
        catch (Exception ex)
        {
            throw;
        }
    }

    public int ActHorario(Horario h)
    {
        try
        {
            Conexion con = new Conexion();
            SqlCommand Comando = new SqlCommand();
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@horad", SqlDbType.Int);
            SqlParametros.Value = h.GetHoraDesde();
            SqlParametros = Comando.Parameters.Add("@horah", SqlDbType.Int);
            SqlParametros.Value = h.GetHoraHasta();
            string query = "Update horario set horadesde = @horad, horahasta = @horah;";
            con.ExecuteNonquery(Comando, query);
            return 1;
        }
        catch (Exception ex)
        {
            return 0;
        }
    }
    /*
          public int ModificarUsuario(Usuarios cat)
    {
        try
        {
            SqlCommand Comando = new SqlCommand();

            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@idTipo", SqlDbType.Int);
            SqlParametros.Value = cat.getTipo();
            SqlParametros = Comando.Parameters.Add("@nombre", SqlDbType.VarChar);
            SqlParametros.Value = cat.getNombre();
            SqlParametros = Comando.Parameters.Add("@apellido", SqlDbType.VarChar);
            SqlParametros.Value = cat.getApellido();
            SqlParametros = Comando.Parameters.Add("@clave", SqlDbType.VarChar);
            SqlParametros.Value = cat.getClave();
            SqlParametros = Comando.Parameters.Add("@email", SqlDbType.VarChar);
            SqlParametros.Value = cat.getEmail();
            string query = "Update usuarios Set nombre = @nombre, apellido = @apellido, idtipo = @idTipo, clave = @clave, email = @email Where id = " + cat.getIdUsuario();
            con.ExecuteNonquery(Comando, query);
            return 1;
        }
        catch (Exception)
        {
            return 0;
        }
    }*/
}