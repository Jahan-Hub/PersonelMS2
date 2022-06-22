using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using Telerik.Web.UI;

namespace PersonelMS.Forms
{
    public partial class CustomerInfo : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        PersonelMSEntities db = new PersonelMSEntities();
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        public DataTable dtCustomer
        {
            get
            {
                object obj = this.Session["dtCustomer"];
                if (obj != null)
                {
                    return (DataTable)obj;
                }
                DataTable dt1 = new DataTable();
                dt1.Columns.Add("rowid", typeof(Int32));
                dt1.Columns.Add("CustId", typeof(Int32));
                dt1.Columns.Add("Name", typeof(string));
                dt1.Columns.Add("FatherName", typeof(string));
                dt1.Columns.Add("Mobile", typeof(string));
                dt1.Columns.Add("Phone", typeof(string));
                dt1.Columns.Add("Telephone", typeof(string));
                dt1.PrimaryKey = new DataColumn[] { dt1.Columns["rowid"] };
                this.Session["dtCustomer"] = dt1;
                return dtCustomer;
            }
        }
        public string GetAutoNumber(string fieldName, string tableName)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                string ss = "Select convert(int,Max(" + fieldName + ")) from " + tableName;
                SqlCommand cmd = new SqlCommand(ss, con);

                con.Open();
                int x = (int)cmd.ExecuteScalar() + 1;
                return x.ToString();
            }
            catch (Exception)
            {
                return "10001";
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
                cmd = new SqlCommand("Sp_CustomerInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 1;
                cmd.Parameters.Add("@CustId", SqlDbType.NVarChar).Value = txtCustCode.Text;
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = textInfo.ToTitleCase(txtName.Text);
                cmd.Parameters.Add("@FatherName", SqlDbType.NVarChar).Value = txtFatherName.Text;
                if (txtMobile.Text != "")
                    cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar).Value = txtMobile.Text;
                if (txtPhone.Text != "")
                    cmd.Parameters.Add("@Phone", SqlDbType.NVarChar).Value = txtPhone.Text;
                if (cmDistrict.SelectedValue != "")
                    cmd.Parameters.Add("@DisId", SqlDbType.Int).Value = cmDistrict.SelectedValue;
                if (cmUpazila.SelectedValue != "")
                    cmd.Parameters.Add("@UpaId", SqlDbType.Int).Value = cmUpazila.SelectedValue;
                if (cmVillage.SelectedValue != "")
                    cmd.Parameters.Add("@ViId", SqlDbType.Int).Value = cmVillage.SelectedValue;
                cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = txtAddress.Text;
                cmd.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = txtRemarks.Text;
                if (ckSpecial.Checked == true)
                    cmd.Parameters.Add("@IsSpecial", SqlDbType.Bit).Value = 1;
                else
                    cmd.Parameters.Add("@IsSpecial", SqlDbType.Bit).Value = 0;

                cmd.Parameters.Add("@userid", SqlDbType.NVarChar).Value = AppEnv.Current.p_UserName;
                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }
        private void DataRefill()
        {
            GridDataItem selectedItem = (GridDataItem)RadGrid1.SelectedItems[0];
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("Sp_CustomerInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 5;
            cmd.Parameters.Add("@CustId", SqlDbType.VarChar).Value = selectedItem["CustId"].Text;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtCustCode.Text = dr["CustId"].ToString();
                txtName.Text = dr["Name"].ToString();
                txtFatherName.Text = dr["FatherName"].ToString();
                string a = dr["IsSpecial"].ToString();
                txtMobile.Text = dr["Mobile"].ToString();
                if (dr["IsSpecial"].Equals(true))
                    ckSpecial.Checked = true;
                else
                    ckSpecial.Checked = false;
                txtPhone.Text = dr["Phone"].ToString();
                cmDistrict.SelectedValue = dr["DisId"].ToString();
                cmDistrict.Text = dr["DisName"].ToString();
                cmUpazila.SelectedValue = dr["UpaId"].ToString();
                cmUpazila.Text = dr["UpaName"].ToString();
                cmVillage.SelectedValue = dr["ViId"].ToString();
                cmVillage.Text = dr["VilName"].ToString();
                txtAddress.Text = dr["Address"].ToString();
                txtRemarks.Text = dr["Remarks"].ToString();
            }
        }
        private void ReloadMainGrid()
        {
            this.dtCustomer.Clear();
            RadGrid1.Rebind();
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("Sp_CustomerInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 4;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            adpt.Fill(ds);
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow newRow = this.dtCustomer.NewRow();
                newRow["rowid"] = i + 1;
                newRow["CustId"] = Convert.ToInt32(dt.Rows[i]["CustId"].ToString());
                newRow["Name"] = dt.Rows[i]["Name"].ToString();
                newRow["FatherName"] = dt.Rows[i]["FatherName"].ToString();
                newRow["Mobile"] = dt.Rows[i]["Mobile"].ToString();
                newRow["Phone"] = dt.Rows[i]["Phone"].ToString();
                this.dtCustomer.Rows.Add(newRow);
                this.dtCustomer.AcceptChanges();
            }
            RadGrid1.Rebind();
            cmd.Dispose();
            con.Close();
        }
        public void EnableControl(bool ec)
        {
            txtAddress.Enabled = ec;
            txtCustCode.Enabled = ec;
            txtFatherName.Enabled = ec;
            txtMobile.Enabled = ec;
            ckSpecial.Enabled = ec;
            txtName.Enabled = ec;
            txtPhone.Enabled = ec;
            txtRemarks.Enabled = ec;
            cmDistrict.Enabled = ec;
            cmUpazila.Enabled = ec;
            cmVillage.Enabled = ec;
        }
        public void ClearControl()
        {
            txtAddress.Text = "";
            txtCustCode.Text = "";
            txtFatherName.Text = "";
            txtMobile.Text = "";
            txtName.Text = "";
            txtPhone.Text = "";
            txtRemarks.Text = "";
            cmDistrict.Text = "";
            cmDistrict.SelectedValue = "";
            cmUpazila.Text = "";
            cmUpazila.SelectedValue = "";
            cmVillage.Text = "";
            cmVillage.SelectedValue = "";
            ckSpecial.Checked = false;
        }
        public void ButtonControl(string bc)
        {
            if (bc == "L")
            {
                btnNew.Enabled = true;
                btnSave.Enabled = false;
                btnDelete.Enabled = false;
                btnCancel.Enabled = false;
                lblMessage.Text = "";
            }
            else if (bc == "N")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = true;
                btnDelete.Enabled = false;
                btnCancel.Enabled = true;
                lblMessage.Text = "";
            }
            else if (bc == "F")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = true;
                btnDelete.Enabled = true;
                btnCancel.Enabled = true;
                lblMessage.Text = "";
            }
            else if (bc == "E")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = true;
                btnDelete.Enabled = true;
                btnCancel.Enabled = true;
                lblMessage.Text = "";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ReloadMainGrid();
                EnableControl(false);
                ClearControl();
                ButtonControl("L");
                ReloadMainGrid();
                RadGrid1.Rebind();
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                ClearControl();
                int max = Convert.ToInt32(GetAutoNumber("CustId", "tblCustomers"));
                txtCustCode.Text = max.ToString();
                EnableControl(true);
                lblMessage.Text = "";
                ButtonControl("N");
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
                if (txtName.Text == "")
                {
                    lblMessage.Text = "Customer Name can not be blank.";
                }
                else if (txtMobile.Text == "")
                {
                    lblMessage.Text = "Mobile can not be blank.";
                }
                else
                {
                    SaveData();
                    ClearControl();
                    EnableControl(false);
                    lblMessage.Text = "Data Saved Successfully.";
                    ReloadMainGrid();
                    ButtonControl("L");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearControl();
            EnableControl(false);
            txtCustCode.Enabled = true;
            ButtonControl("L");
        }
        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ClearControl();
                DataRefill();
                ButtonControl("F");
                EnableControl(true);
                txtCustCode.Enabled = false;
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_CustomerInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 3;
                cmd.Parameters.Add("@CustId", SqlDbType.VarChar).Value = txtCustCode.Text;
                cmd.ExecuteNonQuery();
                con.Close();

                ReloadMainGrid();
                ButtonControl("L");
                lblMessage.Text = "Customer Name \"" + txtName.Text + "\" Deleted Successfully.";
                ClearControl();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            RadGrid1.DataSource = this.dtCustomer;
        }

        protected void cmDistrict_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("Sp_Setting", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "1";
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            foreach (DataRow dataRow in dt.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = (string)dataRow["Name"];
                item.Value = dataRow["Id"].ToString();

                //string ItemCode = (string)dataRow["NameBangla"].ToString();
                //item.Attributes.Add("NameBangla", ItemCode.ToString());

                cmDistrict.Items.Add(item);
                item.DataBind();
            }
            con.Close();
        }
        protected void cmDistrict_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cmUpazila.SelectedValue = "";
            cmUpazila.Text = "";
            cmUpazila.Items.Clear();
            cmVillage.SelectedValue = "";
            cmVillage.Text = "";
            cmVillage.Items.Clear();

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("Sp_Setting", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "101";
            cmd.Parameters.Add("@DisId", SqlDbType.VarChar).Value = cmDistrict.SelectedValue;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            foreach (DataRow dataRow in dt.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = (string)dataRow["Name"];
                item.Value = dataRow["Id"].ToString();

                //string ItemCode = (string)dataRow["NameBangla"].ToString();
                //item.Attributes.Add("NameBangla", ItemCode.ToString());

                cmUpazila.Items.Add(item);
                item.DataBind();
            }
            con.Close();
        }
        protected void cmUpazila_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            cmVillage.SelectedValue = "";
            cmVillage.Text = "";
            cmVillage.Items.Clear();

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("Sp_Setting", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "102";
            cmd.Parameters.Add("@UpaId", SqlDbType.VarChar).Value = cmUpazila.SelectedValue;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            foreach (DataRow dataRow in dt.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = (string)dataRow["Name"];
                item.Value = dataRow["Id"].ToString();

                //string ItemCode = (string)dataRow["NameBangla"].ToString();
                //item.Attributes.Add("NameBangla", ItemCode.ToString());

                cmVillage.Items.Add(item);
                item.DataBind();
            }
            con.Close();
        }

        protected void btnVillage_Click(object sender, EventArgs e)
        {
            if (cmUpazila.SelectedValue == "")
            {
                lblMessage.Text = "Select an Upazila.";
            }
            else
            {
                lblMessagePopup.Text = "";
                lblInsertType.Text = "Insert Village";
                ViewState["btnType"] = "Village";
                int max = Convert.ToInt32(GetAutoNumber("Id", "M_tblVillage"));
                txtCodeMaster.Text = max.ToString();
                txtNameMaster.Text = "";
                cmCommon.Visible = true;
                lblTypeName.Visible = true;
                lblTypeName.Text = "Upazila";
                cmCommon.SelectedValue = cmUpazila.SelectedValue;
                cmCommon.Text = cmUpazila.Text;
                cmCommon.Enabled = false;
                RadWindow1.VisibleOnPageLoad = true;
            }
        }
        protected void btnSaveMaster_Click(object sender, EventArgs e)
        {
            if (ViewState["btnType"].ToString() == "Village")
            {
                M_tblVillage tbl = new M_tblVillage();
                tbl.Id = Convert.ToInt32(txtCodeMaster.Text);
                tbl.Name = txtNameMaster.Text;
                tbl.UpaId = Convert.ToInt32(cmUpazila.SelectedValue);
                db.M_tblVillage.Add(tbl);
                db.SaveChanges();
                cmVillage.DataBind();

                lblMessagePopup.Text = txtNameMaster.Text + " Saved Successfully.";
                txtNameMaster.Text = "";
                txtCodeMaster.Text = "";
                int max = Convert.ToInt32(GetAutoNumber("Id", "M_tblVillage"));
                txtCodeMaster.Text = max.ToString();

                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_Setting", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "102";
                cmd.Parameters.Add("@UpaId", SqlDbType.VarChar).Value = cmUpazila.SelectedValue;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dataRow in dt.Rows)
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = (string)dataRow["Name"];
                    item.Value = dataRow["Id"].ToString();

                    //string ItemCode = (string)dataRow["NameBangla"].ToString();
                    //item.Attributes.Add("NameBangla", ItemCode.ToString());

                    cmVillage.Items.Add(item);
                    item.DataBind();
                }
                con.Close();

                RadWindow1.VisibleOnPageLoad = false;
            }
        }
        protected void btnCancelMaster_Click(object sender, EventArgs e)
        {
            txtNameMaster.Text = "";
            txtCodeMaster.Text = "";
            RadWindow1.VisibleOnPageLoad = false;
        }
        protected void cmCommon_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            if (ViewState["btnType"].ToString() == "Village")
            {
                try
                {
                    con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                    con.Open();
                    cmd = new SqlCommand("select * from M_tblUpazila where DisId=" + cmDistrict.SelectedValue, con);
                    cmd.CommandType = CommandType.Text;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    foreach (DataRow dataRow in dt.Rows)
                    {
                        RadComboBoxItem item = new RadComboBoxItem();
                        item.Text = (string)dataRow["Name"];
                        item.Value = dataRow["Id"].ToString();
                        cmCommon.Items.Add(item);
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
        protected void cmUpazila_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("Sp_Setting", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "101";
            cmd.Parameters.Add("@DisId", SqlDbType.VarChar).Value = cmDistrict.SelectedValue;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            foreach (DataRow dataRow in dt.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = (string)dataRow["Name"];
                item.Value = dataRow["Id"].ToString();

                //string ItemCode = (string)dataRow["NameBangla"].ToString();
                //item.Attributes.Add("NameBangla", ItemCode.ToString());

                cmUpazila.Items.Add(item);
                item.DataBind();
            }
            con.Close();
        }
        protected void cmVillage_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("Sp_Setting", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "102";
            cmd.Parameters.Add("@UpaId", SqlDbType.VarChar).Value = cmUpazila.SelectedValue;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            foreach (DataRow dataRow in dt.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = (string)dataRow["Name"];
                item.Value = dataRow["Id"].ToString();

                //string ItemCode = (string)dataRow["NameBangla"].ToString();
                //item.Attributes.Add("NameBangla", ItemCode.ToString());

                cmVillage.Items.Add(item);
                item.DataBind();
            }
            con.Close();
        }
    }
}