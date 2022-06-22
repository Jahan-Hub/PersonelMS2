<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SobujBanglaARM.Forms.Dashboard" %>

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
        <div>
            <center>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 33%" colspan="2">
                            <telerik:RadGrid ID="rgOutFlow" MasterTableView-Caption="Out Flow Transaction" ForeColor="Red" runat="server" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both" Visible="False">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                                <MasterTableView>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Purchase" FilterControlAltText="Filter Purchase column" HeaderText="Purchase" SortExpression="Purchase" UniqueName="Purchase">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Payment" FilterControlAltText="Filter Payment column" HeaderText="Payment" SortExpression="Payment" UniqueName="Payment">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Deposit" FilterControlAltText="Filter Deposit column" HeaderText="Bank Deposit" SortExpression="Deposit" UniqueName="Deposit">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Lend" FilterControlAltText="Filter Lend column" HeaderText="Lend" SortExpression="Lend" UniqueName="Lend">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Expense" FilterControlAltText="Filter Expense column" HeaderText="Expense" SortExpression="Expense" UniqueName="Expense">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>

                        </td>
                        <td style="width: 33%"></td>
                        <td style="width: 33%; position: initial;" rowspan="3">
                            <telerik:RadGrid ID="rgCount" MasterTableView-Caption="Total Summary" ForeColor="Red" runat="server" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both">
                                <MasterTableView>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="TotalCustomer" FilterControlAltText="Filter TotalCustomer column" HeaderText="Customer" SortExpression="TotalCustomer" UniqueName="TotalCustomer">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TotalSupplier" FilterControlAltText="Filter TotalSupplier column" HeaderText="Supplier" SortExpression="TotalSupplier" UniqueName="TotalSupplier">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TotalItems" FilterControlAltText="Filter TotalItems column" HeaderText="Items" SortExpression="TotalItems" UniqueName="TotalItems">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TotalCostCenter" FilterControlAltText="Filter TotalCostCenter column" HeaderText="Cost Center" SortExpression="TotalCostCenter" UniqueName="TotalCostCenter">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TotalCostElement" FilterControlAltText="Filter TotalCostElement column" HeaderText="Cost Element" SortExpression="TotalCostElement" UniqueName="TotalCostElement">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <br />
                            <telerik:RadGrid ID="rgTotalSummary" MasterTableView-Caption="Others Summary" ForeColor="Red" runat="server" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                                <MasterTableView Caption="Others Summary">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Village" FilterControlAltText="Filter TotalDistricts column" HeaderText="Village" SortExpression="Village" UniqueName="Village">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Upazila" FilterControlAltText="Filter TotalVenues column" HeaderText="Upazila" SortExpression="Upazila" UniqueName="Upazila">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Category" FilterControlAltText="Filter TotalClubs column" HeaderText="Category" SortExpression="Category" UniqueName="Category">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Packing" FilterControlAltText="Filter TotalVillages column" HeaderText="Packing" SortExpression="Packing" UniqueName="Packing">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ItemSize" FilterControlAltText="Filter ItemSize column" HeaderText="Item Size" SortExpression="ItemSize" UniqueName="ItemSize">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <%--                                                     <telerik:GridBoundColumn DataField="Occupation" FilterControlAltText="Filter Occupation column" HeaderText="Occupation" SortExpression="Occupation" UniqueName="Occupation" Visible="False">
                                                         <ColumnValidationSettings>
                                                             <ModelErrorMessage Text="" />
                                                         </ColumnValidationSettings>
                                                     </telerik:GridBoundColumn>--%>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <br />

                            <telerik:RadGrid Visible="false" Enabled="false" ID="rgNotification" MasterTableView-Caption="Notification" ForeColor="Red" runat="server" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both">
                                <MasterTableView Caption="Notification">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Date" FilterControlAltText="Filter TotalThanas column" HeaderText="Date" SortExpression="Date" UniqueName="Date" DataFormatString="{0:dd/MM/yyyy}">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Subject" FilterControlAltText="Filter TotalVenues column" HeaderText="Subject" SortExpression="Subject" UniqueName="Subject">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Description" FilterControlAltText="Filter TotalClubs column" HeaderText="Description" SortExpression="Description" UniqueName="Description">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 33%" colspan="2">

                            <telerik:RadGrid ID="rgInFlow" MasterTableView-Caption="In Flow Transaction" ForeColor="Red" runat="server" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both" Visible="False">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                                <MasterTableView>
                                    <Columns>

                                        <telerik:GridBoundColumn DataField="Sales" FilterControlAltText="Filter Sales column" HeaderText="Sales" SortExpression="Sales" UniqueName="Sales">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="MoneyReceived" FilterControlAltText="Filter MoneyReceived column" HeaderText="Money Received" SortExpression="MoneyReceived" UniqueName="MoneyReceived">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Withdraw" FilterControlAltText="Filter Withdraw column" HeaderText="Bank Withdraw" SortExpression="Withdraw" UniqueName="Withdraw">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Borrow" FilterControlAltText="Filter Borrow column" HeaderText="Borrow" SortExpression="Borrow" UniqueName="Borrow">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Income" FilterControlAltText="Filter Income column" HeaderText="Income" SortExpression="Income" UniqueName="Income">
                                        </telerik:GridBoundColumn>

                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>

                        </td>
                        <td style="width: 33%">
                            <div>
                                <%--                                                     <telerik:GridBoundColumn DataField="Occupation" FilterControlAltText="Filter Occupation column" HeaderText="Occupation" SortExpression="Occupation" UniqueName="Occupation" Visible="False">
                                                         <ColumnValidationSettings>
                                                             <ModelErrorMessage Text="" />
                                                         </ColumnValidationSettings>
                                                     </telerik:GridBoundColumn>--%>
                                <telerik:RadGrid ID="rgMaxMinStockQty" Visible="false" MasterTableView-Caption="Items Minimum & Stock Qty" ForeColor="Red" runat="server" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                                    <MasterTableView>
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="ItemCode" FilterControlAltText="Filter TotalDistricts column" HeaderText="Item Code" SortExpression="ItemCode" UniqueName="ItemCode">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ItemName" FilterControlAltText="Filter TotalVenues column" HeaderText="Item Name" SortExpression="ItemName" UniqueName="ItemName">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="StockQty" FilterControlAltText="Filter TotalClubs column" HeaderText="Stock Qty" SortExpression="StockQty" UniqueName="StockQty">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MinQty" FilterControlAltText="Filter TotalVillages column" HeaderText="Reorder Qty" SortExpression="MinQty" UniqueName="MinQty">
                                                <ColumnValidationSettings>
                                                    <ModelErrorMessage Text="" />
                                                </ColumnValidationSettings>
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 16%">
                            <telerik:RadGrid ID="rgIn" ShowFooter="true" MasterTableView-Caption="In Flow Transaction" ForeColor="Red" runat="server" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both" OnItemDataBound="rgIn_ItemDataBound">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                                <MasterTableView>
                                    <Columns>

                                        <telerik:GridBoundColumn DataField="Head" FilterControlAltText="Filter Head column" HeaderText="Head" SortExpression="Head" UniqueName="Head">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Total" FilterControlAltText="Filter Total column" HeaderText="Total" SortExpression="Total" UniqueName="Total">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>

                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </td>
                        <td style="width: 16%">

                            <telerik:RadGrid ID="rgOut" ShowFooter="true" MasterTableView-Caption="Out Flow Transaction" ForeColor="Red" runat="server" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both" OnItemDataBound="rgOut_ItemDataBound">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                                <MasterTableView>
                                    <Columns>

                                        <telerik:GridBoundColumn DataField="Head" FilterControlAltText="Filter Head column" HeaderText="Head" SortExpression="Head" UniqueName="Head">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Total" FilterControlAltText="Filter Total column" HeaderText="Total" SortExpression="Total" UniqueName="Total">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>

                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </td>
                        <td style="width: 33%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 33%; text-align: right" colspan="2">

                            <asp:Label ID="lblBalance" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Maroon"></asp:Label>

                        </td>
                        <td style="width: 33%">&nbsp;</td>
                        <td style="width: 33%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 33%" colspan="2">

                            <telerik:RadTicker Enabled="false" Visible="false" AutoStart="true" ForeColor="Red" Font-Size="Larger" Font-Bold="true" Font-Italic="true" Font-Underline="true" runat="server" ID="Radticker1" Loop="true">
                            </telerik:RadTicker>

                        </td>
                        <td style="width: 33%">&nbsp;</td>
                        <td style="width: 33%">&nbsp;</td>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>
