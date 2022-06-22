<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rptDueList.aspx.cs" Inherits="SobujBanglaARM.Forms.ReportForms.rptDueList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        <h1>Customer &amp; Supplier Due Report</h1>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label20" runat="server" Text="Report Formats"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmReportFormat" runat="server" Width="100%">
                        <Items>
                            <telerik:RadComboBoxItem runat="server" Text="Customer Due List" Value="Customer Due List" />
                            <telerik:RadComboBoxItem runat="server" Text="Supplier Due List" Value="Supplier Due List" />
                        </Items>
                    </telerik:RadComboBox>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Customer Name"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmCustomer" runat="server" EmptyMessage="Select A Customer" Width="100%"  EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="cmCustomer_ItemsRequested">
                    </telerik:RadComboBox>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label21" runat="server" Text="Supplier Name"></asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox ID="cmSupplier" runat="server" EmptyMessage="Select A Supplier" Width="100%" EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="cmSupplier_ItemsRequested">
                    </telerik:RadComboBox>

                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblStartDate" runat="server" Text="Date Options"></asp:Label>
                </td>
                <td class="auto-style1">
                    <telerik:RadDatePicker ID="dpStartDate" runat="server" Width="120px">
                        <DateInput runat="server" DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%">
                            <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                            <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                            <FocusedStyle Resize="None"></FocusedStyle>

                            <DisabledStyle Resize="None"></DisabledStyle>

                            <InvalidStyle Resize="None"></InvalidStyle>

                            <HoveredStyle Resize="None"></HoveredStyle>

                            <EnabledStyle Resize="None"></EnabledStyle>
                        </DateInput>
                    </telerik:RadDatePicker>
                    <telerik:RadDatePicker ID="dpEndDate" runat="server" Width="120px">
                        <DateInput runat="server" DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%">
                            <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                            <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                            <FocusedStyle Resize="None"></FocusedStyle>

                            <DisabledStyle Resize="None"></DisabledStyle>

                            <InvalidStyle Resize="None"></InvalidStyle>

                            <HoveredStyle Resize="None"></HoveredStyle>

                            <EnabledStyle Resize="None"></EnabledStyle>
                        </DateInput>
                    </telerik:RadDatePicker>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label19" runat="server" Text="Report Type" Visible="False"></asp:Label>
                </td>
                <td class="auto-style1">
                    <telerik:RadComboBox ID="cmReportType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmReportType_SelectedIndexChanged" Visible="False" Filter="Contains">
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
                <td>&nbsp;</td>
                <td>
                    <telerik:RadButton ID="btnGenerate" runat="server" Text="Generate Report" OnClick="btnGenerate_Click">
                    </telerik:RadButton>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label17" runat="server" ForeColor="Blue" Text="Report Format"></asp:Label></td>
                <td>
                    <asp:RadioButton ID="rbtnPdf" runat="server" Text="Pdf" GroupName="b" ForeColor="Blue" Checked="True" />
                    <asp:RadioButton ID="rbtnCrystal" runat="server" Text="Crystal" GroupName="b" ForeColor="Blue" Visible="False" />
                    <asp:RadioButton ID="rbtnWord" runat="server" Text="Word" GroupName="b" ForeColor="Blue" Visible="False" />
                    <asp:RadioButton ID="rbtnExcel" runat="server" Text="Excel" GroupName="b" ForeColor="Blue" />
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
