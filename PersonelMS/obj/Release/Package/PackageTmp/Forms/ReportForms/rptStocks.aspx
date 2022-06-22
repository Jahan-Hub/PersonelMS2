<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rptStocks.aspx.cs" Inherits="SobujBanglaARM.Forms.rptStocks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
                </asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
          <h1>Stock Info</h1>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Product Name"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmCommon" Runat="server" EmptyMessage="Select A Product" OnItemsRequested="cmCommon_ItemsRequested" Width="300px" AutoPostBack="True" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" Height="400px">
                        <HeaderTemplate>
                            <table cellpadding="0" cellspacing="0" style="width: 450px">
                                <tr>
                                    <td style="font-family: Arial; font-size: 8px; width: 100px;">Code</td>
                                    <td style="font-family: Arial; font-size: 8px; width: 100px;">Alias</td>
                                    <td style="font-family: Arial; font-size: 8px; width: 250px;">Name</td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" style="width: 450px">
                                <tr>
                                    <td style="width: 100px; font-size: 10px;"><%# DataBinder.Eval(Container, "Attributes['ItemCode']")%></td>
                                   <td style="width: 250px; font-size: 10px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <telerik:RadButton ID="btnGenerate" runat="server" Text="Generate Report" OnClick="btnGenerate_Click">
                    </telerik:RadButton>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label17" runat="server" class="menuitembold" ForeColor="Blue" Text="Report Format"></asp:Label></td>
                <td>
                    <asp:RadioButton ID="rbtnPdf" runat="server" Text="Pdf" GroupName="b" ForeColor="Blue" Checked="True"/>
                    <asp:RadioButton ID="rbtnCrystal" runat="server" Text="Crystal" GroupName="b" ForeColor="Blue" Visible="False"/>
                    <asp:RadioButton ID="rbtnWord" runat="server" Text="Word" GroupName="b" ForeColor="Blue" Visible="False"/>
                    <asp:RadioButton ID="rbtnExcel" runat="server" Text="Excel" GroupName="b" ForeColor="Blue" Visible="False"  />
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
    <div>
    
        <asp:Label ID="lblMessage" runat="server" ForeColor="#990033"></asp:Label>
    
    </div>
    </form>
</body>
</html>
