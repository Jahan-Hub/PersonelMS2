using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using Telerik.Web.UI;

namespace PersonelMS.Forms
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand Cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sbcon"].ConnectionString);
            con.Open();
            Cmd = new SqlCommand("Sp_Dashboard", con);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add("@Mode", SqlDbType.Int).Value = 1;
            SqlDataAdapter adapter = new SqlDataAdapter(Cmd);
            DataSet ds = new DataSet();
            DataTable dt0 = new DataTable();
            DataTable dt1 = new DataTable();
            DataTable dt2 = new DataTable();
            DataTable dt3 = new DataTable();

            adapter.Fill(ds);
            dt0 = ds.Tables[0];
            dt1 = ds.Tables[1];
            dt2 = ds.Tables[2];
            dt3 = ds.Tables[3];

            rgCount.DataSource = dt0;
            rgCount.Rebind();

            rgTotalSummary.DataSource = dt1;
            rgTotalSummary.Rebind();

            rgNotification.DataSource = dt2;
            rgNotification.Rebind();

            rgOutFlow.DataSource = dt3;
            rgOutFlow.Rebind();

            //Radticker1.DataSource = dt4;
            //Radticker1.DataTextField = "Description";
            //Radticker1.DataBind();

            //TopChart.PlotArea.Series.Clear();
            PieSeries curCol = new PieSeries();
            PieSeries OldCol = new PieSeries();

            OldCol.DataFieldY = dt0.Columns[0].Caption;

            //TopChart.PlotArea.Series.Add(curCol);
            //TopChart.PlotArea.Series.Add(OldCol);

            //TopChart.PlotArea.XAxis.DataLabelsField = dt1.Columns[0].Caption.ToString();
            //TopChart.PlotArea.XAxis.Visible = true;
            con.Close();
        }

        decimal sumInFlow = 0;
        decimal sumOutFlow = 0;
        protected void rgIn_ItemDataBound(object sender, GridItemEventArgs e)
        {
            try
            {
                if (e.Item is GridDataItem)
                {
                    GridDataItem dataItem = e.Item as GridDataItem;
                    sumInFlow += Convert.ToDecimal(dataItem["Total"].Text);
                }
                else if (e.Item is GridFooterItem)
                {
                    GridFooterItem footerItem = e.Item as GridFooterItem;
                    footerItem["Total"].Text = sumInFlow.ToString();
                    footerItem["Head"].Text = "Total : ";
                    footerItem.BackColor = System.Drawing.Color.LightGray;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void rgOut_ItemDataBound(object sender, GridItemEventArgs e)
        {
            try
            {
                if (e.Item is GridDataItem)
                {
                    GridDataItem dataItem = e.Item as GridDataItem;
                    sumOutFlow += Convert.ToDecimal(dataItem["Total"].Text);
                }
                else if (e.Item is GridFooterItem)
                {
                    GridFooterItem footerItem = e.Item as GridFooterItem;
                    footerItem["Total"].Text = sumOutFlow.ToString();
                    footerItem["Head"].Text = "Total : ";
                    footerItem.BackColor = System.Drawing.Color.LightGray;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
    }
}