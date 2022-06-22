<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DBBackup.aspx.cs" Inherits="SobujBanglaARM.Forms.DBBackup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 36px;
        }
    </style>
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
        <h1>Database Backup</h1>
        <div>
            <table class="auto-style1" style="width: 80%">
                <tr>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadButton ID="btnBackup" runat="server" Text="Backup" OnClick="btnBackup_Click">
                        </telerik:RadButton>
                    </td>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 80%">
        </div>
    </form>
</body>
</html>
<script>
    function OnClientClicked(button, args) {
        if (window.confirm("Are you sure you want to delete?")) {
            button.set_autoPostBack(true);
        }
        else {
            button.set_autoPostBack(false);
        }
    }
    <%--function pageLoad() {
        var grid = $find("<%= rgMain.ClientID %>");
            var columns = grid.get_masterTableView().get_columns();
            for (var i = 0; i < columns.length; i++) {
                columns[i].resizeToFit();
            }
        }--%>
</script>
