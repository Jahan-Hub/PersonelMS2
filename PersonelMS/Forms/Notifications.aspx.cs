using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI;
using Telerik.Web.UI;

namespace PersonelMS.Forms
{
    public partial class Notifications : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        public DataTable dtNotifications
        {
            get
            {
                object obj = this.Session["dtNotifications"];
                if (obj != null)
                {
                    return (DataTable)obj;
                }
                DataTable dt1 = new DataTable();
                dt1.Columns.Add("rowid", typeof(Int64));
                dt1.Columns.Add("Id", typeof(Int64));
                dt1.Columns.Add("Date", typeof(DateTime));
                dt1.Columns.Add("Subject", typeof(string));
                dt1.Columns.Add("Description", typeof(string));
                dt1.PrimaryKey = new DataColumn[] { dt1.Columns["rowid"] };
                this.Session["dtNotifications"] = dt1;
                return dtNotifications;
            }
        }
        public string GetAutoNumber(string fieldName, string tableName)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                string ss = "Select  convert(int,Max(" + fieldName + ")) from " + tableName + "";
                SqlCommand cmd = new SqlCommand(ss, con);

                con.Open();
                int x = (int)cmd.ExecuteScalar() + 1;
                return x.ToString();
            }
            catch (Exception)
            {
                return "201";
            }
            finally
            {
                con.Close();
            }
        }
        private void SaveData()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            try
            {
                cmd = new SqlCommand("Sp_Notification", con);
                cmd.CommandType = CommandType.StoredProcedure;
                if (lblOperationMode.Text == "Save Mode")
                {
                    cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 1;
                }
                if (lblOperationMode.Text == "Edit Mode")
                {
                    cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 2;
                }
                cmd.Parameters.Add("@Id", SqlDbType.Int).Value = Convert.ToInt32(txtID.Text);
                cmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = dpDate.SelectedDate;
                cmd.Parameters.Add("@Subject", SqlDbType.VarChar).Value = textInfo.ToTitleCase(txtSubject.Text);
                cmd.Parameters.Add("@Description", SqlDbType.VarChar).Value = txtDescriptions.Text;
                cmd.Parameters.Add("@UserId", SqlDbType.VarChar).Value = AppEnv.Current.p_UserName;
                cmd.ExecuteNonQuery();
                con.Close();

                EnableControl(false);
                rgMain.Rebind();
                ButtonControl("L");
                lblMessage.Text = "Notification/Event/News Saved Successfully.";
                ClearControl();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>";
            }
        }
        private void ReloadMainGrid()
        {
            try
            {
                this.dtNotifications.Clear();
                rgMain.Rebind();
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_Notification", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 5;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                adpt.Fill(ds);
                dt = ds.Tables[0];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DataRow newRow = this.dtNotifications.NewRow();
                    newRow["rowid"] = i + 1;
                    newRow["Id"] = Convert.ToInt32(dt.Rows[i]["Id"].ToString());
                    newRow["Date"] = dt.Rows[i]["Date"].ToString();
                    newRow["Subject"] = dt.Rows[i]["Subject"].ToString();
                    newRow["Description"] = dt.Rows[i]["Description"].ToString();
                    this.dtNotifications.Rows.Add(newRow);
                    this.dtNotifications.AcceptChanges();
                }
                rgMain.DataSource = this.dtNotifications;
                rgMain.Rebind();
                cmd.Dispose();
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>";
            }
        }
        public void EnableControl(bool ec)
        {
            txtSubject.Enabled = ec;
            txtDescriptions.Enabled = ec;
            dpDate.Enabled = ec;
        }
        public void ClearControl()
        {
            txtID.Text = "";
            txtSubject.Text = "";
            txtDescriptions.Text = "";
            dpDate.SelectedDate = null;
        }
        public void ButtonControl(string bc)
        {
            if (bc == "L")
            {
                btnNew.Enabled = true;
                btnSave.Enabled = false;
                btnEdit.Enabled = false;
                btnCancel.Enabled = false;
                lblMessage.Text = "";
                lblOperationMode.Text = "";
            }
            else if (bc == "N")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = true;
                btnEdit.Enabled = false;
                btnCancel.Enabled = true;
                lblMessage.Text = "";
                lblOperationMode.Text = "Save Mode";
            }
            else if (bc == "F")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = false;
                btnEdit.Enabled = true;
                btnCancel.Enabled = true;
                lblMessage.Text = "";
                lblOperationMode.Text = "";
            }
            else if (bc == "E")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = true;
                btnEdit.Enabled = false;
                btnCancel.Enabled = true;
                lblMessage.Text = "";
                lblOperationMode.Text = "Edit Mode";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReloadMainGrid();
                EnableControl(false);
                txtID.Enabled = false;
                ClearControl();
                ButtonControl("L");
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                ClearControl();
                int max = Convert.ToInt32(GetAutoNumber("Id", "tblNotifications"));
                txtID.Text = max.ToString();
                EnableControl(true);
                lblMessage.Text = "";
                ButtonControl("N");
                dpDate.SelectedDate = DateTime.Now;
                txtSubject.Focus();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>";
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtID.Text == "")
                {
                    lblMessage.Text = "Id can not be Blank.";
                }
                else if (dpDate.SelectedDate == null)
                {
                    lblMessage.Text = "Select Date.";
                }
                else if (txtSubject.Text == "")
                {
                    lblMessage.Text = "Subject can not be blank.";
                }
                else if (txtDescriptions.Text == "")
                {
                    lblMessage.Text = "Description can not be blank.";
                }
                else
                {
                    SaveData();
                }
                ReloadMainGrid();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>";
            }
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            EnableControl(true);
            ButtonControl("E");
            txtID.Enabled = false;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearControl();
            EnableControl(false);
            ButtonControl("L");
        }
        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClearControl();
            ButtonControl("F");
            EnableControl(false);
        }
        protected void btnFind_Click(object sender, EventArgs e)
        {

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }
        protected void rgMain_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgMain.DataSource = this.dtNotifications;
        }
        protected void rgMain_PageIndexChanged(object sender, GridPageChangedEventArgs e)
        {
            ReloadMainGrid();
        }
        protected void rgMain_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ButtonControl("F");
                GridDataItem selectedItem = (GridDataItem)rgMain.SelectedItems[0];
                ViewState["Id"] = selectedItem["Id"].Text;
                ViewState["rowid"] = selectedItem["rowid"].Text;

                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_Notification", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 4;
                cmd.Parameters.Add("@Id", SqlDbType.VarChar).Value = selectedItem["Id"].Text;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt1 = new DataTable();
                adpt.Fill(ds);
                dt1 = ds.Tables[0];
                txtID.Text = dt1.Rows[0]["Id"].ToString();
                dpDate.SelectedDate = Convert.ToDateTime(dt1.Rows[0]["Date"].ToString());
                txtSubject.Text = dt1.Rows[0]["Subject"].ToString();
                txtDescriptions.Text = dt1.Rows[0]["Description"].ToString();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>";
            }
        }
    }
}