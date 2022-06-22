<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportManager.aspx.cs" Inherits="SobujBanglaARM.Forms.ReportManager" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 53px;
        }
    </style>
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
   <div id="div1a" runat="server" style="border-width: 1px; border-color: #000000; width: 100%;">
                       
                                        <table class="auto-style36">
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td colspan="2">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" class="menuitembold" Text="Name"></asp:Label>
                                                </td>
                                                <td>

                                                    <telerik:RadComboBox ID="cmParty" Filter="Contains" Runat="server" DropDownWidth="340px" AutoPostBack="True" EnableLoadOnDemand="True" Width="300px"  DataTextField="Column1" DataValueField="CustId" AppendDataBoundItems="True" EmptyMessage="Select Customer" OnSelectedIndexChanged="cmParty_SelectedIndexChanged" OnItemsRequested="cmParty_ItemsRequested">
                                                          <HeaderTemplate>
                                                            <table cellpadding="0" cellspacing="0" style="width: 400px">
                                                                <tr>
                                                                    <td style="font-family: Arial; font-size: 10px; width: 170px;">Name</td>
                                                                    <td style="font-family: Arial; font-size: 10px; width: 170px;">Father Name</td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="font-family: Arial; font-size: 10px;width: 170px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                                                    <td style="font-family: Arial; font-size: 10px; width: 170px;"><%# DataBinder.Eval(Container, "Attributes['FatherName']")%></td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </telerik:RadComboBox>

                                                </td>
                                                <td>
                                                    </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:RadioButton ID="rbInviCustomer" runat="server" GroupName="a" Text="Individual Customer" />
                                                </td>
                                                <td>
                                                    <asp:RadioButton ID="rbIndiAcc" runat="server" GroupName="a" Text="Individual Accounts" />
                                                </td>
                                                <td>
                                                    <asp:RadioButton ID="rbIndiShareForm" runat="server" GroupName="a" Text="Individual Shareholder Form" />
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:RadioButton ID="rbAllCustomer" runat="server" GroupName="a" Text="All Customer" AutoPostBack="True" OnCheckedChanged="rbAllShareholder_CheckedChanged" />
                                                </td>
                                                <td>
                                                    <asp:RadioButton ID="rbAllAcc" runat="server" GroupName="a" Text="All Accounts" AutoPostBack="True" OnCheckedChanged="rbAllAcc_CheckedChanged" />
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label17" runat="server" class="menuitembold" ForeColor="Blue" Text="Report Format"></asp:Label>
                                                </td>
                                                <td style="font-weight: 700" colspan="2">
                                                    <asp:RadioButton ID="rbtnPdf" runat="server" Text="Pdf" GroupName="b" ForeColor="Blue" Checked="True"/>
                                                    <asp:RadioButton ID="rbtnCrystal" runat="server" Text="Crystal" GroupName="b" ForeColor="Blue" Visible="False"/>
                                                    <asp:RadioButton ID="rbtnWord" runat="server" Text="Word" GroupName="b" ForeColor="Blue"/>
                                                    <asp:RadioButton ID="rbtnExcel" runat="server" Text="Excel" GroupName="b" ForeColor="Blue"  />
                                                </td>
                                                <td style="font-weight: 700">
                                                    &nbsp;</td>
                                            </tr>
                                            
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td style="font-weight: 700" colspan="2">
                                                    &nbsp;</td>
                                                <td style="font-weight: 700">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <telerik:RadButton ID="btnGenerate" runat="server" OnClick="btnGenerate_Click" Text="Generate Report">
                                                    </telerik:RadButton>
                                                </td>
                                                <td style="font-weight: 700" colspan="2">
                                                    &nbsp;</td>
                                                <td style="font-weight: 700">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td style="font-weight: 700" colspan="2">
                                                    &nbsp;</td>
                                                <td style="font-weight: 700">
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </div>
        <asp:Label ID="lblMessage" runat="server" ForeColor="#990033"></asp:Label>
        
      
        
    </form>
</body>
</html>
