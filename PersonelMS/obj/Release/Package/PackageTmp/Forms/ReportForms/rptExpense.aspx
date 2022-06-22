<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rptExpense.aspx.cs" Inherits="SobujBanglaARM.Forms.rptExpense" %>

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
         <h1>Expense Info</h1>
        <table style="width:35%">
            <tr>
                <td>
                    <asp:Label ID="Label23" runat="server" Text="Report Format"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmReportFormat" Runat="server" AutoPostBack="True">
                        <Items>
                            <telerik:RadComboBoxItem runat="server" Text="Enterprise" Value="Enterprise" />
                            <telerik:RadComboBoxItem runat="server" Text="Company" Value="Company" />
                        </Items>
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label19" runat="server" Text="Cost Center"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmCostHead" Runat="server" EnableLoadOnDemand="True" AutoPostBack="True" EmptyMessage="Select Cost Head"  Width="250px" OnSelectedIndexChanged="cmCostHead_SelectedIndexChanged" OnItemsRequested="cmCostHead_ItemsRequested" Filter="Contains" Height="500px">
                                </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label22" runat="server" Text="Cost Element"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmExpenseHead" Runat="server" EnableLoadOnDemand="true" EmptyMessage="Select Cost Elements" Width="250px" OnItemsRequested="cmExpenseHead_ItemsRequested" Filter="Contains" Height="500px" OnSelectedIndexChanged="cmExpenseHead_SelectedIndexChanged" AutoPostBack="True">
                    </telerik:RadComboBox>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label21" runat="server" Text="Staff Name"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmCommon" Runat="server" EnableLoadOnDemand="true" EmptyMessage="Select A Staff" OnItemsRequested="cmCommon_ItemsRequested" Width="300px">
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
