<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LendBorrow.aspx.cs" Inherits="SobujBanglaARM.Forms.LendBorrow" %>

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
        <h1>Lend/Borrow</h1>
        <div>
            <table style="width: 80%">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="ID"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtId" runat="server" EmptyMessage="Auto Generated Id" Enabled="False">
                        </telerik:RadTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Date"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="dpDate" runat="server">
                            <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%">
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
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="lblOperationMode" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="Type"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmType" EnableLoadOnDemand="True" runat="server" AutoPostBack="True" EmptyMessage="Select Type" OnSelectedIndexChanged="cmType_SelectedIndexChanged">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="Lend" Value="Lend" />
                                <telerik:RadComboBoxItem runat="server" Text="Borrow" Value="Borrow" />
                            </Items>
                        </telerik:RadComboBox>
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Amount"></asp:Label>
                    </td>
                    <td style="margin-left: 40px">
                        <telerik:RadNumericTextBox ID="txtAmount" runat="server" AutoPostBack="True">
                            <NegativeStyle Resize="None"></NegativeStyle>

                            <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>

                            <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                            <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                            <FocusedStyle Resize="None"></FocusedStyle>

                            <DisabledStyle Resize="None"></DisabledStyle>

                            <InvalidStyle Resize="None"></InvalidStyle>

                            <HoveredStyle Resize="None"></HoveredStyle>

                            <EnabledStyle Resize="None"></EnabledStyle>
                        </telerik:RadNumericTextBox>
                    </td>
                    <td style="margin-left: 40px">&nbsp;</td>
                    <td style="margin-left: 40px">&nbsp;</td>
                </tr>

                <tr>
                    <td>
                        <asp:LinkButton ID="btnCustomerName" runat="server" OnClick="btnCustomerName_Click">Customer Name</asp:LinkButton>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmCustomerName" runat="server" Width="100%" EmptyMessage="Select Customer" EnableLoadOnDemand="true" Filter="Contains" Height="500px" DropDownAutoWidth="Enabled" OnItemsRequested="cmCustomerName_ItemsRequested" AutoPostBack="True" OnSelectedIndexChanged="cmCustomerName_SelectedIndexChanged">
                            <HeaderTemplate>
                                <table style="width: 300px">
                                    <tr>
                                        <td style="font-family: Arial; font-size: 8px; width: 50px;">Code</td>
                                        <td style="font-family: Arial; font-size: 8px; width: 250px;">Name</td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table style="width: 300px">
                                    <tr>
                                        <td style="width: 50px; font-size: 10px;"><%# DataBinder.Eval(Container, "Attributes['CustId']")%></td>
                                        <td style="width: 250px; font-size: 10px;"><%# DataBinder.Eval(Container, "Text")%></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadComboBox>

                    </td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Remarks"></asp:Label>
                    </td>
                    <td style="margin-left: 40px">
                        <telerik:RadTextBox ID="txtRemarks" runat="server" Width="80%" TextMode="MultiLine">
                        </telerik:RadTextBox>
                    </td>
                    <td style="margin-left: 40px">&nbsp;</td>
                    <td style="margin-left: 40px">&nbsp;</td>
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
                            <telerik:RadGrid runat="server" ID="RadGrid1" GroupingSettings-CaseSensitive="false" Width="80%" RenderMode="Auto" AllowMultiRowSelection="True" AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_NeedDataSource"
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
                                        <telerik:GridBoundColumn DataField="ID" Display="False" FilterControlAltText="Filter TrackId column" HeaderText="ID" SortExpression="ID" UniqueName="ID">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Type" FilterControlAltText="Filter PayMode column" HeaderText="Type" SortExpression="Type" UniqueName="Type">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Date" FilterControlAltText="Filter PayDate column" HeaderText="Date" SortExpression="Date" UniqueName="Date" DataType="System.DateTime" DataFormatString="{0:dd/MM/yyyy}">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Amount" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" FilterControlAltText="Filter PayAmount column" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount" DataFormatString="{0:N0}">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Right"></HeaderStyle>

                                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Lend" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" FilterControlAltText="Filter Deposit column" HeaderText="Lend" SortExpression="Lend" UniqueName="Lend">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Right"></HeaderStyle>

                                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Borrow" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" FilterControlAltText="Filter Withdraw column" HeaderText="Borrow" SortExpression="Borrow" UniqueName="Borrow">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Right"></HeaderStyle>

                                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Remarks" FilterControlAltText="Filter PaidAmount column" HeaderText="Remarks" SortExpression="Remarks" UniqueName="Remarks">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CustId" FilterControlAltText="Filter CustId column" HeaderText="CustId" SortExpression="CustId" UniqueName="CustId" Visible="False">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CustomerName" FilterControlAltText="Filter CustomerName column" HeaderText="Customer" SortExpression="CustomerName" UniqueName="CustomerName">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>

                                <FilterMenu RenderMode="Auto"></FilterMenu>

                                <HeaderContextMenu RenderMode="Auto"></HeaderContextMenu>
                            </telerik:RadGrid>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </div>
        <telerik:RadWindow ID="RadWindow1" runat="server" Height="200px" Width="500px" ShowOnTopWhenMaximized="false" VisibleTitlebar="False">
            <ContentTemplate>
                <table class="auto-style1">
                    <tr>
                        <td>
                            <asp:Label ID="Label106" runat="server" Text="Code"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtCodeMaster" runat="server" Enabled="False">
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblInsertType" runat="server" ForeColor="#CC0000"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label107" runat="server" Text="Name"></asp:Label>
                        </td>
                        <td colspan="2">
                            <telerik:RadTextBox ID="txtNameMaster" Width="250px" runat="server">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblTypeName" runat="server"></asp:Label>
                        </td>
                        <td colspan="2">
                            <telerik:RadTextBox ID="txtMobileNo" runat="server" Width="250px">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblAddress" runat="server">Address</asp:Label>
                        </td>
                        <td colspan="2">
                            <telerik:RadTextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="250px">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <telerik:RadButton ID="btnSaveMaster" runat="server" OnClick="btnSaveMaster_Click" Text="Save">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnCancelMaster" runat="server" OnClick="btnCancelMaster_Click" Text="Cancel">
                            </telerik:RadButton>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblMessagePopup" runat="server" ForeColor="#CC0000"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </telerik:RadWindow>
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
  <%--  function pageLoad() {
        var grid = $find("<%= RadGrid1.ClientID %>");
        var columns = grid.get_masterTableView().get_columns();
        for (var i = 0; i < columns.length; i++) {
            columns[i].resizeToFit();
        }
    }--%>
</script>
