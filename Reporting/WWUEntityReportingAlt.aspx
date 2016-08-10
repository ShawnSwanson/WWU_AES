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
        <h3>WWU Entity Detail Report</h3>
        <div>
            <asp:SqlDataSource ID="sdsEntityDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT [WWUEntityID], [EntityName] FROM [tblWWUEntity]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsReportClients" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblClient] WHERE ([WWUEntityID] = @WWUEntityID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="WWUEntityID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsReportProjects" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblProject] WHERE ([WWUEntityID] = @WWUEntityID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="WWUEntityID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsUPartners" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblUniversityPartner] WHERE ([WWUEntityID] = @WWUEntityID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="WWUEntityID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsWWUEntityDetail" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblWWUEntity] WHERE ([WWUEntityID] = @WWUEntityID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="WWUEntityID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="hidden-print">
                Select a WWU Entity to develop a report:
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sdsEntityDropDown" DataTextField="EntityName" DataValueField="WWUEntityID" AutoPostBack="True" CssClass="chosen-select" Width="250px"></asp:DropDownList>
            </div>

            <h2 class="PrintNone">WWU Entity Detail</h2>
            <asp:ListView ID="lvWWUDetail" runat="server" DataKeyNames="WWUEntityID" DataSourceID="sdsWWUEntityDetail">
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

            <h2>Clients</h2>
            <asp:ListView ID="lvClients" runat="server" DataKeyNames="ClientID" DataSourceID="sdsReportClients">
                <EmptyDataTemplate>
                    <span>This Entity has no registered Clients.</span><br />
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
            <asp:ListView ID="lvProjects" runat="server" DataKeyNames="ProjectID" DataSourceID="sdsReportProjects">
                <EmptyDataTemplate>
                    <span>The Selected Entity has no project records in the database.</span><br />
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

            <h2>Project Partners Created</h2>
            <asp:ListView ID="lvUPartners" runat="server" DataSourceID="sdsUPartners" DataKeyNames="UniversityPartnerID">
                <EmptyDataTemplate>
                    <span>The Selected Entity has not created any project partners.</span><br />
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
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" runat="Server">
    <uc1:Footer runat="server" ID="Footer" />
</asp:Content>

