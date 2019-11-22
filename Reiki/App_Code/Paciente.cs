using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Pacientes
/// </summary>
public class Paciente
{
	public Paciente()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    private int Id;
    private String Nombre;
    private String Apellido;
    private int Telefono;
    private int Dni;
    private DateTime Fecha;
    private String Sexo;
    private String Clave;
    private String Email;
    private bool Estado;
    Conexion con = new Conexion();

    public int getId()
    {
        return Id;
    }
    public void setId(int id)
    {
        Id = id;
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
    public int getTelefono()
    {
        return Telefono;
    }
    public void setTelefono(int telefono)
    {
        Telefono = telefono;
    }
    public DateTime getFecha()
    {
        return Fecha;
    }
    public void setFecha(DateTime tipo)
    {
        Fecha = tipo;
    }
    public int getDni()
    {
        return Dni;
    }
    public void setDni(int dni)
    {
        Dni = dni;
    }
    public String getSexo()
    {
        return Sexo;
    }
    public void setSexo(String email)
    {
        Sexo = email;
    }
    public bool getEstado()
    {
        return Estado;
    }
    public void setEstado(bool estado)
    {
        Estado = estado;
    }
    public String getEmail()
    {
        return Email;
    }
    public void setEmail(String email)
    {
        Email = email;
    }
    public String getClave()
    {
        return Clave;
    }
    public void setClave(String clave)
    {
        Clave = clave;
    }
    public SqlCommand getPacientescmd()
    {
        return con.DevuelveComando("select id, convert(varchar(64),dni) + ', ' + nombre + ', ' + apellido as 'Apellido y nombre' from pacientes where estado = 1");
    }
    public DataTable getTablaPacientes(int id)
    {
        DataTable tabla = con.ObtenerTabla("Pacientes", "select * from pacientes where id=" + id);
        return tabla;
    }
    public SqlConnection getConexion()
    {
        return con.Conexiondb();
    }
    public int agregarPaciente(Paciente cat)
    {
        SqlCommand Comando = new SqlCommand();

        SqlParameter SqlParametros = new SqlParameter();
        SqlParametros = Comando.Parameters.Add("@dni", SqlDbType.Int);
        SqlParametros.Value = cat.getDni();
        SqlParametros = Comando.Parameters.Add("@nombre", SqlDbType.VarChar);
        SqlParametros.Value = cat.getNombre();
        SqlParametros = Comando.Parameters.Add("@apellido", SqlDbType.VarChar);
        SqlParametros.Value = cat.getApellido();
        SqlParametros = Comando.Parameters.Add("@telefono", SqlDbType.Int);
        SqlParametros.Value = cat.getTelefono();
        SqlParametros = Comando.Parameters.Add("@fecha", SqlDbType.Date);
        SqlParametros.Value = cat.getFecha();
        SqlParametros = Comando.Parameters.Add("@sexo", SqlDbType.VarChar);
        SqlParametros.Value = cat.getSexo();
        SqlParametros = Comando.Parameters.Add("@email", SqlDbType.Date);
        SqlParametros.Value = cat.getFecha();
        SqlParametros = Comando.Parameters.Add("@clavo", SqlDbType.VarChar);
        SqlParametros.Value = cat.getSexo();

        return con.EjecutarSP(Comando, "spInsertarPaciente");
    }

    public Paciente getPacientelogin(Paciente ps)
    {
        try
        {
            Paciente p = new Paciente();
            SqlCommand cmd = new SqlCommand();
            SqlParameter parameter = new SqlParameter();
            parameter = cmd.Parameters.Add("@mail", SqlDbType.VarChar);
            parameter.Value = ps.getEmail();
            parameter = cmd.Parameters.Add("@clave", SqlDbType.VarChar);
            parameter.Value = ps.getClave();
            SqlDataReader reader = con.ObtenerReader(cmd, "Select id,dni,nombre,apellido,telefono,fechanac,sexo,email,clave from pacientes Where email = @mail and clave = @clave and estado = 1");
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    p.setId(reader.GetInt32(reader.GetOrdinal("id")));
                    p.setDni(reader.GetInt32(reader.GetOrdinal("dni")));
                    p.setNombre(reader.GetString(reader.GetOrdinal("nombre")));
                    p.setApellido(reader.GetString(reader.GetOrdinal("apellido")));                  
                    p.setTelefono(reader.GetInt32(reader.GetOrdinal("telefono")));
                    p.setFecha(reader.GetDateTime(reader.GetOrdinal("fechanac")));
                    p.setSexo(reader.GetString(reader.GetOrdinal("sexo")));
                    p.setEmail(reader.GetString(reader.GetOrdinal("email")));
                    p.setClave(reader.GetString(reader.GetOrdinal("clave")));
                    return p;
                }
            }
            return null;

        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
    public void getPaciente(int dni, string nombre, string apellido, int telefono, DateTime email, string clave)
    {
        setDni(dni);
        setNombre(nombre);
        setApellido(apellido);
        setTelefono(telefono);
        setFecha(email);
        setSexo(clave);
    }
}