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
        <h3>Entity Search</h3>
        <div>
            <div class="hidden-print">
                <h4>Enter a search term:</h4>
            </div>
            <asp:TextBox ID="tbSearch" runat="server" CssClass="form-control" Width="20%"></asp:TextBox><br />
            <asp:SqlDataSource ID="sdsWWUEntity" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblWWUEntity] WHERE (([ActivityType] LIKE '%' + @ActivityType + '%') OR ([EntityName] LIKE '%' + @EntityName + '%') OR ([ContactPerson] LIKE '%' + @ContactPerson + '%') OR ([EntityPurpose] LIKE '%' + @EntityPurpose + '%'))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbSearch" Name="ActivityType" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="EntityName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="ContactPerson" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="EntityPurpose" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="Wnumber" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsClient" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT DISTINCT [ClientID], [OrganizationName], [ContactName], [Address], [City], [State], [Zip], [Email], [Phone], [WWUEntityID], [ClientType] FROM [tblClient] WHERE (([Address] LIKE '%' + @Address + '%') OR ([ClientType] LIKE '%' + @ClientType + '%') OR ([City] LIKE '%' + @City + '%') OR ([ContactName] LIKE '%' + @ContactName + '%') OR ([Email] LIKE '%' + @Email + '%') OR ([OrganizationName] LIKE '%' + @OrganizationName + '%') OR ([Phone] LIKE '%' + @Phone + '%') OR ([State] LIKE '%' + @State + '%') OR ([Zip] LIKE '%' + @Zip + '%'))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbSearch" Name="Address" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="ClientType" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="City" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="ContactName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="Email" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="OrganizationName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="Phone" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="State" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="Zip" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsUPartner" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT DISTINCT [UniversityPartnerID], [OrganizationName], [ContactName], [Address], [City], [State], [ZIP], [Email], [Phone], [WWUEntityID], [Notes] FROM [tblUniversityPartner] WHERE (([Address] LIKE '%' + @Address + '%') OR ([City] LIKE '%' + @City + '%') OR ([ContactName] LIKE '%' + @ContactName + '%') OR ([Email] LIKE '%' + @Email + '%') OR ([Notes] LIKE '%' + @Notes + '%') OR ([OrganizationName] LIKE '%' + @OrganizationName + '%') OR ([Phone] LIKE '%' + @Phone + '%') OR ([State] LIKE '%' + @State + '%') OR ([ZIP] LIKE '%' + @ZIP + '%'))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbSearch" Name="Address" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="City" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="ContactName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="Email" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="Notes" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="OrganizationName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="Phone" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="State" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="ZIP" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsProject" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT DISTINCT [ProjectID], [ProjectName], [ClientID], [WWUEntityID], [StartOfEngagement], [EndOfEngagement], [SpecificProjectActivity], [UniversityPartnerID], [NumberOfFaculty],[FacultyHours], [NumberOfStaff],[StaffHours], [NumberOfStudents],[StudentHours], [ActivityFee], [ActivityType], [RelationshipType], [EngagementType] FROM [tblProject] WHERE (([ActivityType] LIKE '%' + @ActivityType + '%') OR ([EngagementType] LIKE '%' + @EngagementType + '%') OR ([ProjectName] LIKE '%' + @ProjectName + '%') OR ([RelationshipType] LIKE '%' + @RelationshipType + '%') OR ([SpecificProjectActivity] LIKE '%' + @SpecificProjectActivity + '%'))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbSearch" Name="ActivityType" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="EngagementType" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="ProjectName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="RelationshipType" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbSearch" Name="SpecificProjectActivity" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <h1>WWU Entities</h1>
            <asp:ListView ID="lvWWUEntity" runat="server" DataKeyNames="WWUEntityID" DataSourceID="sdsWWUEntity">
                <EmptyDataTemplate>
                    <span>No data</span>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <div class="row noBreak">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-11">
                            <table >
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

            <hr />

            <h1>Clients</h1>
            <asp:ListView ID="lvClient" runat="server" DataKeyNames="ClientID" DataSourceID="sdsClient">
                <EmptyDataTemplate>
                    <span>No data</span>
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

            <hr />

            <h1>Project Partners</h1>
            <asp:ListView ID="lvUPartner" runat="server" DataKeyNames="UniversityPartnerID" DataSourceID="sdsUPartner">
                <EmptyDataTemplate>
                    <span>No data</span>
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
            <hr />

            <h1>Projects</h1>
            <asp:ListView ID="lvProjects" runat="server" DataKeyNames="ProjectID" DataSourceID="sdsProject">
                <EmptyDataTemplate>
                    <span>No data</span>
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
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" runat="Server">
    <uc1:Footer runat="server" ID="Footer" />
</asp:Content>

