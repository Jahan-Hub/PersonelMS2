using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace PersonelMS.Forms
{
    public partial class DBBackup : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnBackup_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("Sp_DbBackup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}