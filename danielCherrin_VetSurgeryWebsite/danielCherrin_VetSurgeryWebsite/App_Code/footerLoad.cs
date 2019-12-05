using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for footerLoad
/// </summary>
public class footerLoad
{
    public static void enable(MasterPage Master, System.Web.SessionState.HttpSessionState Session)
    {
        ((Label)Master.FindControl("ftr_lbl_fullName")).Text = "Welcome, " + Session["user_fullName"].ToString() + "<br />";
        ((Label)Master.FindControl("ftr_lbl_email")).Text = Session["user_email"].ToString() + "<br />";

        Master.FindControl("ftr_lbl_fullName").Visible = true;
        Master.FindControl("ftr_lbl_email").Visible = true;
        Master.FindControl("ftr_lbtn_logOut").Visible = true;
    }

    public static void logOut(MasterPage Master, System.Web.SessionState.HttpSessionState Session, HttpResponse Response, string url)
    {
        ((Label)Master.FindControl("ftr_lbl_fullName")).Text = "";
        ((Label)Master.FindControl("ftr_lbl_email")).Text = "";

        Master.FindControl("ftr_lbl_fullName").Visible = false;
        Master.FindControl("ftr_lbl_email").Visible = false;
        Master.FindControl("ftr_lbtn_logOut").Visible = false;

        Session["loggedIn"] = false;
        Response.Redirect(url);
    }
}