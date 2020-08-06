<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="ProjectTrackerApp.Admin.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Task</h2>
    <div class="jumbotron" style="overflow: auto;">
        <asp:ListView ID="UserListView" runat="server" DataSourceID="UserSqlDataSource" DataKeyNames="EmployeeNo" InsertItemPosition="LastItem" OnItemInserting="UserListView_ItemInserting" OnItemUpdating="UserListView_ItemUpdating">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFF8DC;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="EmployeeNoLabel" runat="server" Text='<%# Eval("EmployeeId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailIdLabel" runat="server" Text='<%# Eval("EmailId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BusinessTitleLabel" runat="server" Text='<%# Eval("BusinessTitle") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="EmployeeNoLabel1" runat="server" Text='<%# Eval("EmployeeNo") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EamilIdTextBox" runat="server" Text='<%# Bind("EmailId") %>' TextMode="Email" />
                    </td>
                    <td>
                        <asp:TextBox ID="BusinessTitleTextBox" runat="server" Text='<%# Bind("BusinessTitle") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="EmployeeNoTextBox" runat="server" Text='<%# Bind("EmployeeNo") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EamilIdTextBox" runat="server" Text='<%# Bind("EmailId") %>' TextMode="Email" />
                    </td>
                    <td>
                        <asp:TextBox ID="BusinessTitleTextBox" runat="server" Text='<%# Bind("BusinessTitle") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #DCDCDC; color: #000000;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="EmployeeNoLabel" runat="server" Text='<%# Eval("EmployeeNo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailIdLabel" runat="server" Text='<%# Eval("EmailId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BusinessTitleLabel" runat="server" Text='<%# Eval("BusinessTitle") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                    <th runat="server"></th>
                                    <th runat="server">EmployeeNo</th>
                                    <th runat="server">FirstName</th>
                                    <th runat="server">LastName</th>
                                    <th runat="server">EmailId</th>
                                    <th runat="server">BusinessTitle</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="EmployeeNoLabel" runat="server" Text='<%# Eval("EmployeeNo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailIdLabel" runat="server" Text='<%# Eval("EmailId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BusinessTitleLabel" runat="server" Text='<%# Eval("BusinessTitle") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
    </div>
    <asp:SqlDataSource ID="UserSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ProjectTrackDBConnStr %>'
        SelectCommand="SELECT [EmployeeNo], [FirstName], [LastName], [EmailId], [BusinessTitle] FROM [AppUser] WHERE Active=1 Order By [FirstName]"
        DeleteCommand="UPDATE [AppUser] SET Active = 0 WHERE [EmployeeNo] = @EmployeeNo AND Active=1"
        InsertCommand="INSERT INTO [AppUser] ([EmployeeNo], [FirstName], [LastName], [EmailId], [BusinessTitle], [Active], [_CreatedBy], [_CreatedDate]) VALUES (@EmployeeNo, @FirstName, @LastName, @EmailId, @BusinessTitle, 1, @CreatedBy, GETDATE())"
        UpdateCommand="UPDATE [AppUser] SET [EmployeeNo] = @EmployeeNo, [FirstName] = @FirstName, [LastName] = @LastName, [EmailId] = @EmailId, [BusinessTitle] = @BusinessTitle, [Active] = 1, [_ModifiedBy] = @ModifiedBy, [_ModifiedDate] = GETDATE() WHERE [EmployeeNo] = @EmployeeNo AND Active = 1">
        <DeleteParameters>
            <asp:Parameter Name="EmployeeNo" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EmployeeNo" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="EmailId" Type="String"></asp:Parameter>
            <asp:Parameter Name="BusinessTitle" Type="String"></asp:Parameter>
            <asp:Parameter Name="CreatedBy" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmployeeNo" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="EmailId" Type="String"></asp:Parameter>
            <asp:Parameter Name="BusinessTitle" Type="String"></asp:Parameter>
            <asp:Parameter Name="ModifiedBy" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
