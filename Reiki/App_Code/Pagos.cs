using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Pagos
/// </summary>
public class Pagos
{
	public Pagos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    Conexion con = new Conexion();
    public SqlCommand getPagoscmd()
    {
        return con.DevuelveComando("Select * from pagos");
    }
}