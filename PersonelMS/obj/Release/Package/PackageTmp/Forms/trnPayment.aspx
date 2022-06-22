<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trnPayment.aspx.cs" Inherits="SobujBanglaARM.Forms.trnPayment" %>

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
        <h1>Payment</h1>
        <div>
            <table style="width: 100%">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Supplier Name"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmPartyName" runat="server" Width="100%" EnableLoadOnDemand="true" EmptyMessage="Select Supplier" OnItemsRequested="cmPartyName_ItemsRequested" AutoPostBack="True" Filter="Contains" DropDownAutoWidth="Enabled" Height="400px" OnSelectedIndexChanged="cmPartyName_SelectedIndexChanged">
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
                        <asp:Label ID="Label5" runat="server" Text="Pay Date"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="dpPayDate" runat="server" Culture="en-US">
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
                        <asp:Label ID="Label13" runat="server" Text="Pay Mode"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmPayMode" runat="server" AutoPostBack="True" EmptyMessage="Select Pay Mode" OnSelectedIndexChanged="cmPayMode_SelectedIndexChanged">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="Cash" Value="Cash" />
                                <telerik:RadComboBoxItem runat="server" Text="Cheque" Value="Cheque" />
                                <telerik:RadComboBoxItem runat="server" Text="Bank Transfer" Value="Bank Transfer" />
                            </Items>
                        </telerik:RadComboBox>
                    </td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Remarks"></asp:Label>
                    </td>
                    <td style="margin-left: 40px">
                        <telerik:RadTextBox ID="txtRemarks" runat="server" Width="100%">
                        </telerik:RadTextBox>
                    </td>
                    <td style="margin-left: 40px">&nbsp;</td>
                    <td style="margin-left: 40px">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Need to Pay"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="txtNeedToPay" runat="server" Enabled="False">
                        </telerik:RadNumericTextBox>
                    </td>
                    <td colspan="2" rowspan="3">
                        <fieldset>
                            <legend>Cheque Details &amp; Others</legend>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Text="Cheque No"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadTextBox ID="txtChequeNo" runat="server" LabelWidth="64px" Resize="None" Width="160px">
                                        </telerik:RadTextBox>
                                    </td>
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
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label11" runat="server" Text="Bank Name"></asp:Label>
                                    </td>
                                    <td colspan="3">
                                        <telerik:RadTextBox ID="txtBankName" runat="server" Width="100%">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label18" runat="server" Text="Check Details"></asp:Label>
                                    </td>
                                    <td colspan="3">
                                        <telerik:RadTextBox ID="txtCheckDetails" runat="server" TextMode="MultiLine" Width="100%">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                    <td rowspan="3">&nbsp;</td>
                    <td rowspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label16" runat="server" Text="Paid Amount"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="txtPaidAmount" runat="server" AutoPostBack="True" OnTextChanged="txtPaidAmount_TextChanged">
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label17" runat="server" Text="Due"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblDue" runat="server" ForeColor="#CC0066"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:HiddenField ID="hfTrackId" runat="server" />
                        <asp:HiddenField ID="hfPreviousDue" runat="server" />
                    </td>
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
                        <telerik:RadButton ID="btnPrintPreview" runat="server" Text="Print Preview" SingleClick="True" SingleClickText="Working.." OnClick="btnPrintPreview_Click">
                        </telerik:RadButton>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="5">
                        <fieldset>
                            <legend>Received Amount as per</legend>
                            <telerik:RadGrid ID="RadGrid1" Width="100%" GroupingSettings-CaseSensitive="false" runat="server" AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_NeedDataSource" ShowFooter="True" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged">
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
                                        <telerik:GridBoundColumn DataField="TrackId" Display="False" FilterControlAltText="Filter TrackId column" HeaderText="TrackId" SortExpression="TrackId" UniqueName="TrackId">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PayMode" FilterControlAltText="Filter PayMode column" HeaderText="Pay Mode" SortExpression="PayMode" UniqueName="PayMode">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PayDate" FilterControlAltText="Filter PayDate column" HeaderText="Pay Date" SortExpression="PayDate" UniqueName="PayDate" DataType="System.DateTime" DataFormatString="{0:dd/MM/yyyy}">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PayAmount" FilterControlAltText="Filter PayAmount column" HeaderText="Pay Amount" SortExpression="PayAmount" UniqueName="PayAmount">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DueAmount" FilterControlAltText="Filter DueAmount column" HeaderText="Due Amount" SortExpression="DueAmount" UniqueName="DueAmount" Display="False">
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
                                        <telerik:GridBoundColumn DataField="BankName" FilterControlAltText="Filter BankName column" HeaderText="Bank Name" SortExpression="BankName" UniqueName="BankName">
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
</script>