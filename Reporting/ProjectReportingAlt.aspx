<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<%@ Register Src="~/controls/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/controls/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>


<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="cphNavigation" runat="Server">
    <uc1:Navigation runat="server" ID="Navigation" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <div class="row">
        <h3>Project Detail Report</h3>
        <div>
            <asp:SqlDataSource ID="sdsProjects" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [URCD_UniversityProjects].[WWU\swanso31].[tblProject]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsProjectDetail" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [URCD_UniversityProjects].[WWU\swanso31].[tblProject] WHERE ([ProjectID] = @ProjectID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProjects" Name="ProjectID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="sdsClient" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [URCD_UniversityProjects].[WWU\swanso31].[tblClient] WHERE (ClientID = (SELECT ClientID FROM [URCD_UniversityProjects].[WWU\swanso31].[tblProject] WHERE (ProjectID = @ProjectID)))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProjects" Name="ProjectID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsUniversityPartner" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [URCD_UniversityProjects].[WWU\swanso31].[tblUniversityPartner] WHERE ([UniversityPartnerID] = (SELECT UniversityPartnerID FROM [URCD_UniversityProjects].[WWU\swanso31].[tblProject] WHERE ([ProjectID] = @ProjectID)))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProjects" Name="ProjectID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsWWUEntity" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [URCD_UniversityProjects].[WWU\swanso31].[tblWWUEntity] WHERE ([WWUEntityID] = (SELECT WWUEntityID FROM [URCD_UniversityProjects].[WWU\swanso31].[tblProject] WHERE ([ProjectID] = @ProjectID)))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProjects" Name="ProjectID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>

            <div class="hidden-print">
                Select a project to generate a report:
                    <asp:DropDownList ID="ddlProjects" runat="server" DataSourceID="sdsProjects" DataTextField="ProjectName" DataValueField="ProjectID" AutoPostBack="True" CssClass="chosen-select" Width="250px"></asp:DropDownList>
            </div>

            <h2 class="PrintNone">Project Information</h2>
            <asp:ListView ID="lvProjectDetails" runat="server" DataSourceID="sdsProjectDetail" DataKeyNames="ProjectID">
                <EmptyDataTemplate>
                    <span>No data was returned.</span><br />
                </EmptyDataTemplate>
                <ItemTemplate>
                    <div class="row noBreak">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-11">
                            <table>
                                <tr>
                                    <td style="padding:5px;">
                                        <h3><%# Eval("ProjectName") %></h3>
                                        Project ID: <%# Eval("ProjectID") %><br />
                                        Client ID: <%# Eval("ClientID") %>
                                        <br />
                                        WWU Entity ID: <%# Eval("WWUEntityID") %>
                                        <br />
                                        University Partner ID: <%# Eval("UniversityPartnerID") %>
                                        <br />
                                        Engagement Type: <%# Eval("EngagementType") %>
                                        <br />
                                        Activity Type: <%# Eval("ActivityType") %>
                                        <br />
                                        <asp:CheckBox ID="CheckBox9" runat="server" Checked='<%# Eval("ActivityFee") %>' Enabled="false" Text="Activity Has Fee" />
                                    </td>
                                    <td style="padding:5px;">
                                        <br />
                                        <br />
                                        Project Start: <%# Eval("StartOfEngagement", "{0:d}") %><br />
                                        Project End: <%# Eval("EndOfEngagement", "{0:d}") %><br />
                                        Faculty: <%# Eval("NumberOfFaculty") %> | Hours: <%# Eval("FacultyHours") %><br />
                                        Staff: <%# Eval("NumberOfStaff") %> | Hours: <%# Eval("StaffHours") %><br />
                                        Students: <%# Eval("NumberOfStudents") %> | Hours: <%# Eval("StudentHours") %><br />
                                        Relationship Type: <%# Eval("RelationshipType") %>
                                    </td>
                                </tr>
                            </table>
                            <div class="col-sm-12">
                                <hr />
                                <em><%# Eval("SpecificProjectActivity") %></em>
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
                    <div class="row noBreak">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-11">
                            <h3><%# Eval("OrganizationName") %></h3>
                            Client ID: <%# Eval("ClientID") %>
                            <br />
                            <%# Eval("ContactName") %> | <%# Eval("ClientType") %>
                            <br />
                            <%# Eval("Address") %> <%# Eval("City") %>, <%# Eval("State") %> <%# Eval("Zip") %>
                            <br />
                            <%# Eval("Phone") %>
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
                    <div class="row noBreak">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-11">
                            <h3><%# Eval("OrganizationName") %></h3>
                            University Partner ID: <%# Eval("UniversityPartnerID") %><br />
                            <%# Eval("ContactName") %><br />
                            <%# Eval("Phone") %> | <%# Eval("Email") %><br />
                            <%# Eval("Address") %> <%# Eval("City") %>, <%# Eval("State") %> <%# Eval("ZIP") %>
                            <hr />
                            <em>
                                <%# Eval("Notes") %>
                            </em>
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
                    <div class="row noBreak">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-11">
                            <table>
                                <tr>
                                    <td style="padding:5px;">
                                        <h3><%# Eval("EntityName") %></h3>
                                        WWU Entity ID: <%# Eval("WWUEntityID") %><br />
                                        <br />
                                        Contact: <%# Eval("ContactPerson") %>
                                        <br />
                                        <%# Eval("ActivityType") %>
                                                
                                    </td>
                                    <td style="padding:5px;">
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("ClientIsInternalWWU") %>' Enabled="false" Text="Internal Clients" />
                                        <br />
                                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Eval("ClientIsForProfit") %>' Enabled="false" Text="For Profit Clients" />
                                        <br />
                                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Eval("ClientIsNonProfit") %>' Enabled="false" Text="Non Profit Clients" />
                                        <br />
                                        <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Eval("ClientIsGovernment") %>' Enabled="false" Text="Government Clients" />
                                        <br />
                                        <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Eval("ClientIsTribal") %>' Enabled="false" Text="Tribal Clients" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Eval("EngagementIsProject") %>' Enabled="false" Text="Project Engagements" />
                                        <br />
                                        <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Eval("EngagementIsQuarter") %>' Enabled="false" Text="Quarterly Engagements" />
                                        <br />
                                        <asp:CheckBox ID="CheckBox8" runat="server" Checked='<%# Eval("EngagementIsContract") %>' Enabled="false" Text="Contract Engagements" />
                                    </td>
                                </tr>
                            </table>
                            <div class="col-sm-12">
                                <hr />
                                <em><%# Eval("EntityPurpose") %></em>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" runat="Server">
    <uc1:Footer runat="server" ID="Footer" />
</asp:Content>

