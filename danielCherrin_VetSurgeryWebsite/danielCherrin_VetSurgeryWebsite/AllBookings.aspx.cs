using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AllBookings : System.Web.UI.Page
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

                string str_queryAllBookings = null;

                try
                {
                    str_queryAllBookings = "SELECT * " +
                                           "FROM [VetSurgery].[dbo].[booking] "+
                                           "ORDER BY bookingDate desc, bookingTime asc";

                    SqlDataAdapter ada_allBookings = new SqlDataAdapter(str_queryAllBookings, sqlConn.conn);
                    DataSet ds_allBookings = new DataSet();
                    ada_allBookings.Fill(ds_allBookings);
                    gv_allBookings.DataSource = ds_allBookings.Tables[0];
                    gv_allBookings.DataBind();
                }
                catch (Exception ex)
                {

                }
            }
        }
    }

    protected void gv_allBookings_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (Session["user_type"].ToString() == "Admin")
            {
                e.Row.Cells[0].FindControl("gvBtnEdit").Visible = true;
            }
            else if (e.Row.Cells[1].Text != Session["user_email"].ToString())
            {
                e.Row.Cells[0].FindControl("gvBtnEdit").Visible = false;
            }
        }
    }

    protected void gv_allBookings_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (((Button)e.CommandSource).ID == "gvBtnEdit")
        {
            GridViewRow gvr = (GridViewRow)(((Button)e.CommandSource).NamingContainer);

            Session["editBookingId"] = gv_allBookings.DataKeys[gvr.RowIndex].Values[0].ToString();

            Response.Redirect("EditBooking.aspx");
        }

        if (((Button)e.CommandSource).ID == "gvBtnSelect")
        {
            GridViewRow gvr = (GridViewRow)(((Button)e.CommandSource).NamingContainer);

            Session["selectPetId"] = gv_allBookings.DataKeys[gvr.RowIndex].Values[1].ToString();

            string str_querySelectPetDetails;

            str_querySelectPetDetails = "SELECT pet.petId " +
                                        ",pet.clientId " +
                                        ",pet.petName " +
                                        ",pet.regRef " +
                                        ",pet.animalType " +
                                        ",pet.breed " +
                                        ",pet.colour " +
                                        "FROM [VetSurgery].[dbo].[client] JOIN [VetSurgery].[dbo].[pet] ON client.clientId = pet.clientId " +
                                        "WHERE petId = '" + Session["selectPetId"].ToString() + "';";

            SqlDataAdapter ada_PetDetails = new SqlDataAdapter(str_querySelectPetDetails, sqlConn.conn);
            DataSet ds_PetDetails = new DataSet();
            ada_PetDetails.Fill(ds_PetDetails);
            gv_selectPet.DataSource = ds_PetDetails.Tables[0];
            gv_selectPet.DataBind();

            //

            string str_querySelectClientDetails;

            str_querySelectClientDetails = "SELECT client.clientId " +
                                           ",client.givenName " +
                                           ",client.lastName " +
                                           ",client.email " +
                                           ",client.addressNo " +
                                           ",client.addressStreet " +
                                           ",client.addressPostCode " +
                                           ",client.addressSuburb " +
                                           ",client.addressState " +
                                           ",client.mobPhone " +
                                           ",client.homePhone " +
                                           "FROM [VetSurgery].[dbo].[client] JOIN [VetSurgery].[dbo].[pet] ON client.clientId = pet.clientId " +
                                           "WHERE petId = '" + Session["selectPetId"].ToString() + "';";

            SqlDataAdapter ada_ClientDetails = new SqlDataAdapter(str_querySelectClientDetails, sqlConn.conn);
            DataSet ds_ClientDetails = new DataSet();
            ada_ClientDetails.Fill(ds_ClientDetails);
            gv_selectClient.DataSource = ds_ClientDetails.Tables[0];
            gv_selectClient.DataBind();

            //

            Session["selectBookingId"] = gv_allBookings.DataKeys[gvr.RowIndex].Values[0].ToString();

            string str_querySelectMedRefDetails;

            str_querySelectMedRefDetails = "SELECT medication.medName " +
                                           ",medication.medRoute " +
                                           ",medication.strength " +
                                           ",medication.cost " +
                                           ",med_ref.med_refId " +
                                           "FROM[VetSurgery].[dbo].[med_ref] JOIN medication ON med_ref.medId = medication.medId " +
                                           "WHERE bookingId = '" + Session["selectBookingId"].ToString() + "';";

            SqlDataAdapter ada_medDetails = new SqlDataAdapter(str_querySelectMedRefDetails, sqlConn.conn);
            DataSet ds_medDetails = new DataSet();
            ada_medDetails.Fill(ds_medDetails);
            gv_selectMeds.DataSource = ds_medDetails.Tables[0];
            gv_selectMeds.DataBind();
        }
    }
}