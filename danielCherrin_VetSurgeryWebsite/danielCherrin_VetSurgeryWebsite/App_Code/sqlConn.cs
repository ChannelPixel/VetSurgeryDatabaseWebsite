using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for sqlConn
/// </summary>
public static class sqlConn
{
    //public static string str_conn = "Data Source = ZEO-PC; Initial Catalog = VetSurgery; Integrated Security = True";
    public static string str_conn = "Data Source = MSSQL002; Initial Catalog = VetSurgery; Integrated Security = True";
    public static SqlConnection conn = new SqlConnection(str_conn);
}