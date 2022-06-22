<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BankTransaction.aspx.cs" Inherits="SobujBanglaARM.Forms.BankTransaction" %>

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
        <h1>Bank Transaction</h1>
        <div>
            <table style="width: 80%">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Transaction ID"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtTransactionId" runat="server" EmptyMessage="Auto Generated Id">
                        </telerik:RadTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Transaction Date"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="dpTransactionDate" runat="server" Culture="en-US">
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
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="lblOperationMode" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="Transaction Type"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmTransactionType" runat="server" AutoPostBack="True" EmptyMessage="Select Transaction Type" OnSelectedIndexChanged="cmTransactionType_SelectedIndexChanged">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="Withdraw" Value="Withdraw" />
                                <telerik:RadComboBoxItem runat="server" Text="Deposit" Value="Deposit" />
                            </Items>
                        </telerik:RadComboBox>
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Amount"></asp:Label>
                    </td>
                    <td style="margin-left: 40px">
                        <telerik:RadNumericTextBox ID="txtAmount" runat="server" AutoPostBack="True">
                        </telerik:RadNumericTextBox>
                    </td>
                    <td style="margin-left: 40px">&nbsp;</td>
                    <td style="margin-left: 40px">&nbsp;</td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Bank Name"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmBankName" runat="server" Width="80%" EnableLoadOnDemand="true" EmptyMessage="Select Bank Name" OnItemsRequested="cmBankName_ItemsRequested" AutoPostBack="True" Filter="Contains" Height="400px" OnSelectedIndexChanged="cmBankName_SelectedIndexChanged">
                            <%--<HeaderTemplate>
                            <table cellpadding="0" cellspacing="0" style="width: 450px">
                                <tr>
                                    <td style="font-family: Arial; font-size: 8px; width: 100px;">Code</td>
                                    <td style="font-family: Arial; font-size: 8px; width: 250px;">Name</td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" style="width: 450px">
                                <tr>
                                    <td style="width: 100px; font-size: 10px;"><%# DataBinder.Eval(Container, "Attributes['SupplierId']")%></td>
                                    <td style="width: 250px; font-size: 10px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                </tr>
                            </table>
                        </ItemTemplate>--%>
                        </telerik:RadComboBox>
                    </td>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="Cheque No"></asp:Label>
                    </td>
                    <td style="margin-left: 40px">
                        <telerik:RadTextBox ID="txtChequeNo" runat="server" LabelWidth="64px" Resize="None" Width="160px">
                        </telerik:RadTextBox>
                    </td>
                    <td style="margin-left: 40px">&nbsp;</td>
                    <td style="margin-left: 40px">&nbsp;</td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="Cheque Date"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="dpCheckDate" runat="server" Culture="en-US">
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
                        <asp:Label ID="Label18" runat="server" Text="Check Details"></asp:Label>
                    </td>
                    <td style="margin-left: 40px">
                        <telerik:RadTextBox ID="txtCheckDetails" runat="server" TextMode="MultiLine" Width="80%">
                        </telerik:RadTextBox>
                    </td>
                    <td style="margin-left: 40px">&nbsp;</td>
                    <td style="margin-left: 40px">&nbsp;</td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Remarks"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtRemarks" runat="server" Width="80%" TextMode="MultiLine">
                        </telerik:RadTextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td style="margin-left: 40px">&nbsp;</td>
                    <td style="margin-left: 40px">&nbsp;</td>
                    <td style="margin-left: 40px">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4"></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <telerik:RadButton ID="btnNew" runat="server" OnClick="btnNew_Click" Text="New">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" SingleClick="True" SingleClickText="Working..">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel">
                        </telerik:RadButton>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="5">
                        <fieldset>
                            <legend>All Transactions</legend>
                            <telerik:RadGrid runat="server" ID="RadGrid1" GroupingSettings-CaseSensitive="false" Width="100%" RenderMode="Auto" AllowMultiRowSelection="True" AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_NeedDataSource"
                                CellSpacing="-1" GridLines="Both" ShowFooter="True" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" OnItemCommand="RadGrid1_ItemCommand"
                                OnItemDataBound="RadGrid1_ItemDataBound" AllowFilteringByColumn="True" AllowPaging="True" OnPageIndexChanged="RadGrid1_PageIndexChanged">
                                <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                    <Selecting AllowRowSelect="True" />
                                    <Scrolling UseStaticHeaders="True" />
                                    <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                                </ClientSettings>
                                <MasterTableView>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="rowid" Display="False" FilterControlAltText="Filter rowid column" HeaderText="rowid" SortExpression="rowid" UniqueName="rowid">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TrackId" Display="False" FilterControlAltText="Filter TrackId column" HeaderText="TrackId" SortExpression="TrackId" UniqueName="TrackId">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TransactionType" FilterControlAltText="Filter PayMode column" HeaderText="Transaction Type" SortExpression="TransactionType" UniqueName="TransactionType">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TransactionDate" FilterControlAltText="Filter PayDate column" HeaderText="Transaction Date" SortExpression="TransactionDate" UniqueName="TransactionDate" DataType="System.DateTime" DataFormatString="{0:dd/MM/yyyy}">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="BankName" FilterControlAltText="Filter BankName column" HeaderText="Bank Name" SortExpression="BankName" UniqueName="BankName">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Amount" FilterControlAltText="Filter PayAmount column" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Deposit" FilterControlAltText="Filter Deposit column" HeaderText="Deposit" SortExpression="Deposit" UniqueName="Deposit">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Withdraw" FilterControlAltText="Filter Withdraw column" HeaderText="Withdraw" SortExpression="Withdraw" UniqueName="Withdraw">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Remarks" FilterControlAltText="Filter PaidAmount column" HeaderText="Remarks" SortExpression="Remarks" UniqueName="Remarks">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ChequeNo" FilterControlAltText="Filter ChequeNo column" HeaderText="Cheque No" SortExpression="ChequeNo" UniqueName="ChequeNo">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ChequeDate" FilterControlAltText="Filter ChequeDate column" HeaderText="Cheque Date" SortExpression="ChequeDate" UniqueName="ChequeDate" DataType="System.DateTime" DataFormatString="{0:dd/MM/yyyy}">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DepositBank" FilterControlAltText="Filter DepositBank column" HeaderText="Deposit Bank" SortExpression="DepositBank" UniqueName="DepositBank" Visible="False">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ChequeDetails" FilterControlAltText="Filter ChequeDetails column" HeaderText="Cheque Details" SortExpression="ChequeDetails" UniqueName="ChequeDetails">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </fieldset>
                    </td>
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
    function pageLoad() {
        var grid = $find("<%= RadGrid1.ClientID %>");
        var columns = grid.get_masterTableView().get_columns();
        for (var i = 0; i < columns.length; i++) {
            columns[i].resizeToFit();
        }
    }
</script>
