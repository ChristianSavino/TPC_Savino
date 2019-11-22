using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Tipos
/// </summary>
public class Tipos
{
    public Tipos()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    Conexion con = new Conexion();
    public SqlCommand getTiposcmd()
    {
        return con.DevuelveComando("Select * from tipos");
    }
}