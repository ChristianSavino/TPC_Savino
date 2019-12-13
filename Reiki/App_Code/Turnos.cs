using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Turnos
/// </summary>
public class Turnos
{
    public Turnos()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    private string Fecha;
    private string Hora;
    private int IdPaciente;
    private int Id;
    Conexion con = new Conexion();

    public int getId()
    {
        return Id;
    }
    public void setId(int id)
    {
        Id = id;
    }
    public string getFecha()
    {
        return Fecha;
    }
    public void setFecha(string id)
    {
        Fecha = id;
    }
    public string getHora()
    {
        return Hora;
    }
    public void setHora(string h)
    {
        Hora = h;
    }
    public int getIdPaciente()
    {
        return IdPaciente;
    }
    public void setIdPaciente(int id)
    {
        IdPaciente = id;
    }
    public DataRow getTablaTurnos(int id)
    {
        DataRow tabla = con.ObtenerRow("Turnos", "select * from turnos where id=" + id);
        return tabla;
    }
    public DataTable getTurnos(int id)
    {
        DataTable tabla = con.ObtenerTabla("Turnos", "select t.id as 'ids', p.dni as 'dni', p.apellido + ' ' + p.nombre as 'Apellidos', p.telefono as 'tel', t.fecha as 'fec', t.hora as 'hora', t.estado as 'estado' from turnos as t inner join pacientes as p on p.id=t.idpaciente WHERE t.idreiki = " + id.ToString());
        return tabla;
    }
    public SqlConnection getConexion()
    {
        return con.Conexiondb();
    }
    public int agregarTurno(Turnos cat, Usuarios u)
    {
        SqlCommand Comando = new SqlCommand();

        SqlParameter SqlParametros = new SqlParameter();
        SqlParametros = Comando.Parameters.Add("@fecha", SqlDbType.Date);
        SqlParametros.Value = cat.getFecha();
        SqlParametros = Comando.Parameters.Add("@hora", SqlDbType.VarChar);
        SqlParametros.Value = cat.getHora();
        SqlParametros = Comando.Parameters.Add("@idpaciente", SqlDbType.Int);
        SqlParametros.Value = cat.getIdPaciente();
        SqlParametros = Comando.Parameters.Add("@idreiki", SqlDbType.Int);
        SqlParametros.Value = u.getIdUsuario();

        return con.EjecutarSP(Comando, "spInsertarTurno");
    }
    public void getPaciente(string fecha, string hora, int id)
    {
        setFecha(fecha);
        setHora(hora);
        setIdPaciente(id);
    }

    public void ActualizarMarca(Turnos t)
    {
        try
        {
            SqlCommand cmd = new SqlCommand();
            SqlParameter parameter = new SqlParameter();
            parameter = cmd.Parameters.Add("@idpaciente", SqlDbType.Int);
            parameter.Value = t.getIdPaciente();
            con.ExecuteNonquery(cmd, "Update turnos set estado = 'abonado' Where estado = 'Concurrido' and idpaciente = @idpaciente");
        }
        catch (Exception ex)
        {
            throw;
        }

    }
    public void ActualizarEstado(int id, string estado)
    {
        try
        {
            SqlCommand cmd = new SqlCommand();
            SqlParameter parameter = new SqlParameter();
            parameter = cmd.Parameters.Add("@id", SqlDbType.Int);
            parameter.Value = id;
            parameter = cmd.Parameters.Add("@estado", SqlDbType.VarChar);
            parameter.Value = estado;
            con.ExecuteNonquery(cmd, "Update turnos set estado = @estado Where id = @id");
        }
        catch (Exception ex)
        {
            throw;
        }

    }
}