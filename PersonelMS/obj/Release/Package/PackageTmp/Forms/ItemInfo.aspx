<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemInfo.aspx.cs" Inherits="SobujBanglaARM.Forms.ItemInfo" %>

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
        <h1>Item Information</h1>
        <div>

            <table class="auto-style1" style="width: 95%">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Category"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmCategory" runat="server" DataSourceID="dsCat" DataTextField="Name" DataValueField="CatId" EmptyMessage="Select Category" AutoPostBack="True" OnSelectedIndexChanged="cmCategory_SelectedIndexChanged">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="dsCat" runat="server" ConnectionString="<%$ ConnectionStrings:sbcon %>" SelectCommand="SELECT [Name], [CatId] FROM [tblCategory]"></asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Label ID="Label28" runat="server" Text="Pack"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmPack" EnableLoadOnDemand="true" runat="server" DataSourceID="dsPack" DataTextField="Name" DataValueField="Id" EmptyMessage="Select Pack">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="dsPack" runat="server" ConnectionString="<%$ ConnectionStrings:sbcon %>" SelectCommand="SELECT * FROM [tblPacking]"></asp:SqlDataSource>
                    </td>
                    <td>

                        <asp:Label ID="Label14" runat="server" Text="Purchase Rate"></asp:Label>

                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="txtPurchaseRate" runat="server">
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Item Code"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="txtItemCode" runat="server" Enabled="False" EmptyMessage="Auto Generated Id">
                            <NegativeStyle Resize="None"></NegativeStyle>

                            <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>

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
                        <asp:Label ID="Label30" runat="server" Text="Item Type"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmItemType" EnableLoadOnDemand="True" runat="server" DataSourceID="dsType" DataTextField="Name" DataValueField="Id" EmptyMessage="Select Item Type">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="dsType" runat="server" ConnectionString="<%$ ConnectionStrings:sbcon %>" SelectCommand="SELECT [Id], [Name] FROM [tblItemType]"></asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Label ID="Label15" runat="server" Text="Sales Rate"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="txtSalesRate" runat="server">
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Item Name"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtItemName" runat="server" Width="250px">
                        </telerik:RadTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="Size"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="cmItemSize" EnableLoadOnDemand="true" runat="server" DataSourceID="dsSize" DataTextField="Name" DataValueField="Id" EmptyMessage="Select Item Size">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="dsSize" runat="server" ConnectionString="<%$ ConnectionStrings:sbcon %>" SelectCommand="SELECT * FROM [tblItemSize]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label22" runat="server" Text="Photo"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="80px" Width="80px" /><asp:FileUpload ID="FileUpload2" runat="server" onchange="previewFile()" OnDataBinding="FileUpload2_DataBinding" ValidateRequestMode="Inherit" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="3">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="3">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <telerik:RadButton ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" SingleClick="True" SingleClickText="Working..">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click">
                        </telerik:RadButton>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
        <div style="width: 100%;">
            <telerik:RadGrid ID="rgMain" runat="server" GroupingSettings-CaseSensitive="false" RenderMode="Auto" AllowMultiRowSelection="True" AutoGenerateColumns="False" OnSelectedIndexChanged="rgMain_SelectedIndexChanged" Width="99%" AllowFilteringByColumn="True" OnNeedDataSource="rgMain_NeedDataSource">
                <GroupingSettings CaseSensitive="False" CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                    <Selecting AllowRowSelect="True" />
                    <Scrolling UseStaticHeaders="True" />
                    <%--<Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />--%>
                </ClientSettings>
                <MasterTableView>
                    <Columns>
                        <telerik:GridBoundColumn DataField="rowid" Display="False" FilterControlAltText="Filter rowid column" HeaderText="rowid" SortExpression="rowid" UniqueName="rowid">
                            <ColumnValidationSettings>
                                <ModelErrorMessage Text="" />
                            </ColumnValidationSettings>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ItemCode" FilterControlAltText="Filter TransID column" HeaderText="Item Code" SortExpression="ItemCode" UniqueName="ItemCode">
                            <ColumnValidationSettings>
                                <ModelErrorMessage Text="" />
                            </ColumnValidationSettings>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ItemName" FilterControlAltText="Filter ItemName column" HeaderText="Item Name" SortExpression="ItemName" UniqueName="ItemName">
                            <ColumnValidationSettings>
                                <ModelErrorMessage Text="" />
                            </ColumnValidationSettings>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ItemCatId" FilterControlAltText="Filter ItemCatId column" HeaderText="ItemCatId" SortExpression="ItemCatId" UniqueName="ItemCatId" Display="False">
                            <ColumnValidationSettings>
                                <ModelErrorMessage Text="" />
                            </ColumnValidationSettings>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CategoryName" FilterControlAltText="Filter ChallanNo column" HeaderText="Item Category" SortExpression="CategoryName" UniqueName="CategoryName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ItemSize" FilterControlAltText="Filter TotalAmount column" HeaderText="Item Size" SortExpression="ItemSize" UniqueName="ItemSize" Display="False">
                            <ColumnValidationSettings>
                                <ModelErrorMessage Text="" />
                            </ColumnValidationSettings>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ItemType" HeaderText="Item Type" SortExpression="ItemType" UniqueName="ItemType" FilterControlAltText="Filter Discount column" Display="False">
                            <ColumnValidationSettings>
                                <ModelErrorMessage Text="" />
                            </ColumnValidationSettings>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PackName" FilterControlAltText="Filter PackName column" HeaderText="Packing" SortExpression="PackName" UniqueName="PackName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PurRate" FilterControlAltText="Filter Paid column" HeaderText="Purchase Rate" SortExpression="PurRate" UniqueName="PurRate" DataFormatString="{0:F2}">
                            <ColumnValidationSettings>
                                <ModelErrorMessage Text="" />
                            </ColumnValidationSettings>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            <FooterStyle HorizontalAlign="Right" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SalesRate" DataFormatString="{0:F2}" DataType="System.Decimal" FilterControlAltText="Filter Due column" HeaderText="Sales Rate" SortExpression="SalesRate" UniqueName="SalesRate">
                            <ColumnValidationSettings>
                                <ModelErrorMessage Text=""></ModelErrorMessage>
                            </ColumnValidationSettings>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            <FooterStyle HorizontalAlign="Right" />
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>

                <FilterMenu RenderMode="Auto"></FilterMenu>

                <HeaderContextMenu RenderMode="Auto"></HeaderContextMenu>
            </telerik:RadGrid>
        </div>
    </form>

</body>
</html>
<script type="text/javascript">
    function previewFile() {
        var preview = document.querySelector('#<%=Image1.ClientID %>');
        var file = document.querySelector('#<%=FileUpload2.ClientID %>').files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
    function OnClientClicked(button, args) {
        if (window.confirm("Are you sure you want to delete?")) {
            button.set_autoPostBack(true);
        }
        else {
            button.set_autoPostBack(false);
        }
    }
    function pageLoad() {
        var grid = $find("<%= rgMain.ClientID %>");
        var columns = grid.get_masterTableView().get_columns();
        for (var i = 0; i < columns.length; i++) {
            columns[i].resizeToFit();
        }
    }
</script>
