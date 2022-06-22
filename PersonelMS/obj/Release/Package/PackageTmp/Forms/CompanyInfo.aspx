<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyInfo.aspx.cs" Inherits="SobujBanglaARM.Forms.CompanyInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 24px;
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
        <h1>Company Information</h1>
        <div>

            <table class="auto-style1" style="width: 50%">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Company ID"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtId" runat="server" Width="100px" AutoPostBack="True" OnTextChanged="txtId_TextChanged">
                        </telerik:RadTextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label11" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <telerik:RadTextBox ID="txtName" runat="server" Width="300px">
                        </telerik:RadTextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label20" runat="server" Text="Address"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="300px">
                        </telerik:RadTextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label14" runat="server" Text="Contact No 1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtContactNo1" runat="server">
                        </telerik:RadTextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label24" runat="server" Text="Contact No 2"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtContactNo2" runat="server">
                        </telerik:RadTextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label25" runat="server" Text="Fax"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtFax" runat="server">
                        </telerik:RadTextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label16" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtEmail" runat="server" Width="200px">
                        </telerik:RadTextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label23" runat="server" Text="Website"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtWebsite" runat="server" Width="250px">
                        </telerik:RadTextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label26" runat="server" Text="Moto"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtMoto" runat="server" Width="300px">
                        </telerik:RadTextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label22" runat="server" Text="Photo"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:FileUpload ID="FileUpload2" runat="server" onchange="previewFile()" OnDataBinding="FileUpload2_DataBinding" ValidateRequestMode="Inherit" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" SingleClick="True" SingleClickText="Working..">
                        </telerik:RadButton>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
    </form>

</body>
</html>
<script type="text/javascript">
    function previewFile() {
        var preview = document.querySelector('#<%=Image1.ClientID %>');
        var file = document.querySelector('#<%=FileUpload2.ClientID %>').files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
</script>
