<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mailing.aspx.cs" Inherits="SobujBanglaARM.Forms.Mailing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        </telerik:RadAjaxManager>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <div>
            <asp:Label ID="lblOperationMode" Style="float: right" runat="server" ForeColor="#CC0000"></asp:Label>
            <h1>Emailing</h1>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Sent From" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtSentFrom" runat="server" Width="300px" Visible="False">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Password" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtPassword" runat="server" Width="250px" TextMode="Password" Visible="False">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Recipients"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtRecipients" runat="server" Width="100%" TextMode="MultiLine">
                        </telerik:RadTextBox>
                        <telerik:RadButton ID="btnRecipients" runat="server" OnClick="btnRecipients_Click" Text="Select Recipients" Width="100px">
                        </telerik:RadButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Subject"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtSubject" runat="server" Width="100%" EmptyMessage="As A Report Name">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Body"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtBody" runat="server" Height="300px" TextMode="MultiLine" Width="100%" LabelWidth="360px" Resize="None">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Host &amp; Port" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtHost" runat="server" Width="250px" Visible="False" Enabled="False">
                        </telerik:RadTextBox>
                        <telerik:RadTextBox ID="txtPort" runat="server" Width="70px" Visible="False" Enabled="False">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <telerik:RadButton ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" Visible="False">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" Visible="False">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" Visible="False" SingleClick="True" SingleClickText="Working..">
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnSendMail" runat="server" OnClick="btnSendMail_Click" Text="Send Email" SingleClick="true" SingleClickText="Sending Email...">
                        </telerik:RadButton>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0066"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <telerik:RadWindow ID="RadWindow1" Width="700px" Height="700px" runat="server" IconUrl="none" Modal="True" Title="Find Option" Behaviors="Pin">
            <ContentTemplate>
                <%--  <asp:UpdatePanel ID="upitembill" runat="server">
                        <ContentTemplate>--%>
                <table class="auto-style1">
                    <tr>
                        <td style="text-align: right;">
                            <asp:Button ID="btnOk" runat="server" OnClick="btnOk_Click" Text="Ok" Width="50px" />
                            <asp:Button ID="btnExit" runat="server" OnClick="btnExit_Click" Text="Exit" Width="50px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <telerik:RadGrid ID="RGSelect" runat="server" GroupingSettings-CaseSensitive="false" AutoGenerateColumns="False" GridLines="Both" OnEditCommand="RGSelect_EditCommand" OnItemDataBound="RGSelect_ItemDataBound" OnNeedDataSource="RGSelect_NeedDataSource" ShowFooter="True">
                                <CommandItemStyle BackColor="#F8FFFF" CssClass="commanditem1" />
                                <AlternatingItemStyle CssClass="RadGridAlternatingItem" />
                                <ItemStyle CssClass="RadGridItem" />
                                <MasterTableView BorderWidth="0" EditMode="InPlace" Width="100%">
                                    <CommandItemSettings AddNewRecordImageUrl="../AddRecord.gif" ExportToCsvImageUrl="ExportToCsv.gif" ExportToExcelImageUrl="ExportToExcel.gif" ExportToPdfImageUrl="ExportToPdf.gif" ExportToWordImageUrl="ExportToWord.gif" RefreshImageUrl="../Refresh.gif" />
                                    <NoRecordsTemplate>
                                        <div class="blnkmsg">
                                            No records to display
                                        </div>
                                    </NoRecordsTemplate>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="CustId" FilterControlAltText="Filter column column" FilterImageUrl="Filter.gif" HeaderText="Customer ID" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" SortExpression="CustId" UniqueName="CustId">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" FilterImageUrl="Filter.gif" HeaderText="Name" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" SortExpression="Name" UniqueName="Name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Email" FilterControlAltText="Filter Email column" FilterImageUrl="Filter.gif" HeaderText="Email" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" SortExpression="Email" UniqueName="Email">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn DataField="Email" FilterControlAltText="Filter BillNo column" HeaderText="Choose" SortExpression="Email" UniqueName="Email">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkRecipient" runat="server" AutoPostBack="true" OnCheckedChanged="chkRecipient_CheckedChanged" />
                                            </ItemTemplate>
                                            <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                            <HeaderStyle Font-Bold="True" Font-Names="Arial" Font-Size="8pt" HorizontalAlign="Center" Width="15%" />
                                            <ItemStyle Font-Names="Arial" Font-Size="8pt" HorizontalAlign="Right" Width="15%" />
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                    <EditFormSettings EditColumn-ItemStyle-BorderWidth="0px">
                                        <EditColumn CancelImageUrl="Cancel.gif" FilterControlAltText="Filter EditCommandColumn1 column" FilterImageUrl="Filter.gif" InsertImageUrl="Update.gif" SortAscImageUrl="SortAsc.gif" SortDescImageUrl="SortDesc.gif" UniqueName="EditCommandColumn1" UpdateImageUrl="Update.gif">
                                            <ItemStyle BorderWidth="0px" />
                                        </EditColumn>
                                    </EditFormSettings>
                                    <PagerStyle FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                </MasterTableView>
                                <PagerStyle CssClass="RadGridPager" FirstPageImageUrl="PagingFirst.gif" LastPageImageUrl="PagingLast.gif" NextPageImageUrl="PagingNext.gif" PrevPageImageUrl="PagingPrev.gif" />
                                <FilterMenu EnableEmbeddedSkins="False">
                                </FilterMenu>
                                <HeaderContextMenu EnableEmbeddedSkins="False">
                                </HeaderContextMenu>
                            </telerik:RadGrid>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <%-- </ContentTemplate>
                    </asp:UpdatePanel>--%>
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
