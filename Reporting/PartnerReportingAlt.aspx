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
        <h3>Project Partner Detail Report</h3>
        <div>
            <asp:SqlDataSource ID="sdsUP" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT [UniversityPartnerID], [OrganizationName] FROM [tblUniversityPartner]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsUPDetail" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblUniversityPartner] WHERE ([UniversityPartnerID] = @UniversityPartnerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlUP" Name="UniversityPartnerID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsWWUEntity" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblWWUEntity] WHERE ([WWUEntityID] IN (SELECT DISTINCT WWUEntityID FROM [tblProject] WHERE ([UniversityPartnerID] = @UniversityPartnerID)))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlUP" Name="UniversityPartnerID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsProjects" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblProject] WHERE ([UniversityPartnerID] = @UniversityPartnerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlUP" Name="UniversityPartnerID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="hidden-print">
                Select a Project Partner to generate a report:
                    <asp:DropDownList ID="ddlUP" runat="server" DataSourceID="sdsUP" DataTextField="OrganizationName" DataValueField="UniversityPartnerID" AutoPostBack="true" CssClass="chosen-select" Width="250px"></asp:DropDownList>
            </div>

            <h2 class="PrintNone">Project Partner Details</h2>
            <asp:ListView ID="lvUPDetail" runat="server" DataSourceID="sdsUPDetail" DataKeyNames="UniversityPartnerID">
                <EmptyDataTemplate>
                    <span>No data was returned.</span><br />
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

            <h2>WWU Entity Involvement</h2>
            <asp:ListView ID="lvWWUEntity" runat="server" DataSourceID="sdsWWUEntity" DataKeyNames="WWUEntityID">
                <EmptyDataTemplate>
                    <span>No WWU Entities have worked with this partner on record.</span><br />
                </EmptyDataTemplate>
                <ItemTemplate>
                    <div class="row noBreak">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-11">
                            <table>
                                <tr>
                                    <td>
                                        <h3><%# Eval("EntityName") %></h3>
                                        WWU Entity ID: <%# Eval("WWUEntityID") %><br />
                                        W#: <%# Eval("Wnumber") %>
                                        <br />
                                        Contact: <%# Eval("ContactPerson") %>
                                        <br />
                                        <%# Eval("ActivityType") %>
                                                
                                    </td>
                                    <td>
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

            <h2>Projects</h2>
            <asp:ListView ID="lvProjects" runat="server" DataKeyNames="ProjectID" DataSourceID="sdsProjects">
                <EmptyDataTemplate>
                    <span>This University Partner has not been involved in any recorded Projects.</span><br />
                </EmptyDataTemplate>
                <ItemTemplate>
                    <div class="row noBreak">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-11">
                            <table>
                                <tr>
                                    <td>
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
                                    <td>
                                        <br />
                                        <br />
                                        Project Start: <%# Eval("StartOfEngagement", "{0:d}") %><br />
                                        Project End: <%# Eval("EndOfEngagement", "{0:d}") %><br />
                                        Faculty: <%# Eval("NumberOfFaculty") %><br />
                                        Staff: <%# Eval("NumberOfStaff") %><br />
                                        Students: <%# Eval("NumberOfStudents") %><br />
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
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" runat="Server">
    <uc1:Footer runat="server" ID="Footer" />
</asp:Content>

