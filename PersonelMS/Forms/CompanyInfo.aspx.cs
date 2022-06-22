using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

namespace PersonelMS.Forms
{
    public partial class CompanyInfo : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearControl();
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("select * from tblCompany", con);
                cmd.CommandType = CommandType.Text;
                SqlDataReader Dr;
                Dr = cmd.ExecuteReader();
                while (Dr.Read())
                {
                    Session["Name"] = Dr["Name"].ToString();
                    Session["Address"] = Dr["Address"].ToString();
                    Session["Contact1"] = Dr["Contact1"].ToString();
                    Session["Contact2"] = Dr["Contact2"].ToString();
                    Session["Fax"] = Dr["Fax"].ToString();
                    Session["CompanyMoto"] = Dr["CompanyMoto"].ToString();
                    Session["Email"] = Dr["Email"].ToString();
                    Session["Website"] = Dr["Website"].ToString();
                    Page.Title = Dr["Name"].ToString().ToUpper();
                }
                con.Close();
            }
        }
        private void ClearControl()
        {
            txtAddress.Text = "";
            txtContactNo1.Text = "";
            txtContactNo2.Text = "";
            txtEmail.Text = "";
            txtFax.Text = "";
            txtMoto.Text = "";
            txtName.Text = "";
            txtWebsite.Text = "";
        }
        private void SaveData()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            try
            {
                cmd = new SqlCommand("Sp_CompanyInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = txtName.Text;
                cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = txtAddress.Text;
                cmd.Parameters.Add("@Contact1", SqlDbType.NVarChar).Value = txtContactNo1.Text;
                cmd.Parameters.Add("@Contact2", SqlDbType.NVarChar).Value = txtContactNo2.Text;
                cmd.Parameters.Add("@Fax", SqlDbType.NVarChar).Value = txtFax.Text;
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtEmail.Text;
                cmd.Parameters.Add("@Website", SqlDbType.NVarChar).Value = txtWebsite.Text;
                cmd.Parameters.Add("@Moto", SqlDbType.NVarChar).Value = txtMoto.Text;
                int imglength = FileUpload2.PostedFile.ContentLength;
                byte[] bytearray = new byte[imglength];
                HttpPostedFile image = FileUpload2.PostedFile;
                image.InputStream.Read(bytearray, 0, imglength);
                if (FileUpload2.HasFile)
                {
                    cmd.Parameters.Add("@Logo", SqlDbType.Image).Value = bytearray;
                }
                else
                {
                    cmd.Parameters.Add("@Logo", SqlDbType.Image).Value = ViewState["CompanyLogo"];
                }
                cmd.Parameters.Add("@ComId", SqlDbType.NVarChar).Value = txtId.Text;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }
        public static byte[] GetPhoto(string imageloc)
        {

            FileStream stream = new FileStream(imageloc, FileMode.Open, FileAccess.Read);
            BinaryReader reader = new BinaryReader(stream);
            byte[] photo = reader.ReadBytes((int)stream.Length);

            reader.Close();
            stream.Close();

            return photo;
        }
        public static byte[] MakeThumbnail(byte[] myImage, int thumbWidth, int thumbHeight)
        {
            using (System.IO.MemoryStream ms = new System.IO.MemoryStream())
            using (System.Drawing.Image thumbnail = System.Drawing.Image.FromStream(new MemoryStream(myImage)).GetThumbnailImage(thumbWidth, thumbHeight, null, new IntPtr()))
            {
                thumbnail.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                return ms.ToArray();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SaveData();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void FileUpload2_DataBinding(object sender, EventArgs e)
        {
            byte[] bytes = (byte[])(FileUpload2.FileBytes);
            Image1.ImageUrl = (System.IO.Path.GetFileName(FileUpload2.FileName)).ToString();
            Image1.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(MakeThumbnail(bytes, 100, 100), 0, (MakeThumbnail(bytes, 100, 100).Length));
        }
        protected void txtId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (txtId.Text == "")
                {
                    lblMessage.Text = "Company not found.";
                }
                else
                {
                    con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                    con.Open();
                    cmd = new SqlCommand("Sp_CompanyInfo", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 4;
                    cmd.Parameters.Add("@ComId", SqlDbType.NVarChar).Value = txtId.Text;
                    SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    DataTable dt1 = new DataTable();
                    adpt.Fill(ds);
                    dt1 = ds.Tables[0];
                    txtName.Text = dt1.Rows[0]["Name"].ToString();
                    txtAddress.Text = dt1.Rows[0]["Address"].ToString();
                    txtContactNo1.Text = dt1.Rows[0]["Contact1"].ToString();
                    txtContactNo2.Text = dt1.Rows[0]["Contact2"].ToString();
                    txtFax.Text = dt1.Rows[0]["Fax"].ToString();
                    txtEmail.Text = dt1.Rows[0]["Email"].ToString();
                    txtWebsite.Text = dt1.Rows[0]["Website"].ToString();
                    txtMoto.Text = dt1.Rows[0]["CompanyMoto"].ToString();
                    if (!Convert.IsDBNull(dt1.Rows[0]["CompanyLogo"]))
                    {
                        byte[] bytes = (byte[])dt1.Rows[0]["CompanyLogo"];
                        ViewState["CompanyLogo"] = (byte[])dt1.Rows[0]["CompanyLogo"];
                        if (bytes.Length > 0)
                        {
                            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                            Image1.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(MakeThumbnail(bytes, 100, 100), 0, (MakeThumbnail(bytes, 100, 100).Length));
                            Image1.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
    }
}