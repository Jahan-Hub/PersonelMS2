<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inquiry.aspx.cs" Inherits="SobujBanglaARM.Forms.Inquiry" %>

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
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <h1>History Data</h1>
        <table>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label19" runat="server" Text="Query Type"></asp:Label>
                </td>
                <td class="auto-style1">
                    <telerik:RadComboBox ID="cmQueryType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmQueryType_SelectedIndexChanged" Filter="Contains" EmptyMessage="Select">
                        <Items>
                            <telerik:RadComboBoxItem runat="server" Text="Purchase" Value="Purchase" />
                            <telerik:RadComboBoxItem runat="server" Text="Sales" Value="Sales" />
                            <telerik:RadComboBoxItem runat="server" Text="Payment" Value="Payment"></telerik:RadComboBoxItem>
                            <telerik:RadComboBoxItem runat="server" Text="Money Receive" Value="Money Receive" />
                            <telerik:RadComboBoxItem runat="server" Text="Expense" Value="Expense" />
                            <telerik:RadComboBoxItem runat="server" Text="Income" Value="Income" />
                            <telerik:RadComboBoxItem runat="server" Text="Lend &amp; Borrow" Value="Lend &amp; Borrow" />
                            <telerik:RadComboBoxItem runat="server" Text="Bank Transaction" Value="Bank Transaction" />
                        </Items>
                    </telerik:RadComboBox>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="lblStartDate" runat="server" Text="From Date"></asp:Label>
                </td>
                <td class="auto-style1">
                    <telerik:RadDatePicker ID="dpStartDate" runat="server" AutoPostBack="True" OnSelectedDateChanged="dpStartDate_SelectedDateChanged">
                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

                        <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%" AutoPostBack="True">
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
                <td class="auto-style1">
                    <asp:Label ID="lblEndDate" runat="server" Text="To Date"></asp:Label>
                </td>
                <td class="auto-style1">
                    <telerik:RadDatePicker ID="dpEndDate" runat="server" AutoPostBack="True" OnSelectedDateChanged="dpEndDate_SelectedDateChanged">
                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

                        <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%" AutoPostBack="True">
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
                <td class="auto-style1"> <asp:Label ID="lblCommon" runat="server" Text=""></asp:Label></td>
                <td class="auto-style1"><telerik:RadComboBox ID="cmCommon" ZIndex="9999999" runat="server" AutoPostBack="True" EnableLoadOnDemand="True" Filter="Contains" Height="400px" OnItemsRequested="cmCommon_ItemsRequested" TabIndex="25" Width="200px" OnSelectedIndexChanged="cmCommon_SelectedIndexChanged" EmptyMessage="Select">
                            </telerik:RadComboBox></td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">
                    <telerik:RadButton ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click">
                    </telerik:RadButton>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label17" runat="server" class="menuitembold" ForeColor="Blue" Text="Report Format" Visible="False"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:RadioButton ID="rbtnPdf" runat="server" Text="Pdf" GroupName="b" ForeColor="Blue" Checked="True" Visible="False" />
                </td>
                <td class="auto-style1">
                    <asp:RadioButton ID="rbtnCrystal" runat="server" Text="Crystal" GroupName="b" ForeColor="Blue" Visible="False" />
                </td>
                <td class="auto-style1">
                    <asp:RadioButton ID="rbtnWord" runat="server" Text="Word" GroupName="b" ForeColor="Blue" Visible="False" />
                </td>
                <td class="auto-style1">
                    <asp:RadioButton ID="rbtnExcel" runat="server" Text="Excel" GroupName="b" ForeColor="Blue" Visible="False" />
                </td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
        </table>
        <div>

            <asp:Label ID="lblMessage" runat="server" ForeColor="#990033"></asp:Label>

        </div>
        <telerik:RadPanelBar ID="RadPanelBar1" runat="server" Width="90%" Height="100%">
            <Items>
                <telerik:RadPanelItem runat="server" Text="Purchase">
                    <ContentTemplate>
                        <div style="overflow: scroll; height: 500px; width: 100%">
                            <telerik:RadGrid ID="rgPurchase" ShowFooter="true" GroupingSettings-CaseSensitive="false" Height="500px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowPaging="False" PageSize="15" OnItemDataBound="rgPurchase_ItemDataBound">
                                <GroupingSettings CaseSensitive="False" CollapseAllTooltip="Collapse all groups" />
                                <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                    <Selecting AllowRowSelect="True" />

                                </ClientSettings>
                                <HeaderStyle CssClass="RadGridHeader" />
                                <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                <ItemStyle CssClass="RadGridItem" />
                                <MasterTableView AllowSorting="true" Width="100%" BorderWidth="0">
                                    <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                    <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </ExpandCollapseColumn>
                                    <CommandItemSettings ShowExportToExcelButton="true" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="BillDate" FilterControlAltText="Filter BillDate column" HeaderText="Purchase Date" SortExpression="BillDate" UniqueName="BillDate" DataFormatString="{0:dd/MM/yyyy}">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SupplierName" FilterControlAltText="Filter SupplierName column" HeaderText="Supplier Name" SortExpression="SupplierName" UniqueName="SupplierName" FooterStyle-HorizontalAlign="Right">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="NetAmount" FilterControlAltText="Filter NetAmount column" HeaderText="Net Amount" SortExpression="NetAmount" UniqueName="NetAmount" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"  FooterStyle-HorizontalAlign="Right" >
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Paid" FilterControlAltText="Filter Paid column" HeaderText="Paid" SortExpression="Paid" UniqueName="Paid" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" >
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Due" FilterControlAltText="Filter Due column" HeaderText="Total Due" SortExpression="Due" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" UniqueName="Due">
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right"/>
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                    </EditFormSettings>
                                </MasterTableView>
                                <FilterMenu EnableEmbeddedSkins="False">
                                </FilterMenu>
                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                </HeaderContextMenu>

                            </telerik:RadGrid>
                        </div>
                    </ContentTemplate>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Text="Sales">
                    <ContentTemplate>
                        <div style="overflow: scroll; height: 500px; width: 100%">
                            <telerik:RadGrid ID="rgSales" ShowFooter="true" GroupingSettings-CaseSensitive="false" Height="500px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowPaging="False" PageSize="15" OnItemDataBound="rgSales_ItemDataBound">
                                <GroupingSettings CaseSensitive="False" CollapseAllTooltip="Collapse all groups" />
                                <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                    <Selecting AllowRowSelect="True" />

                                </ClientSettings>
                                <HeaderStyle CssClass="RadGridHeader" />
                                <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                <ItemStyle CssClass="RadGridItem" />
                                <MasterTableView AllowSorting="true" Width="100%" BorderWidth="0">
                                    <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                    <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </ExpandCollapseColumn>
                                    <CommandItemSettings ShowExportToExcelButton="true" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="SalesDate" FilterControlAltText="Filter SalesDate column" HeaderText="Sales Date" SortExpression="SalesDate" UniqueName="SalesDate" DataFormatString="{0:dd/MM/yyyy}">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CustomerName" FilterControlAltText="Filter CustomerName column" HeaderText="Customer Name" SortExpression="CustomerName" UniqueName="CustomerName" FooterStyle-HorizontalAlign="Right">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="NetAmount" FilterControlAltText="Filter NetAmount column" HeaderText="Net Amount" SortExpression="NetAmount" UniqueName="NetAmount" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Paid" FilterControlAltText="Filter Paid column" HeaderText="Paid" SortExpression="Paid" UniqueName="Paid" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Balance" FilterControlAltText="Filter Balance column" HeaderText="Total Due" SortExpression="Balance" UniqueName="Balance" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                    </EditFormSettings>
                                </MasterTableView>
                                <FilterMenu EnableEmbeddedSkins="False">
                                </FilterMenu>
                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                </HeaderContextMenu>

                            </telerik:RadGrid>
                        </div>
                    </ContentTemplate>
                </telerik:RadPanelItem>

                <telerik:RadPanelItem runat="server" Text="Payment">
                    <ContentTemplate>
                        <div style="overflow: scroll; height: 500px; width: 100%">
                            <telerik:RadGrid ID="rgPayment" ShowFooter="true" GroupingSettings-CaseSensitive="false" Height="500px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowPaging="False" PageSize="15" OnItemDataBound="rgPayment_ItemDataBound">
                                <GroupingSettings CaseSensitive="False" CollapseAllTooltip="Collapse all groups" />
                                <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                    <Selecting AllowRowSelect="True" />

                                </ClientSettings>
                                <HeaderStyle CssClass="RadGridHeader" />
                                <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                <ItemStyle CssClass="RadGridItem" />
                                <MasterTableView AllowSorting="true" Width="100%" BorderWidth="0">
                                    <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                    <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="PayDate" FilterControlAltText="Filter PayDate column" HeaderText="Pay Date" SortExpression="PayDate" UniqueName="PayDate" DataFormatString="{0:dd/MM/yyyy}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SupplierName" FilterControlAltText="Filter SupplierName column" HeaderText="Supplier Name" SortExpression="SupplierName" UniqueName="SupplierName">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PayAmount" FilterControlAltText="Filter PayAmount column" HeaderText="Pay Amount" SortExpression="PayAmount" UniqueName="PayAmount" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                    </EditFormSettings>
                                </MasterTableView>
                                <FilterMenu EnableEmbeddedSkins="False">
                                </FilterMenu>
                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                </HeaderContextMenu>

                            </telerik:RadGrid>
                        </div>
                    </ContentTemplate>
                </telerik:RadPanelItem>

                <telerik:RadPanelItem runat="server" Text="Money Receive">
                    <ContentTemplate>
                        <div style="overflow: scroll; height: 500px; width: 100%">
                            <telerik:RadGrid ID="rgMoneyReceive" ShowFooter="true" GroupingSettings-CaseSensitive="false" Height="500px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowPaging="False" PageSize="15" OnItemDataBound="rgMoneyReceive_ItemDataBound">
                                <GroupingSettings CaseSensitive="False" CollapseAllTooltip="Collapse all groups" />
                                <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                    <Selecting AllowRowSelect="True" />

                                </ClientSettings>
                                <HeaderStyle CssClass="RadGridHeader" />
                                <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                <ItemStyle CssClass="RadGridItem" />
                                <MasterTableView AllowSorting="true" Width="100%" BorderWidth="0">
                                    <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                    <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="ReceivedDate" FilterControlAltText="Filter ReceivedDate column" HeaderText="Receive Date" SortExpression="ReceivedDate" UniqueName="ReceivedDate" DataFormatString="{0:dd/MM/yyyy}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CustomerName" FilterControlAltText="Filter CustomerName column" HeaderText="Customer Name" SortExpression="CustomerName" UniqueName="CustomerName">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ReceiveAmount" FilterControlAltText="Filter ReceiveAmount column" HeaderText="Receive Amount" SortExpression="ReceiveAmount" UniqueName="ReceiveAmount" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                    </EditFormSettings>
                                </MasterTableView>
                                <FilterMenu EnableEmbeddedSkins="False">
                                </FilterMenu>
                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                </HeaderContextMenu>

                            </telerik:RadGrid>
                        </div>
                    </ContentTemplate>
                </telerik:RadPanelItem>

                <telerik:RadPanelItem runat="server" Text="Expense">
                    <ContentTemplate>
                        <div style="overflow: scroll; height: 500px; width: 100%">
                            <telerik:RadGrid ID="rgExpense" ShowFooter="true" GroupingSettings-CaseSensitive="false" Height="500px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowPaging="False" PageSize="15" OnItemDataBound="rgExpense_ItemDataBound">
                                <GroupingSettings CaseSensitive="False" CollapseAllTooltip="Collapse all groups" />
                                <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                    <Selecting AllowRowSelect="True" />

                                </ClientSettings>
                                <HeaderStyle CssClass="RadGridHeader" />
                                <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                <ItemStyle CssClass="RadGridItem" />
                                <MasterTableView AllowSorting="true" Width="100%" BorderWidth="0">
                                    <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                    <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Date" FilterControlAltText="Filter Date column" HeaderText="Expense Date" SortExpression="Date" UniqueName="Date" DataFormatString="{0:dd/MM/yyyy}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CostCenterName" FilterControlAltText="Filter PI column" HeaderText="Cost Center" SortExpression="CostCenterName" UniqueName="CostCenterName">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CostElementName" FilterControlAltText="Filter CostElementName column" HeaderText="Cost Element" SortExpression="CostElementName" UniqueName="CostElementName">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="HandedTo" FilterControlAltText="Filter HandedTo column" HeaderText="Handed To" SortExpression="HandedTo" UniqueName="HandedTo" FooterStyle-HorizontalAlign="Right">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Amount" FilterControlAltText="Filter Amount column" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                    </EditFormSettings>
                                </MasterTableView>
                                <FilterMenu EnableEmbeddedSkins="False">
                                </FilterMenu>
                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                </HeaderContextMenu>

                            </telerik:RadGrid>
                        </div>
                    </ContentTemplate>
                </telerik:RadPanelItem>

                <telerik:RadPanelItem runat="server" Text="Income">
                    <ContentTemplate>
                        <div style="overflow: scroll; height: 500px; width: 100%">
                            <telerik:RadGrid ID="rgIncome" ShowFooter="true" GroupingSettings-CaseSensitive="false" Height="500px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowPaging="False" PageSize="15" OnItemDataBound="rgIncome_ItemDataBound">
                                <GroupingSettings CaseSensitive="False" CollapseAllTooltip="Collapse all groups" />
                                <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                    <Selecting AllowRowSelect="True" />

                                </ClientSettings>
                                <HeaderStyle CssClass="RadGridHeader" />
                                <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                <ItemStyle CssClass="RadGridItem" />
                                <MasterTableView AllowSorting="true" Width="100%" BorderWidth="0">
                                    <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                    <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Date" FilterControlAltText="Filter Date column" HeaderText="Date" SortExpression="Date" UniqueName="Date" DataFormatString="{0:dd/MM/yyyy}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="IncomeSourceName" FilterControlAltText="Filter IncomeSourceName column" HeaderText="Income Source" SortExpression="IncomeSourceName" UniqueName="IncomeSourceName">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Amount" FilterControlAltText="Filter Amount column" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                    </EditFormSettings>
                                </MasterTableView>
                                <FilterMenu EnableEmbeddedSkins="False">
                                </FilterMenu>
                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                </HeaderContextMenu>

                            </telerik:RadGrid>
                        </div>
                    </ContentTemplate>
                </telerik:RadPanelItem>

                <telerik:RadPanelItem runat="server" Text="Lend & Borrow">
                    <ContentTemplate>
                        <div style="overflow: scroll; height: 500px; width: 100%">
                            <telerik:RadGrid ID="rgLendBorrow" ShowFooter="true" GroupingSettings-CaseSensitive="false" Height="500px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowPaging="False" PageSize="15" OnItemDataBound="rgLendBorrow_ItemDataBound">
                                <GroupingSettings CaseSensitive="False" CollapseAllTooltip="Collapse all groups" />
                                <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                    <Selecting AllowRowSelect="True" />

                                </ClientSettings>
                                <HeaderStyle CssClass="RadGridHeader" />
                                <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                <ItemStyle CssClass="RadGridItem" />
                                <MasterTableView AllowSorting="true" Width="100%" BorderWidth="0">
                                    <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                    <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Date" FilterControlAltText="Filter Date column" HeaderText="Date" SortExpression="Date" UniqueName="Date" DataFormatString="{0:dd/MM/yyyy}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CustomerName" FilterControlAltText="Filter CustomerName column" HeaderText="Customer Name" SortExpression="CustomerName" UniqueName="CustomerName">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Left" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Lend" FilterControlAltText="Filter Lend column" HeaderText="Lend" SortExpression="Lend" UniqueName="Lend">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Borrow" FilterControlAltText="Filter Borrow column" HeaderText="Borrow" SortExpression="Borrow" UniqueName="Borrow">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Amount" FilterControlAltText="Filter Amount column" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                    </EditFormSettings>
                                </MasterTableView>
                                <FilterMenu EnableEmbeddedSkins="False">
                                </FilterMenu>
                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                </HeaderContextMenu>

                            </telerik:RadGrid>
                        </div>
                    </ContentTemplate>
                </telerik:RadPanelItem>

                <telerik:RadPanelItem runat="server" Text="Bank Transaction">
                    <ContentTemplate>
                        <div style="overflow: scroll; height: 500px; width: 100%">
                            <telerik:RadGrid ID="rgBankTransaction" ShowFooter="true" GroupingSettings-CaseSensitive="false" Height="500px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowPaging="False" PageSize="15" OnItemDataBound="rgBankTransaction_ItemDataBound">
                                <GroupingSettings CaseSensitive="False" CollapseAllTooltip="Collapse all groups" />
                                <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                    <Selecting AllowRowSelect="True" />

                                </ClientSettings>
                                <HeaderStyle CssClass="RadGridHeader" />
                                <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                <ItemStyle CssClass="RadGridItem" />
                                <MasterTableView AllowSorting="true" Width="100%" BorderWidth="0">
                                    <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                    <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="TransactionDate" FilterControlAltText="Filter TransactionDate column" HeaderText="Transaction Date" SortExpression="TransactionDate" UniqueName="TransactionDate" DataFormatString="{0:dd/MM/yyyy}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="BankName" FilterControlAltText="Filter BankName column" HeaderText="Bank Name" SortExpression="BankName" UniqueName="BankName">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Left" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Deposit" FilterControlAltText="Filter Lend column" HeaderText="Deposit" SortExpression="Deposit" UniqueName="Deposit">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Withdraw" FilterControlAltText="Filter Withdraw column" HeaderText="Withdraw" SortExpression="Withdraw" UniqueName="Withdraw">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Amount" FilterControlAltText="Filter Amount column" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                    </EditFormSettings>
                                </MasterTableView>
                                <FilterMenu EnableEmbeddedSkins="False">
                                </FilterMenu>
                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                </HeaderContextMenu>

                            </telerik:RadGrid>
                        </div>
                    </ContentTemplate>
                </telerik:RadPanelItem>

            </Items>
        </telerik:RadPanelBar>
    </form>

</body>
</html>
