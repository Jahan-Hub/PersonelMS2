using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Web;
using Telerik.Web.UI;

namespace PersonelMS.Forms
{
    public partial class ItemInfo : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;

        public DataTable dtItems
        {
            get
            {
                object obj = this.Session["dtItems"];
                if (obj != null)
                {
                    return (DataTable)obj;
                }
                DataTable dt1 = new DataTable();
                dt1.Columns.Add("rowid", typeof(Int32));
                dt1.Columns.Add("ItemCode", typeof(Int32));
                dt1.Columns.Add("ItemName", typeof(string));
                dt1.Columns.Add("ItemCatId", typeof(string));
                dt1.Columns.Add("CategoryName", typeof(string));
                dt1.Columns.Add("ItemSize", typeof(string));
                dt1.Columns.Add("ItemType", typeof(string));
                dt1.Columns.Add("PurRate", typeof(string));
                dt1.Columns.Add("SalesRate", typeof(string));
                dt1.PrimaryKey = new DataColumn[] { dt1.Columns["rowid"] };
                this.Session["dtItems"] = dt1;
                return dtItems;
            }
        }
        public string GetAutoNumber(string fieldName, string tableName, string WhereCondition, string ControlName)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                string ss = "Select  convert(int,Max(" + fieldName + ")) from " + tableName + " where " + WhereCondition + "=" + ControlName + "";
                SqlCommand cmd = new SqlCommand(ss, con);

                con.Open();
                int x = (int)cmd.ExecuteScalar() + 1;
                return x.ToString();
            }
            catch (Exception)
            {
                string prefix = "001";
                txtItemCode.Text = cmCategory.SelectedValue + prefix;
                return txtItemCode.Text;
            }
            finally
            {
                con.Close();
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

        public void EnableControl(bool ec)
        {
            txtItemName.Enabled = ec;
            cmItemSize.Enabled = ec;
            cmItemType.Enabled = ec;
            txtPurchaseRate.Enabled = ec;
            txtSalesRate.Enabled = ec;
            cmPack.Enabled = ec;
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
            else if (bc == "S")
            {
                btnNew.Enabled = false;
                btnSave.Enabled = true;
                btnDelete.Enabled = false;
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
        public void ClearControl()
        {
            txtItemCode.Text = "";
            txtItemName.Text = "";
            cmItemSize.Text = "";
            cmItemSize.SelectedValue = "";
            cmItemType.Text = "";
            cmItemType.SelectedValue = "";
            txtPurchaseRate.Text = "0";
            txtSalesRate.Text = "0";
            cmCategory.SelectedValue = "";
            cmCategory.Text = "";
            Image1.ImageUrl = null;
            cmPack.Text = "";
            cmPack.SelectedValue = "";
            cmItemSize.Text = "";
            cmItemSize.SelectedValue = "";
        }

        private void ReloadMainGrid()
        {
            this.dtItems.Clear();
            rgMain.Rebind();

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("Sp_ItemInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "5";
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            adpt.Fill(ds);
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow newRow = this.dtItems.NewRow();
                newRow["rowid"] = i + 1;
                newRow["ItemCode"] = Convert.ToInt32(dt.Rows[i]["ItemCode"].ToString());
                newRow["ItemName"] = dt.Rows[i]["ItemName"].ToString();
                newRow["ItemCatId"] = dt.Rows[i]["ItemCatId"].ToString();
                newRow["CategoryName"] = dt.Rows[i]["CategoryName"].ToString();
                newRow["ItemSize"] = dt.Rows[i]["ItemSize"].ToString();
                newRow["ItemType"] = dt.Rows[i]["ItemType"].ToString();
                newRow["PurRate"] = dt.Rows[i]["PurRate"].ToString();
                newRow["SalesRate"] = dt.Rows[i]["SalesRate"].ToString();

                this.dtItems.Rows.Add(newRow);
                this.dtItems.AcceptChanges();
            }
            rgMain.Rebind();
            cmd.Dispose();
            con.Close();
        }
        private void SaveData()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("Sp_ItemInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 1;
            cmd.Parameters.Add("@ItemCode", SqlDbType.NVarChar).Value = txtItemCode.Text;
            cmd.Parameters.Add("@ItemName", SqlDbType.NVarChar).Value = textInfo.ToTitleCase(txtItemName.Text);
            cmd.Parameters.Add("@ItemCatId", SqlDbType.NVarChar).Value = cmCategory.SelectedValue;
            cmd.Parameters.Add("@ItemType", SqlDbType.NVarChar).Value = cmItemType.SelectedValue;
            cmd.Parameters.Add("@ItemSize", SqlDbType.NVarChar).Value = cmItemSize.SelectedValue;
            cmd.Parameters.Add("@PurRate", SqlDbType.Decimal).Value = txtPurchaseRate.Text;
            cmd.Parameters.Add("@SalesRate", SqlDbType.Decimal).Value = txtSalesRate.Text;
            cmd.Parameters.Add("@Pack", SqlDbType.Int).Value = cmPack.SelectedValue;

            int imglength = FileUpload2.PostedFile.ContentLength;
            byte[] bytearray = new byte[imglength];
            HttpPostedFile image = FileUpload2.PostedFile;
            image.InputStream.Read(bytearray, 0, imglength);
            if (FileUpload2.HasFile)
                cmd.Parameters.Add("@Photo", SqlDbType.Image).Value = bytearray;
            cmd.Parameters.Add("@UserId", SqlDbType.NVarChar).Value = AppEnv.Current.p_UserName.ToString();
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
        }
        private void DataRefillForGrid()
        {
            GridDataItem selectedItem = (GridDataItem)rgMain.SelectedItems[0];
            ViewState["ItemCode"] = selectedItem["ItemCode"].Text;
            ViewState["rowid"] = selectedItem["rowid"].Text;

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("Sp_ItemInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 6;
            cmd.Parameters.Add("@ItemCode", SqlDbType.VarChar).Value = selectedItem["ItemCode"].Text;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt1 = new DataTable();
            adpt.Fill(ds);
            dt1 = ds.Tables[0];

            txtItemCode.Text = dt1.Rows[0]["ItemCode"].ToString();
            txtItemName.Text = dt1.Rows[0]["ItemName"].ToString();
            cmItemSize.SelectedValue = dt1.Rows[0]["ItemSize"].ToString();
            //cmItemSize.Text = 
            txtPurchaseRate.Text = dt1.Rows[0]["PurRate"].ToString();
            txtSalesRate.Text = dt1.Rows[0]["SalesRate"].ToString();
            cmCategory.SelectedValue = dt1.Rows[0]["ItemCatId"].ToString();
            cmPack.Text = dt1.Rows[0]["PackName"].ToString();
            cmPack.SelectedValue = dt1.Rows[0]["Pack"].ToString();
            cmItemType.Text = dt1.Rows[0]["ItemTypeName"].ToString();
            cmItemType.SelectedValue = dt1.Rows[0]["ItemType"].ToString();

            //if (dt1.Rows[0]["Photo"].ToString() != "" || dt1.Rows[0]["Photo"] != null)
            //{
            //    byte[] bytes = (byte[])dt1.Rows[0]["Photo"];
            //    ViewState["Photo"] = (byte[])dt1.Rows[0]["Photo"];
            //    if (bytes.Length > 0)
            //    {
            //        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            //        Image1.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(MakeThumbnail(bytes, 100, 100), 0, (MakeThumbnail(bytes, 100, 100).Length));
            //        Image1.DataBind();
            //    }
            //}

            //if (dr["Photo"].ToString() != "")
            //{
            //}

            if (!Convert.IsDBNull(dt1.Rows[0]["Photo"]))
            {
                byte[] bytes = (byte[])dt1.Rows[0]["Photo"];
                ViewState["Photo"] = (byte[])dt1.Rows[0]["Photo"];
                if (bytes.Length > 0)
                {
                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    Image1.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(MakeThumbnail(bytes, 100, 100), 0, (MakeThumbnail(bytes, 100, 100).Length));
                    Image1.DataBind();
                }
                ViewState["Photo"] = (byte[])dt1.Rows[0]["Photo"];
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

        protected void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                if (cmCategory.SelectedValue == "")
                {
                    lblMessage.Text = "Select Category.";
                }
                else
                {
                    int max = Convert.ToInt32(GetAutoNumber("ItemCode", "tblItems", "ItemCatId", cmCategory.SelectedValue));
                    //string prefix = "001";
                    //txtItemCode.Text = (max + 1).ToString();
                    txtItemCode.Text = max.ToString();
                    EnableControl(true);
                    cmCategory.Enabled = false;

                    lblMessage.Text = "";
                    ButtonControl("N");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtItemCode.Text == "")
            {
                lblMessage.Text = "Item Code can not be blank.";
            }
            else if (cmCategory.SelectedValue == "")
            {
                lblMessage.Text = "Select Category.";
            }
            else if (txtItemName.Text == "")
            {
                lblMessage.Text = "Item Name can not be blank.";
            }
            else if (cmItemSize.SelectedValue == "")
            {
                lblMessage.Text = "Select Item Size.";
            }
            else if (cmPack.SelectedValue == "")
            {
                lblMessage.Text = "Select Pack.";
            }
            else if (txtPurchaseRate.Text == "")
            {
                lblMessage.Text = "Purchase Rate can not be blank.";
            }
            else if (txtSalesRate.Text == "")
            {
                lblMessage.Text = "Sales Rate can not be blank.";
            }
            else
            {
                try
                {
                    SaveData();
                    ReloadMainGrid();
                    lblMessage.Text = "Item " + txtItemName.Text + " Saved Successfully.";
                    ClearControl();
                    ButtonControl("L");
                    cmCategory.Enabled = true;
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
            try
            {
                if (cmCategory.SelectedValue == "")
                {
                    lblMessage.Text = "Select Category.";
                }
                else
                {
                    lblMessage.Text = "";
                    con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                    con.Open();
                    cmd = new SqlCommand("Sp_ItemInfo", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 7;
                    cmd.Parameters.Add("@ItemCatId", SqlDbType.Int).Value = cmCategory.SelectedValue;
                    SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    adpt.Fill(ds);
                    dt = ds.Tables[0];
                    rgMain.DataSource = dt;
                    rgMain.DataBind();
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
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_ItemInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 3;
                cmd.Parameters.Add("@ItemCode", SqlDbType.VarChar).Value = txtItemCode.Text;
                cmd.ExecuteNonQuery();
                con.Close();

                ReloadMainGrid();
                ButtonControl("L");
                lblMessage.Text = "Item Name \"" + txtItemName.Text + "\" Deleted Successfully.";
                ClearControl();
                cmCategory.Enabled = true;
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
            cmCategory.Enabled = true;
            ButtonControl("L");
        }

        protected void rgMain_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ClearControl();
                DataRefillForGrid();
                ButtonControl("E");
                EnableControl(true);
                cmCategory.Enabled = false;
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
        protected void cmCategory_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            try
            {
                if (cmCategory.SelectedValue == "")
                {
                    lblMessage.Text = "Select Category.";
                }
                else
                {
                    lblMessage.Text = "";
                    con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                    con.Open();
                    cmd = new SqlCommand("Sp_ItemInfo", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 7;
                    cmd.Parameters.Add("@ItemCatId", SqlDbType.Int).Value = cmCategory.SelectedValue;
                    SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    adpt.Fill(ds);
                    dt = ds.Tables[0];
                    rgMain.DataSource = dt;
                    rgMain.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void rgMain_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgMain.DataSource = this.dtItems;
        }
    }
}