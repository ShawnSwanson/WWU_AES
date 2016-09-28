<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

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
                    <h3>Project Partner Detail Report</h3>
                </div>
                <div class="panel-body">
                    <asp:SqlDataSource ID="sdsUP" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT [UniversityPartnerID], [OrganizationName] FROM [URCD_UniversityProjects].[WWU\swanso31].[tblUniversityPartner]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsUPDetail" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [URCD_UniversityProjects].[WWU\swanso31].[tblUniversityPartner] WHERE ([UniversityPartnerID] = @UniversityPartnerID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlUP" Name="UniversityPartnerID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsWWUEntity" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [URCD_UniversityProjects].[WWU\swanso31].[tblWWUEntity] WHERE ([WWUEntityID] IN (SELECT DISTINCT WWUEntityID FROM [URCD_UniversityProjects].[WWU\swanso31].[tblProject] WHERE ([UniversityPartnerID] = @UniversityPartnerID)))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlUP" Name="UniversityPartnerID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsProjects" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [URCD_UniversityProjects].[WWU\swanso31].[tblProject] WHERE ([UniversityPartnerID] = @UniversityPartnerID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlUP" Name="UniversityPartnerID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    Select a Project Partner to generate a report:
                    <asp:DropDownList ID="ddlUP" runat="server" DataSourceID="sdsUP" DataTextField="OrganizationName" DataValueField="UniversityPartnerID" AutoPostBack="true" CssClass="chosen-select" Width="250px"></asp:DropDownList>
                    <br />
                    Print Friendly page <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Reporting/PartnerReportingAlt.aspx">Here</asp:HyperLink>

                    <h2>Project Partner Details</h2>
                    <asp:ListView ID="lvUPDetail" runat="server" DataSourceID="sdsUPDetail" DataKeyNames="UniversityPartnerID">
                        <EmptyDataTemplate>
                            <span>No data was returned.</span><br />
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <div class="col-md-12">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <h2><%# Eval("OrganizationName") %></h2>
                                            </div>
                                            <div class="col-sm-4 text-right">
                                                <h4>University Partner ID: <%# Eval("UniversityPartnerID") %></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row text-center">
                                            <h3><%# Eval("ContactName") %></h3>

                                            <h3><%# Eval("Phone") %> | <%# Eval("Email") %></h3>

                                            <h3><%# Eval("Address") %> <%# Eval("City") %>, <%# Eval("State") %> <%# Eval("ZIP") %></h3>
                                            <hr />
                                            <h3>
                                                <em>
                                                    <%# Eval("Notes") %>
                                                </em>
                                            </h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                    <h2>WWU Entity Involvement</h2>
                    <asp:ListView ID="lvWWUEntity" runat="server" DataSourceID="sdsWWUEntity" DataKeyNames="WWUEntityID">
                        <EmptyDataTemplate>
                            <span>No WWU Entities have worked with this partner on record.</span><br />
                        </EmptyDataTemplate>
                        <ItemTemplate>
                                <div class="col-md-12">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <h2><%# Eval("EntityName") %></h2>
                                                </div>
                                                <div class="col-sm-4 text-right">
                                                    <h4>WWU Entity ID: <%# Eval("WWUEntityID") %></h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-sm-8 text-center">
                                                    <h3><%# Eval("ContactPerson") %></h3>

                                                    <h3><%# Eval("ActivityType") %></h3>
                                                    <hr />
                                                    <h5><em><%# Eval("EntityPurpose") %></em></h5>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("ClientIsInternalWWU") %>' Enabled="false" Text="Internal Clients" />
                                                    <br />
                                                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Eval("ClientIsForProfit") %>' Enabled="false" Text="For Profit Clients" />
                                                    <br />
                                                    <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Eval("ClientIsNonProfit") %>' Enabled="false" Text="Non Profit Clients" />
                                                    <br />
                                                    <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Eval("ClientIsGovernment") %>' Enabled="false" Text="Government Clients" />
                                                    <br />
                                                    <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Eval("ClientIsTribal") %>' Enabled="false" Text="Tribal Clients" />
                                                    <br />
                                                    <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Eval("EngagementIsProject") %>' Enabled="false" Text="Project Engagements" />
                                                    <br />
                                                    <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Eval("EngagementIsQuarter") %>' Enabled="false" Text="Quarterly Engagements" />
                                                    <br />
                                                    <asp:CheckBox ID="CheckBox8" runat="server" Checked='<%# Eval("EngagementIsContract") %>' Enabled="false" Text="Contract Engagements" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </ItemTemplate>
                    </asp:ListView>
                    <h2>Projects</h2>
                    <asp:ListView ID="lvProjects" runat="server" DataKeyNames="ProjectID" DataSourceID="sdsProjects">
                        <EmptyDataTemplate>
                            <span>This University Partner has not been involved in any recorded Projects.</span><br />
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <div class="col-md-12">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <h2><%# Eval("ProjectName") %></h2>
                                            </div>
                                            <div class="col-sm-4 text-right">
                                                <h4>Project ID: <%# Eval("ProjectID") %></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row text-center">
                                            <div class="col-sm-6">
                                                <h3>Client ID: <%# Eval("ClientID") %>
                                                    <br />
                                                    WWU Entity ID: <%# Eval("WWUEntityID") %>
                                                    <br />
                                                    University Partner ID: <%# Eval("UniversityPartnerID") %>
                                                    <br />
                                                    Engagement Type: <%# Eval("EngagementType") %>
                                                    <br />
                                                    Activity Type: <%# Eval("ActivityType") %>
                                                </h3>
                                                <asp:CheckBox ID="CheckBox9" runat="server" Checked='<%# Eval("ActivityFee") %>' Enabled="false" Text="Activity Has Fee" />
                                            </div>
                                            <div class="col-sm-6">
                                                <h3>Project Start: <%# Eval("StartOfEngagement", "{0:d}") %><br />
                                                    Project End: <%# Eval("EndOfEngagement", "{0:d}") %><br />
                                                    Faculty: <%# Eval("NumberOfFaculty") %> | Hours: <%# Eval("FacultyHours") %><br />
                                                    Staff: <%# Eval("NumberOfStaff") %> | Hours: <%# Eval("StaffHours") %><br />
                                                    Students: <%# Eval("NumberOfStudents") %> | Hours: <%# Eval("StudentHours") %><br />
                                                    Relationship Type: <%# Eval("RelationshipType") %>
                                                </h3>
                                            </div>
                                            <div class="col-sm-12">
                                                <hr />
                                                <h3>
                                                    <em><%# Eval("SpecificProjectActivity") %></em>
                                                </h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" runat="Server">
    <uc1:Footer runat="server" ID="Footer" />
</asp:Content>

