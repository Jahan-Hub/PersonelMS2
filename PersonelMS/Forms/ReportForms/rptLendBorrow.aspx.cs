using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using Telerik.Web.UI;

namespace PersonelMS.Forms.ReportForms
{
    public partial class rptLendBorrow : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand Cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dpFromDate.SelectedDate = DateTime.Now;
                dpToDate.SelectedDate = DateTime.Now;
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
                Cmd = new SqlCommand("Sp_ReportManager", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = 137;
                if (cmReportFormat.SelectedValue != "")
                    Cmd.Parameters.Add("@Type", SqlDbType.VarChar).Value = cmReportFormat.Text;
                Cmd.Parameters.Add("@DateOption", SqlDbType.VarChar).Value = cmReportType.Text;
                if (cmReportType.SelectedValue == "Custom Date")
                    Cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = dpFromDate.SelectedDate;
                Cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = dpToDate.SelectedDate;
                if (cmCustomerName.SelectedValue != "")
                    Cmd.Parameters.Add("@CustomerId", SqlDbType.VarChar).Value = cmCustomerName.Text;

                SqlDataAdapter Dap = new SqlDataAdapter(Cmd);
                DataTable dt = new DataTable();
                Dap.Fill(dt);
                Cmd.Dispose();

                string tempPath = "";
                string reportName = "";

                AppEnv.Current.p_rptObject = "~/Reports/LendBorrow.rpt";
                tempPath = @System.IO.Path.GetTempPath() + "LendBorrow";
                reportName = "LendBorrow";

                AppEnv.Current.p_rptSource.Load(Server.MapPath(AppEnv.Current.p_rptObject.ToString()));
                AppEnv.Current.p_rptSource.SetDataSource(dt);
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtCompanyName"]).Text = Session["Name"].ToString();
                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtAddress"]).Text = Session["Address"].ToString();
                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtContact"]).Text = Session["Contact1"].ToString();
                    ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section5"].ReportObjects["txtUserName"]).Text = AppEnv.Current.p_UserName;
                    if (cmReportType.SelectedValue == "As on Date")
                    {
                        ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtDatePeriod"]).Text = "As on Date : " + Convert.ToDateTime(dpToDate.SelectedDate).ToString("dd-MMM-yyyy");
                    }
                    else
                    {
                        ((TextObject)AppEnv.Current.p_rptSource.ReportDefinition.Sections["Section1"].ReportObjects["txtDatePeriod"]).Text = "Date Period : " + Convert.ToDateTime(dpFromDate.SelectedDate).ToString("dd-MMM-yyyy") + " To " + Convert.ToDateTime(dpToDate.SelectedDate).ToString("dd-MMM-yyyy");
                    }
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
        protected void cmCustomerName_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
                con.Open();
                Cmd = new SqlCommand("Sp_Sales", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.Add("@mode", SqlDbType.VarChar).Value = 8;
                SqlDataAdapter adapter = new SqlDataAdapter(Cmd);
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

        protected void cmReportType_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            if (cmReportType.SelectedValue == "Custom Date")
            {
                dpFromDate.SelectedDate = DateTime.Now;
                dpToDate.SelectedDate = DateTime.Now;
                dpFromDate.Visible = true;
                dpToDate.Visible = true;
                lblStartDate.Visible = true;
            }
            else if (cmReportType.SelectedValue == "As on Date")
            {
                dpFromDate.SelectedDate = null;
                dpToDate.SelectedDate = DateTime.Now;
                dpFromDate.Visible = false;
                lblStartDate.Visible = false;
            }
        }

    }
}