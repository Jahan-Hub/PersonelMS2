using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;

namespace PersonelMS.Forms
{
    public partial class BankTransaction : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        public string GetAutoNumber(string fieldName, string tableName)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                string ss = "Select convert(int,isnull(Max(" + fieldName + "),0)) from " + tableName;
                SqlCommand cmd = new SqlCommand(ss, con);

                con.Open();
                int x = (int)cmd.ExecuteScalar() + 1;
                return x.ToString();
            }
            catch (Exception)
            {
                return "1";
            }
            finally
            {
                con.Close();
            }
        }
        public void EnableControl(bool ec)
        {
            cmBankName.Enabled = ec;
            txtChequeNo.Enabled = ec;
            txtCheckDetails.Enabled = ec;
            txtRemarks.Enabled = ec;
            txtAmount.Enabled = ec;
            cmTransactionType.Enabled = ec;
            dpCheckDate.Enabled = ec;
            dpTransactionDate.Enabled = ec;
        }
        public void EnableControlPartial(bool ec)
        {
            txtChequeNo.Enabled = ec;
            dpCheckDate.Enabled = ec;
            txtCheckDetails.Enabled = ec;
        }
        public void ClearControl()
        {
            cmTransactionType.Text = "";
            txtTransactionId.Text = "";
            dpTransactionDate.SelectedDate = null;
            cmTransactionType.SelectedValue = "";
            txtRemarks.Text = "";
            txtAmount.Text = "";
            cmBankName.Text = "";
            cmBankName.SelectedValue = "";

            txtCheckDetails.Text = "";
            txtChequeNo.Text = "";
            dpCheckDate.SelectedDate = null;
        }
        public void ClearControlPartial()
        {
            txtChequeNo.Text = "";
            txtCheckDetails.Text = "";
            dpCheckDate.SelectedDate = null;
        }
        public void ButtonControl(string bc)
        {
            //// Which button you click control according by button
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
            //else if (bc == "S")
            //{
            //    btnNew.Enabled = false;
            //    btnSave.Enabled = false;
            //    btnEdit.Enabled = false;
            //    btnSearch.Enabled = false;
            //    btnCancel.Enabled = false;
            //    lblOperationMode.Text = "";
            //    lblMessage.Text = "";

            //}
            else if (bc == "F")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = false;
                btnSearch.Enabled = true;
                btnEdit.Enabled = true;
                btnSearch.Enabled = false;
                btnCancel.Enabled = true;
                lblOperationMode.Text = "";
                lblMessage.Text = "";
            }
            else if (bc == "E")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = true;
                btnEdit.Enabled = true;
                btnSearch.Enabled = false;
                btnCancel.Enabled = true;
                lblOperationMode.Text = "Edit Mode";
                lblMessage.Text = "";
            }

            //else if (bc == "C")
            //{
            //    btnNew.Enabled = true;
            //    btnSave.Enabled = false;
            //    btnEdit.Enabled = false;
            //    btnSearch.Enabled = false;
            //    btnCancel.Enabled = false;
            //    lblOperationMode.Text = "";
            //    lblMessage.Text = "";
            //}
        }
        private void SaveData()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            try
            {
                cmd = new SqlCommand("Sp_BankTransaction", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 1;
                cmd.Parameters.Add("@TransactionID", SqlDbType.VarChar).Value = txtTransactionId.Text;
                cmd.Parameters.Add("@TransactionDate", SqlDbType.DateTime).Value = dpTransactionDate.SelectedDate;
                cmd.Parameters.Add("@TransactionType", SqlDbType.VarChar).Value = cmTransactionType.SelectedValue;
                cmd.Parameters.Add("@Bank", SqlDbType.VarChar).Value = cmBankName.SelectedValue;
                cmd.Parameters.Add("@Amount", SqlDbType.Decimal).Value = txtAmount.Text;
                if (cmTransactionType.SelectedValue == "Deposit")
                {
                    cmd.Parameters.Add("@Deposit", SqlDbType.Decimal).Value = txtAmount.Text;
                }
                else
                {
                    cmd.Parameters.Add("@Withdraw", SqlDbType.Decimal).Value = txtAmount.Text;
                }
                cmd.Parameters.Add("@ChequeNo", SqlDbType.VarChar).Value = txtChequeNo.Text;
                if (dpCheckDate.SelectedDate != null)
                    cmd.Parameters.Add("@ChequeDate", SqlDbType.DateTime).Value = dpCheckDate.SelectedDate;
                cmd.Parameters.Add("@ChequeDetails", SqlDbType.VarChar).Value = txtCheckDetails.Text;

                cmd.Parameters.Add("@Remarks", SqlDbType.VarChar).Value = txtRemarks.Text;
                cmd.Parameters.Add("@userid", SqlDbType.VarChar).Value = AppEnv.Current.p_UserName;

                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();

                //ReloadMainGrid();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }
        private void EditData()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            try
            {
                cmd = new SqlCommand("Sp_BankTransaction", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@TransactionDate", SqlDbType.DateTime).Value = dpTransactionDate.SelectedDate;
                cmd.Parameters.Add("@TransactionType", SqlDbType.VarChar).Value = cmTransactionType.SelectedValue;
                cmd.Parameters.Add("@Bank", SqlDbType.VarChar).Value = cmBankName.SelectedValue;
                cmd.Parameters.Add("@Amount", SqlDbType.Decimal).Value = txtAmount.Text;

                cmd.Parameters.Add("@ChequeNo", SqlDbType.VarChar).Value = txtChequeNo.Text;
                if (dpCheckDate.SelectedDate != null)
                    cmd.Parameters.Add("@ChequeDate", SqlDbType.DateTime).Value = dpCheckDate.SelectedDate;
                cmd.Parameters.Add("@ChequeDetails", SqlDbType.VarChar).Value = txtCheckDetails.Text;

                cmd.Parameters.Add("@Remarks", SqlDbType.VarChar).Value = txtRemarks.Text;
                cmd.Parameters.Add("@userid", SqlDbType.VarChar).Value = AppEnv.Current.p_UserName;
                cmd.Parameters.Add("@TransactionID", SqlDbType.VarChar).Value = txtTransactionId.Text;

                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();

                //ReloadMainGrid();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }
        public DataTable dtBankTransactionsGrid
        {
            get
            {
                object obj = this.Session["dtBankTransactionsGrid"];
                if (obj != null)
                {
                    return (DataTable)obj;
                }
                DataTable dt1 = new DataTable();
                dt1.Columns.Add("rowid", typeof(Int64));
                dt1.Columns.Add("TrackId", typeof(Int64));
                dt1.Columns.Add("TransactionType", typeof(string));
                dt1.Columns.Add("TransactionDate", typeof(DateTime));
                dt1.Columns.Add("BankName", typeof(string));
                dt1.Columns.Add("Amount", typeof(string));
                dt1.Columns.Add("Deposit", typeof(string));
                dt1.Columns.Add("Withdraw", typeof(string));
                dt1.Columns.Add("Remarks", typeof(string));
                dt1.Columns.Add("ChequeNo", typeof(string));
                dt1.Columns.Add("ChequeDate", typeof(DateTime));
                //dt1.Columns.Add("DepositBank", typeof(string));
                dt1.Columns.Add("ChequeDetails", typeof(string));
                dt1.PrimaryKey = new DataColumn[] { dt1.Columns["rowid"] };
                this.Session["dtBankTransactionsGrid"] = dt1;
                return dtBankTransactionsGrid;
            }
        }
        private void ReloadMainGrid()
        {
            try
            {
                this.dtBankTransactionsGrid.Clear();
                RadGrid1.Rebind();
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_BankTransaction", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "5";
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                adpt.Fill(ds);
                dt = ds.Tables[0];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DataRow newRow = this.dtBankTransactionsGrid.NewRow();
                    newRow["rowid"] = i + 1;
                    newRow["TrackId"] = Convert.ToInt32(dt.Rows[i]["TrackId"].ToString());
                    newRow["TransactionType"] = dt.Rows[i]["TransactionType"].ToString();
                    newRow["TransactionDate"] = dt.Rows[i]["TransactionDate"].ToString();
                    newRow["BankName"] = dt.Rows[i]["BankName"].ToString();
                    newRow["Amount"] = dt.Rows[i]["Amount"].ToString();
                    newRow["Deposit"] = dt.Rows[i]["Deposit"].ToString();
                    newRow["Withdraw"] = dt.Rows[i]["Withdraw"].ToString();
                    newRow["Remarks"] = dt.Rows[i]["Remarks"].ToString();
                    newRow["ChequeNo"] = dt.Rows[i]["ChequeNo"].ToString();
                    newRow["ChequeDate"] = dt.Rows[i]["ChequeDate"].ToString();
                    //newRow["DepositBank"] = dt.Rows[i]["DepositBank"].ToString();
                    newRow["ChequeDetails"] = dt.Rows[i]["ChequeDetails"].ToString();
                    this.dtBankTransactionsGrid.Rows.Add(newRow);
                    this.dtBankTransactionsGrid.AcceptChanges();
                }
                RadGrid1.DataSource = this.dtBankTransactionsGrid;
                RadGrid1.Rebind();
                cmd.Dispose();
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        private void DataRefill()
        {
            try
            {
                GridDataItem selectedItem = (GridDataItem)RadGrid1.SelectedItems[0];
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_BankTransaction", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 6;
                cmd.Parameters.Add("@TrackId", SqlDbType.VarChar).Value = selectedItem["TrackId"].Text;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                adpt.Fill(ds);
                dt = ds.Tables[0];
                txtTransactionId.Text = dt.Rows[0]["TransactionID"].ToString();
                dpTransactionDate.SelectedDate = Convert.ToDateTime(dt.Rows[0]["TransactionDate"].ToString());
                cmTransactionType.Text = dt.Rows[0]["TransactionType"].ToString();
                cmTransactionType.SelectedValue = dt.Rows[0]["TransactionType"].ToString();
                txtAmount.Text = dt.Rows[0]["Amount"].ToString();
                txtCheckDetails.Text = dt.Rows[0]["ChequeDetails"].ToString();
                txtChequeNo.Text = dt.Rows[0]["ChequeNo"].ToString();
                dpCheckDate.SelectedDate = Convert.ToDateTime(dt.Rows[0]["ChequeDate"].ToString());
                txtRemarks.Text = dt.Rows[0]["Remarks"].ToString();
                cmBankName.Text = dt.Rows[0]["BankName"].ToString();
                cmBankName.SelectedValue = dt.Rows[0]["Bank"].ToString();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EnableControl(false);
                EnableControlPartial(false);
                ClearControl();
                ButtonControl("L");
                ReloadMainGrid();
            }
        }

        protected void cmBankName_ItemsRequested(object sender, Telerik.Web.UI.RadComboBoxItemsRequestedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_BankTransaction", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 7;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dataRow in dt.Rows)
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = (string)dataRow["Name"];
                    item.Value = dataRow["BankCode"].ToString();

                    cmBankName.Items.Add(item);
                    item.DataBind();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void cmBankName_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_BankTransaction", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "8";
                if (cmBankName.SelectedValue != "")
                    cmd.Parameters.Add("@Bank", SqlDbType.VarChar).Value = cmBankName.SelectedValue;
                if (cmTransactionType.SelectedValue != "")
                    cmd.Parameters.Add("@TransactionType", SqlDbType.VarChar).Value = cmTransactionType.SelectedValue;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                adpt.Fill(ds);
                dt = ds.Tables[0];
                RadGrid1.DataSource = dt;
                RadGrid1.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void cmTransactionType_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_BankTransaction", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "8";
                if (cmBankName.SelectedValue != "")
                    cmd.Parameters.Add("@Bank", SqlDbType.VarChar).Value = cmBankName.SelectedValue;
                if (cmTransactionType.SelectedValue != "")
                    cmd.Parameters.Add("@TransactionType", SqlDbType.VarChar).Value = cmTransactionType.SelectedValue;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                adpt.Fill(ds);
                dt = ds.Tables[0];
                RadGrid1.DataSource = dt;
                RadGrid1.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                EnableControl(true);
                ClearControl();
                ButtonControl("N");

                int max = Convert.ToInt32(GetAutoNumber("TransactionID", "tblBankTransaction"));
                txtTransactionId.Text = max.ToString();
                dpTransactionDate.SelectedDate = System.DateTime.Now;
                lblOperationMode.Text = "Save Mode";
                lblMessage.Text = "";
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (cmBankName.SelectedValue == "")
            {
                lblMessage.Text = "Select Bank Name.";
            }
            else if (cmTransactionType.SelectedValue == "")
            {
                lblMessage.Text = "Select Transaction Type.";
            }
            else if (dpTransactionDate.SelectedDate == null)
            {
                lblMessage.Text = "Select Transaction Date.";
            }
            else if (dpCheckDate.SelectedDate == null)
            {
                lblMessage.Text = "Select Cheque Date.";
            }
            else if (txtAmount.Text == "")
            {
                lblMessage.Text = "Amount can not be Blank.";
            }
            else
            {
                try
                {
                    if (lblOperationMode.Text == "Save Mode")
                    {
                        SaveData();
                        ButtonControl("L");
                        ClearControl();
                        EnableControl(false);
                    }
                    else if (lblOperationMode.Text == "Edit Mode")
                    {
                        EditData();
                        ButtonControl("L");
                        ClearControl();
                        EnableControl(false);
                    }
                    //RadGrid1.Rebind();
                    ReloadMainGrid();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {

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

        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            RadGrid1.DataSource = this.dtBankTransactionsGrid;
        }
        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClearControl();
            ClearControlPartial();

            DataRefill();
            ButtonControl("E");
            btnSave.Enabled = false;
            EnableControl(true);
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            //try
            //{
            //    if (e.CommandName == "GridDelete")
            //    {
            //        GridDataItem item = (GridDataItem)e.Item;
            //        int RID = Convert.ToInt16(item["rowid"].Text);
            //        DataRow[] Drow = this.dtItemDetailSales.Select("rowid='" + RID + "'");
            //        if (Drow.Length > 0)
            //        {
            //            Drow[0].Delete();
            //            this.dtItemDetailSales.AcceptChanges();
            //            RadGrid1.Rebind();
            //        }
            //        txtPaidAmount.Text = "0";
            //        txtPacketCost.Text = "0";
            //        txtDiscount.Text = "0";
            //        txtLabourCost.Text = "0";
            //        txtOtherCost.Text = "0";
            //        if (txtPacketCost.Text != "" && txtDiscount.Text != "" && lblDueAmount.Text != "" && txtLabourCost.Text != "" && txtPaidAmount.Text != "")
            //        {
            //            decimal total = Convert.ToDecimal(ViewState["sumAmount"]);
            //            decimal labourCost = Convert.ToDecimal(txtLabourCost.Text);
            //            decimal otherCost = Convert.ToDecimal(txtOtherCost.Text);
            //            decimal PacketCost = Convert.ToDecimal(txtPacketCost.Text);
            //            decimal discount = Convert.ToDecimal(txtDiscount.Text);
            //            decimal netamount = (total + labourCost + otherCost + PacketCost) - discount;
            //            lblNetAmount.Text = netamount.ToString();
            //            decimal paid = Convert.ToDecimal(txtPaidAmount.Text);
            //            decimal due = ((total + labourCost + otherCost + PacketCost) - discount) - paid;
            //            lblDueAmount.Text = due.ToString();
            //        }
            //    }
            //}
            //catch (Exception ex)
            //{
            //    lblMessage.Text = ex.Message;
            //}
        }
        decimal sumDeposit = 0;
        decimal sumWithdraw = 0;
        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            try
            {
                if (e.Item is GridDataItem)
                {
                    GridDataItem dataItem = e.Item as GridDataItem;
                    sumDeposit += Convert.ToDecimal(dataItem["Deposit"].Text);
                    sumWithdraw += Convert.ToDecimal(dataItem["Withdraw"].Text);
                }
                else if (e.Item is GridFooterItem)
                {
                    GridFooterItem footerItem = e.Item as GridFooterItem;
                    footerItem["Deposit"].Text = sumDeposit.ToString();
                    footerItem["Withdraw"].Text = sumWithdraw.ToString();
                    footerItem["Remarks"].Text = "Balance : ";
                    footerItem["Amount"].Text = "Total : ";
                    footerItem["ChequeNo"].Text = (sumDeposit - sumWithdraw).ToString();
                    footerItem.BackColor = System.Drawing.Color.LightGray;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void RadGrid1_PageIndexChanged(object sender, GridPageChangedEventArgs e)
        {
            ReloadMainGrid();
        }
    }
}