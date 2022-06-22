<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RatioCalculation.aspx.cs" Inherits="SobujBanglaARM.Forms.RatioCalculation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 26px;
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
        <h1>Lot wise Production</h1>
        <div>
            <table style="width: 99%">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Main Info</legend>
                            <div style="height: 200px; width: 390px; overflow: scroll">
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="Lot Number"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="txtLotNo" runat="server" Width="100px" EmptyMessage="Auto Generated Id">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Label ID="lblOperationMode" runat="server" ForeColor="#CC0000"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="Crashing Date"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="dpCrashingDate" runat="server" Culture="en-US" Width="100px">
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
                                            <asp:Label ID="Label27" runat="server" Text="Purchase Carrying Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtPurchaseCarryingCost" runat="server" AutoPostBack="True" Width="80px" OnTextChanged="txtPurchaseCarryingCost_TextChanged">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label34" runat="server" Text="Crashing Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtCrashingCost" runat="server" AutoPostBack="True" Width="80px" OnTextChanged="txtCrashingCost_TextChanged">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label38" runat="server" Text="Total Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblTotalCost" runat="server" ForeColor="#990033"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>
                    </td>
                    <td>
                        <fieldset>
                            <legend>Add Item</legend>
                            <div style="height: 200px; overflow: scroll">
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="Supplier Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" Text="Item Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label36" runat="server" Text="Total Sack"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label11" runat="server" Text="Qty(Mon)"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label12" runat="server" Text="Unit Price"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label13" runat="server" Text="Amount"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <telerik:RadComboBox ID="cmPartyName" runat="server" EmptyMessage="Select Supplier" Width="100%" EnableLoadOnDemand="true" Filter="Contains" Height="500px" DropDownAutoWidth="Enabled" OnItemsRequested="cmPartyName_ItemsRequested" AutoPostBack="True" OnSelectedIndexChanged="cmPartyName_SelectedIndexChanged">
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="width: 400px">
                                                        <tr>
                                                            <td style="font-family: Arial; font-size: 8px; width: 50px;">Code</td>
                                                            <td style="font-family: Arial; font-size: 8px; width: 250px;">Name</td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="width: 400px">
                                                        <tr>
                                                            <td style="width: 50px; font-size: 10px;"><%# DataBinder.Eval(Container, "Attributes['SupplierId']")%></td>
                                                            <td style="width: 250px; font-size: 10px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadComboBox>
                                        </td>
                                        <td>
                                            <telerik:RadComboBox ID="cmItemName" runat="server" Width="100%" AutoPostBack="True" EmptyMessage="Select Product" OnSelectedIndexChanged="cmItemName_SelectedIndexChanged" EnableLoadOnDemand="true" Filter="Contains" DropDownAutoWidth="Enabled" Height="400px" OnItemsRequested="cmItemName_ItemsRequested">
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="width: 450px">
                                                        <tr>
                                                            <td style="font-family: Arial; font-size: 8px; width: 30px;">Code</td>
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
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtTotalSack" runat="server" AutoPostBack="True" Width="60px">
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
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtUnitPrice" runat="server" AutoPostBack="True" OnTextChanged="txtUnitPrice_TextChanged" Width="60px">
                                            </telerik:RadNumericTextBox>
                                        </td>
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
                                        <td colspan="7">
                                            <telerik:RadGrid ID="RadGrid1" GroupingSettings-CaseSensitive="false" runat="server" AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_NeedDataSource" OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="RadGrid1_ItemDataBound" ShowFooter="True" Width="100%">
                                                <MasterTableView>
                                                    <Columns>
                                                        <telerik:GridBoundColumn DataField="rowid" Display="False" FilterControlAltText="Filter rowid column" HeaderText="rowid" SortExpression="rowid" UniqueName="rowid">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="ItemCode" FilterControlAltText="Filter ItemCode column" HeaderText="Item Code" SortExpression="ItemCode" UniqueName="ItemCode" Display="False">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="ItemName" FilterControlAltText="Filter ItemName column" HeaderText="Item Name" SortExpression="ItemName" UniqueName="ItemName">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="SupplierId" Display="False" FilterControlAltText="Filter SupplierId column" HeaderText="SupplierId" SortExpression="SupplierId" UniqueName="SupplierId">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="SupplierName" FilterControlAltText="Filter SupplierName column" HeaderText="Supplier Name" SortExpression="SupplierName" UniqueName="SupplierName">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="TotalSacks" FilterControlAltText="Filter TotalSacks column" HeaderText="Total Sack" SortExpression="TotalSacks" UniqueName="TotalSacks">
                                                            <ColumnValidationSettings>
                                                                <ModelErrorMessage Text="" />
                                                            </ColumnValidationSettings>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="TotalMon" DataType="System.Decimal" FilterControlAltText="Filter YardQty column" HeaderText="Qty" SortExpression="TotalMon" UniqueName="TotalMon" DataFormatString="{0:F2}">
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
                            <legend>Production & Other Details</legend>
                            <div style="height: 350px">
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label33" runat="server" Text="Empty Sack Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtEmptySackCost" runat="server" AutoPostBack="True" Width="60px" OnTextChanged="txtEmptySackCost_TextChanged" Style="margin-bottom: 0px">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label45" runat="server" Text="Kayel Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtKayelCost" runat="server" AutoPostBack="True" Width="60px" Style="margin-bottom: 0px" OnTextChanged="txtKayelCost_TextChanged">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label ID="Label32" runat="server" Text="Sales Carrying Cost"></asp:Label>
                                        </td>
                                        <td class="auto-style2">
                                            <telerik:RadNumericTextBox ID="txtSalesCarryingCost" runat="server" AutoPostBack="True" Width="60px" OnTextChanged="txtSalesCarryingCost_TextChanged">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                        <td class="auto-style2">
                                            <asp:Label ID="Label46" runat="server" Text="Trolley Cost"></asp:Label>
                                        </td>
                                        <td class="auto-style2">
                                            <telerik:RadNumericTextBox ID="txtTrolleyCost" runat="server" AutoPostBack="True" Width="60px" OnTextChanged="txtTrolleyCost_TextChanged" Style="margin-bottom: 0px">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label47" runat="server" Text="Sack Sewing Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtSackSewingCost" runat="server" AutoPostBack="True" Width="60px" OnTextChanged="txtSackSewingCost_TextChanged" Style="margin-bottom: 0px">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label50" runat="server" Text="Chada Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtChadaCost" runat="server" AutoPostBack="True" Width="60px" OnTextChanged="txtChadaCost_TextChanged" Style="margin-bottom: 0px">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label48" runat="server" Text="Sutli Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtSutliCost" runat="server" AutoPostBack="True" Width="60px" OnTextChanged="txtSutliCost_TextChanged" Style="margin-bottom: 0px">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label49" runat="server" Text="Khajna Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtKhajnaCost" runat="server" AutoPostBack="True" Width="60px" OnTextChanged="txtKhajnaCost_TextChanged" Style="margin-bottom: 0px">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label44" runat="server" Text="Kuli Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtKuliCost" runat="server" AutoPostBack="True" Width="60px" OnTextChanged="txtKuliCost_TextChanged" Style="margin-bottom: 0px">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label35" runat="server" Text="Other Cost"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtOtherCost" runat="server" AutoPostBack="True" Width="60px" OnTextChanged="txtOtherCost_TextChanged">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label39" runat="server" Text="Total Produced Qty"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="txtTotalProducedQty" runat="server" AutoPostBack="True" Width="60px" OnTextChanged="txtTotalProducedQty_TextChanged">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label41" runat="server" Text="Cost/Sack"></asp:Label>
                                        </td>
                                        <td colspan="3">
                                            <telerik:RadNumericTextBox ID="txtCostPerSack" runat="server" AutoPostBack="True" Width="60px" OnTextChanged="txtCostPerSack_TextChanged" Enabled="False">
                                            </telerik:RadNumericTextBox>
                                            <asp:Label ID="Label42" runat="server" Text="Cost/50Kg Rice"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label40" runat="server" Text="Produced/Unit"></asp:Label>
                                        </td>
                                        <td colspan="3">
                                            <telerik:RadNumericTextBox ID="txtProducedPerUnit" runat="server" AutoPostBack="True" Width="60px" OnTextChanged="txtProducedPerUnit_TextChanged" Enabled="False">
                                            </telerik:RadNumericTextBox>
                                            <asp:Label ID="Label43" runat="server" Text="Total Rice/40Kg Paddy"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label37" runat="server" Text="Remarks"></asp:Label>
                                        </td>
                                        <td colspan="3">
                                            <telerik:RadTextBox ID="txtRemarks" runat="server" LabelWidth="64px" Resize="None" Width="100%" TextMode="MultiLine">
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <telerik:RadButton ID="btnUpdateProduction" runat="server" Text="Update Production" OnClick="btnUpdateProduction_Click">
                                            </telerik:RadButton>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>
                    </td>
                    <td>
                        <fieldset>
                            <legend>Details</legend>
                            <div style="height: 350px; overflow: scroll">
                                <telerik:RadGrid ID="rgMain" GroupingSettings-CaseSensitive="false" runat="server" Height="100px" AllowMultiRowSelection="True" AutoGenerateColumns="False" OnSelectedIndexChanged="rgMain_SelectedIndexChanged" Width="100%" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" OnNeedDataSource="rgMain_NeedDataSource">
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
                                            <telerik:GridBoundColumn DataField="RatioId" FilterControlAltText="Filter PurId column" HeaderText="Lot Number" SortExpression="RatioId" UniqueName="RatioId">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CrashingDate" FilterControlAltText="Filter SupplierId column" HeaderText="Crashing Date" SortExpression="CrashingDate" UniqueName="CrashingDate" DataType="System.Decimal" DataFormatString="{0:dd/MM/yyyy}">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PurchaseCarryingCost" FilterControlAltText="Filter CustomerName column" HeaderText="Purchase Carrying Cost" SortExpression="PurchaseCarryingCost" UniqueName="PurchaseCarryingCost" DataType="System.Decimal">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MillCrashingCost" FilterControlAltText="Filter NetAmount column" HeaderText="Mill Crashing Cost" SortExpression="MillCrashingCost" UniqueName="MillCrashingCost" DataType="System.Decimal">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SalesCarryingCost" FilterControlAltText="Filter NetAmount column" HeaderText="Sales Carrying Cost" SortExpression="SalesCarryingCost" UniqueName="SalesCarryingCost" DataFormatString="{0:F2}" DataType="System.Decimal">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="EmptySackCost" DataType="System.Decimal" FilterControlAltText="Filter EmptySackCost column" HeaderText="Empty Sack Cost" SortExpression="EmptySackCost" UniqueName="EmptySackCost">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="OtherCost" DataType="System.Decimal" FilterControlAltText="Filter OtherCost column" HeaderText="Other Cost" SortExpression="OtherCost" UniqueName="OtherCost">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="TotalCost" DataType="System.Decimal" FilterControlAltText="Filter TotalRice column" HeaderText="Total Cost" SortExpression="TotalCost" UniqueName="TotalCost">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Remarks" FilterControlAltText="Filter Remarks column" HeaderText="Remarks" SortExpression="Remarks" UniqueName="Remarks">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
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
                    <td>
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
                        <telerik:RadButton ID="btnPrintPreview" runat="server" Text="Print Preview" OnClick="btnPrintPreview_Click">
                        </telerik:RadButton>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
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
</script>
