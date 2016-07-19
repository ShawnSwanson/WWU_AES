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
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>WWU Entity Detail Report</h3>
                </div>
                <div class="panel-body">
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


                    Select a WWU Entity to develop a report:
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sdsEntityDropDown" DataTextField="EntityName" DataValueField="WWUEntityID" AutoPostBack="True" CssClass="chosen-select" Width="250px"></asp:DropDownList>
                    <br />Print Friendly page <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Reporting/WWUEntityReportingAlt.aspx">Here</asp:HyperLink>

                    <h2>WWU Entity Detail</h2>
                    <asp:ListView ID="lvWWUDetail" runat="server" DataKeyNames="WWUEntityID" DataSourceID="sdsWWUEntityDetail">
                        <EmptyDataTemplate>
                            <span>No data was returned.</span><br />
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
                                                    <h4><%# Eval("Wnumber") %></h4>
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

                    <h2>Clients</h2>
                    <div class="row">
                        <asp:ListView ID="lvClients" runat="server" DataKeyNames="ClientID" DataSourceID="sdsReportClients">
                            <EmptyDataTemplate>
                                <span>This Entity has no registered Clients.</span><br />
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <div class="col-md-6">
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
                    </div>
                    <h2>Projects</h2>
                    <asp:ListView ID="lvProjects" runat="server" DataKeyNames="ProjectID" DataSourceID="sdsReportProjects">
                        <EmptyDataTemplate>
                            <span>The Selected Entity has no project records in the database.</span><br />
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
                                                    Faculty: <%# Eval("NumberOfFaculty") %><br />
                                                    Staff: <%# Eval("NumberOfStaff") %><br />
                                                    Students: <%# Eval("NumberOfStudents") %><br />
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
                            </span>
                        </ItemTemplate>
                    </asp:ListView>
                    <h2>Project Partners Created</h2>
                    <asp:ListView ID="lvUPartners" runat="server" DataSourceID="sdsUPartners" DataKeyNames="UniversityPartnerID">
                        <EmptyDataTemplate>
                            <span>The Selected Entity has not created any project partners.</span><br />
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <div class="col-md-6">
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
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" runat="Server">
    <uc1:Footer runat="server" ID="Footer" />
</asp:Content>

