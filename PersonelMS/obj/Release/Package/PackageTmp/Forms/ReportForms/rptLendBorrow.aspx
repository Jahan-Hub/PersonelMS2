<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rptLendBorrow.aspx.cs" Inherits="SobujBanglaARM.Forms.ReportForms.rptLendBorrow" %>

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
         <h1>Lend &amp; Borrow Info</h1>
        <table style="width:35%">
            <tr>
                <td>
                    <asp:Label ID="Label23" runat="server" Text="Report Format"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmReportFormat" Runat="server" EmptyMessage="Select Format">
                        <Items>
                            <telerik:RadComboBoxItem runat="server" Text="Lend" Value="Lend" />
                            <telerik:RadComboBoxItem runat="server" Text="Borrow" Value="Borrow" />
                        </Items>
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label19" runat="server" Text="Customer"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmCustomerName" runat="server" Width="100%" EmptyMessage="Select Customer" EnableLoadOnDemand="true" Filter="Contains" Height="500px" OnItemsRequested="cmCustomerName_ItemsRequested">
                        <HeaderTemplate>
                            <table style="width: 350px">
                                <tr>
                                    <td style="font-family: Arial; font-size: 8px; width: 50px;">Code</td>
                                    <td style="font-family: Arial; font-size: 8px; width: 300px;">Name</td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 350px">
                                <tr>
                                    <td style="width: 50px; font-size: 10px;"><%# DataBinder.Eval(Container, "Attributes['CustId']")%></td>
                                    <td style="width: 300px; font-size: 10px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label20" runat="server" Text="Report Type"></asp:Label>
                </td>
                <td>
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
                    <telerik:RadDatePicker ID="dpFromDate" Runat="server" Culture="en-US" Width="100px">
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
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label18" runat="server" Text="To Date"></asp:Label>
                </td>
                <td>
                    <telerik:RadDatePicker ID="dpToDate" Runat="server" Culture="en-US" Width="100px">
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