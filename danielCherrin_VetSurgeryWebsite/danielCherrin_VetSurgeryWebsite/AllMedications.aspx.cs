using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AllMedications : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loggedIn"] == null || (bool)Session["loggedIn"] == false)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            //Enables footer logout using the session to fill label as the user 
            footerLoad.enable(Master, Session);

            string str_queryAllBookings = null;

            try
            {
                str_queryAllBookings = "SELECT *" +
                                       "FROM [VetSurgery].[dbo].[medication] ";

                SqlDataAdapter ada_allBookings = new SqlDataAdapter(str_queryAllBookings, sqlConn.conn);
                DataSet ds_allBookings = new DataSet();
                ada_allBookings.Fill(ds_allBookings);
                gv_allMedications.DataSource = ds_allBookings.Tables[0];
                gv_allMedications.DataBind();
            }
            catch (Exception ex)
            {

            }

        }
    }
}