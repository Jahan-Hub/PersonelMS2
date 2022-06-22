<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rptPurchase.aspx.cs" Inherits="SobujBanglaARM.Forms.rptPurchase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
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
          <h1>Purchase Info</h1>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Supplier Name"></asp:Label>
                </td>
                <td colspan="2">
                    <telerik:RadComboBox ID="cmCommon" Runat="server" Filter="Contains" EnableLoadOnDemand="true" EmptyMessage="Select A Supplier" OnItemsRequested="cmCommon_ItemsRequested" Width="300px">
                    </telerik:RadComboBox>
                </td>
            </tr>
                        <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label21" runat="server" Text="Item Category"></asp:Label>
                </td>
                <td class="auto-style1" colspan="2">
                    <telerik:RadComboBox ID="cmCategory" Runat="server" DataSourceID="dsCat" DataTextField="Name" DataValueField="CatId" EmptyMessage="Select Category" AutoPostBack="True" OnSelectedIndexChanged="cmCategory_SelectedIndexChanged">
                    </telerik:RadComboBox>
                    <asp:SqlDataSource ID="dsCat" runat="server" ConnectionString="<%$ ConnectionStrings:sbcon %>" SelectCommand="SELECT [Name], [CatId] FROM [tblCategory]"></asp:SqlDataSource>

                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label20" runat="server" Text="Item Name"></asp:Label>
                </td>
                <td class="auto-style1" colspan="2">
                            <telerik:RadComboBox ID="cmItemName" Runat="server" Width="100%" EmptyMessage="Select Product" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" Height="400px" Filter="Contains">
                                    <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width: 450px">
                                        <tr>
                                            <td style="font-family: Arial; font-size: 8px; width: 30px;">Code</td>
                                            <td style="font-family: Arial; font-size: 8px; width: 170px;">Alias</td>
                                            <td style="font-family: Arial; font-size: 8px; width: 250px;">Name</td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width: 450px">
                                        <tr>
                                            <td style="width: 30px; font-size: 10px;"><%# DataBinder.Eval(Container, "Attributes['ItemCode']")%></td>
                                           <td style="width: 250px; font-size: 10px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label19" runat="server" Text="Report Type"></asp:Label>
                </td>
                <td class="auto-style1" colspan="2">
                    <telerik:RadComboBox ID="cmReportType" Runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmReportType_SelectedIndexChanged">
                        <Items>
                            <telerik:RadComboBoxItem runat="server" Text="Custom Date" Value="Custom Date" />
                            <telerik:RadComboBoxItem runat="server" Text="As on Date" Value="As on Date" />
                            <telerik:RadComboBoxItem runat="server" Text="Monthly" Value="Monthly" Visible="False" />
                            <telerik:RadComboBoxItem runat="server" Text="Yearly" Value="Yearly" Visible="False" />
                        </Items>
                    </telerik:RadComboBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="lblStartDate" runat="server" Text="From Date"></asp:Label>
                </td>
                <td>
                    <telerik:RadDatePicker ID="dpStartDate" Runat="server" Culture="en-US">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="dd-MM-yyyy" DateFormat="dd-MM-yyyy" LabelWidth="40%">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    </telerik:RadDatePicker>
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Summary" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEndDate" runat="server" Text="To Date"></asp:Label>
                </td>
                <td>
                    <telerik:RadDatePicker ID="dpEndDate" Runat="server" Culture="en-US">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="dd-MM-yyyy" DateFormat="dd-MM-yyyy" LabelWidth="40%">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    </telerik:RadDatePicker>
                </td>
                <td>
                    <asp:CheckBox ID="ckOpeningBalance" runat="server" Text="Opening Balance" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2">
                    <telerik:RadButton ID="btnGenerate" runat="server" Text="Generate Report" OnClick="btnGenerate_Click">
                    </telerik:RadButton>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label17" runat="server" class="menuitembold" ForeColor="Blue" Text="Report Format"></asp:Label></td>
                <td colspan="2">
                    <asp:RadioButton ID="rbtnPdf" runat="server" Text="Pdf" GroupName="b" ForeColor="Blue" Checked="True"/>
                    <asp:RadioButton ID="rbtnCrystal" runat="server" Text="Crystal" GroupName="b" ForeColor="Blue" Visible="False"/>
                    <asp:RadioButton ID="rbtnWord" runat="server" Text="Word" GroupName="b" ForeColor="Blue" Visible="False"/>
                    <asp:RadioButton ID="rbtnExcel" runat="server" Text="Excel" GroupName="b" ForeColor="Blue" Visible="False"  />
                </td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
        </table>
    <div>
    
        <asp:Label ID="lblMessage" runat="server" ForeColor="#990033"></asp:Label>
    
    </div>
    </form>
</body>
</html>
