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
        <h2>Client Detail Report</h2>
        <div>
            <asp:SqlDataSource ID="sdsClientDDL" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT [ClientID], [OrganizationName] FROM [tblClient]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsClientDetail" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblClient] WHERE ([ClientID] = @ClientID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlClients" Name="ClientID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsProjects" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblProject] WHERE ([ClientID] = @ClientID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlClients" Name="ClientID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsWWUEntities" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblWWUEntity] WHERE ([WWUEntityID] IN (SELECT WWUEntityID FROM [tblProject] WHERE ClientID = @ClientID))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlClients" Name="ClientID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="hidden-print">
                Select a Client to generate a report:
                    <asp:DropDownList ID="ddlClients" runat="server" DataSourceID="sdsClientDDL" DataTextField="OrganizationName" DataValueField="ClientID" AutoPostBack="True" CssClass="chosen-select" Width="250px"></asp:DropDownList>
            </div>

            <h2 class="PrintNone">Client Details</h2>
            <asp:ListView ID="lvClientDetail" runat="server" DataKeyNames="ClientID" DataSourceID="sdsClientDetail">
                <EmptyDataTemplate>
                    <span>No data was returned.</span><br />
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

            <h2>Projects</h2>
            <asp:ListView ID="lvProjects" runat="server" DataKeyNames="ProjectID" DataSourceID="sdsProjects">
                <EmptyDataTemplate>
                    <span>No Projects were found for this client.</span><br />
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

            <h2>WWU Entities</h2>
            <asp:ListView ID="lvWWUEntities" runat="server" DataKeyNames="WWUEntityID" DataSourceID="sdsWWUEntities">
                <EmptyDataTemplate>
                    <span>No WWU Entities have worked with this client on record.</span><br />
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
                                    <td style="padding:5px;">
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

