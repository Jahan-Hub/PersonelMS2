using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;

namespace PersonelMS
{
    public partial class LogIn : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand Cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                //con.Open();
                //Cmd = new SqlCommand("select * from tblCompany", con);
                //Cmd.CommandType = CommandType.Text;
                //SqlDataReader Dr;
                //Dr = Cmd.ExecuteReader();
                //while (Dr.Read())
                //{
                //    //lblHeading.Text = Dr["Name"].ToString();
                //    Session["Name"] = Dr["Name"].ToString();
                //    Session["Address"] = Dr["Address"].ToString();
                //    Session["Contact1"] = Dr["Contact1"].ToString();
                //    Session["Contact2"] = Dr["Contact2"].ToString();
                //    Session["Fax"] = Dr["Fax"].ToString();
                //    Session["CompanyLogo"] = Dr["CompanyLogo"].ToString();
                //    Session["CompanyMoto"] = Dr["CompanyMoto"].ToString();
                //    Session["Email"] = Dr["Email"].ToString();
                //    Session["Website"] = Dr["Website"].ToString();
                //    Page.Title = Dr["Name"].ToString();
                //}
                //con.Close();
            }
            Session["UserName"] = null;
            Session["comName"] = null;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (RadComboBox1.SelectedValue == "")
            {
                lblMessage.Text = "Select User Name";
            }
            else if (txtPassword.Text == "")
            {
                lblMessage.Text = "Enter Password.";
            }
            else
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                Cmd = new SqlCommand("Sp_Login", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.Add("@Mode", SqlDbType.VarChar).Value = 1;
                SqlDataReader dr = Cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (dr["UserName"].ToString() == RadComboBox1.Text && dr["Password"].ToString() == txtPassword.Text)
                    {
                        Session["UserName"] = RadComboBox1.Text;
                        Response.Redirect("~/Home.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid Username or Password.";
                    }
                }
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            RadComboBox1.Text = "";
            RadComboBox1.SelectedValue = "";
            txtPassword.Text = "";
        }
    }
}