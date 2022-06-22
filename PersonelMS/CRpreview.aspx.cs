using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.Printing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonelMS
{
    public partial class CRpreview : System.Web.UI.Page
    {
        ReportDocument cp = new ReportDocument();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    cp.Load(Server.MapPath("~/Reports/ReceiveVoucher.rpt"));
                    DataTable dt = (DataTable)Session["dt"];
                    cp.SetDataSource(dt);
                    CrystalReportViewer1.ReportSource = cp;
                    //CrystalReportViewer1.DisplayStatusbar = false;
                    CrystalReportViewer1.DisplayGroupTree = false;

                    btnPrint.TabIndex = 0;
                    btnPrint.Focus();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                }
            }
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            try
            {
                btnPrint.TabIndex = 0;
                btnPrint.Focus();

                CrystalReportViewer1.Width = Unit.Percentage(100);
                CrystalReportViewer1.Visible = true;
                cp.Load(Server.MapPath("~/Reports/ReceiveVoucher.rpt"));
                DataTable dt = (DataTable)Session["dt"];
                cp.SetDataSource(dt);
                CrystalReportViewer1.ReportSource = AppEnv.Current.p_rptSource;
                cp.PrintOptions.PrinterName = LocalPrintServer.GetDefaultPrintQueue().FullName;
                cp.PrintToPrinter(1, false, 1, 1);

                AppEnv.Current.p_rptSource.Close();
                AppEnv.Current.p_rptSource.Dispose();
                GC.Collect();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void Print(object sender, EventArgs e)
        {
            cp.Refresh();
            cp.PrintOptions.PaperOrientation = CrystalDecisions.Shared.PaperOrientation.Landscape;
            cp.PrintOptions.PaperSize = CrystalDecisions.Shared.PaperSize.PaperA4;
            cp.PrintOptions.PrinterName = GetDefaultPrinter();
            cp.PrintToPrinter(1, true, 0, 0);
        }
        private string GetDefaultPrinter()
        {
            PrinterSettings settings = new PrinterSettings();
            foreach (string printer in PrinterSettings.InstalledPrinters)
            {
                settings.PrinterName = printer;
                if (settings.IsDefaultPrinter)
                {
                    return printer;
                }
            }
            return string.Empty;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    con = new SqlConnection(ConfigurationManager.ConnectionStrings["BikeProductionDBConnectionString"].ConnectionString);
            //    con.Open();
            //    cmd = new SqlCommand("sp_BikeScan", con);
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.Add("@Mode", SqlDbType.VarChar).Value = 3;
            //    string srlno = Session["SrlNo"].ToString();
            //    cmd.Parameters.Add("@SrlNo", SqlDbType.VarChar).Value = Session["SrlNo"].ToString();
            //    cmd.ExecuteNonQuery();
            //    cmd.Dispose();
            //    con.Close();
            //    ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "RefreshParent();", true);
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "onclick", "javascript:window.close('','_blank','height=700,width=1200,toolbar=no,location=no, directories=no,status=no,menubar=no,scrollbars=no,resizable=no');", true);
            //}
            //catch (Exception ex)
            //{
            //    lblMessage.Text = ex.Message.ToString();
            //}
        }
    }
}