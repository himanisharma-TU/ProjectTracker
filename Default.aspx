<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProjectTrackerApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Task</h2>
    <div class="jumbotron" style="overflow: auto;">
        <asp:ListView ID="TaskListView" runat="server" DataSourceID="TaskSqlDataSource" DataKeyNames="Id" InsertItemPosition="LastItem"
            OnItemInserting="TaskListView_ItemInserting" OnItemUpdating="TaskListView_ItemUpdating" OnItemDataBound="TaskListView_ItemDataBound">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFF8DC;">
                    <td>
                        <asp:Label ID="ProjectNameLabel" runat="server" Text='<%# Eval("ProjectName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StatusNameLabel" runat="server" Text='<%# Eval("StatusName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ResourceNameLabel" runat="server" Text='<%# Eval("ResourceName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UtilizationLabel" runat="server" Text='<%# Eval("Utilization") %>' />
                        <asp:Label runat="server" Text="%"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="DevClouserDateLabel" runat="server" Text='<%# Eval("DevClouserDate", "{0:d}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SentToQALabel" runat="server" Text='<%# Eval("SentToQA", "{0:d}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UATDateLabel" runat="server" Text='<%# Eval("UATDate", "{0:d}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="InfoSecApprovalLabel" runat="server" Text='<%# Eval("InfoSecApproval") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LegalApprovalLabel" runat="server" Text='<%# Eval("LegalApproval") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DataPrivacyApprovalLabel" runat="server" Text='<%# Eval("DataPrivacyApproval") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ServerProcuredLabel" runat="server" Text='<%# Eval("ServerProcured") %>' />
                    </td>
                    <td>
                        <asp:Label ID="RiskLabel" runat="server" Text='<%# Eval("Risk") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CommentsLabel" runat="server" Text='<%# Eval("Comments") %>' />
                    </td>
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr>
                    <td>
                        <asp:DropDownList ID="ProjectDropDownList" runat="server" DataSourceID="ProjectSqlDataSource"
                            DataTextField="Name" DataValueField="ProjectId" SelectedValue='<%# Bind("ProjectId") %>'>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="ProjectRequiredFieldValidator" runat="server" ForeColor="Red" 
                            ToolTip="Required" ErrorMessage="*" ControlToValidate="ProjectDropDownList">
                        </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="StatusDropDownList" runat="server" DataSourceID="StatusSqlDataSource"
                            DataTextField="Name" DataValueField="StatusId" SelectedValue='<%# Bind("StatusId") %>'>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="StatusRequiredFieldValidator" runat="server" ForeColor="Red" 
                            ToolTip="Required" ErrorMessage="*" ControlToValidate="StatusDropDownList">
                        </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="ResourceDropDownList" runat="server" DataSourceID="ResourceSqlDataSource"
                            DataTextField="Name" DataValueField="ResourceId" SelectedValue='<%# Bind("ResourceId") %>'>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="ResourceRequiredFieldValidator" runat="server" ForeColor="Red" 
                            ToolTip="Required" ErrorMessage="*" ControlToValidate="ResourceDropDownList">
                        </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" />
                    </td>
                    <td>
                        <asp:TextBox ID="UtilizationTextBox" runat="server" Text='<%# Bind("Utilization") %>' TextMode="Number" Width="50px" />
                        <asp:Label runat="server" Text="%"></asp:Label>
                        <asp:RangeValidator ForeColor="Red" ID="UtilizationRangeValidator" runat="server" ToolTip="The value must be from 1 to 100!" ErrorMessage="*" MinimumValue="1" MaximumValue="100" ControlToValidate="UtilizationTextBox" Type="Integer"></asp:RangeValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DevClouserDateTextBox" runat="server" Text='<%# Bind("DevClouserDate", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                    </td>
                    <td>
                        <asp:TextBox ID="SentToQATextBox" runat="server" Text='<%# Bind("SentToQA", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                    </td>
                    <td>
                        <asp:TextBox ID="UATDateTextBox" runat="server" Text='<%# Bind("UATDate", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                    </td>
                    <td>
                        <asp:DropDownList ID="InfoSecApprovalDropDownList" runat="server" SelectedValue='<%# Bind("InfoSecApproval") %>'>
                            <asp:ListItem Text="NA" Value="NA"></asp:ListItem>
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="LegalApprovalDropDownList" runat="server" SelectedValue='<%# Bind("LegalApproval") %>'>
                            <asp:ListItem Text="NA" Value="NA"></asp:ListItem>
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="DataPrivacyApprovalDropDownList" runat="server" SelectedValue='<%# Bind("DataPrivacyApproval") %>'>
                            <asp:ListItem Text="NA" Value="NA"></asp:ListItem>
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="ServerProcuredDropDownList" runat="server" SelectedValue='<%# Bind("ServerProcured") %>'>
                            <asp:ListItem Text="NA" Value="NA"></asp:ListItem>
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="RiskTextBox" runat="server" Text='<%# Bind("Risk") %>' TextMode="MultiLine" />
                    </td>
                    <td>
                        <asp:TextBox ID="CommentsTextBox" runat="server" Text='<%# Bind("Comments") %>' TextMode="MultiLine" MaxLength="35" />
                    </td>
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
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
                        <asp:DropDownList ID="ProjectDropDownList" runat="server" DataSourceID="ProjectSqlDataSource"
                            DataTextField="Name" DataValueField="ProjectId" SelectedValue='<%# Bind("ProjectId") %>'>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="ProjectRequiredFieldValidator" runat="server" ForeColor="Red" 
                            ToolTip="Required" ErrorMessage="*" ControlToValidate="ProjectDropDownList">
                        </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="StatusDropDownList" runat="server" DataSourceID="StatusSqlDataSource"
                            DataTextField="Name" DataValueField="StatusId" SelectedValue='<%# Bind("StatusId") %>'>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="StatusRequiredFieldValidator" runat="server" ForeColor="Red" 
                            ToolTip="Required" ErrorMessage="*" ControlToValidate="StatusDropDownList">
                        </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="ResourceAddDropDownList" runat="server" DataSourceID="ResourceSqlDataSource"
                            DataTextField="Name" DataValueField="ResourceId" SelectedValue='<%# Bind("ResourceId") %>'>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="ResourceRequiredFieldValidator" runat="server" ForeColor="Red" 
                            ToolTip="Required" ErrorMessage="*" ControlToValidate="ResourceAddDropDownList">
                        </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" />
                    </td>
                    <td>
                        <asp:TextBox ID="UtilizationTextBox" runat="server" Text='<%# Bind("Utilization") %>' TextMode="Number" Width="50px"/>
                        <asp:Label runat="server" Text="%"></asp:Label>
                        <asp:RangeValidator ForeColor="Red" ID="UtilizationRangeValidator" runat="server" ToolTip="The value must be from 1 to 100!" ErrorMessage="*" MinimumValue="1" MaximumValue="100" ControlToValidate="UtilizationTextBox" Type="Integer"></asp:RangeValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DevClouserDateTextBox" runat="server" Text='<%# Bind("DevClouserDate") %>' TextMode="Date" />
                    </td>
                    <td>
                        <asp:TextBox ID="SentToQATextBox" runat="server" Text='<%# Bind("SentToQA") %>' TextMode="Date" />
                    </td>
                    <td>
                        <asp:TextBox ID="UATDateTextBox" runat="server" Text='<%# Bind("UATDate") %>' TextMode="Date" />
                    </td>
                    <td>
                        <asp:DropDownList ID="InfoSecApprovalDropDownList" runat="server" SelectedValue='<%# Bind("InfoSecApproval") %>'>
                            <asp:ListItem Text="NA" Value="NA"></asp:ListItem>
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="LegalApprovalDropDownList" runat="server" SelectedValue='<%# Bind("LegalApproval") %>'>
                            <asp:ListItem Text="NA" Value="NA"></asp:ListItem>
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="DataPrivacyApprovalDropDownList" runat="server" SelectedValue='<%# Bind("DataPrivacyApproval") %>'>
                            <asp:ListItem Text="NA" Value="NA"></asp:ListItem>
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="ServerProcuredDropDownList" runat="server" SelectedValue='<%# Bind("ServerProcured") %>'>
                            <asp:ListItem Text="NA" Value="NA"></asp:ListItem>
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="RiskTextBox" runat="server" Text='<%# Bind("Risk") %>' TextMode="MultiLine" />
                    </td>
                    <td>
                        <asp:TextBox ID="CommentsTextBox" runat="server" Text='<%# Bind("Comments") %>' TextMode="MultiLine" MaxLength="35" />
                    </td>
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #DCDCDC; color: #000000;">
                    <td>
                        <asp:Label ID="ProjectNameLabel" runat="server" Text='<%# Eval("ProjectName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StatusNameLabel" runat="server" Text='<%# Eval("StatusName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ResourceNameLabel" runat="server" Text='<%# Eval("ResourceName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UtilizationLabel" runat="server" Text='<%# Eval("Utilization") %>' />
                        <asp:Label runat="server" Text="%"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="DevClouserDateLabel" runat="server" Text='<%# Eval("DevClouserDate", "{0:d}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SentToQALabel" runat="server" Text='<%# Eval("SentToQA", "{0:d}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UATDateLabel" runat="server" Text='<%# Eval("UATDate", "{0:d}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="InfoSecApprovalLabel" runat="server" Text='<%# Eval("InfoSecApproval") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LegalApprovalLabel" runat="server" Text='<%# Eval("LegalApproval") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DataPrivacyApprovalLabel" runat="server" Text='<%# Eval("DataPrivacyApproval") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ServerProcuredLabel" runat="server" Text='<%# Eval("ServerProcured") %>' />
                    </td>
                    <td>
                        <asp:Label ID="RiskLabel" runat="server" Text='<%# Eval("Risk") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CommentsLabel" runat="server" Text='<%# Eval("Comments") %>' />
                    </td>
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                    <th runat="server" style="width:50px;">Project</th>
                                    <th runat="server" style="width:50px;">Status</th>
                                    <th runat="server" style="width:50px;">Resource</th>
                                    <th runat="server" style="width:150px;">Description</th>
                                    <th runat="server" style="width:30px;">Utilization</th>
                                    <th runat="server" style="width:50px;">Dev Clouser Date</th>
                                    <th runat="server" style="width:50px;">Sent To QA Date</th>
                                    <th runat="server" style="width:50px;">UAT Date</th>
                                    <th runat="server" style="width:30px;">InfoSec Approval</th>
                                    <th runat="server" style="width:30px;">Legal Approval</th>
                                    <th runat="server" style="width:30px;">Data Privacy Approval</th>
                                    <th runat="server" style="width:30px;">Server Procured</th>
                                    <th runat="server" style="width:150px;">Risk</th>
                                    <th runat="server" style="width:150px;">Comments</th>
                                    <th runat="server"></th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                            <asp:DataPager ID="DataPager2" runat="server">
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
                        <asp:Label ID="ProjectNameLabel" runat="server" Text='<%# Eval("ProjectName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StatusNameLabel" runat="server" Text='<%# Eval("StatusName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ResourceNameLabel" runat="server" Text='<%# Eval("ResourceName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UtilizationLabel" runat="server" Text='<%# Eval("Utilization") %>' />
                        <asp:Label runat="server" Text="%"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="DevClouserDateLabel" runat="server" Text='<%# Eval("DevClouserDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SentToQALabel" runat="server" Text='<%# Eval("SentToQA") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UATDateLabel" runat="server" Text='<%# Eval("UATDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="InfoSecApprovalLabel" runat="server" Text='<%# Eval("InfoSecApproval") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LegalApprovalLabel" runat="server" Text='<%# Eval("LegalApproval") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DataPrivacyApprovalLabel" runat="server" Text='<%# Eval("DataPrivacyApproval") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ServerProcuredLabel" runat="server" Text='<%# Eval("ServerProcured") %>' />
                    </td>
                    <td>
                        <asp:Label ID="RiskLabel" runat="server" Text='<%# Eval("Risk") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CommentsLabel" runat="server" Text='<%# Eval("Comments") %>' />
                    </td>
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="TaskSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectTrackDBConnStr %>"
            OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT * FROM [TaskView]" ConflictDetection="OverwriteChanges"
            DeleteCommand="UPDATE [Task] SET Active=0 WHERE [Id] = @original_Id AND Active = 1"
            InsertCommand="INSERT INTO [Task] ([ProjectId], [StatusId], [ResourceId], [Description], [Utilization], [DevClouserDate], [SentToQA], [UATDate], [InfoSecApproval], [LegalApproval], [DataPrivacyApproval], [ServerProcured], [Risk], [Comments], [Active], [_CreatedBy], [_CreatedDate]) VALUES (@ProjectId, @StatusId, @ResourceId, @Description, @Utilization, @DevClouserDate, @SentToQA, @UATDate, @InfoSecApproval, @LegalApproval, @DataPrivacyApproval, @ServerProcured, @Risk, @Comments, 1, @CreatedBy, GETDATE())"
            UpdateCommand="UPDATE [Task] SET [ProjectId] = @ProjectId, [StatusId] = @StatusId, [ResourceId] = @ResourceId, [Description] = @Description, [Utilization] = @Utilization, [DevClouserDate] = @DevClouserDate, [SentToQA] = @SentToQA, [UATDate] = @UATDate, [InfoSecApproval] = @InfoSecApproval, [LegalApproval] = @LegalApproval, [DataPrivacyApproval] = @DataPrivacyApproval, [ServerProcured] = @ServerProcured, [Risk] = @Risk, [Comments] = @Comments, [Active] = 1, [_ModifiedBy] = @ModifiedBy, [_ModifiedDate] = GETDATE() WHERE [Id] = @original_Id AND Active = 1">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
                <%--<asp:Parameter Name="original_ProjectId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_StatusId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_ResourceId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_Description" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Utilization" Type="Int32"></asp:Parameter>
                <asp:Parameter DbType="DateTime2" Name="original_DevClouserDate"></asp:Parameter>
                <asp:Parameter DbType="DateTime2" Name="original_SentToQA"></asp:Parameter>
                <asp:Parameter DbType="DateTime2" Name="original_UATDate"></asp:Parameter>
                <asp:Parameter Name="original_InfoSecApproval" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_LegalApproval" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_DataPrivacyApproval" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_ServerProcured" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Risk" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Comments" Type="String"></asp:Parameter>--%>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProjectId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="StatusId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="ResourceId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                <asp:Parameter Name="Utilization" Type="Int32"></asp:Parameter>
                <asp:Parameter DbType="DateTime2" Name="DevClouserDate"></asp:Parameter>
                <asp:Parameter DbType="DateTime2" Name="SentToQA"></asp:Parameter>
                <asp:Parameter DbType="DateTime2" Name="UATDate"></asp:Parameter>
                <asp:Parameter Name="InfoSecApproval" Type="String"></asp:Parameter>
                <asp:Parameter Name="LegalApproval" Type="String"></asp:Parameter>
                <asp:Parameter Name="DataPrivacyApproval" Type="String"></asp:Parameter>
                <asp:Parameter Name="ServerProcured" Type="String"></asp:Parameter>
                <asp:Parameter Name="Risk" Type="String"></asp:Parameter>
                <asp:Parameter Name="Comments" Type="String"></asp:Parameter>
                <asp:Parameter Name="CreatedBy" Type="String"></asp:Parameter>
                <asp:Parameter Name="Active" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProjectId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="StatusId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="ResourceId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                <asp:Parameter Name="Utilization" Type="Int32"></asp:Parameter>
                <asp:Parameter DbType="DateTime2" Name="DevClouserDate"></asp:Parameter>
                <asp:Parameter DbType="DateTime2" Name="SentToQA"></asp:Parameter>
                <asp:Parameter DbType="DateTime2" Name="UATDate"></asp:Parameter>
                <asp:Parameter Name="InfoSecApproval" Type="String"></asp:Parameter>
                <asp:Parameter Name="LegalApproval" Type="String"></asp:Parameter>
                <asp:Parameter Name="DataPrivacyApproval" Type="String"></asp:Parameter>
                <asp:Parameter Name="ServerProcured" Type="String"></asp:Parameter>
                <asp:Parameter Name="Risk" Type="String"></asp:Parameter>
                <asp:Parameter Name="Comments" Type="String"></asp:Parameter>
                <asp:Parameter Name="Active" Type="String"></asp:Parameter>
                <asp:Parameter Name="ModifiedBy" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_ProjectId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_StatusId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_ResourceId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_Description" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Utilization" Type="Int32"></asp:Parameter>
                <asp:Parameter DbType="DateTime2" Name="original_DevClouserDate"></asp:Parameter>
                <asp:Parameter DbType="DateTime2" Name="original_SentToQA"></asp:Parameter>
                <asp:Parameter DbType="DateTime2" Name="original_UATDate"></asp:Parameter>
                <asp:Parameter Name="original_InfoSecApproval" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_LegalApproval" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_DataPrivacyApproval" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_ServerProcured" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Risk" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Comments" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Active" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_ModifiedBy" Type="String"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="ResourceSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ProjectTrackDBConnStr %>'
            SelectCommand="SELECT EmployeeNo as ResourceId, (FirstName + ' ' + LastName) As Name FROM AppUser"></asp:SqlDataSource>
        <asp:SqlDataSource ID="ProjectSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ProjectTrackDBConnStr %>'
            SelectCommand="SELECT Id as ProjectId, Name FROM Project"></asp:SqlDataSource>
        <asp:SqlDataSource ID="StatusSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ProjectTrackDBConnStr %>'
            SelectCommand="SELECT Id as StatusId, Name FROM Status"></asp:SqlDataSource>
    </div>
</asp:Content>
