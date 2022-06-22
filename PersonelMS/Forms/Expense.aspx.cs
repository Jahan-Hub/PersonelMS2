using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;

namespace PersonelMS.Forms
{
    public partial class Expense : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        public DataTable dtExpenseGrid
        {
            get
            {
                object obj = this.Session["dtExpenseGrid"];
                if (obj != null)
                {
                    return (DataTable)obj;
                }
                DataTable dt1 = new DataTable();
                dt1.Columns.Add("rowid", typeof(Int32));
                dt1.Columns.Add("Id", typeof(Int32));
                dt1.Columns.Add("CostHead", typeof(string));
                dt1.Columns.Add("CostElement", typeof(string));
                dt1.Columns.Add("Date", typeof(DateTime));
                dt1.Columns.Add("CostCenterName", typeof(string));
                dt1.Columns.Add("CostElementName", typeof(string));
                dt1.Columns.Add("PayTo", typeof(string));
                dt1.Columns.Add("Amount", typeof(string));
                dt1.Columns.Add("Remarks", typeof(string));
                dt1.PrimaryKey = new DataColumn[] { dt1.Columns["rowid"] };
                this.Session["dtExpenseGrid"] = dt1;
                return dtExpenseGrid;
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
                int year = Convert.ToDateTime(dpExpenseDt.SelectedDate).Year;
                int month = Convert.ToDateTime(dpExpenseDt.SelectedDate).Month;
                DateTime FirstDate = new DateTime(year, month, 1);
                DateTime LastDate = new DateTime(year, month, DateTime.DaysInMonth(year, month));
                cmd = new SqlCommand("Sp_Expense", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 1;
                cmd.Parameters.Add("@Id", SqlDbType.Int).Value = Convert.ToInt32(txtExpenseId.Text);
                cmd.Parameters.Add("@Head", SqlDbType.Int).Value = Convert.ToInt32(cmCostHead.SelectedValue);
                cmd.Parameters.Add("@Element", SqlDbType.Int).Value = Convert.ToInt32(cmExpenseHead.SelectedValue);
                cmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = dpExpenseDt.SelectedDate;
                cmd.Parameters.Add("@PayTo", SqlDbType.VarChar).Value = txtPayTo.Text;
                cmd.Parameters.Add("@Amount", SqlDbType.Decimal).Value = txtAmount.Text;
                cmd.Parameters.Add("@UserId", SqlDbType.VarChar).Value = AppEnv.Current.p_UserName;
                cmd.Parameters.Add("@Remarks", SqlDbType.VarChar).Value = txtRemarks.Text;

                cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = Convert.ToDateTime(FirstDate);
                cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = Convert.ToDateTime(LastDate);

                cmd.Parameters.Add("@CostElementName", SqlDbType.VarChar).Value = cmExpenseHead.Text;

                cmd.ExecuteNonQuery();
                con.Close();

                ClearControl();
                EnableControl(false);
                lblMessage.Text = "Expense Head " + cmExpenseHead.Text + " Saved Successfully.";
                ReloadMainGrid();
                ButtonControl("L");
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }
        private void ReloadMainGrid()
        {
            try
            {
                this.dtExpenseGrid.Clear();
                rgMain.Rebind();
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_Expense", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 4;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                adpt.Fill(ds);
                dt = ds.Tables[0];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DataRow newRow = this.dtExpenseGrid.NewRow();
                    newRow["rowid"] = i + 1;
                    newRow["Id"] = Convert.ToInt32(dt.Rows[i]["Id"].ToString());
                    newRow["CostHead"] = dt.Rows[i]["CostHead"].ToString();
                    newRow["CostElement"] = dt.Rows[i]["CostElement"].ToString();
                    newRow["Date"] = dt.Rows[i]["Date"].ToString();
                    newRow["CostCenterName"] = dt.Rows[i]["CostCenterName"].ToString();
                    newRow["CostElementName"] = dt.Rows[i]["CostElementName"].ToString();
                    newRow["PayTo"] = dt.Rows[i]["PayTo"].ToString();
                    newRow["Amount"] = dt.Rows[i]["Amount"].ToString();
                    newRow["Remarks"] = dt.Rows[i]["Remarks"].ToString();
                    this.dtExpenseGrid.Rows.Add(newRow);
                    this.dtExpenseGrid.AcceptChanges();
                }
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
            cmExpenseHead.Enabled = ec;
            cmCostHead.Enabled = ec;
            txtPayTo.Enabled = ec;
            dpExpenseDt.Enabled = ec;
        }
        public void ClearControl()
        {
            txtAmount.Text = "";
            txtExpenseId.Text = "";
            txtRemarks.Text = "";
            cmExpenseHead.Text = "";
            cmExpenseHead.SelectedValue = "";
            cmCostHead.Text = "";
            cmCostHead.SelectedValue = "";
            txtPayTo.Text = "";
            dpExpenseDt.SelectedDate = null;
        }
        public void ButtonControl(string bc)
        {
            if (bc == "L")
            {
                btnNew.Enabled = true;
                btnSave.Enabled = false;
                btnEdit.Enabled = false;
                btnCancel.Enabled = false;
                lblOperationMode.Text = "";
                lblMessage.Text = "";
            }
            else if (bc == "N")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = true;
                btnEdit.Enabled = false;
                btnCancel.Enabled = true;
                lblOperationMode.Text = "Save Mode";
                lblMessage.Text = "";
            }
            else if (bc == "F")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = false;
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
                EnableControl(false);
                ClearControl();
                ButtonControl("L");
                ReloadMainGrid();
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                ClearControl();
                int max = Convert.ToInt32(GetAutoNumber("Id", "tblExpense"));
                txtExpenseId.Text = max.ToString();
                EnableControl(true);
                lblOperationMode.Text = "Save Mode";
                lblMessage.Text = "";
                ButtonControl("N");
                dpExpenseDt.SelectedDate = DateTime.Now;
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
                if (cmExpenseHead.SelectedValue == "")
                {
                    lblMessage.Text = "Select Expense Head.";
                }
                else if (dpExpenseDt.SelectedDate == null)
                {
                    lblMessage.Text = "Select Expense Date.";
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
                    }
                    else if (lblOperationMode.Text == "Edit Mode")
                    {
                        SaveData();
                    }
                }
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
                if (txtExpenseId.Text == "")
                {
                    lblMessage.Text = "Expense Id Can not be Blank.";
                }
                else
                {
                    lblMessage.Text = "";
                    con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                    con.Open();
                    cmd = new SqlCommand("Sp_Expense", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 5;
                    cmd.Parameters.Add("@Id", SqlDbType.Int).Value = txtExpenseId.Text;
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        cmCostHead.SelectedValue = dr["ExHead"].ToString();
                        cmExpenseHead.SelectedValue = dr["ExElement"].ToString();
                        dpExpenseDt.SelectedDate = Convert.ToDateTime(dr["ExDate"].ToString());
                        txtPayTo.Text = dr["PayTo"].ToString();
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
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearControl();
            EnableControl(false);
            ButtonControl("L");
        }
        protected void rgMain_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ButtonControl("F");
                GridDataItem selectedItem = (GridDataItem)rgMain.SelectedItems[0];
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_Expense", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 5;
                cmd.Parameters.Add("@Id", SqlDbType.VarChar).Value = selectedItem["Id"].Text;
                cmd.Parameters.Add("@ExistingSalary", SqlDbType.VarChar).Value = selectedItem["Amount"].Text;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt1 = new DataTable();
                adpt.Fill(ds);
                dt1 = ds.Tables[0];
                txtExpenseId.Text = dt1.Rows[0]["Id"].ToString();
                dpExpenseDt.SelectedDate = Convert.ToDateTime(dt1.Rows[0]["Date"].ToString());
                cmCostHead.SelectedValue = dt1.Rows[0]["CostHead"].ToString();
                cmCostHead.Text = dt1.Rows[0]["CostCenterName"].ToString();
                cmExpenseHead.SelectedValue = dt1.Rows[0]["CostElement"].ToString();
                cmExpenseHead.Text = dt1.Rows[0]["CostElementName"].ToString();
                txtPayTo.Text = dt1.Rows[0]["PayTo"].ToString();
                txtAmount.Text = dt1.Rows[0]["Amount"].ToString();
                txtRemarks.Text = dt1.Rows[0]["Remarks"].ToString();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void cmCostHead_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cmExpenseHead.Text = "";
            cmExpenseHead.SelectedValue = "";
        }
        protected void cmCostHead_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_Expense", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = 6;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dataRow in dt.Rows)
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = (string)dataRow["Name"].ToString();
                    item.Value = dataRow["Id"].ToString();

                    cmCostHead.Items.Add(item);
                    item.DataBind();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void cmExpenseHead_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_Expense", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = 7;
                cmd.Parameters.Add("@Head", SqlDbType.VarChar).Value = cmCostHead.SelectedValue;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dataRow in dt.Rows)
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = (string)dataRow["Name"].ToString();
                    item.Value = dataRow["Id"].ToString();

                    cmExpenseHead.Items.Add(item);
                    item.DataBind();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void rgMain_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgMain.DataSource = this.dtExpenseGrid;
        }
        protected void rgMain_PageIndexChanged(object sender, GridPageChangedEventArgs e)
        {

        }
    }
}