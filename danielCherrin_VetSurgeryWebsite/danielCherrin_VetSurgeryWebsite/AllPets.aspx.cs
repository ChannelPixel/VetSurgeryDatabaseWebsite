using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AllPets : System.Web.UI.Page
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

                string str_queryAllPets = null;

                
                    str_queryAllPets = "SELECT pet.petName " +
                                           ", (client.givenName + ' '+ client.lastName +' (' +client.email+')') AS 'concatName' " +
                                           ", pet.regRef " +
                                           ", pet.animalType " +
                                           ", pet.breed " +
                                           ", pet.colour " +
                                           "FROM [VetSurgery].[dbo].[client] JOIN [VetSurgery].[dbo].[pet] ON client.clientId = pet.clientId " +
                                           "ORDER BY concatName ASC, pet.petName asc";

                    SqlDataAdapter ada_allPets = new SqlDataAdapter(str_queryAllPets, sqlConn.conn);
                    DataSet ds_allPets = new DataSet();
                    ada_allPets.Fill(ds_allPets);
                    gv_allPets.DataSource = ds_allPets.Tables[0];
                    gv_allPets.DataBind();
            }
        }
    }
}