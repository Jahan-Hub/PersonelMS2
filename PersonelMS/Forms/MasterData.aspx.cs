using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace PersonelMS.Forms
{
    public partial class MasterData : System.Web.UI.Page
    {
        PersonelMSEntities db = new PersonelMSEntities();
        SqlConnection con;
        SqlCommand cmd;
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        public string GetAutoNumber(string fieldName, string tableName)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                string ss = "Select  isnull(Max(" + fieldName + "),0) from " + tableName;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EnableVillage(false);
                btnVillageCancel.Enabled = false;
                btnVillageSave.Enabled = false;
                rgVillage.DataSource = db.M_tblVillage.ToList();
                rgVillage.DataBind();

                txtBankName.Enabled = false;
                btnBankCancel.Enabled = false;
                btnBankEdit.Enabled = false;
                btnBankSave.Enabled = false;

                txtCategoryName.Enabled = false;
                btnCategoryCancel.Enabled = false;
                btnCategoryEdit.Enabled = false;
                btnCategoryDelete.Enabled = false;
                btnCategorySave.Enabled = false;

                txtPackingName.Enabled = false;
                btnPackingCancel.Enabled = false;
                btnPackingEdit.Enabled = false;
                btnPackingDelete.Enabled = false;
                btnPackingSave.Enabled = false;

                txtTypeName.Enabled = false;
                btnTypeCancel.Enabled = false;
                btnTypeEdit.Enabled = false;
                btnTypeSave.Enabled = false;

                txtCostName.Enabled = false;
                btnCostCancel.Enabled = false;
                btnCostEdit.Enabled = false;
                btnCostSave.Enabled = false;

                txtCostElementName.Enabled = false;
                cmCostCenter.Enabled = false;
                btnCostElementCancel.Enabled = false;
                btnCostElementEdit.Enabled = false;
                btnCostElementSave.Enabled = false;

                txtIncomeSourceName.Enabled = false;
                btnIncomeSourceCancel.Enabled = false;
                btnIncomeSourceEdit.Enabled = false;
                btnIncomeSourceSave.Enabled = false;
            }
        }

        protected void btnCompanyNew_Click(object sender, EventArgs e)
        {

        }
        protected void btnSaveCompany_Click(object sender, EventArgs e)
        {

        }
        protected void btnCompanyFind_Click(object sender, EventArgs e)
        {

        }
        protected void btnCompanyEdit_Click(object sender, EventArgs e)
        {

        }
        protected void btnCompanyCancel_Click(object sender, EventArgs e)
        {

        }

        public void EnableVillage(bool ec)
        {
            txtVillageName.Enabled = ec;
            txtVillageNameBangla.Enabled = ec;
            cmUpazila.Enabled = ec;
        }
        protected void btnVillageNew_Click(object sender, EventArgs e)
        {
            int max = Convert.ToInt32(GetAutoNumber("Id", "M_tblVillage"));
            txtVillageCode.Text = max.ToString();
            txtVillageName.Text = "";
            txtVillageNameBangla.Text = "";
            cmUpazila.Text = "";
            cmUpazila.SelectedValue = "";

            btnVillageSave.Enabled = true;
            btnVillageCancel.Enabled = true;
            btnVillageNew.Enabled = false;
            EnableVillage(true);

            lblVillageMode.Text = "Save Mode";
            lblVillage.Text = "";
        }
        protected void btnVillageSave_Click(object sender, EventArgs e)
        {
            if (txtVillageCode.Text == "")
            {
                lblVillage.Text = "Village Code can not be blank.";
            }
            else if (txtVillageName.Text == "")
            {
                lblVillage.Text = "Village Name can not be blank.";
            }
            else if (cmUpazila.SelectedValue == "")
            {
                lblVillage.Text = "Select Upazila Name.";
            }
            else
            {
                if (lblVillageMode.Text == "Save Mode")
                {
                    try
                    {
                        M_tblVillage tbl = new M_tblVillage();
                        tbl.Id = Convert.ToInt32(txtVillageCode.Text);
                        tbl.Name = textInfo.ToTitleCase(txtVillageName.Text);
                        tbl.NameBangla = txtVillageNameBangla.Text;
                        tbl.UpaId = Convert.ToInt32(cmUpazila.SelectedValue);
                        db.M_tblVillage.Add(tbl);
                        db.SaveChanges();
                        lblVillage.Text = "Village Name " + "\"" + txtVillageName.Text + "\" Saved Successfully.";
                        lblVillageMode.Text = "";
                        txtVillageCode.Text = "";
                        txtVillageName.Text = "";
                        cmUpazila.Text = "";
                        cmUpazila.SelectedValue = "";

                        btnVillageSave.Enabled = false;
                        btnVillageCancel.Enabled = false;
                        btnVillageNew.Enabled = true;
                        EnableVillage(false);
                        rgVillage.DataSource = db.M_tblVillage.ToList();
                        rgVillage.DataBind();
                    }
                    catch (Exception ex)
                    {
                        lblVillage.Text = ex.Message;
                    }
                }
                else if (lblVillageMode.Text == "Edit Mode")
                {
                    try
                    {
                        Int32 id = Convert.ToInt32(txtVillageCode.Text);
                        var k = (from c in db.M_tblVillage
                                 where c.Id == id
                                 select c).First();
                        k.Id = Convert.ToInt32(txtVillageCode.Text);
                        k.Name = textInfo.ToTitleCase(txtVillageName.Text);
                        k.NameBangla = txtVillageNameBangla.Text;
                        k.UpaId = Convert.ToInt32(cmUpazila.SelectedValue);
                        db.SaveChanges();

                        lblVillage.Text = "Village Name " + "\"" + txtVillageName.Text + "\" Updated Successfully.";
                        lblVillageMode.Text = "";
                        txtVillageCode.Text = "";
                        txtVillageName.Text = "";
                        cmUpazila.Text = "";
                        cmUpazila.SelectedValue = "";

                        btnVillageSave.Enabled = false;
                        btnVillageCancel.Enabled = false;
                        btnVillageNew.Enabled = true;
                        EnableVillage(false);
                        rgVillage.DataSource = db.M_tblVillage.ToList();
                        rgVillage.DataBind();
                    }
                    catch (Exception ex)
                    {
                        lblVillage.Text = ex.Message;
                    }
                }
            }
        }
        protected void btnVillageEdit_Click(object sender, EventArgs e)
        {
            btnVillageSave.Enabled = true;
            btnVillageCancel.Enabled = true;
            btnVillageNew.Enabled = false;
            lblVillageMode.Text = "Edit Mode";
            lblVillage.Text = "";
            EnableVillage(true);
        }
        protected void btnVillageCancel_Click(object sender, EventArgs e)
        {
            btnVillageSave.Enabled = false;
            btnVillageCancel.Enabled = false;
            btnVillageNew.Enabled = true;
            EnableVillage(false);
            lblVillage.Text = "";
            lblVillageMode.Text = "";

            txtVillageCode.Text = "";
            txtVillageName.Text = "";
            txtVillageNameBangla.Text = "";
            cmUpazila.Text = "";
            cmUpazila.SelectedValue = "";
        }

        protected void btnCategoryNew_Click(object sender, EventArgs e)
        {
            int max = Convert.ToInt32(GetAutoNumber("CatId", "tblCategory"));
            txtCategoryCode.Text = max.ToString();
            btnCategorySave.Enabled = true;
            btnCategoryCancel.Enabled = true;
            btnCategoryFind.Enabled = false;
            btnCategoryEdit.Enabled = false;
            btnCategoryDelete.Enabled = false;
            btnCategoryNew.Enabled = false;
            txtCategoryName.Enabled = true;

            txtCategoryName.Text = "";
            lblCategoryMode.Text = "Save Mode";
            lblCategory.Text = "";
        }
        protected void btnCategorySave_Click(object sender, EventArgs e)
        {
            if (txtCategoryCode.Text == "")
            {
                lblCategory.Text = "Category Code can not be blank.";
            }
            else if (txtCategoryName.Text == "")
            {
                lblCategory.Text = "Category Name can not be blank.";
            }
            else
            {
                if (lblCategoryMode.Text == "Save Mode")
                {
                    try
                    {
                        tblCategory tbl = new tblCategory();
                        tbl.CatId = Convert.ToInt32(txtCategoryCode.Text);
                        tbl.Name = textInfo.ToTitleCase(txtCategoryName.Text);
                        db.tblCategories.Add(tbl);
                        db.SaveChanges();
                        rgCategory.Rebind();

                        lblCategory.Text = "Category Name " + "\"" + txtCategoryName.Text + "\" Saved Successfully.";
                        lblCategoryMode.Text = "";
                        txtCategoryCode.Text = "";
                        txtCategoryName.Text = "";

                        btnCategorySave.Enabled = false;
                        btnCategoryCancel.Enabled = false;
                        btnCategoryFind.Enabled = true;
                        btnCategoryEdit.Enabled = false;
                        btnCategoryDelete.Enabled = false;
                        btnCategoryNew.Enabled = true;
                        txtCategoryName.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblCategory.Text = ex.Message;
                    }
                }
                else if (lblCategoryMode.Text == "Edit Mode")
                {
                    try
                    {
                        Int32 id = Convert.ToInt32(txtCategoryCode.Text);
                        var k = (from c in db.tblCategories
                                 where c.CatId == id
                                 select c).First();
                        k.Name = textInfo.ToTitleCase(txtCategoryName.Text);
                        db.SaveChanges();
                        rgCategory.Rebind();

                        lblCategory.Text = "Category Name " + "\"" + txtCategoryName.Text + "\" Updated Successfully.";
                        lblCategoryMode.Text = "";
                        txtCategoryCode.Text = "";
                        txtCategoryName.Text = "";

                        btnCategorySave.Enabled = false;
                        btnCategoryCancel.Enabled = false;
                        btnCategoryFind.Enabled = true;
                        btnCategoryEdit.Enabled = false;
                        btnCategoryDelete.Enabled = false;
                        btnCategoryNew.Enabled = true;
                        txtCategoryName.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblCategory.Text = ex.Message;
                    }
                }
            }
        }
        protected void btnCategoryFind_Click(object sender, EventArgs e)
        {
            if (txtCategoryCode.Text == "")
            {
                lblCategory.Text = "Category Code Needed.";
            }
            else
            {
                try
                {
                    Int32 id = Convert.ToInt32(txtCategoryCode.Text);
                    var k = (from c in db.tblCategories
                             where c.CatId == id
                             select c).First();
                    txtCategoryName.Text = k.Name.ToString();
                    lblCategory.Text = "";

                    btnCategorySave.Enabled = false;
                    btnCategoryCancel.Enabled = true;
                    btnCategoryFind.Enabled = true;
                    btnCategoryEdit.Enabled = true;
                    btnCategoryDelete.Enabled = false;
                    btnCategoryNew.Enabled = true;
                    txtCategoryName.Enabled = false;
                }
                catch (Exception ex)
                {
                    lblCategory.Text = ex.Message;
                }
            }
        }
        protected void btnCategoryEdit_Click(object sender, EventArgs e)
        {
            btnCategorySave.Enabled = true;
            btnCategoryCancel.Enabled = true;
            btnCategoryFind.Enabled = false;
            btnCategoryEdit.Enabled = false;
            btnCategoryDelete.Enabled = false;
            btnCategoryNew.Enabled = false;
            lblCategoryMode.Text = "Edit Mode";
            lblCategory.Text = "";
            txtCategoryName.Enabled = true;
        }
        protected void btnCategoryDelete_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_ValidationAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@ItemCatId", SqlDbType.Int).Value = txtCategoryCode.Text;
                cmd.ExecuteNonQuery();
                con.Close();
                rgCategory.Rebind();

                btnCategorySave.Enabled = false;
                btnCategoryCancel.Enabled = false;
                btnCategoryFind.Enabled = true;
                btnCategoryEdit.Enabled = false;
                btnCategoryDelete.Enabled = false;
                btnCategoryNew.Enabled = true;
                txtCategoryName.Enabled = false;
                lblCategory.Text = "Category Name " + "\"" + txtCategoryName.Text + "\" Deleted Successfully.";
                lblCategoryMode.Text = "";

                txtCategoryCode.Text = "";
                txtCategoryName.Text = "";
            }
            catch (Exception ex)
            {
                lblCategory.Text = ex.Message;
            }
        }
        protected void btnCategoryCancel_Click(object sender, EventArgs e)
        {
            btnCategorySave.Enabled = false;
            btnCategoryCancel.Enabled = false;
            btnCategoryFind.Enabled = true;
            btnCategoryEdit.Enabled = false;
            btnCategoryDelete.Enabled = false;
            btnCategoryNew.Enabled = true;
            txtCategoryName.Enabled = false;
            lblCategory.Text = "";
            lblCategoryMode.Text = "";

            txtCategoryCode.Text = "";
            txtCategoryName.Text = "";
        }

        protected void btnBankNew_Click(object sender, EventArgs e)
        {
            int max = Convert.ToInt32(GetAutoNumber("BankCode", "tblBank"));
            txtBankCode.Text = max.ToString();
            btnBankSave.Enabled = true;
            btnBankCancel.Enabled = true;
            btnBankFind.Enabled = false;
            btnBankEdit.Enabled = false;
            btnBankDelete.Enabled = false;
            btnBankNew.Enabled = false;
            txtBankName.Enabled = true;

            txtBankName.Text = "";
            lblBankMode.Text = "Save Mode";
            lblBank.Text = "";
        }
        protected void btnBankSave_Click(object sender, EventArgs e)
        {
            if (txtBankCode.Text == "")
            {
                lblBank.Text = "Bank Code can not be blank.";
            }
            else if (txtBankName.Text == "")
            {
                lblBank.Text = "Bank Name can not be blank.";
            }
            else
            {
                if (lblBankMode.Text == "Save Mode")
                {
                    try
                    {
                        tblBank tbl = new tblBank();
                        tbl.BankCode = Convert.ToInt32(txtBankCode.Text);
                        tbl.Name = textInfo.ToTitleCase(txtBankName.Text);
                        db.tblBanks.Add(tbl);
                        db.SaveChanges();
                        rgBank.Rebind();

                        lblBank.Text = "Bank Name " + "\"" + txtBankName.Text + "\" Saved Successfully.";
                        lblBankMode.Text = "";
                        txtBankCode.Text = "";
                        txtBankName.Text = "";

                        btnBankSave.Enabled = false;
                        btnBankCancel.Enabled = false;
                        btnBankFind.Enabled = true;
                        btnBankEdit.Enabled = false;
                        btnBankDelete.Enabled = false;
                        btnBankNew.Enabled = true;
                        txtBankName.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblBank.Text = ex.Message;
                    }
                }
                else if (lblBankMode.Text == "Edit Mode")
                {
                    try
                    {
                        Int32 id = Convert.ToInt32(txtBankCode.Text);
                        var k = (from c in db.tblBanks
                                 where c.BankCode == id
                                 select c).First();
                        k.Name = textInfo.ToTitleCase(txtBankName.Text);
                        db.SaveChanges();
                        rgBank.Rebind();

                        lblBank.Text = "Bank Name " + "\"" + txtBankName.Text + "\" Updated Successfully.";
                        lblBankMode.Text = "";
                        txtBankCode.Text = "";
                        txtBankName.Text = "";

                        btnBankSave.Enabled = false;
                        btnBankCancel.Enabled = false;
                        btnBankFind.Enabled = true;
                        btnBankEdit.Enabled = false;
                        btnBankDelete.Enabled = false;
                        btnBankNew.Enabled = true;
                        txtBankName.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblBank.Text = ex.Message;
                    }
                }
            }
        }
        protected void btnBankFind_Click(object sender, EventArgs e)
        {
            if (txtBankCode.Text == "")
            {
                lblBank.Text = "Bank Code Needed.";
            }
            else
            {
                try
                {
                    Int32 id = Convert.ToInt32(txtBankCode.Text);
                    var k = (from c in db.tblBanks
                             where c.BankCode == id
                             select c).First();
                    txtBankName.Text = textInfo.ToTitleCase(k.Name.ToString());
                    lblBank.Text = "";

                    btnBankSave.Enabled = false;
                    btnBankCancel.Enabled = true;
                    btnBankFind.Enabled = true;
                    btnBankEdit.Enabled = true;
                    btnBankDelete.Enabled = false;
                    btnBankNew.Enabled = true;
                    txtBankName.Enabled = false;
                }
                catch (Exception ex)
                {
                    lblBank.Text = ex.Message;
                }
            }
        }
        protected void btnBankEdit_Click(object sender, EventArgs e)
        {
            btnBankSave.Enabled = true;
            btnBankCancel.Enabled = true;
            btnBankFind.Enabled = false;
            btnBankEdit.Enabled = false;
            btnBankDelete.Enabled = false;
            btnBankNew.Enabled = false;
            lblBankMode.Text = "Edit Mode";
            lblBank.Text = "";
            txtBankName.Enabled = true;
        }
        protected void btnBankDelete_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_ValidationAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 8;
                cmd.Parameters.Add("@Bank", SqlDbType.VarChar).Value = txtBankCode.Text;
                cmd.ExecuteNonQuery();
                con.Close();
                rgBank.Rebind();

                lblBank.Text = "Bank Name " + "\"" + txtBankName.Text + "\" Deleted Successfully.";
                lblBankMode.Text = "";
                txtBankCode.Text = "";
                txtBankName.Text = "";

                btnBankSave.Enabled = false;
                btnBankCancel.Enabled = false;
                btnBankFind.Enabled = true;
                btnBankEdit.Enabled = false;
                btnBankDelete.Enabled = false;
                btnBankDelete.Enabled = false;
                btnBankNew.Enabled = true;
                txtBankName.Enabled = false;
            }
            catch (Exception ex)
            {
                lblBank.Text = ex.Message;
            }
        }
        protected void btnBankCancel_Click(object sender, EventArgs e)
        {
            btnBankSave.Enabled = false;
            btnBankCancel.Enabled = false;
            btnBankFind.Enabled = true;
            btnBankEdit.Enabled = false;
            btnBankDelete.Enabled = false;
            btnBankNew.Enabled = true;
            txtBankName.Enabled = false;
            lblBank.Text = "";
            lblBankMode.Text = "";

            txtBankCode.Text = "";
            txtBankName.Text = "";
        }

        protected void btnItemSizeNew_Click(object sender, EventArgs e)
        {
            int max = Convert.ToInt32(GetAutoNumber("Id", "tblItemSize"));
            txtItemSizeCode.Text = max.ToString();
            txtItemSizeName.Text = "";

            btnItemSizeSave.Enabled = true;
            btnItemSizeCancel.Enabled = true;
            btnItemSizeFind.Enabled = false;
            btnItemSizeEdit.Enabled = false;
            btnItemSizeDelete.Enabled = false;
            btnItemSizeNew.Enabled = false;
            txtItemSizeName.Enabled = true;

            lblItemSize.Text = "";
            lblItemSizeMode.Text = "Save Mode";
        }
        protected void btnItemSizeSave_Click(object sender, EventArgs e)
        {
            if (txtItemSizeCode.Text == "")
            {
                lblItemSize.Text = "Item Size Code can not be blank.";
            }
            else if (txtItemSizeName.Text == "")
            {
                lblItemSize.Text = "Item Size Name can not be blank.";
            }
            else
            {
                if (lblItemSizeMode.Text == "Save Mode")
                {
                    try
                    {
                        tblItemSize tbl = new tblItemSize();
                        tbl.Id = Convert.ToInt32(txtItemSizeCode.Text);
                        tbl.Name = textInfo.ToTitleCase(txtItemSizeName.Text);
                        db.tblItemSizes.Add(tbl);
                        db.SaveChanges();
                        rgItemSize.Rebind();

                        lblItemSize.Text = "Item Size Name " + "\"" + txtItemSizeName.Text + "\" Saved Successfully.";
                        lblItemSizeMode.Text = "";
                        txtItemSizeCode.Text = "";
                        txtItemSizeName.Text = "";

                        btnItemSizeSave.Enabled = false;
                        btnItemSizeCancel.Enabled = false;
                        btnItemSizeFind.Enabled = true;
                        btnItemSizeEdit.Enabled = false;
                        btnItemSizeDelete.Enabled = false;
                        btnItemSizeNew.Enabled = true;
                        txtItemSizeName.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblItemSize.Text = ex.Message;
                    }
                }
                else if (lblItemSizeMode.Text == "Edit Mode")
                {
                    try
                    {
                        Int32 id = Convert.ToInt32(txtItemSizeCode.Text);
                        tblItemSize tbl = new tblItemSize();
                        var k = (from c in db.tblItemSizes
                                 where c.Id == id
                                 select c).First();
                        k.Name = textInfo.ToTitleCase(txtItemSizeName.Text);
                        db.SaveChanges();
                        rgItemSize.Rebind();

                        lblItemSize.Text = "Item Size Name " + "\"" + txtItemSizeName.Text + "\" Updated Successfully.";
                        lblItemSizeMode.Text = "";
                        txtItemSizeCode.Text = "";
                        txtItemSizeName.Text = "";

                        btnItemSizeSave.Enabled = false;
                        btnItemSizeCancel.Enabled = false;
                        btnItemSizeFind.Enabled = true;
                        btnItemSizeEdit.Enabled = false;
                        btnItemSizeDelete.Enabled = false;
                        btnItemSizeNew.Enabled = true;
                        txtItemSizeName.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblItemSize.Text = ex.Message;
                    }
                }
            }
        }
        protected void btnItemSizeFind_Click(object sender, EventArgs e)
        {
            if (txtItemSizeCode.Text == "")
            {
                lblItemSize.Text = "ItemSize Code Needed.";
            }
            else
            {
                try
                {
                    Int32 id = Convert.ToInt32(txtItemSizeCode.Text);
                    tblItemSize tbl = new tblItemSize();
                    var k = (from c in db.tblItemSizes
                             where c.Id == id
                             select c).First();
                    txtItemSizeName.Text = textInfo.ToTitleCase(k.Name.ToString());
                    lblItemSize.Text = "";

                    btnItemSizeSave.Enabled = false;
                    btnItemSizeCancel.Enabled = true;
                    btnItemSizeFind.Enabled = true;
                    btnItemSizeEdit.Enabled = true;
                    btnItemSizeDelete.Enabled = false;
                    btnItemSizeNew.Enabled = true;
                    txtItemSizeName.Enabled = false;
                }
                catch (Exception ex)
                {
                    lblItemSize.Text = ex.Message;
                }
            }
        }
        protected void btnItemSizeEdit_Click(object sender, EventArgs e)
        {
            btnItemSizeSave.Enabled = true;
            btnItemSizeCancel.Enabled = true;
            btnItemSizeFind.Enabled = false;
            btnItemSizeEdit.Enabled = false;
            btnItemSizeDelete.Enabled = false;
            btnItemSizeNew.Enabled = false;
            lblItemSizeMode.Text = "Edit Mode";
            lblItemSize.Text = "";
            txtItemSizeName.Enabled = true;
        }
        protected void btnItemSizeDelete_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_ValidationAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 3;
                cmd.Parameters.Add("@ItemSize", SqlDbType.Int).Value = txtItemSizeCode.Text;
                cmd.ExecuteNonQuery();
                con.Close();
                rgItemSize.Rebind();

                lblItemSize.Text = "Item Size Name " + "\"" + txtItemSizeName.Text + "\" Deleted Successfully.";
                lblItemSizeMode.Text = "";
                txtItemSizeCode.Text = "";
                txtItemSizeName.Text = "";

                btnItemSizeSave.Enabled = false;
                btnItemSizeCancel.Enabled = false;
                btnItemSizeFind.Enabled = true;
                btnItemSizeEdit.Enabled = false;
                btnItemSizeDelete.Enabled = false;
                btnItemSizeNew.Enabled = true;
                txtItemSizeName.Enabled = false;
            }
            catch (Exception ex)
            {
                lblItemSize.Text = ex.Message;
            }
        }
        protected void btnItemSizeCancel_Click(object sender, EventArgs e)
        {
            btnItemSizeSave.Enabled = false;
            btnItemSizeCancel.Enabled = false;
            btnItemSizeFind.Enabled = true;
            btnItemSizeEdit.Enabled = false;
            btnItemSizeDelete.Enabled = false;
            btnItemSizeNew.Enabled = true;
            txtItemSizeName.Enabled = false;
            lblItemSize.Text = "";
            lblItemSizeMode.Text = "";

            txtItemSizeCode.Text = "";
            txtItemSizeName.Text = "";
        }

        protected void btnTypeNew_Click(object sender, EventArgs e)
        {
            int max = Convert.ToInt32(GetAutoNumber("Id", "tblItemType"));
            txtTypeCode.Text = max.ToString();
            txtTypeName.Text = "";

            btnTypeSave.Enabled = true;
            btnTypeCancel.Enabled = true;
            btnTypeFind.Enabled = false;
            btnTypeEdit.Enabled = false;
            btnTypeDelete.Enabled = false;
            btnTypeNew.Enabled = false;
            txtTypeName.Enabled = true;

            lblType.Text = "";
            lblTypeMode.Text = "Save Mode";
        }
        protected void btnTypeSave_Click(object sender, EventArgs e)
        {
            if (txtTypeCode.Text == "")
            {
                lblType.Text = "Type Code can not be blank.";
            }
            else if (txtTypeName.Text == "")
            {
                lblType.Text = "Type Name can not be blank.";
            }
            else
            {
                if (lblTypeMode.Text == "Save Mode")
                {
                    try
                    {
                        tblItemType tbl = new tblItemType();
                        tbl.Id = Convert.ToInt32(txtTypeCode.Text);
                        tbl.Name = textInfo.ToTitleCase(txtTypeName.Text);
                        db.tblItemTypes.Add(tbl);
                        db.SaveChanges();
                        rgItemType.Rebind();

                        lblType.Text = "Type Name " + "\"" + txtTypeName.Text + "\" Saved Successfully.";
                        lblTypeMode.Text = "";
                        txtTypeCode.Text = "";
                        txtTypeName.Text = "";

                        btnTypeSave.Enabled = false;
                        btnTypeCancel.Enabled = false;
                        btnTypeFind.Enabled = true;
                        btnTypeEdit.Enabled = false;
                        btnTypeDelete.Enabled = false;
                        btnTypeNew.Enabled = true;
                        txtTypeName.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblType.Text = ex.Message;
                    }
                }
                else if (lblTypeMode.Text == "Edit Mode")
                {
                    try
                    {
                        Int32 id = Convert.ToInt32(txtTypeCode.Text);
                        tblItemType tbl = new tblItemType();
                        var k = (from c in db.tblItemTypes
                                 where c.Id == id
                                 select c).First();
                        k.Name = textInfo.ToTitleCase(txtTypeName.Text);
                        db.SaveChanges();
                        rgItemType.Rebind();

                        lblType.Text = "Type Name " + "\"" + txtTypeName.Text + "\" Updated Successfully.";
                        lblTypeMode.Text = "";
                        txtTypeCode.Text = "";
                        txtTypeName.Text = "";

                        btnTypeSave.Enabled = false;
                        btnTypeCancel.Enabled = false;
                        btnTypeFind.Enabled = true;
                        btnTypeEdit.Enabled = false;
                        btnTypeDelete.Enabled = false;
                        btnTypeNew.Enabled = true;
                        txtTypeName.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblType.Text = ex.Message;
                    }
                }
            }
        }
        protected void btnTypeFind_Click(object sender, EventArgs e)
        {
            if (txtTypeCode.Text == "")
            {
                lblType.Text = "Type Code Needed.";
            }
            else
            {
                try
                {
                    Int32 id = Convert.ToInt32(txtTypeCode.Text);
                    tblItemType tbl = new tblItemType();
                    var k = (from c in db.tblItemTypes
                             where c.Id == id
                             select c).First();
                    txtTypeName.Text = textInfo.ToTitleCase(k.Name.ToString());
                    lblType.Text = "";

                    btnTypeSave.Enabled = false;
                    btnTypeCancel.Enabled = true;
                    btnTypeFind.Enabled = true;
                    btnTypeEdit.Enabled = true;
                    btnTypeDelete.Enabled = false;
                    btnTypeNew.Enabled = true;
                    txtTypeName.Enabled = false;
                }
                catch (Exception ex)
                {
                    lblType.Text = ex.Message;
                }
            }
        }
        protected void btnTypeEdit_Click(object sender, EventArgs e)
        {
            btnTypeSave.Enabled = true;
            btnTypeCancel.Enabled = true;
            btnTypeFind.Enabled = false;
            btnTypeEdit.Enabled = false;
            btnTypeDelete.Enabled = false;
            btnTypeNew.Enabled = false;
            lblTypeMode.Text = "Edit Mode";
            lblType.Text = "";
            txtTypeName.Enabled = true;
        }
        protected void btnTypeDelete_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_ValidationAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 9;
                cmd.Parameters.Add("@ItemType", SqlDbType.VarChar).Value = txtTypeCode.Text;
                cmd.ExecuteNonQuery();
                con.Close();
                rgItemType.Rebind();

                lblType.Text = "Item Type Name " + "\"" + txtTypeName.Text + "\" Deleted Successfully.";
                lblTypeMode.Text = "";
                txtTypeCode.Text = "";
                txtTypeName.Text = "";

                btnTypeSave.Enabled = false;
                btnTypeCancel.Enabled = false;
                btnTypeFind.Enabled = true;
                btnTypeEdit.Enabled = false;
                btnTypeDelete.Enabled = false;
                btnTypeNew.Enabled = true;
                txtTypeName.Enabled = false;
            }
            catch (Exception ex)
            {
                lblType.Text = ex.Message;
            }
        }
        protected void btnTypeCancel_Click(object sender, EventArgs e)
        {
            btnTypeSave.Enabled = false;
            btnTypeCancel.Enabled = false;
            btnTypeFind.Enabled = true;
            btnTypeEdit.Enabled = false;
            btnTypeDelete.Enabled = false;
            btnTypeNew.Enabled = true;
            txtTypeName.Enabled = false;
            lblType.Text = "";
            lblTypeMode.Text = "";

            txtTypeCode.Text = "";
            txtTypeName.Text = "";
        }

        protected void btnPackingNew_Click(object sender, EventArgs e)
        {
            int max = Convert.ToInt32(GetAutoNumber("Id", "tblPacking"));
            txtPackingCode.Text = max.ToString();
            txtPackingName.Text = "";

            btnPackingSave.Enabled = true;
            btnPackingCancel.Enabled = true;
            btnPackingFind.Enabled = false;
            btnPackingEdit.Enabled = false;
            btnPackingDelete.Enabled = false;
            btnPackingNew.Enabled = false;
            txtPackingName.Enabled = true;

            lblPacking.Text = "";
            lblPackingMode.Text = "Save Mode";
        }
        protected void btnPackingSave_Click(object sender, EventArgs e)
        {
            if (txtPackingCode.Text == "")
            {
                lblPacking.Text = "Packing Code can not be blank.";
            }
            else if (txtPackingName.Text == "")
            {
                lblPacking.Text = "Packing Name can not be blank.";
            }
            else
            {
                if (lblPackingMode.Text == "Save Mode")
                {
                    try
                    {
                        tblPacking tbl = new tblPacking();
                        tbl.Id = Convert.ToInt32(txtPackingCode.Text);
                        tbl.Name = textInfo.ToTitleCase(txtPackingName.Text);
                        db.tblPackings.Add(tbl);
                        db.SaveChanges();
                        rgPacking.Rebind();

                        lblPacking.Text = "Packing Name " + "\"" + txtPackingName.Text + "\" Saved Successfully.";
                        lblPackingMode.Text = "";
                        txtPackingCode.Text = "";
                        txtPackingName.Text = "";

                        btnPackingSave.Enabled = false;
                        btnPackingCancel.Enabled = false;
                        btnPackingFind.Enabled = true;
                        btnPackingEdit.Enabled = false;
                        btnPackingDelete.Enabled = false;
                        btnPackingNew.Enabled = true;
                        txtPackingName.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblPacking.Text = ex.Message;
                    }
                }
                else if (lblPackingMode.Text == "Edit Mode")
                {
                    try
                    {
                        Int32 id = Convert.ToInt32(txtPackingCode.Text);
                        tblPacking tbl = new tblPacking();
                        var k = (from c in db.tblPackings
                                 where c.Id == id
                                 select c).First();
                        k.Name = textInfo.ToTitleCase(txtPackingName.Text);
                        db.SaveChanges();
                        rgPacking.Rebind();

                        lblPacking.Text = "Packing Name " + "\"" + txtPackingName.Text + "\" Updated Successfully.";
                        lblPackingMode.Text = "";
                        txtPackingCode.Text = "";
                        txtPackingName.Text = "";

                        btnPackingSave.Enabled = false;
                        btnPackingCancel.Enabled = false;
                        btnPackingFind.Enabled = true;
                        btnPackingEdit.Enabled = false;
                        btnPackingDelete.Enabled = false;
                        btnPackingNew.Enabled = true;
                        txtPackingName.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblPacking.Text = ex.Message;
                    }
                }
            }
        }
        protected void btnPackingFind_Click(object sender, EventArgs e)
        {
            if (txtPackingCode.Text == "")
            {
                lblPacking.Text = "Packing Code Needed.";
            }
            else
            {
                try
                {
                    Int32 id = Convert.ToInt32(txtPackingCode.Text);
                    tblPacking tbl = new tblPacking();
                    var k = (from c in db.tblPackings
                             where c.Id == id
                             select c).First();
                    txtPackingName.Text = k.Name.ToString();
                    lblPacking.Text = "";

                    btnPackingSave.Enabled = false;
                    btnPackingCancel.Enabled = true;
                    btnPackingFind.Enabled = true;
                    btnPackingEdit.Enabled = true;
                    btnPackingDelete.Enabled = false;
                    btnPackingNew.Enabled = true;
                    txtPackingName.Enabled = false;
                }
                catch (Exception ex)
                {
                    lblPacking.Text = ex.Message;
                }
            }
        }
        protected void btnPackingEdit_Click(object sender, EventArgs e)
        {
            btnPackingSave.Enabled = true;
            btnPackingCancel.Enabled = true;
            btnPackingFind.Enabled = false;
            btnPackingEdit.Enabled = false;
            btnPackingDelete.Enabled = false;
            btnPackingNew.Enabled = false;
            lblPackingMode.Text = "Edit Mode";
            lblPacking.Text = "";
            txtPackingName.Enabled = true;
        }
        protected void btnPackingDelete_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_ValidationAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 4;
                cmd.Parameters.Add("@Pack", SqlDbType.Int).Value = txtPackingCode.Text;
                cmd.ExecuteNonQuery();
                con.Close();
                rgPacking.Rebind();

                lblPacking.Text = "Packing Name " + "\"" + txtPackingName.Text + "\" Deleted Successfully.";
                lblPackingMode.Text = "";
                txtPackingCode.Text = "";
                txtPackingName.Text = "";

                btnPackingSave.Enabled = false;
                btnPackingCancel.Enabled = false;
                btnPackingFind.Enabled = true;
                btnPackingEdit.Enabled = false;
                btnPackingDelete.Enabled = false;
                btnPackingNew.Enabled = true;
                txtPackingName.Enabled = false;
            }
            catch (Exception ex)
            {
                lblPacking.Text = ex.Message;
            }
        }
        protected void btnPackingCancel_Click(object sender, EventArgs e)
        {
            btnPackingSave.Enabled = false;
            btnPackingCancel.Enabled = false;
            btnPackingFind.Enabled = true;
            btnPackingEdit.Enabled = false;
            btnPackingDelete.Enabled = false;
            btnPackingNew.Enabled = true;
            txtPackingName.Enabled = false;
            lblPacking.Text = "";
            lblPackingMode.Text = "";

            txtPackingCode.Text = "";
        }

        protected void btnCostNew_Click(object sender, EventArgs e)
        {
            int max = Convert.ToInt32(GetAutoNumber("Id", "tblCostCenters"));
            txtCostCode.Text = max.ToString();
            txtCostName.Text = "";

            btnCostSave.Enabled = true;
            btnCostCancel.Enabled = true;
            btnCostFind.Enabled = false;
            btnCostEdit.Enabled = false;
            btnCostDelete.Enabled = false;
            btnCostNew.Enabled = false;
            txtCostName.Enabled = true;

            lblCost.Text = "";
            lblCostMode.Text = "Save Mode";
        }
        protected void btnCostSave_Click(object sender, EventArgs e)
        {
            if (txtCostName.Text == "")
            {
                lblCost.Text = "Cost Center Name can not be blank.";
            }
            else
            {
                if (lblCostMode.Text == "Save Mode")
                {
                    try
                    {
                        tblCostCenter tbl = new tblCostCenter();
                        tbl.Id = Convert.ToInt32(txtCostCode.Text);
                        tbl.Name = textInfo.ToTitleCase(txtCostName.Text);
                        db.tblCostCenters.Add(tbl);
                        db.SaveChanges();
                        rgCostCenter.Rebind();

                        lblCost.Text = "Cost Center Name " + "\"" + txtCostName.Text + "\" Saved Successfully.";
                        lblCostMode.Text = "";
                        txtCostCode.Text = "";
                        txtCostName.Text = "";
                        cmCostCenter.DataBind();

                        btnCostSave.Enabled = false;
                        btnCostCancel.Enabled = false;
                        btnCostFind.Enabled = true;
                        btnCostEdit.Enabled = false;
                        btnCostDelete.Enabled = false;
                        btnCostNew.Enabled = true;
                        txtCostName.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblCost.Text = ex.Message;
                    }
                }
                else if (lblCostMode.Text == "Edit Mode")
                {
                    try
                    {
                        Int32 id = Convert.ToInt32(txtCostCode.Text);
                        tblCostCenter tbl = new tblCostCenter();
                        var k = (from c in db.tblCostCenters
                                 where c.Id == id
                                 select c).First();
                        k.Name = textInfo.ToTitleCase(txtCostName.Text);
                        db.SaveChanges();
                        rgCostCenter.Rebind();

                        lblCost.Text = "Cost Center Name " + "\"" + txtCostName.Text + "\" Updated Successfully.";
                        lblCostMode.Text = "";
                        txtCostCode.Text = "";
                        txtCostName.Text = "";
                        cmCostCenter.DataBind();

                        btnCostSave.Enabled = false;
                        btnCostCancel.Enabled = false;
                        btnCostFind.Enabled = true;
                        btnCostEdit.Enabled = false;
                        btnCostDelete.Enabled = false;
                        btnCostNew.Enabled = true;
                        txtCostName.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblCost.Text = ex.Message;
                    }
                }
            }
        }
        protected void btnCostFind_Click(object sender, EventArgs e)
        {
            if (txtCostCode.Text == "")
            {
                lblCost.Text = "Cost Code Needed.";
            }
            else
            {
                try
                {
                    Int32 id = Convert.ToInt32(txtCostCode.Text);
                    tblCostCenter tbl = new tblCostCenter();
                    var k = (from c in db.tblCostCenters
                             where c.Id == id
                             select c).First();
                    txtCostName.Text = k.Name.ToString();
                    lblCost.Text = "";

                    btnCostSave.Enabled = false;
                    btnCostCancel.Enabled = true;
                    btnCostFind.Enabled = true;
                    btnCostEdit.Enabled = true;
                    btnCostDelete.Enabled = false;
                    btnCostNew.Enabled = true;
                    txtCostName.Enabled = false;
                }
                catch (Exception ex)
                {
                    lblCost.Text = ex.Message;
                }
            }
        }
        protected void btnCostEdit_Click(object sender, EventArgs e)
        {
            btnCostSave.Enabled = true;
            btnCostCancel.Enabled = true;
            btnCostFind.Enabled = false;
            btnCostEdit.Enabled = false;
            btnCostDelete.Enabled = false;
            btnCostNew.Enabled = false;
            lblCostMode.Text = "Edit Mode";
            lblCost.Text = "";
            txtCostName.Enabled = true;
        }
        protected void btnCostDelete_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_ValidationAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 5;
                cmd.Parameters.Add("@CostHead", SqlDbType.Int).Value = txtCostCode.Text;
                cmd.ExecuteNonQuery();
                con.Close();
                rgCostCenter.Rebind();

                lblCost.Text = "Cost Center Name " + "\"" + txtCostName.Text + "\" Deleted Successfully.";
                lblCostMode.Text = "";
                txtCostCode.Text = "";
                txtCostName.Text = "";
                cmCostCenter.DataBind();

                btnCostSave.Enabled = false;
                btnCostCancel.Enabled = false;
                btnCostFind.Enabled = true;
                btnCostEdit.Enabled = false;
                btnCostDelete.Enabled = false;
                btnCostNew.Enabled = true;
                txtCostName.Enabled = false;
            }
            catch (Exception ex)
            {
                lblCost.Text = ex.Message;
            }
        }
        protected void btnCostCancel_Click(object sender, EventArgs e)
        {
            btnCostSave.Enabled = false;
            btnCostCancel.Enabled = false;
            btnCostFind.Enabled = true;
            btnCostEdit.Enabled = false;
            btnCostDelete.Enabled = false;
            btnCostNew.Enabled = true;
            txtCostName.Enabled = false;
            lblCost.Text = "";
            lblCostMode.Text = "";

            txtCostCode.Text = "";
            txtCostName.Text = "";
        }

        protected void btnCostElementNew_Click(object sender, EventArgs e)
        {
            int max = Convert.ToInt32(GetAutoNumber("Id", "tblCostElements"));
            txtCostElementCode.Text = max.ToString();
            txtCostElementName.Text = "";
            cmCostCenter.Text = "";
            cmCostCenter.SelectedValue = "";

            btnCostElementSave.Enabled = true;
            btnCostElementCancel.Enabled = true;
            btnCostElementFind.Enabled = false;
            btnCostElementEdit.Enabled = false;
            btnCostElementDelete.Enabled = false;
            btnCostElementNew.Enabled = false;
            txtCostElementName.Enabled = true;
            cmCostCenter.Enabled = true;

            lblCostElement.Text = "";
            lblCostElementMode.Text = "Save Mode";
        }
        protected void btnCostElementSave_Click(object sender, EventArgs e)
        {
            if (txtCostElementName.Text == "")
            {
                lblCostElement.Text = "Cost Element Name can not be blank.";
            }
            else if (cmCostCenter.SelectedValue == "")
            {
                lblCostElement.Text = "Select Cost Element.";
            }
            else
            {
                if (lblCostElementMode.Text == "Save Mode")
                {
                    try
                    {
                        tblCostElement tbl = new tblCostElement();
                        tbl.Id = Convert.ToInt32(txtCostElementCode.Text);
                        tbl.Name = textInfo.ToTitleCase(txtCostElementName.Text);
                        tbl.CostCenterId = Convert.ToInt32(cmCostCenter.SelectedValue);
                        db.tblCostElements.Add(tbl);
                        db.SaveChanges();
                        rgCostElements.Rebind();

                        lblCostElement.Text = "Cost Element Name " + "\"" + txtCostElementName.Text + "\" Saved Successfully.";
                        lblCostElementMode.Text = "";
                        txtCostElementCode.Text = "";
                        txtCostElementName.Text = "";

                        btnCostElementSave.Enabled = false;
                        btnCostElementCancel.Enabled = false;
                        btnCostElementFind.Enabled = true;
                        btnCostElementEdit.Enabled = false;
                        btnCostElementDelete.Enabled = false;
                        btnCostElementNew.Enabled = true;
                        txtCostElementName.Enabled = false;
                        cmCostCenter.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblCostElement.Text = ex.Message;
                    }
                }
                else if (lblCostElementMode.Text == "Edit Mode")
                {
                    try
                    {
                        Int32 id = Convert.ToInt32(txtCostElementCode.Text);
                        tblCostElement tbl = new tblCostElement();
                        var k = (from c in db.tblCostElements
                                 where c.Id == id
                                 select c).First();
                        k.Name = textInfo.ToTitleCase(txtCostElementName.Text);
                        k.CostCenterId = Convert.ToInt32(cmCostCenter.SelectedValue);
                        db.SaveChanges();
                        rgCostElements.Rebind();

                        lblCostElement.Text = "Cost Element Name " + "\"" + txtCostElementName.Text + "\" Updated Successfully.";
                        lblCostElementMode.Text = "";
                        txtCostElementCode.Text = "";
                        txtCostElementName.Text = "";

                        btnCostElementSave.Enabled = false;
                        btnCostElementCancel.Enabled = false;
                        btnCostElementFind.Enabled = true;
                        btnCostElementEdit.Enabled = false;
                        btnCostElementDelete.Enabled = false;
                        btnCostElementNew.Enabled = true;
                        txtCostElementName.Enabled = false;
                        cmCostCenter.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblCostElement.Text = ex.Message;
                    }
                }
            }
        }
        protected void btnCostElementFind_Click(object sender, EventArgs e)
        {
            if (txtCostElementCode.Text == "")
            {
                lblCostElement.Text = "Cost Element Code Needed.";
            }
            else
            {
                try
                {
                    Int32 id = Convert.ToInt32(txtCostElementCode.Text);
                    tblCostElement tbl = new tblCostElement();
                    var k = (from c in db.tblCostElements
                             where c.Id == id
                             select c).First();
                    txtCostElementName.Text = k.Name.ToString();
                    cmCostCenter.SelectedValue = k.CostCenterId.ToString();
                    lblCostElement.Text = "";

                    btnCostElementSave.Enabled = false;
                    btnCostElementCancel.Enabled = true;
                    btnCostElementFind.Enabled = true;
                    btnCostElementEdit.Enabled = true;
                    btnCostElementDelete.Enabled = false;
                    btnCostElementNew.Enabled = true;
                    txtCostElementName.Enabled = false;
                    cmCostCenter.Enabled = false;
                }
                catch (Exception ex)
                {
                    lblCostElement.Text = ex.Message;
                }
            }
        }
        protected void btnCostElementEdit_Click(object sender, EventArgs e)
        {
            btnCostElementSave.Enabled = true;
            btnCostElementCancel.Enabled = true;
            btnCostElementFind.Enabled = false;
            btnCostElementEdit.Enabled = false;
            btnCostElementDelete.Enabled = false;
            btnCostElementNew.Enabled = false;
            lblCostElementMode.Text = "Edit Mode";
            lblCostElement.Text = "";
            txtCostElementName.Enabled = true;
            cmCostCenter.Enabled = true;
        }
        protected void btnCostElementDelete_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_ValidationAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 6;
                cmd.Parameters.Add("@CostElement", SqlDbType.Int).Value = txtCostElementCode.Text;
                cmd.ExecuteNonQuery();
                con.Close();
                rgCostElements.Rebind();

                lblCostElement.Text = "Cost Element Name " + "\"" + txtCostElementName.Text + "\" Deleted Successfully.";
                lblCostElementMode.Text = "";
                txtCostElementCode.Text = "";
                txtCostElementName.Text = "";

                btnCostElementSave.Enabled = false;
                btnCostElementCancel.Enabled = false;
                btnCostElementFind.Enabled = true;
                btnCostElementEdit.Enabled = false;
                btnCostElementDelete.Enabled = false;
                btnCostElementNew.Enabled = true;
                txtCostElementName.Enabled = false;
                cmCostCenter.Enabled = false;
            }
            catch (Exception ex)
            {
                lblCostElement.Text = ex.Message;
            }
        }
        protected void btnCostElementCancel_Click(object sender, EventArgs e)
        {
            btnCostElementSave.Enabled = false;
            btnCostElementCancel.Enabled = false;
            btnCostElementFind.Enabled = true;
            btnCostElementEdit.Enabled = false;
            btnCostElementDelete.Enabled = false;
            btnCostElementNew.Enabled = true;
            txtCostElementName.Enabled = false;
            cmCostCenter.Enabled = false;

            lblCostElement.Text = "";
            lblCostElementMode.Text = "";

            txtCostElementCode.Text = "";
            txtCostElementName.Text = "";
        }

        protected void btnIncomeSoureNew_Click(object sender, EventArgs e)
        {
            int max = Convert.ToInt32(GetAutoNumber("Id", "tblIncomeSource"));
            txtIncomeSourceCode.Text = max.ToString();
            txtIncomeSourceName.Text = "";

            btnIncomeSourceSave.Enabled = true;
            btnIncomeSourceCancel.Enabled = true;
            btnIncomeSourceFind.Enabled = false;
            btnIncomeSourceEdit.Enabled = false;
            btnIncomeDelete.Enabled = false;
            btnIncomeSourceNew.Enabled = false;
            txtIncomeSourceName.Enabled = true;

            lblIncomeSource.Text = "";
            lblIncomeSourceMode.Text = "Save Mode";
        }
        protected void btnIncomeSoureSave_Click(object sender, EventArgs e)
        {
            if (txtIncomeSourceName.Text == "")
            {
                lblIncomeSource.Text = "Income Source Name can not be blank.";
            }
            else
            {
                if (lblIncomeSourceMode.Text == "Save Mode")
                {
                    try
                    {
                        tblIncomeSource tbl = new tblIncomeSource();
                        tbl.Id = Convert.ToInt32(txtIncomeSourceCode.Text);
                        tbl.Name = textInfo.ToTitleCase(txtIncomeSourceName.Text);
                        db.tblIncomeSources.Add(tbl);
                        db.SaveChanges();
                        rgIncomeSource.Rebind();

                        lblIncomeSource.Text = "Income Source Name " + "\"" + txtIncomeSourceName.Text + "\" Saved Successfully.";
                        lblIncomeSourceMode.Text = "";
                        txtIncomeSourceCode.Text = "";
                        txtIncomeSourceName.Text = "";

                        btnIncomeSourceSave.Enabled = false;
                        btnIncomeSourceCancel.Enabled = false;
                        btnIncomeSourceFind.Enabled = true;
                        btnIncomeSourceEdit.Enabled = false;
                        btnIncomeDelete.Enabled = false;
                        btnIncomeSourceNew.Enabled = true;
                        txtIncomeSourceName.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblIncomeSource.Text = ex.Message;
                    }
                }
                else if (lblIncomeSourceMode.Text == "Edit Mode")
                {
                    try
                    {
                        Int32 id = Convert.ToInt32(txtIncomeSourceCode.Text);
                        tblIncomeSource tbl = new tblIncomeSource();
                        var k = (from c in db.tblIncomeSources
                                 where c.Id == id
                                 select c).First();
                        k.Name = textInfo.ToTitleCase(txtIncomeSourceName.Text);
                        db.SaveChanges();
                        rgIncomeSource.Rebind();

                        lblIncomeSource.Text = "Income Source Name " + "\"" + txtIncomeSourceName.Text + "\" Updated Successfully.";
                        lblIncomeSourceMode.Text = "";
                        txtIncomeSourceCode.Text = "";
                        txtIncomeSourceName.Text = "";

                        btnIncomeSourceSave.Enabled = false;
                        btnIncomeSourceCancel.Enabled = false;
                        btnIncomeSourceFind.Enabled = true;
                        btnIncomeSourceEdit.Enabled = false;
                        btnIncomeDelete.Enabled = false;
                        btnIncomeSourceNew.Enabled = true;
                        txtIncomeSourceName.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblIncomeSource.Text = ex.Message;
                    }
                }
            }
        }
        protected void btnIncomeSourceFind_Click(object sender, EventArgs e)
        {
            if (txtIncomeSourceCode.Text == "")
            {
                lblIncomeSource.Text = "Income Source Code Needed.";
            }
            else
            {
                try
                {
                    Int32 id = Convert.ToInt32(txtIncomeSourceCode.Text);
                    tblIncomeSource tbl = new tblIncomeSource();
                    var k = (from c in db.tblIncomeSources
                             where c.Id == id
                             select c).First();
                    txtIncomeSourceName.Text = k.Name.ToString();
                    lblIncomeSource.Text = "";

                    btnIncomeSourceSave.Enabled = false;
                    btnIncomeSourceCancel.Enabled = true;
                    btnIncomeSourceFind.Enabled = true;
                    btnIncomeSourceEdit.Enabled = true;
                    btnIncomeDelete.Enabled = false;
                    btnIncomeSourceNew.Enabled = true;
                    txtIncomeSourceName.Enabled = false;
                }
                catch (Exception ex)
                {
                    lblIncomeSource.Text = ex.Message;
                }
            }
        }
        protected void btnIncomeSourceEdit_Click(object sender, EventArgs e)
        {
            btnIncomeSourceSave.Enabled = true;
            btnIncomeSourceCancel.Enabled = true;
            btnIncomeSourceFind.Enabled = false;
            btnIncomeSourceEdit.Enabled = false;
            btnIncomeDelete.Enabled = false;
            btnIncomeSourceNew.Enabled = false;
            lblIncomeSourceMode.Text = "Edit Mode";
            lblIncomeSource.Text = "";
            txtIncomeSourceName.Enabled = true;
        }
        protected void btnIncomeDelete_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("Sp_ValidationAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 7;
                cmd.Parameters.Add("@IncomeSource", SqlDbType.Int).Value = txtIncomeSourceCode.Text;
                cmd.ExecuteNonQuery();
                con.Close();
                rgIncomeSource.Rebind();

                lblIncomeSource.Text = "Income Source Name " + "\"" + txtIncomeSourceName.Text + "\" Deleted Successfully.";
                lblIncomeSourceMode.Text = "";
                txtIncomeSourceCode.Text = "";
                txtIncomeSourceName.Text = "";

                btnIncomeSourceSave.Enabled = false;
                btnIncomeSourceCancel.Enabled = false;
                btnIncomeSourceFind.Enabled = true;
                btnIncomeSourceEdit.Enabled = false;
                btnIncomeDelete.Enabled = false;
                btnIncomeSourceNew.Enabled = true;
                txtIncomeSourceName.Enabled = false;
            }
            catch (Exception ex)
            {
                lblIncomeSource.Text = ex.Message;
            }
        }
        protected void btnIncomeSourceCancel_Click(object sender, EventArgs e)
        {
            btnIncomeSourceSave.Enabled = false;
            btnIncomeSourceCancel.Enabled = false;
            btnIncomeSourceFind.Enabled = true;
            btnIncomeSourceEdit.Enabled = false;
            btnIncomeDelete.Enabled = false;
            btnIncomeSourceNew.Enabled = true;
            txtIncomeSourceName.Enabled = false;
            lblIncomeSource.Text = "";
            lblIncomeSourceMode.Text = "";

            txtIncomeSourceCode.Text = "";
            txtIncomeSourceName.Text = "";
        }

        protected void rgVillage_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            rgVillage.DataSource = db.M_tblVillage.ToList();
        }
        protected void rgVillage_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridDataItem selectedItem = (GridDataItem)rgVillage.SelectedItems[0];
            txtVillageCode.Text = selectedItem["Id"].Text;
            txtVillageName.Text = selectedItem["Name"].Text;
            txtVillageNameBangla.Text = selectedItem["NameBangla"].Text;
            cmUpazila.SelectedValue = selectedItem["UpaId"].Text;
            lblVillage.Text = "";
            lblVillageMode.Text = "Edit Mode";
            EnableVillage(true);
            btnVillageSave.Enabled = true;
            txtVillageCode.Enabled = false;
        }

        protected void rgBank_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgBank.DataSource = db.tblBanks.ToList();
        }
        protected void rgBank_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridDataItem selectedItem = (GridDataItem)rgBank.SelectedItems[0];
            txtBankCode.Text = selectedItem["BankCode"].Text;
            txtBankName.Text = selectedItem["Name"].Text;
            btnBankEdit.Enabled = true;
            btnBankDelete.Enabled = true;
            lblBank.Text = "";
        }

        protected void rgCategory_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgCategory.DataSource = db.tblCategories.ToList();
        }
        protected void rgCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridDataItem selectedItem = (GridDataItem)rgCategory.SelectedItems[0];
            txtCategoryCode.Text = selectedItem["CatId"].Text;
            txtCategoryName.Text = selectedItem["Name"].Text;
            btnCategoryEdit.Enabled = true;
            btnCategoryDelete.Enabled = true;
            lblCategory.Text = "";
        }

        protected void rgItemType_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgItemType.DataSource = db.tblItemTypes.ToList();
        }
        protected void rgItemType_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridDataItem selectedItem = (GridDataItem)rgItemType.SelectedItems[0];
            txtTypeCode.Text = selectedItem["Id"].Text;
            txtTypeName.Text = selectedItem["Name"].Text;
            btnTypeEdit.Enabled = true;
            btnTypeDelete.Enabled = true;
            lblType.Text = "";
        }

        protected void rgItemSize_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgItemSize.DataSource = db.tblItemSizes.ToList();
        }
        protected void rgItemSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridDataItem selectedItem = (GridDataItem)rgItemSize.SelectedItems[0];
            txtItemSizeCode.Text = selectedItem["Id"].Text;
            txtItemSizeName.Text = selectedItem["Name"].Text;
            btnItemSizeEdit.Enabled = true;
            btnItemSizeDelete.Enabled = true;
            lblItemSize.Text = "";
        }

        protected void rgPacking_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgPacking.DataSource = db.tblPackings.ToList();
        }
        protected void rgPacking_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridDataItem selectedItem = (GridDataItem)rgPacking.SelectedItems[0];
            txtPackingCode.Text = selectedItem["Id"].Text;
            txtPackingName.Text = selectedItem["Name"].Text;
            btnPackingEdit.Enabled = true;
            btnPackingDelete.Enabled = true;
            txtPackingCode.Enabled = false;
            lblPacking.Text = "";
        }

        protected void rgCostCenter_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgCostCenter.DataSource = db.tblCostCenters.ToList();
        }
        protected void rgCostCenter_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridDataItem selectedItem = (GridDataItem)rgCostCenter.SelectedItems[0];
                txtCostCode.Text = selectedItem["Id"].Text;
                txtCostName.Text = selectedItem["Name"].Text;
                btnCostEdit.Enabled = true;
                txtCostCode.Enabled = false;
                btnCostDelete.Enabled = true;
                lblCost.Text = "";
            }
            catch (Exception ex)
            {
                lblCost.Text = ex.Message;
            }
        }

        protected void rgCostElements_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgCostElements.DataSource = db.tblCostElements.ToList();
        }
        protected void rgCostElements_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridDataItem selectedItem = (GridDataItem)rgCostElements.SelectedItems[0];
                txtCostElementCode.Text = selectedItem["Id"].Text;
                txtCostElementName.Text = selectedItem["Name"].Text;
                cmCostCenter.SelectedValue = selectedItem["CostCenterId"].Text;
                btnCostElementEdit.Enabled = true;
                txtCostElementCode.Enabled = false;
                btnCostElementDelete.Enabled = true;
                lblCostElement.Text = "";
            }
            catch (Exception ex)
            {
                lblCostElement.Text = ex.Message;
            }
        }

        protected void rgIncomeSource_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgIncomeSource.DataSource = db.tblIncomeSources.ToList();
        }
        protected void rgIncomeSource_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridDataItem selectedItem = (GridDataItem)rgIncomeSource.SelectedItems[0];
                txtIncomeSourceCode.Text = selectedItem["Id"].Text;
                txtIncomeSourceName.Text = selectedItem["Name"].Text;
                btnIncomeSourceEdit.Enabled = true;
                txtIncomeSourceCode.Enabled = false;
                btnIncomeDelete.Enabled = true;
                lblIncomeSource.Text = "";
            }
            catch (Exception ex)
            {
                lblIncomeSource.Text = ex.Message;
            }
        }

        protected void rgUpazila_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            rgUpazila.DataSource = db.M_tblUpazila.ToList();
        }
        protected void cmUpazila_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            cmUpazila.SelectedValue = "";
            cmUpazila.Text = "";
            cmUpazila.Items.Clear();
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("Sp_Setting", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = "101";
            // cmd.Parameters.Add("@DisId", SqlDbType.VarChar).Value = cmDistrict.SelectedValue;
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

    }
}