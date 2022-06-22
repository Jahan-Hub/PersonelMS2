<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trnItemSales.aspx.cs" Inherits="SobujBanglaARM.Forms.trnItemSales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
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
        <h1>Item Sales</h1>
        <div>
            <table class="auto-style1" style="width: 99%">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Main Info</legend>
                            <div style="height: 200px; overflow: scroll">
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="Sales ID"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="txtSalesID" runat="server" Width="100px" Enabled="False" EmptyMessage="Auto Generated Id">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td colspan="2">
                                            <asp:Label ID="lblOperationMode" runat="server" ForeColor="#CC0000"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="Customer Name"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadComboBox ID="cmCustomerName" runat="server" Width="100%" EmptyMessage="Select Customer" EnableLoadOnDemand="true" Filter="Contains" Height="500px" DropDownAutoWidth="Enabled" OnItemsRequested="cmCustomerName_ItemsRequested" AutoPostBack="True" OnSelectedIndexChanged="cmCustomerName_SelectedIndexChanged">
                                                <HeaderTemplate>
                                                    <table style="width: 350px">
                                                        <tr>
                                                            <td style="font-family: Arial; font-size: 8px; width: 100px;">Code</td>
                                                            <td style="font-family: Arial; font-size: 8px; width: 250px;">Name</td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table style="width: 350px">
                                                        <tr>
                                                            <td style="width: 100px; font-size: 10px;"><%# DataBinder.Eval(Container, "Attributes['CustId']")%></td>
                                                            <td style="width: 250px; font-size: 10px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadComboBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="Sales Date"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="dpSalesDt" runat="server" Culture="en-US" Width="125px">
                                                <Calendar runat="server" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

                                                <DateInput runat="server" DisplayDateFormat="dd-MM-yyyy" DateFormat="dd-MM-yyyy" LabelWidth="40%">
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
                                            <asp:Label ID="Label8" runat="server" Text="Remarks"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Width="100%" LabelWidth="100px" Resize="None">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label29" runat="server" Text="Ship To" Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadComboBox ID="cmShipTo" runat="server" DropDownAutoWidth="Enabled" EmptyMessage="Select Ship To" EnableLoadOnDemand="True" Filter="Contains" Height="500px" OnItemsRequested="cmShipTo_ItemsRequested" Width="100%" Visible="False">
                                                <HeaderTemplate>
                                                    <table style="width: 350px">
                                                        <tr>
                                                            <td style="font-family: Arial; font-size: 8px; width: 100px;">Code</td>
                                                            <td style="font-family: Arial; font-size: 8px; width: 250px;">Name</td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table style="width: 350px">
                                                        <tr>
                                                            <td style="width: 100px; font-size: 10px;"><%# DataBinder.Eval(Container, "Attributes['CustId']")%></td>
                                                            <td style="width: 250px; font-size: 10px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadComboBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="Reference" Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadComboBox ID="cmReference" runat="server" DropDownAutoWidth="Enabled" EmptyMessage="Select Reference" EnableLoadOnDemand="True" Filter="Contains" Height="500px" OnItemsRequested="cmReference_ItemsRequested" Width="100%" Visible="False">
                                                <HeaderTemplate>
                                                    <table style="width: 350px">
                                                        <tr>
                                                            <td style="font-family: Arial; font-size: 8px; width: 100px;">Code</td>
                                                            <td style="font-family: Arial; font-size: 8px; width: 250px;">Name</td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table style="width: 350px">
                                                        <tr>
                                                            <td style="width: 100px; font-size: 10px;"><%# DataBinder.Eval(Container, "Attributes['CustId']")%></td>
                                                            <td style="width: 250px; font-size: 10px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:HiddenField ID="hfOpBalanceYN" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>

                    </td>
                    <td>
                        <fieldset>
                            <legend>Add Item</legend>
                            <div style="height: 200px; overflow: scroll">
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" Text="Product Name"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="Label32" runat="server" Text="Source"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label12" runat="server" Text="Unit Price"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label11" runat="server" Text="Qty"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="Label13" runat="server" Text="Amount"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <telerik:RadComboBox ID="cmItemName" Filter="Contains" runat="server" Width="100%" AutoPostBack="True" EmptyMessage="Select Product" OnSelectedIndexChanged="cmItemName_SelectedIndexChanged" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" Height="400px" OnItemsRequested="cmItemName_ItemsRequested">
                                                <HeaderTemplate>
                                                    <table style="width: 450px">
                                                        <tr>
                                                            <td style="font-family: Arial; font-size: 8px; width: 30px;">Code</td>
                                                            <td style="font-family: Arial; font-size: 8px; width: 250px;">Name</td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table style="width: 450px">
                                                        <tr>
                                                            <td style="width: 30px; font-size: 10px;"><%# DataBinder.Eval(Container, "Attributes['ItemCode']")%></td>
                                                            <td style="width: 250px; font-size: 10px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadComboBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblPacking" runat="server" ForeColor="#006666"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadComboBox ID="cmCompany" Width="100%" EnableLoadOnDemand="true" EmptyMessage="Select Company" runat="server" OnItemsRequested="cmCompany_ItemsRequested">
                                            </telerik:RadComboBox>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtUnitPrice" runat="server" AutoPostBack="True" OnTextChanged="txtUnitPrice_TextChanged" Width="70px">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtQty" runat="server" Width="50px" AutoPostBack="True" OnTextChanged="txtQty_TextChanged">
                                                <NegativeStyle Resize="None"></NegativeStyle>

                                                <NumberFormat ZeroPattern="n" DecimalDigits="3"></NumberFormat>

                                                <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                                                <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                                                <FocusedStyle Resize="None"></FocusedStyle>

                                                <DisabledStyle Resize="None"></DisabledStyle>

                                                <InvalidStyle Resize="None"></InvalidStyle>

                                                <HoveredStyle Resize="None"></HoveredStyle>

                                                <EnabledStyle Resize="None"></EnabledStyle>
                                            </telerik:RadNumericTextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtAmount" runat="server" Width="80px">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                        <td>
                                            <telerik:RadButton ID="btnAdd" runat="server" Text="Add Item" OnClick="btnAdd_Click" Width="60px">
                                            </telerik:RadButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="8">
                                            <telerik:RadGrid ID="RadGrid1" GroupingSettings-CaseSensitive="false" runat="server" AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_NeedDataSource" OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="RadGrid1_ItemDataBound" ShowFooter="True" Width="100%">
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                                                <MasterTableView>
                                                    <Columns>
                                                        <telerik:GridBoundColumn DataField="rowid" Display="False" FilterControlAltText="Filter rowid column" HeaderText="rowid" SortExpression="rowid" UniqueName="rowid">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="ItemCode" FilterControlAltText="Filter ItemCode column" HeaderText="Item Code" SortExpression="ItemCode" UniqueName="ItemCode">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="ItemName" FilterControlAltText="Filter ItemName column" HeaderText="Item Name" SortExpression="ItemName" UniqueName="ItemName">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="ShortName" FilterControlAltText="Filter ShortName column" HeaderText="Company" SortExpression="ShortName" UniqueName="ShortName">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="Qty" DataType="System.Decimal" FilterControlAltText="Filter YardQty column" HeaderText="Qty" SortExpression="Qty" UniqueName="Qty" DataFormatString="{0:F2}">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <HeaderStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="UnitPrice" DataType="System.Decimal" FilterControlAltText="Filter UnitRate column" HeaderText="Unit Price" SortExpression="UnitPrice" UniqueName="UnitPrice" DataFormatString="{0:F2}">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <HeaderStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="Amount" DataType="System.Decimal" FilterControlAltText="Filter Amount column" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount" DataFormatString="{0:F2}">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <HeaderStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn DataField="Delete" FilterControlAltText="Filter Delete column" HeaderText="Delete" SortExpression="Delete" UniqueName="Delete">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="DeleteTextBox" runat="server" Text='<%# Bind("Delete") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="rbtDeleteGrid" runat="server" ImageUrl="~/Images/Delete.png" OnClick="rbtDeleteGrid_Click" TabIndex="5" ToolTip="Delete" CommandName="GridDelete" />
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fieldset>
                            <legend>Pay Details</legend>
                            <div style="height: 250px; overflow: scroll">
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <table class="auto-style1">
                                                <tr>
                                                    <td>
                                                        <table class="auto-style1">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label27" runat="server" Text="Packaging Cost"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <telerik:RadNumericTextBox ID="txtPacketCost" runat="server" AutoPostBack="True" Width="80px" OnTextChanged="txtPacketCost_TextChanged">
                                                                    </telerik:RadNumericTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label18" runat="server" Text="Labour Cost"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <telerik:RadNumericTextBox ID="txtLabourCost" runat="server" AutoPostBack="True" Width="80px" OnTextChanged="txtLabourCost_TextChanged">
                                                                    </telerik:RadNumericTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label31" runat="server" Text="Agent Cost"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <telerik:RadNumericTextBox ID="txtAgentCost" runat="server" AutoPostBack="True" Width="80px" OnTextChanged="txtLabourCost_TextChanged">
                                                                    </telerik:RadNumericTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label26" runat="server" Text="Other Cost"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <telerik:RadNumericTextBox ID="txtOtherCost" runat="server" AutoPostBack="True" Width="80px" OnTextChanged="txtOtherCost_TextChanged">
                                                                    </telerik:RadNumericTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label15" runat="server" Text="Discount"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <telerik:RadNumericTextBox ID="txtDiscount" runat="server" AutoPostBack="True" Width="80px" OnTextChanged="txtDiscount_TextChanged">
                                                                    </telerik:RadNumericTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label24" runat="server" Text="Net Amount"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblNetAmount" runat="server" ForeColor="#006666" Text="0.00" Font-Bold="True"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label30" runat="server" Text="Previous Due"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPreviousDue" runat="server" ForeColor="#0000CC" Text="0.00" Font-Bold="True"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label16" runat="server" Text="Paid Amount"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <telerik:RadNumericTextBox ID="txtPaidAmount" runat="server" AutoPostBack="True" Width="80px" OnTextChanged="txtPaidAmount_TextChanged">
                                                                    </telerik:RadNumericTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label17" runat="server" Text="Due Amount"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblDueAmount" runat="server" ForeColor="#CC0000" Text="0.00"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td>
                                                        <fieldset>
                                                            <legend>Cheque Details & Others</legend>
                                                            <table class="auto-style1">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label23" runat="server" Text="Pay Mode"></asp:Label>
                                                                    </td>
                                                                    <td class="auto-style3">
                                                                        <telerik:RadComboBox ID="cmPayMode" runat="server" AutoPostBack="True" EmptyMessage="Select Mode" OnSelectedIndexChanged="cmPayMode_SelectedIndexChanged" Width="100%">
                                                                            <Items>
                                                                                <telerik:RadComboBoxItem runat="server" Text="Cash" Value="Cash" />
                                                                                <telerik:RadComboBoxItem runat="server" Text="Cheque" Value="Cheque" />
                                                                                <telerik:RadComboBoxItem runat="server" Text="Bank Transfer" Value="Bank Transfer" />
                                                                            </Items>
                                                                        </telerik:RadComboBox>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label20" runat="server" Text="Cheque No"></asp:Label>
                                                                    </td>
                                                                    <td class="auto-style3">
                                                                        <telerik:RadTextBox ID="txtChequeNo" runat="server" LabelWidth="64px" Resize="None" Width="100px">
                                                                        </telerik:RadTextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label21" runat="server" Text="Cheque Date"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <telerik:RadDatePicker ID="dpCheckDate" runat="server" Culture="en-US" Width="100px">
                                                                            <Calendar runat="server" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

                                                                            <DateInput runat="server" DisplayDateFormat="dd-MM-yyyy" DateFormat="dd-MM-yyyy" LabelWidth="40%">
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
                                                                        <asp:Label ID="Label25" runat="server" Text="Bank Name"></asp:Label>
                                                                    </td>
                                                                    <td class="auto-style3" colspan="3">
                                                                        <telerik:RadTextBox ID="txtBankName" runat="server" Width="100%">
                                                                        </telerik:RadTextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label28" runat="server" Text="Cheque Details"></asp:Label>
                                                                    </td>
                                                                    <td class="auto-style3" colspan="3">
                                                                        <telerik:RadTextBox ID="txtChequeDetails" runat="server" Width="100%" TextMode="MultiLine">
                                                                        </telerik:RadTextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </fieldset>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>

                    </td>
                    <td>
                        <fieldset>
                            <legend>Sales Details</legend>
                            <div style="height: 250px; overflow: scroll">
                                <telerik:RadGrid ID="rgMain" runat="server" GroupingSettings-CaseSensitive="false" AllowMultiRowSelection="True" AutoGenerateColumns="False" OnSelectedIndexChanged="rgMain_SelectedIndexChanged" Width="100%" OnNeedDataSource="rgMain_NeedDataSource" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
                                    <GroupingSettings CaseSensitive="False" CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                                    <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling UseStaticHeaders="True" />
                                    </ClientSettings>
                                    <MasterTableView>
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="rowid" Display="False" FilterControlAltText="Filter rowid column" HeaderText="rowid" SortExpression="rowid" UniqueName="rowid">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SalesId" AutoPostBackOnFilter="true" FilterControlAltText="Filter VoucharNo column" HeaderText="Sales Id" SortExpression="SalesId" UniqueName="SalesId">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SalesDate" DataFormatString="{0:dd/MM/yyyy}" FilterControlAltText="Filter SalesDate column" HeaderText="Sales Date" SortExpression="SalesDate" UniqueName="SalesDate">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CustId" FilterControlAltText="Filter CustId column" HeaderText="Customer Id" SortExpression="CustId" UniqueName="CustId" Display="False">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CustomerName" AutoPostBackOnFilter="true" FilterControlAltText="Filter CustomerName column" HeaderText="Customer Name" SortExpression="CustomerName" UniqueName="CustomerName">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="NetAmount" AutoPostBackOnFilter="true" DataFormatString="{0:F2}" FilterControlAltText="Filter NetAmount column" HeaderText="Net Amount" SortExpression="NetAmount" UniqueName="NetAmount">
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Balance" AutoPostBackOnFilter="true" HeaderText="Balance" SortExpression="Balance" UniqueName="Balance" FilterControlAltText="Filter Balance column">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </div>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <telerik:RadButton ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" SingleClick="True" SingleClickText="Working..">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" Visible="False">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" Visible="False">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnDelete" runat="server" Text="Delete" OnClientClicked="OnClientClicked" OnClick="btnDelete_Click">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnPrintPreview" runat="server" Text="Print Preview" OnClick="btnPrintPreview_Click" SingleClick="True" SingleClickText="Working..">
                        </telerik:RadButton>
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Print Challan" />
                    </td>
                </tr>
            </table>
        </div>
        <%# DataBinder.Eval(Container, "Attributes['CustId']")%>
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
</script>
