using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AllClients : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["loggedIn"] == null || (bool)Session["loggedIn"] == false)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                //Enables footer logout using the session to fill label as the user 
                footerLoad.enable(Master, Session);

                string str_queryAllClients = null;

                try
                {
                    str_queryAllClients = "SELECT *" +
                                           "FROM [VetSurgery].[dbo].[client] " +
                                           "ORDER BY givenName ASC, lastName asc";

                    SqlDataAdapter ada_allClients = new SqlDataAdapter(str_queryAllClients, sqlConn.conn);
                    DataSet ds_allClients = new DataSet();
                    ada_allClients.Fill(ds_allClients);
                    gv_allClients.DataSource = ds_allClients.Tables[0];
                    gv_allClients.DataBind();
                }
                catch (Exception ex)
                {

                }
            }
        }
    }
}