<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRpreview.aspx.cs" Inherits="SobujBanglaARM.CRpreview" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="crystalreportviewers13/js/crviewer/crv.js"></script>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <style type="text/css" media="print"></style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            
<Scripts>
<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
 <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
 <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
 </Scripts>
 </telerik:RadScriptManager>
        <div>
            <asp:UpdatePanel ID="upd1" runat="server">
                <ContentTemplate>
                    <center>
                        <telerik:RadButton ID="btnPrint" Height="50" Font-Size="XX-Large" Width="300" runat="server" Font-Bold="true" Text="Print/প্রিন্ট" OnClick="btnPrint_Click" BackColor="#009999" ForeColor="White"></telerik:RadButton>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Please, Check the details before print/প্রিন্ট করার আগে ভালভাবে চেক করুন।" Font-Size="Larger" ForeColor="#990033"></asp:Label>

                        <CR:CrystalReportViewer ID="CrystalReportViewer1" DisplayToolbar="False" runat="server" AutoDataBind="True" Height="1202px" ToolPanelWidth="200px" Width="1104px" />
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <telerik:RadButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"></telerik:RadButton>
                    </center>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">
    function Print() {
        var dvReport = document.getElementById("dvReport");
        var frame1 = dvReport.getElementsByTagName("iframe")[0];
        if (navigator.appName.indexOf("Internet Explorer") != -1) {
            frame1.name = frame1.id;
            window.frames[frame1.id].focus();
            window.frames[frame1.id].print();
        }
        else {
            var frameDoc = frame1.contentWindow ? frame1.contentWindow : frame1.contentDocument.document ? frame1.contentDocument.document : frame1.contentDocument;
            frameDoc.print();
        }
    }
</script>
<script type="text/javascript">
    function RefreshParent() {
        window.opener.location.href = "Forms/Dashboard.aspx";
    }
    window.onbeforeunload = RefreshParent;
</script>
<script type="text/javascript">
    $(function () { // and make the script wait until the page is ready.
        $("#form1").keyup(function (event) {
            if (event.keyCode == 13) {
                $("#btnPrint").click();
                window.close();
            }
        });
    })
</script>
