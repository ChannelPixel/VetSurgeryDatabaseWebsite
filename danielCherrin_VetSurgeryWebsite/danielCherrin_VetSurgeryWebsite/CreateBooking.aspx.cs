using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class CreateBookings : System.Web.UI.Page
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

                //Set Date and Time to Current time and date.
                txt_createDate.Text = (DateTime.Now).ToString("yyyy-MM-dd");
                txt_createTime.Text = (DateTime.Now).ToString("HH:mm");

                //Load Vets into dropdownlist
                string str_queryDdlVets = null;

                str_queryDdlVets = "SELECT email," +
                                   "givenName," +
                                   "lastName," +
                                   "employeeType," +
                                   "(email + ' - ' + givenName + ' ' + lastName) as 'ddlConcat'" +
                                   "FROM [VetSurgery].[dbo].[employee]" +
                                   "WHERE employee.employeeType = 'Vet' " +
                                   "ORDER BY lastName, givenName;";

                try
                {
                    SqlDataAdapter ada_ddlVets = new SqlDataAdapter(str_queryDdlVets, sqlConn.conn);
                    DataSet ds_ddlVets = new DataSet();
                    ada_ddlVets.Fill(ds_ddlVets);
                    ddl_createVets.DataSource = ds_ddlVets.Tables[0];
                    ddl_createVets.DataBind();
                }
                catch (Exception ex)
                {

                }
                //END:Load into Vets dropdownlist

                //Load Pets into dropdownlist
                string str_queryDdlPets = null;

                str_queryDdlPets = "SELECT pet.petId " +
                                   ",client.clientId " +
                                   ",pet.petName " +
                                   ",(pet.petName + ' (Client: ' + client.givenName + ' ' + client.lastName + ')') AS 'ddlConcat' " +
                                   "FROM[VetSurgery].[dbo].[pet] JOIN[VetSurgery].[dbo].[client] ON pet.clientId = client.clientId " +
                                   "ORDER BY client.lastName, client.givenName;";

                try
                {
                    SqlDataAdapter ada_ddlPets = new SqlDataAdapter(str_queryDdlPets, sqlConn.conn);
                    DataSet ds_ddlPets = new DataSet();
                    ada_ddlPets.Fill(ds_ddlPets);
                    ddl_createPets.DataSource = ds_ddlPets.Tables[0];
                    ddl_createPets.DataBind();
                }
                catch (Exception ex)
                {

                }
                //END:Load into Pets dropdownlist
            }
        }
    }

    protected void btn_cancelBooking_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomeAllBookings.aspx");
    }

    protected void btn_createBooking_Click(object sender, EventArgs e)
    {
        string str_queryInsertBooking = "INSERT INTO[dbo].[booking] "+
                                               "([email] " +
                                               ",[petID] " +
                                               ",[bookingDate] " +
                                               ",[bookingTime] " +
                                               ",[isPayed]) " +
                                         "VALUES " +
                                               "('"+ddl_createVets.SelectedValue.ToString()+"' "+
                                               ",'"+ddl_createPets.SelectedValue.ToString()+"' "+
                                               ", CAST('"+txt_createDate.Text+"' AS DATE) "+
                                               ", CAST('"+txt_createTime.Text+"' AS TIME) "+
                                               ", 0);";


        SqlConnection conn = new SqlConnection(sqlConn.str_conn);
        conn.Open();
        SqlCommand insertBooking = new SqlCommand(str_queryInsertBooking,conn);
        insertBooking.ExecuteNonQuery();
        conn.Close();


        Response.Redirect("HomeAllBookings.aspx");
    }
}