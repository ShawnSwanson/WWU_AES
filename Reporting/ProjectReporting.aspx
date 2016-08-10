<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register Src="~/controls/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/controls/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>


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
                    <h3>Project Detail Report</h3>
                </div>
                <div class="panel-body">
                    <asp:SqlDataSource ID="sdsProjects" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblProject]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsProjectDetail" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblProject] WHERE ([ProjectID] = @ProjectID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProjects" Name="ProjectID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="sdsClient" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblClient] WHERE ([ClientID] = @ClientID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProjects" Name="ClientID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsUniversityPartner" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblUniversityPartner] WHERE ([UniversityPartnerID] = (SELECT UniversityPartnerID FROM [tblProject] WHERE ([ProjectID] = @ProjectID)))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProjects" Name="ProjectID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsWWUEntity" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblWWUEntity] WHERE ([WWUEntityID] = (SELECT WWUEntityID FROM [tblProject] WHERE ([ProjectID] = @ProjectID)))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProjects" Name="ProjectID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    Select a project to generate a report:
                    <asp:DropDownList ID="ddlProjects" CssClass="chosen-select" runat="server" DataSourceID="sdsProjects" DataTextField="ProjectName" DataValueField="ProjectID" AutoPostBack="True" Width="250px"></asp:DropDownList>
                    <br />
                    Print Friendly page
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Reporting/ProjectReportingAlt.aspx">Here</asp:HyperLink>
                    <h2>Project Information</h2>
                    <asp:ListView ID="lvProjectDetails" runat="server" DataSourceID="sdsProjectDetail" DataKeyNames="ProjectID">
                        <EmptyDataTemplate>
                            <span>No data was returned.</span><br />
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

                    <h2>Client</h2>
                    <asp:ListView ID="lvClient" runat="server" DataKeyNames="ClientID" DataSourceID="sdsClient">
                        <EmptyDataTemplate>
                            <span>No Client data was returned.</span><br />
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
                                                <h4>Client ID: <%# Eval("ClientID") %></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row text-center">
                                            <h3><%# Eval("ContactName") %> | <%# Eval("ClientType") %></h3>

                                            <h3><%# Eval("Address") %> <%# Eval("City") %>, <%# Eval("State") %> <%# Eval("Zip") %></h3>

                                            <h3><%# Eval("Phone") %></h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                    <h2>Project Partner</h2>
                    <asp:ListView ID="lvUniversityPartner" runat="server" DataKeyNames="UniversityPartnerID" DataSourceID="sdsUniversityPartner">
                        <EmptyDataTemplate>
                            <span>No Project Partner data was returned.</span><br />
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
                    <h2>WWU Entity</h2>
                    <asp:ListView ID="lvWWUEntity" runat="server" DataKeyNames="WWUEntityID" DataSourceID="sdsWWUEntity">
                        <EmptyDataTemplate>
                            <span>No WWU Entity data was returned.</span><br />
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <div class="row">
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
                            </div>

                            <%--                            <span style="">WWUEntityID:
                            <asp:Label ID="WWUEntityIDLabel" runat="server" Text='<%# Eval("WWUEntityID") %>' />
                                <br />
                                Wnumber:
                            <asp:Label ID="WnumberLabel" runat="server" Text='<%# Eval("Wnumber") %>' />
                                <br />
                                EntityName:
                            <asp:Label ID="EntityNameLabel" runat="server" Text='<%# Eval("EntityName") %>' />
                                <br />
                                EntityPurpose:
                            <asp:Label ID="EntityPurposeLabel" runat="server" Text='<%# Eval("EntityPurpose") %>' />
                                <br />
                                ContactPerson:
                            <asp:Label ID="ContactPersonLabel" runat="server" Text='<%# Eval("ContactPerson") %>' />
                                <br />
                                RelationshipType:
                            <asp:Label ID="RelationshipTypeLabel" runat="server" Text='<%# Eval("RelationshipType") %>' />
                                <br />
                                ActivityType:
                            <asp:Label ID="ActivityTypeLabel" runat="server" Text='<%# Eval("ActivityType") %>' />
                                <br />
                                <asp:CheckBox ID="ClientIsInternalWWUCheckBox" runat="server" Checked='<%# Eval("ClientIsInternalWWU") %>' Enabled="false" Text="ClientIsInternalWWU" />
                                <br />
                                <asp:CheckBox ID="ClientIsForProfitCheckBox" runat="server" Checked='<%# Eval("ClientIsForProfit") %>' Enabled="false" Text="ClientIsForProfit" />
                                <br />
                                <asp:CheckBox ID="ClientIsNonProfitCheckBox" runat="server" Checked='<%# Eval("ClientIsNonProfit") %>' Enabled="false" Text="ClientIsNonProfit" />
                                <br />
                                <asp:CheckBox ID="ClientIsGovernmentCheckBox" runat="server" Checked='<%# Eval("ClientIsGovernment") %>' Enabled="false" Text="ClientIsGovernment" />
                                <br />
                                <asp:CheckBox ID="ClientIsTribalCheckBox" runat="server" Checked='<%# Eval("ClientIsTribal") %>' Enabled="false" Text="ClientIsTribal" />
                                <br />
                                <asp:CheckBox ID="EngagementIsProjectCheckBox" runat="server" Checked='<%# Eval("EngagementIsProject") %>' Enabled="false" Text="EngagementIsProject" />
                                <br />
                                <asp:CheckBox ID="EngagementIsQuarterCheckBox" runat="server" Checked='<%# Eval("EngagementIsQuarter") %>' Enabled="false" Text="EngagementIsQuarter" />
                                <br />
                                <asp:CheckBox ID="EngagementIsContractCheckBox" runat="server" Checked='<%# Eval("EngagementIsContract") %>' Enabled="false" Text="EngagementIsContract" />
                                <br />
                                <br />
                            </span>--%>
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

