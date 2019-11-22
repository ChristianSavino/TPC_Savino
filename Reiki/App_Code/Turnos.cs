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
    public DataTable getTablaTurnos(int id)
    {
        DataTable tabla = con.ObtenerTabla("Turnos", "select * from turnos where idpaciente=" + id);
        return tabla;
    }
    public DataTable getTurnos()
    {
        DataTable tabla = con.ObtenerTabla("Turnos", "sselect t.id, p.dni, p.apellido + ' ' + p.nombre as 'Apellido y nombre', p.telefono, t.fecha, t.hora, t.estado from turnos as t inner join pacientes as p on p.id=t.idpaciente");
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
}