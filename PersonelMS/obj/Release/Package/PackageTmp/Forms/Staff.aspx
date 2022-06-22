<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="SobujBanglaARM.Forms.Staff" %>

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
        <h1>Staff Information</h1>
        <%--<asp:UpdatePanel ID="upMain" runat="server">
    <ContentTemplate>--%>
        <div>
            <table class="auto-style1" style="width: 100%">

                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Staff Code"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtStaffCode" runat="server" Width="100px" LabelWidth="40px" Resize="None" EmptyMessage="Auto Generated Id">
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
                        <asp:Label ID="Label68" runat="server" Text="District"></asp:Label>
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
                        <asp:Label ID="Label82" runat="server" Text="Upazila"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmUpazila" runat="server" AutoPostBack="True" DropDownAutoWidth="Enabled" EmptyMessage="....Select...." EnableLoadOnDemand="true" Filter="Contains" OnSelectedIndexChanged="cmUpazila_SelectedIndexChanged" Width="200px">
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
                        <asp:Label ID="Label83" runat="server" Text="Salary"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="txtSalary" runat="server" Width="200px">
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label81" runat="server" Text="Village"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmVillage" runat="server" AutoPostBack="True" DropDownAutoWidth="Enabled" EmptyMessage="....Select...." EnableLoadOnDemand="true" Filter="Contains" Width="200px">
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">
                        <asp:Label ID="Label60" runat="server" Text="Address"></asp:Label>
                    </td>
                    <td class="auto-style1">
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
        <telerik:RadGrid ID="RadGrid1" GroupingSettings-CaseSensitive="false" runat="server" AutoGenerateColumns="False" Width="99%" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" AllowFilteringByColumn="True" OnNeedDataSource="RadGrid1_NeedDataSource" AllowPaging="True">
            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

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
                    <telerik:GridBoundColumn DataField="StaffId" FilterControlAltText="Filter CustId column" HeaderText="Staff Id" SortExpression="StaffId" UniqueName="StaffId">
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
                    <telerik:GridBoundColumn DataField="Phone" FilterControlAltText="Filter Phone column" HeaderText="Phone" SortExpression="Phone" UniqueName="Phone" Display="False">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Address" Display="False" FilterControlAltText="Filter Address column" HeaderText="Address" SortExpression="Address" UniqueName="Address">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Remarks" Display="False" FilterControlAltText="Filter Remarks column" HeaderText="Remarks" SortExpression="Remarks" UniqueName="Remarks">
                        <ColumnValidationSettings>
                            <ModelErrorMessage Text="" />
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <%--    </ContentTemplate>
</asp:UpdatePanel>--%>
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
