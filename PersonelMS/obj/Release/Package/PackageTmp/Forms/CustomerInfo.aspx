<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerInfo.aspx.cs" Inherits="SobujBanglaARM.Forms.CustomerInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
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
        <h1>Customer Information</h1>
            <table class="auto-style1" style="width: 100%">

                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Customer Code"></asp:Label>
                    </td>
                    <div>
                        <table class="auto-style1" style="width: 100%">

                            <tr>
                                <td>
                                    <asp:Label ID="Label101" runat="server" Text="Customer Code"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadTextBox ID="txtCustCode" runat="server" Width="100px" LabelWidth="40px" Resize="None" EmptyMessage="Auto Generated Id">
                                    </telerik:RadTextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Label73" runat="server" Text="Mobile"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadTextBox ID="txtMobile" runat="server" Width="200px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Label80" runat="server" Text="District"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadComboBox ID="cmDistrict" runat="server" AutoPostBack="True" DropDownAutoWidth="Enabled" EmptyMessage="....Select...." EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="cmDistrict_ItemsRequested" OnSelectedIndexChanged="cmDistrict_SelectedIndexChanged" Width="200px">
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadTextBox ID="txtName" runat="server" Width="200px" LabelWidth="80px" Resize="None">
                                    </telerik:RadTextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Label74" runat="server" Text="Phone"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadTextBox ID="txtPhone" runat="server" Width="200px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Label78" runat="server" Text="Upazila"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadComboBox ID="cmUpazila" runat="server" AutoPostBack="True" DropDownAutoWidth="Enabled" EmptyMessage="....Select...." EnableLoadOnDemand="true" Filter="Contains" OnSelectedIndexChanged="cmUpazila_SelectedIndexChanged" Width="200px" OnItemsRequested="cmUpazila_ItemsRequested">
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label72" runat="server" Text="Father Name"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadTextBox ID="txtFatherName" runat="server" Width="200px" LabelWidth="80px" Resize="None">
                                    </telerik:RadTextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Label70" runat="server" Text="Remarks"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadTextBox ID="txtRemarks" runat="server" Width="200px" TextMode="MultiLine">
                                    </telerik:RadTextBox>
                                </td>
                                <td>
                                    <asp:LinkButton ID="btnVillage" runat="server" OnClick="btnVillage_Click">Village</asp:LinkButton>
                                </td>
                                <td>
                                    <telerik:RadComboBox ID="cmVillage" runat="server" AutoPostBack="True" DropDownAutoWidth="Enabled" EmptyMessage="....Select...." EnableLoadOnDemand="true" Filter="Contains" Width="200px" OnItemsRequested="cmVillage_ItemsRequested">
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="ckSpecial" runat="server" Text="Special" />
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Label ID="Label60" runat="server" Text="Address"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadTextBox ID="txtAddress" runat="server" Width="200px" TextMode="MultiLine">
                                    </telerik:RadTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label></td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <telerik:RadButton ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click">
                                    </telerik:RadButton>
                                    <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" SingleClick="True" SingleClickText="Working..">
                                    </telerik:RadButton>
                                    <telerik:RadButton ID="btnDelete" runat="server" OnClientClicked="OnClientClicked" OnClick="btnDelete_Click" Text="Delete">
                                    </telerik:RadButton>
                                    <telerik:RadButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click">
                                    </telerik:RadButton>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                    <telerik:RadGrid ID="RadGrid1" runat="server" PageSize="15" GroupingSettings-CaseSensitive="false" AutoGenerateColumns="False" Width="99%" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" AllowFilteringByColumn="True" OnNeedDataSource="RadGrid1_NeedDataSource" AllowPaging="True">
                        <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                            <Selecting AllowRowSelect="True" />
                            <Scrolling UseStaticHeaders="True" />
                        </ClientSettings>
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="rowid" Display="False" FilterControlAltText="Filter rowid column" HeaderText="Serial No" SortExpression="rowid" UniqueName="rowid">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CustId" FilterControlAltText="Filter CustId column" HeaderText="Customer Id" SortExpression="CustId" UniqueName="CustId">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="Name" UniqueName="Name">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="FatherName" FilterControlAltText="Filter FatherName column" HeaderText="Father Name" SortExpression="FatherName" UniqueName="FatherName">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Mobile" FilterControlAltText="Filter Mobile column" HeaderText="Mobile" SortExpression="Mobile" UniqueName="Mobile">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
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
                                        <telerik:RadComboBox ID="cmCommon" runat="server" AutoPostBack="True" EnableLoadOnDemand="True" ErrorMessage="Select District" Filter="Contains" Height="400px" OnItemsRequested="cmCommon_ItemsRequested" TabIndex="25" Width="250px">
                                        </telerik:RadComboBox>
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
</script>
