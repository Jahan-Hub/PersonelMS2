<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MasterData.aspx.cs" Inherits="SobujBanglaARM.Forms.MasterData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            height: 23px;
        }

        .auto-style1 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI"
                    Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI"
                    Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI"
                    Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <div>
            <h2>Master Data Information</h2>

            <telerik:RadPanelBar ID="RadPanelBar1" runat="server" Width="90%" Height="100%">
                <Items>
                    <%--  <telerik:RadPanelItem runat="server" Text="Expense Head" Visible="False">
                <ContentTemplate>
                    <table class="style1">
                        <tr>
                            <td><table class="style1" style="width:100%">
                        <tr>
                            <td>
                                <asp:Literal ID="Literals1" runat="server" Text="Head Code"></asp:Literal>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtHeadCode" Runat="server"  Width="80px">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblHeadMode" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Literal ID="Literalf2" runat="server" Text="Head Name"></asp:Literal>
                            </td>
                            <td colspan="2">
                                <telerik:RadTextBox ID="txtHeadName" Runat="server" Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <telerik:RadButton ID="btnHeadNew" runat="server" Text="New" OnClick="btnHeadNew_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnHeadSave" runat="server" Text="Save" OnClick="btnHeadSave_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnHeadFind" runat="server"  Text="Find" OnClick="btnHeadFind_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnHeadEdit" runat="server" Text="Edit" OnClick="btnHeadEdit_Click">
                                </telerik:RadButton>
                                <telerik:RadButton ID="btnHeadCancel" runat="server" Text="Cancel" OnClick="btnHeadCancel_Click">
                                </telerik:RadButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                           
                                <asp:Label ID="lblHead" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table></td>
                            <td>
                                <fieldset>
                                    <legend>All Expense Head</legend>
                                    <div style="overflow:scroll;height:200px;width:auto">
                                    <telerik:RadGrid ID="rgExpense" Height="200px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" OnNeedDataSource="rgExpenseHead_NeedDataSource" PageSize="5" OnSelectedIndexChanged="rgExpenseHead_SelectedIndexChanged">
                                            <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                            <Selecting AllowRowSelect="True" />
                                              
                                            </ClientSettings>
                                            <HeaderStyle CssClass="RadGridHeader" />
                                            <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                            <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                            <ItemStyle CssClass="RadGridItem" />
                                            <MasterTableView Width="100%" BorderWidth="0">
                                                <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </RowIndicatorColumn>
                                                <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter PI column" HeaderText="Head Code" SortExpression="Id" UniqueName="Id">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                         <ItemStyle HorizontalAlign="Left" />
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Head Name" SortExpression="Name" UniqueName="Name">
                                                        <ColumnValidationSettings>
                                                            <ModelErrorMessage Text="" />
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                    </EditColumn>
                                                </EditFormSettings>
                                                <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                            </MasterTableView>
                                                <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                <FilterMenu EnableEmbeddedSkins="False">
                                                </FilterMenu>
                                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                                </HeaderContextMenu>
                                                 
                                        </telerik:RadGrid>
                                        </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </telerik:RadPanelItem>--%>
                    <telerik:RadPanelItem runat="server" Text="Upazila">
                        <ContentTemplate>
                            <table class="style1" style="height: 500px;">
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <fieldset>
                                            <legend>All Upazila</legend>
                                            <div style="overflow: scroll; height: 500px; width: auto">
                                                <telerik:RadGrid ID="rgUpazila" runat="server" AllowFilteringByColumn="True" AllowMultiRowSelection="True" AllowPaging="True" AutoGenerateColumns="False" GridLines="Both" Height="500px" OnNeedDataSource="rgUpazila_NeedDataSource" PageSize="15" Width="100%">
                                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                                    <ClientSettings EnablePostBackOnRowClick="True" Selecting-AllowRowSelect="true">
                                                        <Selecting AllowRowSelect="True" />
                                                    </ClientSettings>
                                                    <HeaderStyle CssClass="RadGridHeader" />
                                                    <CommandItemStyle BackColor="#F8FFFF" CssClass="commanditem1" />
                                                    <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                                    <ItemStyle CssClass="RadGridItem" />
                                                    <MasterTableView BorderWidth="0" Width="100%">
                                                        <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                        <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </RowIndicatorColumn>
                                                        <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </ExpandCollapseColumn>
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter Id column" HeaderText="Upazila Id" SortExpression="Id" UniqueName="Id">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Upazila" SortExpression="Name" UniqueName="Name">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="NameBangla" FilterControlAltText="Filter NameBangla column" HeaderText="Bangla Name" SortExpression="NameBangla" UniqueName="NameBangla">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="DistId" Display="False" FilterControlAltText="Filter DistId column" HeaderText="Dist Id" SortExpression="DistId" UniqueName="DistId">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                        <EditFormSettings>
                                                            <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                            </EditColumn>
                                                        </EditFormSettings>
                                                        <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    </MasterTableView>
                                                    <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    <FilterMenu EnableEmbeddedSkins="False">
                                                    </FilterMenu>
                                                    <HeaderContextMenu EnableEmbeddedSkins="False">
                                                    </HeaderContextMenu>
                                                </telerik:RadGrid>
                                            </div>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="Village">
                        <ContentTemplate>

                            <table class="style1" style="height: 500px">
                                <tr>
                                    <td>
                                        <table class="style1" style="width: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal3q" runat="server" Text="Village Code"></asp:Literal>
                                                </td>
                                                <td>
                                                    <telerik:RadTextBox ID="txtVillageCode" EmptyMessage="Auto Generated Id" runat="server" Width="120px">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblVillageMode" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal4" runat="server" Text="Village Name"></asp:Literal>
                                                </td>
                                                <td colspan="2">
                                                    <telerik:RadTextBox ID="txtVillageName" runat="server" Width="200px">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal56" runat="server" Text="Bangla Name"></asp:Literal>
                                                </td>
                                                <td colspan="2">
                                                    <telerik:RadTextBox ID="txtVillageNameBangla" runat="server" Width="200px">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal55" runat="server" Text="Upazila Name"></asp:Literal>
                                                </td>
                                                <td colspan="2">
                                                    <telerik:RadComboBox ID="cmUpazila" runat="server" DataTextField="Name" DataValueField="Id" DropDownAutoWidth="Enabled" EmptyMessage="....Select...." Filter="Contains" Width="200px" DataSourceID="dsUpazila">
                                                    </telerik:RadComboBox>
                                                    <asp:SqlDataSource ID="dsUpazila" runat="server" ConnectionString="<%$ ConnectionStrings:sbcon %>" SelectCommand="SELECT * FROM [M_tblUpazila]"></asp:SqlDataSource>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td colspan="2">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <telerik:RadButton ID="btnVillageNew" runat="server" Text="New" OnClick="btnVillageNew_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnVillageSave" runat="server" Text="Save" OnClick="btnVillageSave_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnVillageCancel" runat="server" Text="Cancel" OnClick="btnVillageCancel_Click">
                                                    </telerik:RadButton>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">

                                                    <asp:Label ID="lblVillage" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <fieldset>
                                            <legend>All Villages</legend>
                                            <div style="overflow: scroll; height: 500px; width: auto">
                                                <telerik:RadGrid ID="rgVillage" Height="500px" Width="100%" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" PageSize="15" OnNeedDataSource="rgVillage_NeedDataSource" OnSelectedIndexChanged="rgVillage_SelectedIndexChanged">
                                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false" />
                                                    <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                                        <Selecting AllowRowSelect="True" />

                                                    </ClientSettings>
                                                    <HeaderStyle CssClass="RadGridHeader" />
                                                    <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                                    <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                                    <ItemStyle CssClass="RadGridItem" />
                                                    <MasterTableView Width="100%" BorderWidth="0">
                                                        <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                        <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </RowIndicatorColumn>
                                                        <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </ExpandCollapseColumn>
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter Id column" HeaderText="Village ID" SortExpression="Id" UniqueName="Id">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Village Name" SortExpression="Name" UniqueName="Name">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="NameBangla" FilterControlAltText="Filter NameBangla column" SortExpression="NameBangla" UniqueName="NameBangla" HeaderText="Bangla Name">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="UpaId" FilterControlAltText="Filter UpaId column" HeaderText="UpaId" SortExpression="UpaId" UniqueName="UpaId" Display="False">
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                        <EditFormSettings>
                                                            <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                            </EditColumn>
                                                        </EditFormSettings>
                                                        <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    </MasterTableView>
                                                    <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    <FilterMenu EnableEmbeddedSkins="False">
                                                    </FilterMenu>
                                                    <HeaderContextMenu EnableEmbeddedSkins="False">
                                                    </HeaderContextMenu>

                                                </telerik:RadGrid>
                                            </div>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="Bank">
                        <ContentTemplate>
                            <table class="style1" style="height: 500px">
                                <tr>
                                    <td>
                                        <table class="style1" style="width: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label115" runat="server" Text="Bank Code"></asp:Label>
                                                </td>
                                                <td>
                                                    <telerik:RadTextBox ID="txtBankCode" EmptyMessage="Auto Generated Id" Width="120px" runat="server">
                                                    </telerik:RadTextBox>
                                                    <asp:Label ID="lblBankMode" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label114" runat="server" Text="Bank Name"></asp:Label>
                                                </td>
                                                <td>
                                                    <telerik:RadTextBox ID="txtBankName" runat="server" Width="300px">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <telerik:RadButton ID="btnBankNew" runat="server" Text="New" OnClick="btnBankNew_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnBankSave" runat="server" Text="Save" OnClick="btnBankSave_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnBankFind" runat="server" Text="Find" OnClick="btnBankFind_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnBankEdit" runat="server" Text="Edit" OnClick="btnBankEdit_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnBankDelete" runat="server" OnClick="btnBankDelete_Click" Text="Delete">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnBankCancel" runat="server" Text="Cancel" OnClick="btnBankCancel_Click">
                                                    </telerik:RadButton>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Label ID="lblBank" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <fieldset>
                                            <legend>All Banks</legend>
                                            <div style="overflow: scroll; height: 500px; width: auto">
                                                <telerik:RadGrid ID="rgBank" Height="500px" Width="100%" GroupingSettings-CaseSensitive="false" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" PageSize="15" OnNeedDataSource="rgBank_NeedDataSource" OnSelectedIndexChanged="rgBank_SelectedIndexChanged">
                                                    <ClientSettings EnablePostBackOnRowClick="True" Selecting-AllowRowSelect="true">
                                                        <Selecting AllowRowSelect="True" />
                                                    </ClientSettings>
                                                    <HeaderStyle CssClass="RadGridHeader" />
                                                    <CommandItemStyle BackColor="#F8FFFF" CssClass="commanditem1" />
                                                    <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                                    <ItemStyle CssClass="RadGridItem" />
                                                    <MasterTableView BorderWidth="0" Width="100%">
                                                        <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                        <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </RowIndicatorColumn>
                                                        <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </ExpandCollapseColumn>
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="BankCode" FilterControlAltText="Filter PI column" HeaderText="Bank Code" SortExpression="BankCode" UniqueName="BankCode">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Bank Name" SortExpression="Name" UniqueName="Name">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                        <EditFormSettings>
                                                            <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                            </EditColumn>
                                                        </EditFormSettings>
                                                        <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    </MasterTableView>
                                                    <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    <FilterMenu EnableEmbeddedSkins="False">
                                                    </FilterMenu>
                                                    <HeaderContextMenu EnableEmbeddedSkins="False">
                                                    </HeaderContextMenu>
                                                </telerik:RadGrid>
                                            </div>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="Category">
                        <ContentTemplate>
                            <table class="style1" style="height: 500px">
                                <tr>
                                    <td>
                                        <table class="style1" style="width: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label15" runat="server" Text="Category Code"></asp:Label>
                                                </td>
                                                <td>
                                                    <telerik:RadTextBox ID="txtCategoryCode" EmptyMessage="Auto Generated Id" Width="120px" runat="server">
                                                    </telerik:RadTextBox>
                                                    <asp:Label ID="lblCategoryMode" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label14" runat="server" Text="Category Name"></asp:Label>
                                                </td>
                                                <td>
                                                    <telerik:RadTextBox ID="txtCategoryName" EmptyMessage="ex-Chal,Dhan,Tus etc" runat="server">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <telerik:RadButton ID="btnCategoryNew" runat="server" Text="New" OnClick="btnCategoryNew_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCategorySave" runat="server" Text="Save" OnClick="btnCategorySave_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCategoryFind" runat="server" Text="Find" OnClick="btnCategoryFind_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCategoryEdit" runat="server" Text="Edit" OnClick="btnCategoryEdit_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCategoryDelete" runat="server" OnClick="btnCategoryDelete_Click" Text="Delete">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCategoryCancel" runat="server" Text="Cancel" OnClick="btnCategoryCancel_Click">
                                                    </telerik:RadButton>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Label ID="lblCategory" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <fieldset>
                                            <legend>All Categories</legend>
                                            <div style="overflow: scroll; height: 500px; width: auto">
                                                <telerik:RadGrid ID="rgCategory" Height="500px" Width="100%" GroupingSettings-CaseSensitive="false" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" PageSize="15" OnNeedDataSource="rgCategory_NeedDataSource" OnSelectedIndexChanged="rgCategory_SelectedIndexChanged">
                                                    <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                                        <Selecting AllowRowSelect="True" />

                                                    </ClientSettings>
                                                    <HeaderStyle CssClass="RadGridHeader" />
                                                    <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                                    <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                                    <ItemStyle CssClass="RadGridItem" />
                                                    <MasterTableView Width="100%" BorderWidth="0">
                                                        <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                        <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </RowIndicatorColumn>
                                                        <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </ExpandCollapseColumn>
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="CatId" FilterControlAltText="Filter PI column" HeaderText="Category Id" SortExpression="CatId" UniqueName="CatId">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Category Name" SortExpression="Name" UniqueName="Name">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                        <EditFormSettings>
                                                            <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                            </EditColumn>
                                                        </EditFormSettings>
                                                        <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    </MasterTableView>
                                                    <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    <FilterMenu EnableEmbeddedSkins="False">
                                                    </FilterMenu>
                                                    <HeaderContextMenu EnableEmbeddedSkins="False">
                                                    </HeaderContextMenu>

                                                </telerik:RadGrid>
                                            </div>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>

                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="Item" Visible="False">
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="User" Visible="False">
                        <ContentTemplate>
                            <table class="style1" style="width: 100%">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label11" runat="server" Text="User Code"></asp:Label></td>
                                    <td>
                                        <telerik:RadTextBox ID="txtUserCode" EmptyMessage="Auto Generated Id" runat="server" Width="120px">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblUserMode" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Text="User Name"></asp:Label></td>
                                    <td colspan="2">
                                        <telerik:RadTextBox ID="txtUserName" runat="server">
                                        </telerik:RadTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <telerik:RadButton ID="btnUserNew" runat="server" Text="New">
                                        </telerik:RadButton>
                                        <telerik:RadButton ID="btnUserSave" runat="server" Text="Save">
                                        </telerik:RadButton>
                                        <telerik:RadButton ID="btnUserFind" runat="server" Text="Find">
                                        </telerik:RadButton>
                                        <telerik:RadButton ID="btnUserEdit" runat="server" Text="Edit">
                                        </telerik:RadButton>
                                        <telerik:RadButton ID="btnUserCancel" runat="server" Text="Cancel">
                                        </telerik:RadButton>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:Label ID="lblUser" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="Item Size">
                        <ContentTemplate>
                            <table class="style1" style="height: 500px">
                                <tr>
                                    <td>
                                        <table class="style1" style="width: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal3" runat="server" Text="Item Size Code"></asp:Literal>
                                                </td>
                                                <td>
                                                    <telerik:RadTextBox ID="txtItemSizeCode" EmptyMessage="Auto Generated Id" runat="server" Width="120px">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblItemSizeMode" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal5" runat="server" Text="Item Size Name"></asp:Literal>
                                                </td>
                                                <td colspan="2">
                                                    <telerik:RadTextBox ID="txtItemSizeName" EmptyMessage="ex-Mota" runat="server" Width="250px">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td colspan="2">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <telerik:RadButton ID="btnItemSizeNew" runat="server" Text="New" OnClick="btnItemSizeNew_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnItemSizeSave" runat="server" Text="Save" OnClick="btnItemSizeSave_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnItemSizeFind" runat="server" Text="Find" OnClick="btnItemSizeFind_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnItemSizeEdit" runat="server" Text="Edit" OnClick="btnItemSizeEdit_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnItemSizeDelete" runat="server" OnClick="btnItemSizeDelete_Click" Text="Delete">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnItemSizeCancel" runat="server" Text="Cancel" OnClick="btnItemSizeCancel_Click">
                                                    </telerik:RadButton>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">

                                                    <asp:Label ID="lblItemSize" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <fieldset>
                                            <legend>All Item Sizes</legend>
                                            <div style="overflow: scroll; height: 500px; width: auto">
                                                <telerik:RadGrid ID="rgItemSize" Height="500px" Width="100%" GroupingSettings-CaseSensitive="false" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" PageSize="15" OnNeedDataSource="rgItemSize_NeedDataSource" OnSelectedIndexChanged="rgItemSize_SelectedIndexChanged">
                                                    <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                                        <Selecting AllowRowSelect="True" />

                                                    </ClientSettings>
                                                    <HeaderStyle CssClass="RadGridHeader" />
                                                    <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                                    <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                                    <ItemStyle CssClass="RadGridItem" />
                                                    <MasterTableView Width="100%" BorderWidth="0">
                                                        <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                        <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </RowIndicatorColumn>
                                                        <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </ExpandCollapseColumn>
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter PI column" HeaderText="Item Size Id" SortExpression="Id" UniqueName="Id">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Item Size Name" SortExpression="Name" UniqueName="Name">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                        <EditFormSettings>
                                                            <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                            </EditColumn>
                                                        </EditFormSettings>
                                                        <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    </MasterTableView>
                                                    <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    <FilterMenu EnableEmbeddedSkins="False">
                                                    </FilterMenu>
                                                    <HeaderContextMenu EnableEmbeddedSkins="False">
                                                    </HeaderContextMenu>

                                                </telerik:RadGrid>
                                            </div>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="Packing">
                        <ContentTemplate>
                            <table class="style1" style="height: 500px">
                                <tr>
                                    <td>
                                        <table class="style1" style="width: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal6" runat="server" Text="Packing Code"></asp:Literal>
                                                </td>
                                                <td>
                                                    <telerik:RadTextBox ID="txtPackingCode" EmptyMessage="Auto Generated Id" runat="server" Width="120px" Enabled="False">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblPackingMode" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal7" runat="server" Text="Packing Name"></asp:Literal>
                                                </td>
                                                <td colspan="2">
                                                    <telerik:RadTextBox ID="txtPackingName" EmptyMessage="ex-50kg" runat="server" Width="200px">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td colspan="2">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <telerik:RadButton ID="btnPackingNew" runat="server" Text="New" OnClick="btnPackingNew_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnPackingSave" runat="server" Text="Save" OnClick="btnPackingSave_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnPackingFind" runat="server" Text="Find" OnClick="btnPackingFind_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnPackingEdit" runat="server" Text="Edit" OnClick="btnPackingEdit_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnPackingDelete" runat="server" OnClick="btnPackingDelete_Click" Text="Delete">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnPackingCancel" runat="server" Text="Cancel" OnClick="btnPackingCancel_Click">
                                                    </telerik:RadButton>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">

                                                    <asp:Label ID="lblPacking" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <fieldset>
                                            <legend>All Packing Types</legend>
                                            <div style="overflow: scroll; height: 500px; width: auto">
                                                <telerik:RadGrid ID="rgPacking" Height="500px" Width="100%" GroupingSettings-CaseSensitive="false" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" PageSize="15" OnNeedDataSource="rgPacking_NeedDataSource" OnSelectedIndexChanged="rgPacking_SelectedIndexChanged">
                                                    <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                                        <Selecting AllowRowSelect="True" />

                                                    </ClientSettings>
                                                    <HeaderStyle CssClass="RadGridHeader" />
                                                    <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                                    <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                                    <ItemStyle CssClass="RadGridItem" />
                                                    <MasterTableView Width="100%" BorderWidth="0">
                                                        <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                        <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </RowIndicatorColumn>
                                                        <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </ExpandCollapseColumn>
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter PI column" HeaderText="Packing Code" SortExpression="Id" UniqueName="Id">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Packing Name" SortExpression="Name" UniqueName="Name">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                        <EditFormSettings>
                                                            <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                            </EditColumn>
                                                        </EditFormSettings>
                                                        <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    </MasterTableView>
                                                    <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    <FilterMenu EnableEmbeddedSkins="False">
                                                    </FilterMenu>
                                                    <HeaderContextMenu EnableEmbeddedSkins="False">
                                                    </HeaderContextMenu>

                                                </telerik:RadGrid>
                                            </div>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="Item Type">
                        <ContentTemplate>
                            <table class="style1" style="height: 500px">
                                <tr>
                                    <td>
                                        <table class="style1" style="width: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal1" runat="server" Text="Type Code"></asp:Literal>
                                                </td>
                                                <td>
                                                    <telerik:RadTextBox ID="txtTypeCode" EmptyMessage="Auto Generated Id" runat="server" Width="120px">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblTypeMode" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal2" runat="server" Text="Type Name"></asp:Literal>
                                                </td>
                                                <td colspan="2">
                                                    <telerik:RadTextBox ID="txtTypeName" EmptyMessage="ex-Boiled" runat="server" Width="200px">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td colspan="2">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <telerik:RadButton ID="btnTypeNew" runat="server" OnClick="btnTypeNew_Click" Text="New">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnTypeSave" runat="server" OnClick="btnTypeSave_Click" Text="Save">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnTypeFind" runat="server" OnClick="btnTypeFind_Click" Text="Find">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnTypeEdit" runat="server" OnClick="btnTypeEdit_Click" Text="Edit">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnTypeDelete" runat="server" OnClick="btnTypeDelete_Click" Text="Delete">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnTypeCancel" runat="server" OnClick="btnTypeCancel_Click" Text="Cancel">
                                                    </telerik:RadButton>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <asp:Label ID="lblType" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <fieldset>
                                            <legend>All Item Types</legend>
                                            <div style="overflow: scroll; height: 500px; width: auto">
                                                <telerik:RadGrid ID="rgItemType" Height="500px" Width="100%" GroupingSettings-CaseSensitive="false" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" PageSize="15" OnNeedDataSource="rgItemType_NeedDataSource" OnSelectedIndexChanged="rgItemType_SelectedIndexChanged">
                                                    <ClientSettings EnablePostBackOnRowClick="True" Selecting-AllowRowSelect="true">
                                                        <Selecting AllowRowSelect="True" />
                                                    </ClientSettings>
                                                    <HeaderStyle CssClass="RadGridHeader" />
                                                    <CommandItemStyle BackColor="#F8FFFF" CssClass="commanditem1" />
                                                    <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                                    <ItemStyle CssClass="RadGridItem" />
                                                    <MasterTableView BorderWidth="0" Width="100%">
                                                        <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                        <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </RowIndicatorColumn>
                                                        <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </ExpandCollapseColumn>
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter PI column" HeaderText="Type Code" SortExpression="Id" UniqueName="Id">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Type Name" SortExpression="Name" UniqueName="Name">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                        <EditFormSettings>
                                                            <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                            </EditColumn>
                                                        </EditFormSettings>
                                                        <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    </MasterTableView>
                                                    <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    <FilterMenu EnableEmbeddedSkins="False">
                                                    </FilterMenu>
                                                    <HeaderContextMenu EnableEmbeddedSkins="False">
                                                    </HeaderContextMenu>
                                                </telerik:RadGrid>
                                            </div>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="Cost Center">
                        <ContentTemplate>
                            <table class="style1" style="height: 500px">
                                <tr>
                                    <td>
                                        <table class="style1" style="width: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal8" runat="server" Text="Cost Center Code"></asp:Literal>
                                                </td>
                                                <td>
                                                    <telerik:RadTextBox ID="txtCostCode" EmptyMessage="Auto Generated Id" runat="server" Width="120px" Enabled="False">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCostMode" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal9" runat="server" Text="Cost Center Name"></asp:Literal>
                                                </td>
                                                <td colspan="2">
                                                    <telerik:RadTextBox ID="txtCostName" EmptyMessage="ex-Office Management" runat="server" Width="200px">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td colspan="2">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <telerik:RadButton ID="btnCostNew" runat="server" Text="New" OnClick="btnCostNew_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCostSave" runat="server" Text="Save" OnClick="btnCostSave_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCostFind" runat="server" Text="Find" OnClick="btnCostFind_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCostEdit" runat="server" Text="Edit" OnClick="btnCostEdit_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCostDelete" runat="server" OnClick="btnCostDelete_Click" Text="Delete">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCostCancel" runat="server" Text="Cancel" OnClick="btnCostCancel_Click">
                                                    </telerik:RadButton>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">

                                                    <asp:Label ID="lblCost" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <fieldset>
                                            <legend>All Cost Centers</legend>
                                            <div style="overflow: scroll; height: 500px; width: auto">
                                                <telerik:RadGrid ID="rgCostCenter" Height="500px" Width="100%" GroupingSettings-CaseSensitive="false" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" PageSize="15" OnNeedDataSource="rgCostCenter_NeedDataSource" OnSelectedIndexChanged="rgCostCenter_SelectedIndexChanged">
                                                    <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                                        <Selecting AllowRowSelect="True" />
                                                    </ClientSettings>
                                                    <HeaderStyle CssClass="RadGridHeader" />
                                                    <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                                    <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                                    <ItemStyle CssClass="RadGridItem" />
                                                    <MasterTableView Width="100%" BorderWidth="0">
                                                        <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                        <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </RowIndicatorColumn>
                                                        <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </ExpandCollapseColumn>
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter PI column" HeaderText="Cost Center Code" SortExpression="Id" UniqueName="Id">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Cost Center Name" SortExpression="Name" UniqueName="Name">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                        <EditFormSettings>
                                                            <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                            </EditColumn>
                                                        </EditFormSettings>
                                                        <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    </MasterTableView>
                                                    <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    <FilterMenu EnableEmbeddedSkins="False">
                                                    </FilterMenu>
                                                    <HeaderContextMenu EnableEmbeddedSkins="False">
                                                    </HeaderContextMenu>

                                                </telerik:RadGrid>
                                            </div>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="Cost Element">
                        <ContentTemplate>
                            <table class="style1" style="height: 500px">
                                <tr>
                                    <td>
                                        <table class="style1" style="width: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="lblCostEle" runat="server" Text="Cost Element Code"></asp:Literal>
                                                </td>
                                                <td>
                                                    <telerik:RadTextBox ID="txtCostElementCode" EmptyMessage="Auto Generated Id" runat="server" Width="120px" Enabled="False">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCostElementMode" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal559" runat="server" Text="Cost Element Name"></asp:Literal>
                                                </td>
                                                <td colspan="2">
                                                    <telerik:RadTextBox ID="txtCostElementName" EmptyMessage="ex-Office Documents Buy" runat="server" Width="200px">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal560" runat="server" Text="Cost Center Name"></asp:Literal>
                                                </td>
                                                <td colspan="2">
                                                    <telerik:RadComboBox ID="cmCostCenter" runat="server" DataSourceID="dsCostCenter" DataTextField="Name" DataValueField="Id" EmptyMessage="Select Cost Center" Width="200px">
                                                    </telerik:RadComboBox>
                                                    <asp:SqlDataSource ID="dsCostCenter" runat="server" ConnectionString="<%$ ConnectionStrings:sbcon %>" SelectCommand="SELECT * FROM [tblCostCenters]"></asp:SqlDataSource>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td colspan="2">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <telerik:RadButton ID="btnCostElementNew" runat="server" Text="New" OnClick="btnCostElementNew_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCostElementSave" runat="server" Text="Save" OnClick="btnCostElementSave_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCostElementFind" runat="server" Text="Find" OnClick="btnCostElementFind_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCostElementEdit" runat="server" Text="Edit" OnClick="btnCostElementEdit_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCostElementDelete" runat="server" OnClick="btnCostElementDelete_Click" Text="Delete">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCostElementCancel" runat="server" Text="Cancel" OnClick="btnCostElementCancel_Click">
                                                    </telerik:RadButton>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <asp:Label ID="lblCostElement" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <fieldset>
                                            <legend>All Cost Elements</legend>
                                            <div style="overflow: scroll; height: 500px; width: auto">
                                                <telerik:RadGrid ID="rgCostElements" Height="500px" Width="100%" GroupingSettings-CaseSensitive="false" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" PageSize="15" OnNeedDataSource="rgCostElements_NeedDataSource" OnSelectedIndexChanged="rgCostElements_SelectedIndexChanged">
                                                    <ClientSettings EnablePostBackOnRowClick="True" Selecting-AllowRowSelect="true">
                                                        <Selecting AllowRowSelect="True" />
                                                    </ClientSettings>
                                                    <HeaderStyle CssClass="RadGridHeader" />
                                                    <CommandItemStyle BackColor="#F8FFFF" CssClass="commanditem1" />
                                                    <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                                    <ItemStyle CssClass="RadGridItem" />
                                                    <MasterTableView BorderWidth="0" Width="100%">
                                                        <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                        <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </RowIndicatorColumn>
                                                        <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </ExpandCollapseColumn>
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter PI column" HeaderText="Cost Element Code" SortExpression="Id" UniqueName="Id">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Cost Element Name" SortExpression="Name" UniqueName="Name">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="CostCenterID" Display="False" FilterControlAltText="Filter CostCenterID column" HeaderText="Cost Center ID" SortExpression="CostCenterID" UniqueName="CostCenterID">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                        <EditFormSettings>
                                                            <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                            </EditColumn>
                                                        </EditFormSettings>
                                                        <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    </MasterTableView>
                                                    <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    <FilterMenu EnableEmbeddedSkins="False">
                                                    </FilterMenu>
                                                    <HeaderContextMenu EnableEmbeddedSkins="False">
                                                    </HeaderContextMenu>
                                                </telerik:RadGrid>
                                            </div>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                    <telerik:RadPanelItem runat="server" Text="Income Source">
                        <ContentTemplate>
                            <table class="style1" style="height: 500px">
                                <tr>
                                    <td>
                                        <table class="style1" style="width: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal10" runat="server" Text="Income Source Code"></asp:Literal>
                                                </td>
                                                <td>
                                                    <telerik:RadTextBox ID="txtIncomeSourceCode" EmptyMessage="Auto Generated Id" runat="server" Width="120px" Enabled="False">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblIncomeSourceMode" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="Literal11" runat="server" Text="Income Source Name"></asp:Literal>
                                                </td>
                                                <td colspan="2">
                                                    <telerik:RadTextBox ID="txtIncomeSourceName" EmptyMessage="ex-Bus,Truck,Cow etc" runat="server" Width="200px">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td colspan="2">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <telerik:RadButton ID="btnIncomeSourceNew" runat="server" Text="New" OnClick="btnIncomeSoureNew_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnIncomeSourceSave" runat="server" Text="Save" OnClick="btnIncomeSoureSave_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnIncomeSourceFind" runat="server" Text="Find" OnClick="btnIncomeSourceFind_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnIncomeSourceEdit" runat="server" Text="Edit" OnClick="btnIncomeSourceEdit_Click">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnIncomeDelete" runat="server" OnClick="btnIncomeDelete_Click" Text="Delete">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnIncomeSourceCancel" runat="server" Text="Cancel" OnClick="btnIncomeSourceCancel_Click">
                                                    </telerik:RadButton>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">

                                                    <asp:Label ID="lblIncomeSource" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <fieldset>
                                            <legend>All Income Sources</legend>
                                            <div style="overflow: scroll; height: 500px; width: auto">
                                                <telerik:RadGrid ID="rgIncomeSource" Height="500px" Width="100%" GroupingSettings-CaseSensitive="false" runat="server" AllowMultiRowSelection="True" AutoGenerateColumns="False" GridLines="Both" AllowFilteringByColumn="True" AllowPaging="True" PageSize="15" OnNeedDataSource="rgIncomeSource_NeedDataSource" OnSelectedIndexChanged="rgIncomeSource_SelectedIndexChanged">
                                                    <ClientSettings Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="True">
                                                        <Selecting AllowRowSelect="True" />
                                                    </ClientSettings>
                                                    <HeaderStyle CssClass="RadGridHeader" />
                                                    <CommandItemStyle CssClass="commanditem1" BackColor="#F8FFFF" />
                                                    <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                                    <ItemStyle CssClass="RadGridItem" />
                                                    <MasterTableView Width="100%" BorderWidth="0">
                                                        <CommandItemSettings AddNewRecordImageUrl="AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="Refresh.gif" />
                                                        <RowIndicatorColumn FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </RowIndicatorColumn>
                                                        <ExpandCollapseColumn CollapseImageUrl="SingleMinus.gif" ExpandImageUrl="SinglePlus.gif" FilterImageUrl="Filter.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif">
                                                        </ExpandCollapseColumn>
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter PI column" HeaderText="Income Source Code" SortExpression="Id" UniqueName="Id">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Income Source Name" SortExpression="Name" UniqueName="Name">
                                                                <ColumnValidationSettings>
                                                                    <ModelErrorMessage Text="" />
                                                                </ColumnValidationSettings>
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                        <EditFormSettings>
                                                            <EditColumn CancelImageUrl="Cancel.gif" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UpdateImageUrl="Update.gif">
                                                            </EditColumn>
                                                        </EditFormSettings>
                                                        <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    </MasterTableView>
                                                    <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                                    <FilterMenu EnableEmbeddedSkins="False">
                                                    </FilterMenu>
                                                    <HeaderContextMenu EnableEmbeddedSkins="False">
                                                    </HeaderContextMenu>

                                                </telerik:RadGrid>
                                            </div>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </telerik:RadPanelItem>
                </Items>
            </telerik:RadPanelBar>
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
