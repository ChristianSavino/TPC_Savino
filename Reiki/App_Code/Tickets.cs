using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Tickets
/// </summary>
public class Tickets
{
    public Tickets()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    private int IdTurno;
    private int Precio;
    private DateTime Fecha;
    private int IdPago;
    Conexion con = new Conexion();
    private int IdP;
    private string Nombre;

    public int getId()
    {
        return IdTurno;
    }
    public void setId(int id)
    {
        IdTurno = id;
    }
    public int getPrecio()
    {
        return Precio;
    }
    public void setPrecio(int id)
    {
        Precio = id;
    }
    public DateTime getFecha()
    {
        return Fecha;
    }
    public void setFecha(DateTime id)
    {
        Fecha = id;
    }
    public int getIdPago()
    {
        return IdPago;
    }
    public void setIdPago(int id)
    {
        IdPago = id;
    }
    //get y set para traer datos del paciente y generar la factura
    public int getIdPaciente()
    {
        return IdP;
    }
    public void setIdPaciente(int id)
    {
        IdP = id;
    }
    public string getNombre()
    {
        return Nombre;
    }
    public void setNombre(string id)
    {
        Nombre = id;
    }
    public DataTable getTablaTickets(int id)
    {
        DataTable tabla = con.ObtenerTabla("Turnos", "select * from tickets where idturno=" + id);
        return tabla;
    }
    public SqlConnection getConexion()
    {
        return con.Conexiondb();
    }
    public int agregarTicket(Tickets cat)
    {

        SqlCommand Comando = new SqlCommand();
        SqlParameter SqlParametros = new SqlParameter();
        SqlParametros = Comando.Parameters.Add("@id", SqlDbType.BigInt);
        SqlParametros.Value = cat.getId();
        SqlParametros = Comando.Parameters.Add("@precio", SqlDbType.Int);
        SqlParametros.Value = cat.getPrecio();
        SqlParametros = Comando.Parameters.Add("@pago", SqlDbType.Int);
        SqlParametros.Value = cat.getIdPago();

        return con.EjecutarSP(Comando, "spInsertarTicket");
    }
    public void getTicket(int id, int precio, int pago)
    {
        setPrecio(precio);
        setIdPago(pago);
        setId(id);
    }
    public Tickets getTicketImpresion(int id)
    {
        try
        {
            Tickets tck = new Tickets();
            SqlCommand cmd = new SqlCommand();
            SqlParameter parameter = new SqlParameter();
            parameter = cmd.Parameters.Add("@id", SqlDbType.BigInt);
            parameter.Value = long.Parse(id.ToString());
            SqlDataReader reader = con.ObtenerReader(cmd, "Select id, fecha, Convert(int,(select p.precio from precios p where p.id = idprecio)) as 'precio' from tickets where id = @id");
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    tck.setId(id);
                    tck.setFecha(reader.GetDateTime(reader.GetOrdinal("fecha")));
                    tck.setPrecio(reader.GetInt32(reader.GetOrdinal("precio")));
                }
            }
            //Select id, fecha, (select p.precio from precios p where p.id = idprecio) as 'precio' from tickets where id = @id
            return tck;
        }
        catch (Exception ex)
        {
            throw;
        }
    }
    public Tickets getFacturaImpresion(int id)
    {
        try
        {
            Tickets tck = new Tickets();
            SqlCommand cmd = new SqlCommand();
            SqlParameter parameter = new SqlParameter();
            parameter = cmd.Parameters.Add("@id", SqlDbType.BigInt);
            parameter.Value = long.Parse(id.ToString());
            SqlDataReader reader = con.ObtenerReader(cmd, "Select t.id, t.fecha as 'fec', Convert(int,(select p.precio from precios p where p.id = t.idprecio)) as 'precio', s.idpaciente as 'idp', p.apellido + ' ' + p.nombre as 'apenom' from tickets as t inner join turnos as s on s.id=t.idturno inner join pacientes as p on p.id=s.idpaciente where t.idturno = @id");
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    tck.setId(id);
                    tck.setFecha(reader.GetDateTime(reader.GetOrdinal("fec")));
                    tck.setPrecio(reader.GetInt32(reader.GetOrdinal("precio")));
                    //datos del paciente
                    tck.setIdPaciente(reader.GetInt32(reader.GetOrdinal("idp")));
                    tck.setNombre(reader.GetString(reader.GetOrdinal("apenom")));
                }
            }
            //Select id, fecha, (select p.precio from precios p where p.id = idprecio) as 'precio' from tickets where id = @id
            return tck;
        }
        catch (Exception ex)
        {
            throw;
        }
    }
}