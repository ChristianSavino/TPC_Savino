using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Usuarios
/// </summary>
public class Usuarios
{
    public Usuarios()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    private int IdUsuario;
    private String Nombre;
    private String Apellido;
    private String Clave;
    private int Tipo;
    private String Email;
    private String Estado;
    Conexion con = new Conexion();

    public int getIdUsuario()
    {
        return IdUsuario;
    }
    public void setIdUsuario(int idUsuario)
    {
        IdUsuario = idUsuario;
    }
    public String getNombre()
    {
        return Nombre;
    }
    public void setNombre(String nombre)
    {
        Nombre = nombre;
    }
    public String getApellido()
    {
        return Apellido;
    }
    public void setApellido(String apellido)
    {
        Apellido = apellido;
    }
    public String getClave()
    {
        return Clave;
    }
    public void setClave(String clave)
    {
        Clave = clave;
    }
    public int getTipo()
    {
        return Tipo;
    }
    public void setTipo(int tipo)
    {
        Tipo = tipo;
    }
    public String getEmail()
    {
        return Email;
    }
    public void setEmail(String email)
    {
        Email = email;
    }
    public String getEstado()
    {
        return Estado;
    }
    public void setEstado(String estado)
    {
        Estado = estado;
    }

    public DataTable getTablaUsuario(int id)
    {
        DataTable tabla = con.ObtenerTabla("Usuarios", "select * from usuarios where id =" + id);
        return tabla;
    }
    public SqlConnection getConexion()
    {
        return con.Conexiondb();
    }
    public int agregarUsuario(Usuarios cat)
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

        return con.EjecutarSP(Comando, "spInsertarUsuario");
    }
    public bool getloginUsuario(Usuarios u)
    {
        SqlCommand cmd = new SqlCommand();
        SqlParameter parameter = new SqlParameter();
        parameter = cmd.Parameters.Add("@mail", SqlDbType.VarChar);
        parameter.Value = u.getEmail();
        parameter = cmd.Parameters.Add("@clave", SqlDbType.VarChar);
        parameter.Value = u.getClave();
        SqlDataReader reader = con.ObtenerReader(cmd, "Select * from usuarios Where email = @mail and clave = @clave");
        if (!reader.HasRows)
        {
            return false;
        }
        return true;
    }

    public Usuarios getUsuario(Usuarios us)
    {
        try
        {
            Usuarios u = new Usuarios();
            SqlCommand cmd = new SqlCommand();
            SqlParameter parameter = new SqlParameter();
            parameter = cmd.Parameters.Add("@mail", SqlDbType.VarChar);
            parameter.Value = us.getEmail();
            parameter = cmd.Parameters.Add("@clave", SqlDbType.VarChar);
            parameter.Value = us.getClave();
            SqlDataReader reader = con.ObtenerReader(cmd, "Select id,idtipo,nombre,apellido,clave,email from usuarios Where email = @mail and clave = @clave and estado = 1");
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    u.setNombre(reader.GetString(reader.GetOrdinal("nombre")));
                    u.setApellido(reader.GetString(reader.GetOrdinal("apellido")));
                    u.setIdUsuario(reader.GetInt32(reader.GetOrdinal("id")));
                    u.setTipo(reader.GetInt32(reader.GetOrdinal("idtipo")));
                    u.setEmail(reader.GetString(reader.GetOrdinal("email")));
                    u.setClave(reader.GetString(reader.GetOrdinal("clave")));
                    return u;
                }
            }
            return null;

        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
    public SqlCommand getusuariocmd()
    {
        return con.DevuelveComando("select id, nombre + ', ' + apellido as 'Apellido y nombre' from usuarios where estado = 1");
    }
    public void getUsuarios(int tipo, string nombre, string apellido, string email, string clave)
    {
        setTipo(tipo);
        setNombre(nombre);
        setApellido(apellido);
        setEmail(email);
        setClave(clave);
    }
}