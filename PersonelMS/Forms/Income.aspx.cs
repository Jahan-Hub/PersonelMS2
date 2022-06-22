using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;

namespace PersonelMS.Forms
{
    public partial class Income : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        public DataTable dtIncomeGrid
        {
            get
            {
                object obj = this.Session["dtIncomeGrid"];
                if (obj != null)
                {
                    return (DataTable)obj;
                }
                DataTable dt1 = new DataTable();
                dt1.Columns.Add("rowid", typeof(Int64));
                dt1.Columns.Add("Id", typeof(Int64));
                dt1.Columns.Add("IncomeSource", typeof(string));
                dt1.Columns.Add("Date", typeof(DateTime));
                dt1.Columns.Add("IncomeSourceName", typeof(string));
                dt1.Columns.Add("Amount", typeof(string));
                dt1.Columns.Add("Remarks", typeof(string));
                dt1.PrimaryKey = new DataColumn[] { dt1.Columns["rowid"] };
                this.Session["dtIncomeGrid"] = dt1;
                return dtIncomeGrid;
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
            //try
            //{
            if (lblOperationMode.Text == "Save Mode")
            {
                cmd = new SqlCommand("Sp_Income", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 1;
                cmd.Parameters.Add("@Id", SqlDbType.Int).Value = Convert.ToInt32(txtIncomeId.Text);
                cmd.Parameters.Add("@IncomeSource", SqlDbType.Int).Value = Convert.ToInt32(cmIncomeSource.SelectedValue);
                cmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = dpIncomeDt.SelectedDate;
                cmd.Parameters.Add("@Amount", SqlDbType.Decimal).Value = txtAmount.Text;
                cmd.Parameters.Add("@Remarks", SqlDbType.VarChar).Value = txtRemarks.Text;
                cmd.Parameters.Add("@UserId", SqlDbType.VarChar).Value = AppEnv.Current.p_UserName;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else if (lblOperationMode.Text == "Edit Mode")
            {
                cmd = new SqlCommand("Sp_Income", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@IncomeSource", SqlDbType.Int).Value = Convert.ToInt32(cmIncomeSource.SelectedValue);
                cmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = dpIncomeDt.SelectedDate;
                cmd.Parameters.Add("@Amount", SqlDbType.Decimal).Value = txtAmount.Text;
                cmd.Parameters.Add("@Remarks", SqlDbType.VarChar).Value = txtRemarks.Text;
                cmd.Parameters.Add("@UserId", SqlDbType.VarChar).Value = AppEnv.Current.p_UserName;
                cmd.Parameters.Add("@Id", SqlDbType.Int).Value = Convert.ToInt32(txtIncomeId.Text);

                cmd.ExecuteNonQuery();
                con.Close();
            }

            //}
            //catch (Exception ex)
            //{
            //    lblMessage.Text = ex.Message.ToString();
            //}
        }
        private void ReloadMainGrid()
        {
            try
            {
                this.dtIncomeGrid.Clear();
                rgMain.Rebind();
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_Income", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 8;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                adpt.Fill(ds);
                dt = ds.Tables[0];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DataRow newRow = this.dtIncomeGrid.NewRow();
                    newRow["rowid"] = i + 1;
                    newRow["Id"] = Convert.ToInt32(dt.Rows[i]["Id"].ToString());
                    newRow["IncomeSource"] = dt.Rows[i]["IncomeSource"].ToString();
                    newRow["Date"] = dt.Rows[i]["Date"].ToString();
                    newRow["IncomeSourceName"] = dt.Rows[i]["IncomeSourceName"].ToString();
                    newRow["Amount"] = dt.Rows[i]["Amount"].ToString();
                    newRow["Remarks"] = dt.Rows[i]["Remarks"].ToString();
                    this.dtIncomeGrid.Rows.Add(newRow);
                    this.dtIncomeGrid.AcceptChanges();
                }
                rgMain.DataSource = this.dtIncomeGrid;
                rgMain.Rebind();
                cmd.Dispose();
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        public void EnableControl(bool ec)
        {
            txtAmount.Enabled = ec;
            txtRemarks.Enabled = ec;
            txtIncomeId.Enabled = ec;
            cmIncomeSource.Enabled = ec;
            dpIncomeDt.Enabled = ec;
        }
        public void ClearControl()
        {
            txtAmount.Text = "";
            txtRemarks.Text = "";
            txtIncomeId.Text = "";
            cmIncomeSource.Text = "";
            cmIncomeSource.SelectedValue = "";
            dpIncomeDt.SelectedDate = null;
        }
        public void ButtonControl(string bc)
        {
            if (bc == "L")
            {
                btnNew.Enabled = true;
                btnSave.Enabled = false;
                btnSearch.Enabled = true;
                btnEdit.Enabled = false;
                btnCancel.Enabled = false;
                lblOperationMode.Text = "";
                lblMessage.Text = "";
            }
            else if (bc == "N")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = true;
                btnSearch.Enabled = false;
                btnEdit.Enabled = false;
                btnCancel.Enabled = true;
                lblOperationMode.Text = "Save Mode";
                lblMessage.Text = "";
            }
            else if (bc == "F")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = false;
                btnSearch.Enabled = true;
                btnEdit.Enabled = true;
                btnCancel.Enabled = true;
                lblOperationMode.Text = "";
                lblMessage.Text = "";
            }
            else if (bc == "E")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = true;
                btnEdit.Enabled = false;
                btnCancel.Enabled = true;
                lblOperationMode.Text = "Edit Mode";
                lblMessage.Text = "";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReloadMainGrid();
                EnableControl(false);
                ClearControl();
                ButtonControl("L");
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                ClearControl();
                int max = Convert.ToInt32(GetAutoNumber("Id", "tblIncome"));
                txtIncomeId.Text = max.ToString();
                EnableControl(true);
                lblOperationMode.Text = "Save Mode";
                lblMessage.Text = "";
                ButtonControl("N");
                dpIncomeDt.SelectedDate = DateTime.Now;
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (cmIncomeSource.SelectedValue == "")
                {
                    lblMessage.Text = "Select Income Source.";
                }
                else if (dpIncomeDt.SelectedDate == null)
                {
                    lblMessage.Text = "Select Income Date.";
                }
                else if (txtAmount.Text == "")
                {
                    lblMessage.Text = "Amount can not be blank.";
                }
                else
                {
                    if (lblOperationMode.Text == "Save Mode")
                    {
                        SaveData();
                        ClearControl();
                        EnableControl(false);
                        lblMessage.Text = "Income Source " + cmIncomeSource.Text + " Saved Successfully.";
                        rgMain.Rebind();
                        ButtonControl("L");
                    }
                    else if (lblOperationMode.Text == "Edit Mode")
                    {
                        SaveData();
                        ClearControl();
                        EnableControl(false);
                        lblMessage.Text = "Income Source " + cmIncomeSource.Text + " Updated Successfully.";
                        rgMain.Rebind();
                        ButtonControl("L");
                    }
                }
                ReloadMainGrid();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtIncomeId.Text == "")
                {
                    lblMessage.Text = "Income Id Can not be Blank.";
                }
                else
                {
                    lblMessage.Text = "";
                    con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                    con.Open();
                    cmd = new SqlCommand("Sp_Income", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 5;
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        cmIncomeSource.SelectedValue = dr[""].ToString();
                        dpIncomeDt.SelectedDate = Convert.ToDateTime(dr["Date"].ToString());
                        txtAmount.Text = dr["Amount"].ToString();
                        txtRemarks.Text = dr["Remarks"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            EnableControl(true);
            ButtonControl("E");
            txtIncomeId.Enabled = false;
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
        protected void cmIncomeSource_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_Income", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = 5;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dataRow in dt.Rows)
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = (string)dataRow["Name"].ToString();
                    item.Value = dataRow["Id"].ToString();

                    cmIncomeSource.Items.Add(item);
                    item.DataBind();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void cmIncomeSource_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
        }
        protected void rgMain_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgMain.DataSource = this.dtIncomeGrid;
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
                cmd = new SqlCommand("Sp_Income", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 4;
                cmd.Parameters.Add("@Id", SqlDbType.VarChar).Value = selectedItem["Id"].Text;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt1 = new DataTable();
                adpt.Fill(ds);
                dt1 = ds.Tables[0];
                txtIncomeId.Text = dt1.Rows[0]["Id"].ToString();
                dpIncomeDt.SelectedDate = Convert.ToDateTime(dt1.Rows[0]["Date"].ToString());
                cmIncomeSource.SelectedValue = dt1.Rows[0]["IncomeSource"].ToString();
                cmIncomeSource.Text = dt1.Rows[0]["IncomeSourceName"].ToString();
                txtAmount.Text = dt1.Rows[0]["Amount"].ToString();
                txtRemarks.Text = dt1.Rows[0]["Remarks"].ToString();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
    }
}