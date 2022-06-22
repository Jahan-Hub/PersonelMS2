using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using Telerik.Web.UI;

namespace PersonelMS.Forms
{
    public partial class rptCustomer : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand Cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void cmCommon_ItemsRequested(object sender, Telerik.Web.UI.RadComboBoxItemsRequestedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                Cmd = new SqlCommand("Sp_ReportManager", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.Add("@mode", SqlDbType.Int).Value = 2;
                SqlDataAdapter adapter = new SqlDataAdapter(Cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                foreach (DataRow dataRow in dt.Rows)
                {
                    RadComboBoxItem item = new RadComboBoxItem();
                    item.Text = (string)dataRow["ItemName"];
                    item.Value = dataRow["ItemCode"].ToString();
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
        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();

                if (AppEnv.Current.p_rptSource != null)
                {
                    AppEnv.Current.p_rptSource.Close();
                    AppEnv.Current.p_rptSource.Dispose();
                }
                AppEnv.Current.p_rptSource = new ReportDocument();
                SqlCommand Cmd;
                Cmd = new SqlCommand("Sp_ReportManager", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = 8;
                if (cmCommon.SelectedValue != "")
                    Cmd.Parameters.Add("@CostCenterId", SqlDbType.VarChar).Value = cmCommon.SelectedValue;
                SqlDataAdapter Dap = new SqlDataAdapter(Cmd);
                DataTable dt = new DataTable();
                Dap.Fill(dt);
                Cmd.Dispose();

                string tempPath = "";
                string reportName = "";

                AppEnv.Current.p_rptObject = "~/Reports/Customers.rpt";
                tempPath = @System.IO.Path.GetTempPath() + "AllCustomersInfo";
                reportName = "AllCustomersInfo";

                AppEnv.Current.p_rptSource.Load(Server.MapPath(AppEnv.Current.p_rptObject.ToString()));
                AppEnv.Current.p_rptSource.SetDataSource(dt);
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section5"].ReportObjects["txtUserName"]).Text = AppEnv.Current.p_UserName.ToString();
                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtCompanyName"]).Text = Session["Name"].ToString();
                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtAddress"]).Text = Session["Address"].ToString();
                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtContact"]).Text = Session["Contact1"].ToString();
                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section5"].ReportObjects["txtUserName"]).Text = AppEnv.Current.p_UserName;
                    if (rbtnPdf.Checked == true)
                    {
                        ViewState["preview"] = "pdf";
                        Response.Buffer = false;
                        Response.ClearContent();
                        Response.ClearHeaders();

                        ExportFormatType format = ExportFormatType.PortableDocFormat;
                        try
                        {
                            AppEnv.Current.p_rptSource.ExportToHttpResponse(format, Response, true, reportName);
                        }
                        finally
                        {
                            AppEnv.Current.p_rptSource.Close();
                            AppEnv.Current.p_rptSource.Dispose();
                            GC.Collect();
                        }
                    }
                    if (rbtnWord.Checked == true)
                    {
                        ViewState["preview"] = "word";
                        Response.Buffer = false;
                        Response.ClearContent();
                        Response.ClearHeaders();

                        ExportFormatType format = ExportFormatType.WordForWindows;
                        //ExportFormatType format = ExportFormatType.ExcelRecord;
                        try
                        {
                            AppEnv.Current.p_rptSource.ExportToHttpResponse(format, Response, true, reportName);
                        }
                        finally
                        {
                            AppEnv.Current.p_rptSource.Close();
                            AppEnv.Current.p_rptSource.Dispose();
                            GC.Collect();
                        }
                    }
                    if (rbtnExcel.Checked == true)
                    {
                        ViewState["preview"] = "word";
                        Response.Buffer = false;
                        Response.ClearContent();
                        Response.ClearHeaders();

                        ExportFormatType format = ExportFormatType.Excel;
                        try
                        {
                            AppEnv.Current.p_rptSource.ExportToHttpResponse(format, Response, true, reportName);
                        }
                        finally
                        {
                            AppEnv.Current.p_rptSource.Close();
                            AppEnv.Current.p_rptSource.Dispose();
                            GC.Collect();
                        }
                    }

                    if (rbtnCrystal.Checked == true)
                    {
                        string URL = "~/CRpreview.aspx";
                        URL = Page.ResolveClientUrl(URL);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "onclick", "javascript:window.open('" + URL + "','_blank','height=700,width=1200,toolbar=no,location=no, directories=no,status=no,menubar=no,scrollbars=no,resizable=no');", true);
                    }
                }
                else
                {
                    lblMessage.Text = "Data is not available.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
    }
}