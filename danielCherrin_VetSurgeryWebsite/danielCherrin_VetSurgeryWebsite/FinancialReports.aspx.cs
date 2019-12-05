using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class FinancialReports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["loggedIn"] == null || (bool)Session["loggedIn"] == false || Session["user_type"].ToString() != "Admin")
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                //Enables footer logout using the session to fill label as the user 
                footerLoad.enable(Master, Session);

                //Load Daily Income.
                string str_queryDailySum = "SELECT SUM(booking.cost) AS 'Sum' " +
                                           "FROM[VetSurgery].[dbo].[booking] " +
                                           "WHERE booking.bookingDate = CAST(GETDATE() as DATE) "+
                                           "AND booking.isPayed = 1";

                try
                {
                    SqlDataAdapter ada_dailyCost = new SqlDataAdapter(str_queryDailySum,sqlConn.conn);
                    DataSet ds_dailyCost = new DataSet();
                    ada_dailyCost.Fill(ds_dailyCost);

                    if (string.IsNullOrEmpty(ds_dailyCost.Tables[0].Rows[0][0].ToString()))
                    {
                        lbl_dailyCost.Text = "No bookings calculated for today.";
                    }
                    else
                    {
                        lbl_dailyCost.Text = "$"+ds_dailyCost.Tables[0].Rows[0][0].ToString();
                    }
                }
                catch(Exception ex)
                {

                }
                //END:Load Daily Income

                //Load Weekly Income.
                DateTime firstDayOfTheWeek = new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.Today.Day);
                
                while (firstDayOfTheWeek.DayOfWeek.ToString() != "Monday")
                {
                    firstDayOfTheWeek = firstDayOfTheWeek.AddDays(-1);
                }

                DateTime lastDayOfTheWeek = firstDayOfTheWeek.AddDays(6);

                string str_queryWeeklySum = "SELECT SUM(booking.cost) AS 'Sum' " +
                                             "FROM[VetSurgery].[dbo].[booking] " +
                                             "WHERE booking.bookingDate <= CAST('" + lastDayOfTheWeek.ToString("yyyy-MM-dd") + "' as DATE) " +
                                             "AND booking.bookingDate >= CAST('" + firstDayOfTheWeek.ToString("yyyy-MM-dd") + "' as DATE) " +
                                             "AND booking.isPayed = 1";

                try
                {
                    SqlDataAdapter ada_weeklyCost = new SqlDataAdapter(str_queryWeeklySum, sqlConn.conn);
                    DataSet ds_weeklyCost = new DataSet();
                    ada_weeklyCost.Fill(ds_weeklyCost);

                    if (string.IsNullOrEmpty(ds_weeklyCost.Tables[0].Rows[0][0].ToString()))
                    {
                        lbl_weeklyCost.Text = "No bookings calculated for week.";
                    }
                    else
                    {
                        lbl_weeklyCost.Text = "$" + ds_weeklyCost.Tables[0].Rows[0][0].ToString();
                    }
                }
                catch(Exception ex)
                {

                }
                //END:Load Weekly Income.

                //Load Monthly Income.
                DateTime firstDayOfMonth = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
                DateTime lastDayOfMonth = firstDayOfMonth.AddMonths(1).AddDays(-1);

                string str_queryMonthlySum = "SELECT SUM(booking.cost) AS 'Sum' " +
                                             "FROM[VetSurgery].[dbo].[booking] " +
                                             "WHERE booking.bookingDate <= CAST('"+lastDayOfMonth.ToString("yyyy-MM-dd") + "' as DATE) " +
                                             "AND booking.bookingDate >= CAST('"+firstDayOfMonth.ToString("yyyy-MM-dd") + "' as DATE) " +
                                             "AND booking.isPayed = 1";

                try
                {
                    SqlDataAdapter ada_monthlyCost = new SqlDataAdapter(str_queryMonthlySum, sqlConn.conn);
                    DataSet ds_monthlyCost = new DataSet();
                    ada_monthlyCost.Fill(ds_monthlyCost);

                    if (string.IsNullOrEmpty(ds_monthlyCost.Tables[0].Rows[0][0].ToString()))
                    {
                        lbl_monthlyCost.Text = "No bookings calculated for month.";
                    }
                    else
                    {
                        lbl_monthlyCost.Text = "$" + ds_monthlyCost.Tables[0].Rows[0][0].ToString();
                    }
                }
                catch (Exception ex)
                {

                }
                //END:Load Monthly Income*/
            }
        }
    }

    protected void txt_dateToDateStart_TextChanged(object sender, EventArgs e)
    {
        txt_dateToDateEnd.Enabled = true;
    }

    protected void txt_dateToDateEnd_TextChanged(object sender, EventArgs e)
    {
        btn_sumbitDates.Enabled = true;
    }

    protected void btn_sumbitDates_Click(object sender, EventArgs e)
    {
        string str_queryDateSum = "SELECT SUM(booking.cost) AS 'Sum' " +
                                             "FROM[VetSurgery].[dbo].[booking] " +
                                             "WHERE booking.bookingDate <= CAST('" + txt_dateToDateEnd.Text.ToString() + "' as DATE) " +
                                             "AND booking.bookingDate >= CAST('" + txt_dateToDateStart.Text.ToString() + "' as DATE) " +
                                             "AND booking.isPayed = 1";

        try
        {
            SqlDataAdapter ada_dateCost = new SqlDataAdapter(str_queryDateSum, sqlConn.conn);
            DataSet ds_dateCost = new DataSet();
            ada_dateCost.Fill(ds_dateCost);

            if (string.IsNullOrEmpty(ds_dateCost.Tables[0].Rows[0][0].ToString()))
            {
                lbl_dateToDateCost.Text = "No bookings calculated for these dates.";
            }
            else
            {
                lbl_dateToDateCost.Text = "$" + ds_dateCost.Tables[0].Rows[0][0].ToString();
            }
        }
        catch (Exception ex)
        {

        }
    }
}