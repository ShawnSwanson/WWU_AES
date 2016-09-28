﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableViewState="false" %>

<%@ Register Src="~/controls/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>
<%@ Register Src="~/controls/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>



<script runat="server">
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="cphNavigation" runat="Server">
    <uc1:Navigation runat="server" ID="Navigation" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>Project</h3>
                </div>
                <div class="panel-body">
                    <asp:SqlDataSource ID="sdsGrid" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [URCD_UniversityProjects].[WWU\swanso31].[tblProject]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsdDetail" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" DeleteCommand="DELETE FROM [URCD_UniversityProjects].[WWU\swanso31].[tblProject] WHERE [ProjectID] = @ProjectID" InsertCommand="INSERT INTO [URCD_UniversityProjects].[WWU\swanso31].[tblProject] ([ProjectName], [ClientID], [WWUEntityID], [StartOfEngagement], [EndOfEngagement], [SpecificProjectActivity], [UniversityPartnerID], [NumberOfFaculty], [FacultyHours], [NumberOfStaff], [StaffHours], [NumberOfStudents], [StudentHours], [ActivityType], [ActivityFee], [RelationshipType], [EngagementType]) VALUES (@ProjectName, @ClientID, @WWUEntityID, @StartOfEngagement, @EndOfEngagement, @SpecificProjectActivity, @UniversityPartnerID, @NumberOfFaculty, @FacultyHours, @NumberOfStaff, @StaffHours, @NumberOfStudents, @StudentHours, @ActivityType, @ActivityFee, @RelationshipType, @EngagementType)" SelectCommand="SELECT * FROM [URCD_UniversityProjects].[WWU\swanso31].[tblProject] WHERE ([ProjectID] = @ProjectID)" UpdateCommand="UPDATE [URCD_UniversityProjects].[WWU\swanso31].[tblProject] SET [ProjectName] = @ProjectName, [ClientID] = @ClientID, [WWUEntityID] = @WWUEntityID, [StartOfEngagement] = @StartOfEngagement, [EndOfEngagement] = @EndOfEngagement, [SpecificProjectActivity] = @SpecificProjectActivity, [UniversityPartnerID] = @UniversityPartnerID, [NumberOfFaculty] = @NumberOfFaculty, [FacultyHours] = @FacultyHours, [NumberOfStaff] = @NumberOfStaff, [StaffHours] = @StaffHours, [NumberOfStudents] = @NumberOfStudents, [StudentHours] = @StudentHours, [ActivityType] = @ActivityType, [ActivityFee] = @ActivityFee, [RelationshipType] = @RelationshipType, [EngagementType] = @EngagementType WHERE [ProjectID] = @ProjectID">
                        <DeleteParameters>
                            <asp:Parameter Name="ProjectID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ProjectName" Type="String" />
                            <asp:Parameter Name="ClientID" Type="Int32" />
                            <asp:Parameter Name="WWUEntityID" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="StartOfEngagement" />
                            <asp:Parameter DbType="Date" Name="EndOfEngagement" />
                            <asp:Parameter Name="SpecificProjectActivity" Type="String" />
                            <asp:Parameter Name="UniversityPartnerID" Type="Int32" />
                            <asp:Parameter Name="NumberOfFaculty" Type="Int32" />
                            <asp:Parameter Name="FacultyHours" Type="Int32" />
                            <asp:Parameter Name="NumberOfStaff" Type="Int32" />
                            <asp:Parameter Name="StaffHours" Type="Int32" />
                            <asp:Parameter Name="NumberOfStudents" Type="Int32" />
                            <asp:Parameter Name="StudentHours" type="Int32" />
                            <asp:Parameter Name="ActivityType" Type="String" />
                            <asp:Parameter Name="ActivityFee" Type="Boolean" />
                            <asp:Parameter Name="RelationshipType" Type="String" />
                            <asp:Parameter Name="EngagementType" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="ProjectID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ProjectName" Type="String" />
                            <asp:Parameter Name="ClientID" Type="Int32" />
                            <asp:Parameter Name="WWUEntityID" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="StartOfEngagement" />
                            <asp:Parameter DbType="Date" Name="EndOfEngagement" />
                            <asp:Parameter Name="SpecificProjectActivity" Type="String" />
                            <asp:Parameter Name="UniversityPartnerID" Type="Int32" />
                            <asp:Parameter Name="NumberOfFaculty" Type="Int32" />
                            <asp:Parameter Name="FacultyHours" Type="Int32" />
                            <asp:Parameter Name="NumberOfStaff" Type="Int32" />
                            <asp:Parameter Name="StaffHours" Type="Int32" />
                            <asp:Parameter Name="NumberOfStudents" Type="Int32" />
                            <asp:Parameter Name="StudentHours" Type="Int32" />
                            <asp:Parameter Name="ActivityType" Type="String" />
                            <asp:Parameter Name="ActivityFee" Type="Boolean" />
                            <asp:Parameter Name="RelationshipType" Type="String" />
                            <asp:Parameter Name="EngagementType" Type="String" />
                            <asp:Parameter Name="ProjectID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsWWUID" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT [WWUEntityID], [EntityName] FROM [URCD_UniversityProjects].[WWU\swanso31].[tblWWUEntity]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsClientID" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT [ClientID], [OrganizationName] FROM [URCD_UniversityProjects].[WWU\swanso31].[tblClient]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsUniversityPartnerID" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT [UniversityPartnerID], [OrganizationName] FROM [URCD_UniversityProjects].[WWU\swanso31].[tblUniversityPartner]"></asp:SqlDataSource>

                    <asp:DetailsView ID="DetailsView1" runat="server" Width="80%" AutoGenerateRows="False" DataKeyNames="ProjectID" DataSourceID="dsdDetail" HorizontalAlign="Center" GridLines="None" BorderStyle="None" CssClass="table table-striped table-hover">
                        <Fields>
                            <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" InsertVisible="False" ReadOnly="True" SortExpression="ProjectID" />
                            <asp:TemplateField HeaderText="Project Name*" SortExpression="ProjectName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("ProjectName") %>' CssClass="form-control" width="500px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("ProjectName") %>' CssClass="form-control" width="500px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("ProjectName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Client Name*" SortExpression="ClientID">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlClientID" runat="server" width="500px" DataSourceID="sdsClientID" DataTextField="OrganizationName" DataValueField="ClientID" SelectedValue='<%# Bind("ClientID") %>' CssClass="form-control chosen-select"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field is Required" ControlToValidate="ddlClientID"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlClientID" runat="server" width="500px" DataSourceID="sdsClientID" DataTextField="OrganizationName" DataValueField="ClientID" SelectedValue='<%# Bind("ClientID") %>' CssClass="form-control chosen-select"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field is Required" ControlToValidate="ddlClientID"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ClientID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="WWU Entity*" SortExpression="WWUEntityID">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlWWUID" runat="server" width="500px" DataSourceID="sdsWWUID" DataTextField="EntityName" DataValueField="WWUEntityID" SelectedValue='<%# Bind("WWUEntityID") %>' CssClass="form-control chosen-select"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Field is Required" ControlToValidate="ddlWWUID"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlWWUID" runat="server" width="500px" DataSourceID="sdsWWUID" DataTextField="EntityName" DataValueField="WWUEntityID" SelectedValue='<%# Bind("WWUEntityID") %>' CssClass="form-control chosen-select"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Field is Required" ControlToValidate="ddlWWUID"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("WWUEntityID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Of Engagement*" SortExpression="StartOfEngagement">
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbStartDate" runat="server" Text='<%# Bind("StartOfEngagement") %>' TextMode="Date" CssClass="form-control" Width="250px"></asp:TextBox>
                                    <small><b>**Dates must be re-entered when updating a project entry</b></small>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Field is Required" ControlToValidate="tbStartDate"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="tbStartDate" runat="server" Text='<%# Bind("StartOfEngagement") %>' TextMode="Date" CssClass="form-control" Width="250px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Field is Required" ControlToValidate="tbStartDate"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("StartOfEngagement", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End Of Engagement*" SortExpression="EndOfEngagement">
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbEndDate" runat="server" Text='<%# Bind("EndOfEngagement") %>' TextMode="Date" CssClass="form-control" Width="250px"></asp:TextBox>
                                    <small><b>**Dates must be re-entered when updating a project entry</b></small>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Field is Required" ControlToValidate="tbEndDate"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="tbEndDate" runat="server" Text='<%# Bind("EndOfEngagement") %>' TextMode="Date" CssClass="form-control" Width="250px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Field is Required" ControlToValidate="tbEndDate"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("EndOfEngagement", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Specific Project Activity" SortExpression="SpecificProjectActivity">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("SpecificProjectActivity") %>' CssClass="form-control" TextMode="MultiLine" Height="75px" width="500px"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("SpecificProjectActivity") %>' CssClass="form-control" TextMode="MultiLine" Height="75px" width="500px"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("SpecificProjectActivity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Project Partner*" SortExpression="UniversityPartnerID">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlUPID" runat="server" width="500px" DataSourceID="sdsUniversityPartnerID" DataTextField="OrganizationName" DataValueField="UniversityPartnerID" SelectedValue='<%# Bind("UniversityPartnerID") %>' CssClass="form-control chosen-select"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Field is Required" ControlToValidate="ddlUPID"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlUPID" runat="server" width="500px" DataSourceID="sdsUniversityPartnerID" DataTextField="OrganizationName" DataValueField="UniversityPartnerID" SelectedValue='<%# Bind("UniversityPartnerID") %>' CssClass="form-control chosen-select"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Field is Required" ControlToValidate="ddlUPID"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("UniversityPartnerID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Number Of Faculty*" SortExpression="NumberOfFaculty">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("NumberOfFaculty") %>' CssClass="form-control" Width="250px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox9"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("NumberOfFaculty") %>' CssClass="form-control" Width="250px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox9"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("NumberOfFaculty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Faculty Hours (Optional)" SortExpression="FacultyHours">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("FacultyHours") %>' CssClass="form-control" Width="250px"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("FacultyHours") %>' CssClass="form-control" Width="250px"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label19" runat="server" Text='<%# Bind("FacultyHours") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Number Of Staff*" SortExpression="NumberOfStaff">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("NumberOfStaff") %>' CssClass="form-control" Width="250px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox10"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("NumberOfStaff") %>' CssClass="form-control" Width="250px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox10"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("NumberOfStaff") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Staff Hours (Optional)" SortExpression="StaffHours">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("StaffHours") %>' CssClass="form-control" Width="250px"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("StaffHours") %>' CssClass="form-control" Width="250px"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="label20" runat="server" Text='<%# Bind("StaffHours") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Number Of Students*" SortExpression="NumberOfStudents">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("NumberOfStudents") %>' CssClass="form-control" Width="250px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox11"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("NumberOfStudents") %>' CssClass="form-control" Width="250px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox11"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("NumberOfStudents") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Student Hours (Optional)" SortExpression="StudentHours">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("StudentHours") %>' CssClass="form-control" Width="250px"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("StudentHours") %>' CssClass="form-control" Width="250px"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label21" runat="server" Text='<%# Bind("StudentHours") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Activity Type*" SortExpression="ActivityType">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("ActivityType") %>' CssClass="form-control" Width="250px">
                                        <asp:ListItem>Course: Credit</asp:ListItem>
                                        <asp:ListItem>Course: Non Credit</asp:ListItem>
                                        <asp:ListItem>Consulting</asp:ListItem>
                                        <asp:ListItem>Service Learning</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Field is Required" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("ActivityType") %>' CssClass="form-control" Width="250px">
                                        <asp:ListItem>Course: Credit</asp:ListItem>
                                        <asp:ListItem>Course: Non Credit</asp:ListItem>
                                        <asp:ListItem>Consulting</asp:ListItem>
                                        <asp:ListItem>Service Learning</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Field is Required" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ActivityType") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="ActivityFee" HeaderText="Activity requires Fee" SortExpression="ActivityFee" ControlStyle-CssClass="bigCB"/>
                            <asp:TemplateField HeaderText="Relationship Type*" SortExpression="RelationshipType">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("RelationshipType") %>' CssClass="form-control" Width="250px">
                                        <asp:ListItem>Consulting</asp:ListItem>
                                        <asp:ListItem>Partnership</asp:ListItem>
                                        <asp:ListItem>Service Learning</asp:ListItem>
                                        <asp:ListItem>Long Term Contract</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Field is Required" ControlToValidate="DropDownList2"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("RelationshipType") %>' CssClass="form-control" Width="250px">
                                        <asp:ListItem>Consulting</asp:ListItem>
                                        <asp:ListItem>Partnership</asp:ListItem>
                                        <asp:ListItem>Service Learning</asp:ListItem>
                                        <asp:ListItem>Long Term Contract</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Field is Required" ControlToValidate="DropDownList2"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("RelationshipType") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Engagement Type*" SortExpression="EngagementType">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("EngagementType") %>' CssClass="form-control" Width="250px">
                                        <asp:ListItem>Project Based</asp:ListItem>
                                        <asp:ListItem>Academic Quarter Based</asp:ListItem>
                                        <asp:ListItem>On Going Contract</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Field is Required" ControlToValidate="DropDownList3"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("EngagementType") %>' CssClass="form-control" Width="250px">
                                        <asp:ListItem>Project Based</asp:ListItem>
                                        <asp:ListItem>Academic Quarter Based</asp:ListItem>
                                        <asp:ListItem>On Going Contract</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Field is Required" ControlToValidate="DropDownList3"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("EngagementType") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger pull-right"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary pull-right"></asp:LinkButton>
                                    <br />
                                    <b>**Dates must be re-entered when updating a project entry</b>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger pull-right"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary pull-right"></asp:LinkButton>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger pull-right"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-info pull-right"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-primary pull-right"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                        <EmptyDataTemplate>
                            <asp:Button ID="InsertButton" runat="server" CommandName="New" Text="Click to insert new record" CssClass="btn btn-primary" />
                        </EmptyDataTemplate>
                    </asp:DetailsView>
                    <br />
                    <br />
                    <h6>Click column headings to sort</h6>
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProjectID" DataSourceID="sdsGrid" HorizontalAlign="Center" AllowSorting="True" CssClass="table-hover" GridLines="Horizontal" BorderStyle="None">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" headerStyle-width="3%"/>
                            <asp:BoundField DataField="ProjectID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ProjectID" HeaderStyle-Width="2%" />
                            <asp:BoundField DataField="ProjectName" HeaderText="Project Name" SortExpression="ProjectName" />
                            <asp:BoundField DataField="ClientID" HeaderText="Client ID" SortExpression="ClientID" />
                            <asp:BoundField DataField="WWUEntityID" HeaderText="WWU ID" SortExpression="WWUEntityID" />
                            <asp:BoundField DataField="StartOfEngagement" HeaderText="Start Date" SortExpression="StartOfEngagement" DataFormatString="{0:d}" headerStyle-width="6%"/>
                            <asp:BoundField DataField="EndOfEngagement" HeaderText="End Date" SortExpression="EndOfEngagement" DataFormatString="{0:d}" headerStyle-width="6%"/>
                            <asp:BoundField DataField="SpecificProjectActivity" HeaderText="Activity" SortExpression="SpecificProjectActivity" />
                            <asp:BoundField DataField="UniversityPartnerID" HeaderText="Partner ID" SortExpression="UniversityPartnerID" />
                            <asp:BoundField DataField="NumberOfFaculty" HeaderText="Faculty" SortExpression="NumberOfFaculty" HeaderStyle-Width="4%" />
                            <asp:BoundField DataField="FacultyHours" HeaderText="Faculty Hrs" SortExpression="FacultyHours" HeaderStyle-Width="4%"/>
                            <asp:BoundField DataField="NumberOfStaff" HeaderText="Staff" SortExpression="NumberOfStaff" HeaderStyle-Width="4%"/>
                            <asp:BoundField DataField="StaffHours" HeaderText="Staff Hrs" SortExpression="StaffHours" HeaderStyle-Width="4%"/>
                            <asp:BoundField DataField="NumberOfStudents" HeaderText="Students" SortExpression="NumberOfStudents" HeaderStyle-Width="4%" />
                            <asp:BoundField DataField="StudentHours" HeaderText="Student Hrs" SortExpression="StudentHours" HeaderStyle-Width="4%"/>
                            <asp:BoundField DataField="ActivityType" HeaderText="Activity Type" SortExpression="ActivityType" headerstyle-width="9%"/>
                            <asp:CheckBoxField DataField="ActivityFee" HeaderText="Has fee?" SortExpression="ActivityFee" HeaderStyle-Width="4%" />
                            <asp:BoundField DataField="RelationshipType" HeaderText="RelationshipType" SortExpression="RelationshipType" />
                            <asp:BoundField DataField="EngagementType" HeaderText="EngagementType" SortExpression="EngagementType" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" runat="Server">
    <uc1:Footer runat="server" ID="Footer" />
</asp:Content>

