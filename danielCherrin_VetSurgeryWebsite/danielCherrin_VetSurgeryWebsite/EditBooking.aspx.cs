using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class EditBooking : System.Web.UI.Page
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
                if (Session["editBookingId"] == null)
                {
                    //Redirect to error no booking id was selected page which then redirects to homepage.
                    Response.Redirect("HomeAllBookings.aspx");
                }

                //Restrict Admin Controls
                if(Session["user_type"].ToString() != "Admin")
                {
                    btn_deleteBooking.Enabled = false;
                    ddl_editVets.Enabled = false;
                    ddl_editPets.Enabled = false;
                    txt_editBookingDate.Enabled = false;
                    txt_editBookingTime.Enabled = false;
                    chk_editIsPayed.Enabled = false;
                    ddl_editPaymentType.Enabled = false;
                    txt_editCost.Enabled = false;
                    txt_editCreditCardNo.Enabled = false;
                    txt_editCreditCardName.Enabled = false;
                    txt_editCreditCardExp.Enabled = false;
                }

                //Enables footer logout using the session to fill label as the user 
                footerLoad.enable(Master, Session);

                //Load BookingDetails
                string str_queryEditBookingDetails = null;

                str_queryEditBookingDetails = "SELECT * "+
                                              "FROM VetSurgery.dbo.booking "+
                                              "WHERE booking.bookingId = '"+Session["editBookingId"]+"';";

                try
                {
                    SqlDataAdapter ada_editBookingDetails = new SqlDataAdapter(str_queryEditBookingDetails, sqlConn.conn);
                    DataSet ds_editBookingDetails = new DataSet();
                    DataTable dt_editBookingsDetails = new DataTable();
                    ada_editBookingDetails.Fill(ds_editBookingDetails);
                    dt_editBookingsDetails = ds_editBookingDetails.Tables[0];

                    ////LOAD Booking into inputs
                    //Booking Date
                    DateTime editBookingDate = Convert.ToDateTime(dt_editBookingsDetails.Rows[0][3].ToString());
                    txt_editBookingDate.Text = editBookingDate.ToString("yyyy-MM-dd");
                    //Booking Time
                    txt_editBookingTime.Text = dt_editBookingsDetails.Rows[0][4].ToString();
                    //Comments
                    txt_editComments.Text = dt_editBookingsDetails.Rows[0][11].ToString();
                    //IsPayed
                    chk_editIsPayed.Checked = Convert.ToBoolean(dt_editBookingsDetails.Rows[0][5].ToString());
                    //Cost
                    txt_editCost.Text = dt_editBookingsDetails.Rows[0][7].ToString();

                    //PaymentType
                    ddl_editPaymentType.Items.FindByValue(dt_editBookingsDetails.Rows[0][6].ToString()).Selected = true;

                    if(dt_editBookingsDetails.Rows[0][6].ToString() == "Credit Card")
                    {
                        pnl_creditCardInfo.Visible = true;
                        //Credit Card No
                        txt_editCreditCardNo.Text = dt_editBookingsDetails.Rows[0][8].ToString();
                        //Credit Card Name
                        txt_editCreditCardName.Text = dt_editBookingsDetails.Rows[0][9].ToString();
                        //Credit Card Exp
                        DateTime editBookingExp = Convert.ToDateTime(dt_editBookingsDetails.Rows[0][10].ToString());
                        txt_editCreditCardExp.Text = editBookingExp.ToString("yyyy-MM-dd");
                    }

                }
                catch
                {

                }

                //Load Vets into dropdownlist
                string str_queryDdlVets = null;

                str_queryDdlVets = "SELECT email," +
                                   "givenName," +
                                   "lastName," +
                                   "employeeType," +
                                   "(email + ' - ' + givenName + ' ' + lastName) as 'ddlConcat'" +
                                   "FROM [VetSurgery].[dbo].[employee]" +
                                   "WHERE employee.employeeType = 'Vet' "+
                                   "ORDER BY lastName, givenName;";

                try
                {
                    SqlDataAdapter ada_ddlVets = new SqlDataAdapter(str_queryDdlVets,sqlConn.conn);
                    DataSet ds_ddlVets = new DataSet();
                    ada_ddlVets.Fill(ds_ddlVets);
                    ddl_editVets.DataSource = ds_ddlVets.Tables[0];
                    ddl_editVets.DataBind();
                    ddl_editVets.ClearSelection();
                    ddl_editVets.Items.FindByValue(Session["editBookingVet"].ToString()).Selected = true;
                }
                catch(Exception ex)
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
                    ddl_editPets.DataSource = ds_ddlPets.Tables[0];
                    ddl_editPets.DataBind();
                    ddl_editPets.ClearSelection();
                    ddl_editPets.Items.FindByValue(Session["editBookingPetId"].ToString()).Selected = true;
                }
                catch (Exception ex)
                {

                }
                //END:Load into Pets dropdownlist

                //Load medications into Med dropdownlist
                string str_queryDdlMeds = null;

                str_queryDdlMeds = "SELECT medId " +
                                   ",(medName + ' (' + medRoute + ') [' + ++strength + ']') AS 'ddlConcat' " +
                                   "FROM VetSurgery.dbo.medication " +
                                   "ORDER BY medName asc, medRoute asc, strength desc;";

                try
                {
                    SqlDataAdapter ada_ddlMeds = new SqlDataAdapter(str_queryDdlMeds,sqlConn.conn);
                    DataSet ds_ddlMeds = new DataSet();
                    ada_ddlMeds.Fill(ds_ddlMeds);
                    ddl_addMeds.DataSource = ds_ddlMeds.Tables[0];
                    ddl_addMeds.DataBind();
                }
                catch(Exception ex)
                {

                }
                //END: Load medications into Med dropdownlist

                //Load medRef into gv_editBookingMeds
                string str_queryAllMedRefs = null;

                str_queryAllMedRefs = "SELECT [med_refId] "+
                                      ",[bookingId] "+
                                	  ",medName "+
                                	  ",medRoute "+
                                	  ",strength "+
                                	  ",cost "+
                                      "FROM[VetSurgery].[dbo].[med_ref] JOIN medication ON med_ref.medId = medication.medId "+
                                      "WHERE bookingId = '"+ Session["editBookingId"].ToString() + "';";

                try
                {
                    SqlDataAdapter ada_allMedRefs = new SqlDataAdapter(str_queryAllMedRefs,sqlConn.conn);
                    DataSet ds_allMedRefs = new DataSet();
                    ada_allMedRefs.Fill(ds_allMedRefs);
                    gv_editBookingMeds.DataSource = ds_allMedRefs.Tables[0];
                    gv_editBookingMeds.DataBind();
                }
                catch(Exception ex)
                {

                }
                //END: /Load medRef into gv_editBookingMeds

            }
        }
    }

    protected void ddl_editPaymentType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_editPaymentType.SelectedValue.ToString() == "Cash")
        {
            pnl_creditCardInfo.Visible = false;
        }
        else
        {
            pnl_creditCardInfo.Visible = true;
        }
    }

    protected void btn_updateBooking_Click(object sender, EventArgs e)
    {
        string str_queryUpdateBooking = null;
        string str_cost = null;

        if(string.IsNullOrWhiteSpace(txt_editCost.Text))
        {
            str_cost = ",[cost] = CAST('0' AS DECIMAL(7,2))";
        }
        else
        {
            str_cost = ",[cost] = CAST('" + txt_editCost.Text + "' AS DECIMAL(7,2))";
        }

        if (ddl_editPaymentType.SelectedValue.ToString() == "Cash")
        {
            str_queryUpdateBooking = "UPDATE [VetSurgery].[dbo].[booking] " +
                                            "SET [email] = '"+ddl_editVets.SelectedValue.ToString()+"' " +
                                            ",[petID] = '"+ddl_editPets.SelectedValue.ToString()+"' " +
                                            ",[bookingDate] = CAST('"+txt_editBookingDate.Text.ToString()+"' AS DATE) " +
                                            ",[bookingTime] = CAST('"+txt_editBookingTime.Text.ToString()+"' AS TIME) " +
                                            ",[isPayed] = CAST('"+chk_editIsPayed.Checked.ToString()+"' AS BIT) " +
                                            ",[paymentType] = '"+ddl_editPaymentType.SelectedValue.ToString()+"' " +
                                            str_cost +
                                            ",[comment] = '"+txt_editComments.Text+"' " +
                                            "WHERE bookingId = '"+Session["editBookingId"]+"';";

        }
        else if(ddl_editPaymentType.SelectedValue.ToString() == "Credit Card")
        {
            str_queryUpdateBooking = "UPDATE [VetSurgery].[dbo].[booking] " +
                                            "SET [email] = '" + ddl_editVets.SelectedValue.ToString() + "' " +
                                            ",[petID] = '" + ddl_editPets.SelectedValue.ToString() + "' " +
                                            ",[bookingDate] = CAST('" + txt_editBookingDate.Text.ToString() + "' AS DATE) " +
                                            ",[bookingTime] = CAST('" + txt_editBookingTime.Text.ToString() + "' AS TIME) " +
                                            ",[isPayed] = CAST('" + chk_editIsPayed.Checked.ToString() + "' AS BIT) " +
                                            ",[paymentType] = '" + ddl_editPaymentType.SelectedValue.ToString() + "' " +
                                            str_cost +
                                            ",[creditCardNo] = '" + txt_editCreditCardNo.Text + "' " +
                                            ",[creditCardName] = '" + txt_editCreditCardName.Text + "' " +
                                            ",[creditCardExp] = CAST('" + "' AS DATE) " +
                                            ",[comment] = '" + txt_editComments.Text + "' " +
                                            "WHERE bookingId = '" + Session["editBookingId"] + "';";
        }

        SqlConnection conn = new SqlConnection(sqlConn.str_conn);
        conn.Open();
        SqlCommand updateBooking = new SqlCommand(str_queryUpdateBooking, conn);
        updateBooking.ExecuteNonQuery();
        conn.Close();

        Session["editBookingId"] = null;

        Response.Redirect("HomeAllBookings.aspx");
    }

    protected void btn_deleteBooking_Click(object sender, EventArgs e)
    {
        string str_queryDeleteBooking = "DELETE FROM VetSurgery.dbo.booking " +
                                        "WHERE booking.bookingId = '"+Session["editBookingId"].ToString()+"';";

        SqlConnection conn = new SqlConnection(sqlConn.str_conn);
        conn.Open();
        SqlCommand deleteBooking = new SqlCommand(str_queryDeleteBooking, conn);
        deleteBooking.ExecuteNonQuery();
        conn.Close();

        Session["editBookingId"] = null;

        Response.Redirect("HomeAllBookings.aspx");
    }

    protected void btn_addMed_Click(object sender, EventArgs e)
    {
        string str_queryInsertMedRef = "INSERT INTO[dbo].[med_ref] " +
                                             "([bookingId] " +
                                             ",[medId]) " +
                                       "VALUES " +
                                             "('"+ Session["editBookingId"].ToString() + "' " +
                                             ",'"+ ddl_addMeds.SelectedValue +"');";

        SqlConnection conn = new SqlConnection(sqlConn.str_conn);
        conn.Open();
        SqlCommand insertMedRef = new SqlCommand(str_queryInsertMedRef, conn);
        insertMedRef.ExecuteNonQuery();
        conn.Close();

        //Load medRef into gv_editBookingMeds
        string str_queryAllMedRefs = null;

        str_queryAllMedRefs = "SELECT [med_refId] " +
                              ",[bookingId] " +
                              ",medName " +
                              ",medRoute " +
                              ",strength " +
                              ",cost " +
                              "FROM[VetSurgery].[dbo].[med_ref] JOIN medication ON med_ref.medId = medication.medId " +
                              "WHERE bookingId = '" + Session["editBookingId"].ToString() + "';";

        try
        {
            SqlDataAdapter ada_allMedRefs = new SqlDataAdapter(str_queryAllMedRefs, sqlConn.conn);
            DataSet ds_allMedRefs = new DataSet();
            ada_allMedRefs.Fill(ds_allMedRefs);
            gv_editBookingMeds.DataSource = ds_allMedRefs.Tables[0];
            gv_editBookingMeds.DataBind();
        }
        catch (Exception ex)
        {

        }
        //END: /Load medRef into gv_editBookingMeds
    }

    protected void gv_editBookingMeds_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (((Button)e.CommandSource).ID == "gvBtnDelete")
        {
            GridViewRow gvr = (GridViewRow)(((Button)e.CommandSource).NamingContainer);

            string deleteMedRefId = gv_editBookingMeds.DataKeys[gvr.RowIndex].Values[0].ToString();

            string str_queryDeleteMedRef = "DELETE FROM VetSurgery.dbo.med_ref " +
                                           "WHERE med_ref.med_refId ='"+deleteMedRefId+"';";

            SqlConnection conn = new SqlConnection(sqlConn.str_conn);
            conn.Open();
            SqlCommand deleteMedRef = new SqlCommand(str_queryDeleteMedRef, conn);
            deleteMedRef.ExecuteNonQuery();
            conn.Close();

            //Load medRef into gv_editBookingMeds
            string str_queryAllMedRefs = null;

            str_queryAllMedRefs = "SELECT [med_refId] " +
                                  ",[bookingId] " +
                                  ",medName " +
                                  ",medRoute " +
                                  ",strength " +
                                  ",cost " +
                                  "FROM[VetSurgery].[dbo].[med_ref] JOIN medication ON med_ref.medId = medication.medId " +
                                  "WHERE bookingId = '" + Session["editBookingId"].ToString() + "';";

            try
            {
                SqlDataAdapter ada_allMedRefs = new SqlDataAdapter(str_queryAllMedRefs, sqlConn.conn);
                DataSet ds_allMedRefs = new DataSet();
                ada_allMedRefs.Fill(ds_allMedRefs);
                gv_editBookingMeds.DataSource = ds_allMedRefs.Tables[0];
                gv_editBookingMeds.DataBind();
            }
            catch (Exception ex)
            {

            }
            //END: /Load medRef into gv_editBookingMeds
        }
    }

    
}