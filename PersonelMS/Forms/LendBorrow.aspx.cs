using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace PersonelMS.Forms
{
    public partial class LendBorrow : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        PersonelMSEntities db = new PersonelMSEntities();
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
            txtRemarks.Enabled = ec;
            txtAmount.Enabled = ec;
            cmType.Enabled = ec;
            cmCustomerName.Enabled = ec;
            dpDate.Enabled = ec;
        }
        public void ClearControl()
        {
            cmType.Text = "";
            cmType.SelectedValue = "";
            cmCustomerName.Text = "";
            cmCustomerName.SelectedValue = "";
            txtId.Text = "";

            txtRemarks.Text = "";
            txtAmount.Text = "";
            dpDate.SelectedDate = null;
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
        }
        private void SaveData()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            try
            {
                cmd = new SqlCommand("Sp_LendBorrow", con);
                cmd.CommandType = CommandType.StoredProcedure;
                if (lblOperationMode.Text == "Save Mode")
                {
                    cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 1;
                }
                if (lblOperationMode.Text == "Edit Mode")
                {
                    cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 2;
                }
                cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = txtId.Text;
                cmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = dpDate.SelectedDate;
                cmd.Parameters.Add("@Type", SqlDbType.VarChar).Value = cmType.SelectedValue;
                cmd.Parameters.Add("@CustId", SqlDbType.VarChar).Value = cmCustomerName.SelectedValue;
                cmd.Parameters.Add("@Amount", SqlDbType.Decimal).Value = txtAmount.Text;
                if (cmType.SelectedValue == "Lend")
                {
                    cmd.Parameters.Add("@Lend", SqlDbType.Decimal).Value = txtAmount.Text;
                }
                else
                {
                    cmd.Parameters.Add("@Borrow", SqlDbType.Decimal).Value = txtAmount.Text;
                }

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
        public DataTable dtLendBorrowGrid
        {
            get
            {
                object obj = this.Session["dtLendBorrowGrid"];
                if (obj != null)
                {
                    return (DataTable)obj;
                }
                DataTable dt1 = new DataTable();
                dt1.Columns.Add("rowid", typeof(Int64));
                dt1.Columns.Add("ID", typeof(Int64));
                dt1.Columns.Add("Type", typeof(string));
                dt1.Columns.Add("Date", typeof(DateTime));
                dt1.Columns.Add("Amount", typeof(string));
                dt1.Columns.Add("Lend", typeof(string));
                dt1.Columns.Add("Borrow", typeof(string));
                dt1.Columns.Add("CustId", typeof(string));
                dt1.Columns.Add("CustomerName", typeof(string));
                dt1.Columns.Add("Remarks", typeof(string));
                dt1.PrimaryKey = new DataColumn[] { dt1.Columns["rowid"] };
                this.Session["dtLendBorrowGrid"] = dt1;
                return dtLendBorrowGrid;
            }
        }
        private void ReloadMainGrid()
        {
            try
            {
                this.dtLendBorrowGrid.Clear();
                RadGrid1.Rebind();
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_LendBorrow", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "5";
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                adpt.Fill(ds);
                dt = ds.Tables[0];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DataRow newRow = this.dtLendBorrowGrid.NewRow();
                    newRow["rowid"] = i + 1;
                    newRow["ID"] = Convert.ToInt32(dt.Rows[i]["ID"].ToString());
                    newRow["Type"] = dt.Rows[i]["Type"].ToString();
                    newRow["Date"] = dt.Rows[i]["Date"].ToString();
                    newRow["Amount"] = dt.Rows[i]["Amount"].ToString();
                    newRow["Lend"] = dt.Rows[i]["Lend"].ToString();
                    newRow["Borrow"] = dt.Rows[i]["Borrow"].ToString();
                    newRow["CustId"] = dt.Rows[i]["CustId"].ToString();
                    newRow["CustomerName"] = dt.Rows[i]["CustomerName"].ToString();
                    newRow["Remarks"] = dt.Rows[i]["Remarks"].ToString();
                    this.dtLendBorrowGrid.Rows.Add(newRow);
                    this.dtLendBorrowGrid.AcceptChanges();
                }
                RadGrid1.DataSource = this.dtLendBorrowGrid;
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
                cmd = new SqlCommand("Sp_LendBorrow", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 6;
                cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = selectedItem["ID"].Text;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                adpt.Fill(ds);
                dt = ds.Tables[0];
                txtId.Text = dt.Rows[0]["ID"].ToString();
                dpDate.SelectedDate = Convert.ToDateTime(dt.Rows[0]["Date"].ToString());
                cmType.Text = dt.Rows[0]["Type"].ToString();
                cmType.SelectedValue = dt.Rows[0]["Type"].ToString();
                txtAmount.Text = dt.Rows[0]["Amount"].ToString();
                txtRemarks.Text = dt.Rows[0]["Remarks"].ToString();
                cmCustomerName.Text = dt.Rows[0]["CustomerName"].ToString();
                cmCustomerName.SelectedValue = dt.Rows[0]["CustId"].ToString();
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
                ClearControl();
                ButtonControl("L");
                ReloadMainGrid();
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                EnableControl(true);
                ClearControl();
                ButtonControl("N");

                int max = Convert.ToInt32(GetAutoNumber("ID", "tblLendBorrow"));
                txtId.Text = max.ToString();
                dpDate.SelectedDate = System.DateTime.Now;
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
            if (cmType.SelectedValue == "")
            {
                lblMessage.Text = "Select Type.";
            }
            else if (dpDate.SelectedDate == null)
            {
                lblMessage.Text = "Select Date.";
            }
            else if (txtAmount.Text == "")
            {
                lblMessage.Text = "Amount can not be Blank.";
            }
            else if (cmCustomerName.SelectedValue == "")
            {
                lblMessage.Text = "Select Customer Name.";
            }
            else
            {
                try
                {
                    SaveData();
                    ButtonControl("L");
                    ClearControl();
                    EnableControl(false);
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
            RadGrid1.DataSource = this.dtLendBorrowGrid;
        }
        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClearControl();
            DataRefill();
            ButtonControl("E");
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
        decimal sumLend = 0;
        decimal sumBorrow = 0;
        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            try
            {
                if (e.Item is GridDataItem)
                {
                    GridDataItem dataItem = e.Item as GridDataItem;
                    sumLend += Convert.ToDecimal(dataItem["Lend"].Text);
                    sumBorrow += Convert.ToDecimal(dataItem["Borrow"].Text);
                }
                else if (e.Item is GridFooterItem)
                {
                    GridFooterItem footerItem = e.Item as GridFooterItem;
                    footerItem["Lend"].Text = sumLend.ToString();
                    footerItem["Lend"].HorizontalAlign = HorizontalAlign.Right;
                    footerItem["Borrow"].Text = sumBorrow.ToString();
                    footerItem["Borrow"].HorizontalAlign = HorizontalAlign.Right;
                    footerItem["Remarks"].Text = "Balance : ";
                    footerItem["Amount"].Text = "Total : ";
                    footerItem["CustomerName"].Text = (sumLend - sumBorrow).ToString();
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
            try
            {
                GridDataItem item = (GridDataItem)e.Item;
                int ID = Convert.ToInt16(item["ID"].Text);

                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_LendBorrow", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "6";
                cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = ID;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                adpt.Fill(ds);
                dt = ds.Tables[0];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DataRow newRow = this.dtLendBorrowGrid.NewRow();
                    newRow["rowid"] = i + 1;
                    newRow["ID"] = Convert.ToInt32(dt.Rows[i]["ID"].ToString());
                    newRow["Type"] = dt.Rows[i]["Type"].ToString();
                    newRow["Date"] = dt.Rows[i]["Date"].ToString();
                    newRow["Amount"] = dt.Rows[i]["Amount"].ToString();
                    newRow["Lend"] = dt.Rows[i]["Lend"].ToString();
                    newRow["Borrow"] = dt.Rows[i]["Borrow"].ToString();
                    newRow["CustId"] = dt.Rows[i]["CustId"].ToString();
                    newRow["CustomerName"] = dt.Rows[i]["CustomerName"].ToString();
                    newRow["Remarks"] = dt.Rows[i]["Remarks"].ToString();
                    this.dtLendBorrowGrid.Rows.Add(newRow);
                    this.dtLendBorrowGrid.AcceptChanges();
                }
                RadGrid1.DataSource = this.dtLendBorrowGrid;
                RadGrid1.Rebind();
                cmd.Dispose();
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void cmType_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_LendBorrow", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "8";
                cmd.Parameters.Add("@Type", SqlDbType.VarChar).Value = cmType.SelectedValue;
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

        protected void btnCustomerName_Click(object sender, EventArgs e)
        {
            lblMessagePopup.Text = "";
            lblInsertType.Text = "Insert Customer";
            ViewState["btnType"] = "Customer";
            int max = Convert.ToInt32(GetAutoNumber("CustId", "tblCustomers"));
            txtCodeMaster.Text = max.ToString();
            txtNameMaster.Text = "";
            txtMobileNo.Text = "";
            txtAddress.Text = "";
            lblTypeName.Visible = true;
            lblTypeName.Text = "Mobile";
            RadWindow1.VisibleOnPageLoad = true;
        }
        protected void btnSaveMaster_Click(object sender, EventArgs e)
        {
            if (txtNameMaster.Text == "")
            {
                lblMessagePopup.Text = "Name can not be Blank.";
            }
            else if (txtMobileNo.Text == "")
            {
                lblMessagePopup.Text = "Mobile No can not be Blank.";
            }
            else if (txtAddress.Text == "")
            {
                lblMessagePopup.Text = "Address No can not be Blank.";
            }
            else
            {
                if (ViewState["btnType"].ToString() == "Customer")
                {
                    tblCustomer tbl = new tblCustomer();
                    tbl.CustId = Convert.ToInt32(txtCodeMaster.Text);
                    tbl.Name = txtNameMaster.Text;
                    tbl.Mobile = txtMobileNo.Text;
                    tbl.Address = txtAddress.Text;
                    db.tblCustomers.Add(tbl);
                    db.SaveChanges();
                    cmCustomerName.DataBind();

                    lblMessagePopup.Text = txtNameMaster.Text + " Saved Successfully.";
                    txtNameMaster.Text = "";
                    txtCodeMaster.Text = "";
                    txtMobileNo.Text = "";
                    txtAddress.Text = "";
                    int max = Convert.ToInt32(GetAutoNumber("CustId", "tblCustomers"));
                    txtCodeMaster.Text = max.ToString();
                }
            }
            RadWindow1.VisibleOnPageLoad = false;
        }
        protected void btnCancelMaster_Click(object sender, EventArgs e)
        {
            txtNameMaster.Text = "";
            txtCodeMaster.Text = "";
            txtMobileNo.Text = "";
            txtAddress.Text = "";
            RadWindow1.VisibleOnPageLoad = false;
        }
        protected void cmCustomerName_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }
        protected void cmCustomerName_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_LendBorrow", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = 9;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dataRow in dt.Rows)
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = (string)dataRow["Name"].ToString();
                    item.Value = dataRow["CustId"].ToString();

                    string Id = (string)dataRow["CustId"].ToString();
                    item.Attributes.Add("CustId", Id.ToString());

                    cmCustomerName.Items.Add(item);
                    item.DataBind();
                    item.DataBind();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
    }
}