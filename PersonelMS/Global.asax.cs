using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Web;

namespace PersonelMS
{
    public class AppEnv
    {
        // private constructor
        private AppEnv()
        {
            p_rptObject = "";
            p_EnterpriseName = "";
            p_UserName = "";
        }

        // Gets the current session.
        public static AppEnv Current
        {
            get
            {
                AppEnv session = (AppEnv)HttpContext.Current.Session["__AppEnv__"];

                if (session == null)
                {
                    session = new AppEnv();
                    HttpContext.Current.Session["__AppEnv__"] = session;
                }
                return session;
            }
        }

        // **** add your session properties here, e.g like this:
        public string p_rptObject { get; set; }
        public ReportDocument p_rptSource { get; set; }
        public string p_EnterpriseName { get; set; }
        public string p_UserName { get; set; }
    }

    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            AppEnv.Current.p_rptObject = "";
            AppEnv.Current.p_rptSource = new ReportDocument();
            AppEnv.Current.p_EnterpriseName = "";
            AppEnv.Current.p_UserName = "";
            Response.Redirect("LogIn.aspx");
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            AppEnv.Current.p_rptSource.Dispose();
            AppEnv.Current.p_rptSource.Close();
        }

        protected void Application_End(object sender, EventArgs e)
        {
            AppEnv.Current.p_rptSource.Dispose();
            AppEnv.Current.p_rptSource.Close();
        }
    }
}