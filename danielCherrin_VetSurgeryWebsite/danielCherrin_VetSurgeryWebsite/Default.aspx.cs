using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Contents.RemoveAll();
        Session["loggedIn"] = false;
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            string str_qryUserExists =
                "SELECT CASE WHEN EXISTS " +
                    "( " +
                        "SELECT email " +
                        "FROM " +
                        "VetSurgery.dbo.employee " +
                        "WHERE email LIKE '" + txt_email.Text + "' AND passwd = '" + txt_password.Text + "' " +
                    ") " +
                    "THEN CAST(1 AS BIT) " +
                    "ELSE CAST(0 AS BIT) END;";

            SqlDataAdapter ada_exists = new SqlDataAdapter(str_qryUserExists, sqlConn.conn);
            DataSet ds_exists = new DataSet();
            DataTable dt_exists = new DataTable();

            ada_exists.Fill(ds_exists, "employee");
            dt_exists = ds_exists.Tables["employee"];

            if(!Convert.ToBoolean(dt_exists.Rows[0][0].ToString()))
            {
                /*User doesn't exist or password is incorrect (case-sensitive).
                 * Display error message to label in message
                 */
                lbl_loginError.ForeColor = System.Drawing.Color.Red;
                lbl_loginError.Text = "User doesn't exist or the password is incorrect </br>"+
                                      "Please enter correct login details";
                lbl_loginError.Visible = true;
            }
            else
            {
                /*User does exist and password(case-sensitive) is correct.
                 *Grab employee type, given name, last name and email and store in session variable
                */
                string str_qryUserType =
                    "SELECT employeeType " +
                    ", email " +
                    ", givenName "+
                    ", lastName "+
                    "FROM VetSurgery.dbo.employee " +
                    "WHERE email LIKE '" + txt_email.Text + "'; ";

                SqlDataAdapter ada_employeeNameType = new SqlDataAdapter(str_qryUserType, sqlConn.conn);
                DataSet ds_userNameType = new DataSet();
                DataTable dt_userNameType = new DataTable();

                ada_employeeNameType.Fill(ds_userNameType, "employee");
                dt_userNameType = ds_userNameType.Tables["employee"];

                //Storing employee details by using login details in a query to return and store a table of the user's type, names and email.
                Session["user_type"] = dt_userNameType.Rows[0][0].ToString();
                Session["user_email"] = dt_userNameType.Rows[0][1].ToString();
                Session["user_givenName"] = dt_userNameType.Rows[0][2].ToString();
                Session["user_lastName"] = dt_userNameType.Rows[0][3].ToString();
                Session["user_fullName"] = Session["user_givenName"].ToString() + " " + Session["user_lastName"].ToString();
                Session["loggedIn"] = true;

                Response.Redirect("HomeAllBookings.aspx");
            }
        }
        catch(Exception ex)
        {
            /*Display exception message login
             * 
             */
            lbl_loginError.ForeColor = System.Drawing.Color.Red;
            List<string> exMessage = ex.Message.Split('.').ToList();
            StringBuilder formattedMessage = new StringBuilder();
            formattedMessage.Append("</br>");

            int count = 1;
            foreach(string message in exMessage)
            {
                if(count < exMessage.Count)
                {
                    formattedMessage.Append(message).Append("</br>");
                }
                count++;
            }

            lbl_loginError.Text = formattedMessage.ToString();
            lbl_loginError.Visible = true;
        }
    }
}