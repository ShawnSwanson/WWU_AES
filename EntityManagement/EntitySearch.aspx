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
                    <h3>Entity Search</h3>
                </div>
                <div class="panel-body">
                    <div class="hidden-print">
                        <h4>Enter a search term:</h4>
                    </div>
                    <asp:TextBox ID="tbSearch" runat="server" CssClass="form-control" Width="20%"></asp:TextBox><br />
                    <div class="hidden-print">
                        Or go to a print friendly page
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/EntityManagement/EntitySearchAlt.aspx">Here</asp:HyperLink>
                    </div>
                    <asp:SqlDataSource ID="sdsWWUEntity" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblWWUEntity] WHERE (([ActivityType] LIKE '%' + @ActivityType + '%') OR ([EntityName] LIKE '%' + @EntityName + '%') OR ([ContactPerson] LIKE '%' + @ContactPerson + '%') OR ([EntityPurpose] LIKE '%' + @EntityPurpose + '%') OR ([Wnumber] LIKE '%' + @Wnumber + '%'))">
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
                    <asp:SqlDataSource ID="sdsProject" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT DISTINCT [ProjectID], [ProjectName], [ClientID], [WWUEntityID], [StartOfEngagement], [EndOfEngagement], [SpecificProjectActivity], [UniversityPartnerID], [NumberOfFaculty], [NumberOfStaff], [NumberOfStudents], [ActivityFee], [ActivityType], [RelationshipType], [EngagementType] FROM [tblProject] WHERE (([ActivityType] LIKE '%' + @ActivityType + '%') OR ([EngagementType] LIKE '%' + @EngagementType + '%') OR ([ProjectName] LIKE '%' + @ProjectName + '%') OR ([RelationshipType] LIKE '%' + @RelationshipType + '%') OR ([SpecificProjectActivity] LIKE '%' + @SpecificProjectActivity + '%'))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="tbSearch" Name="ActivityType" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="tbSearch" Name="EngagementType" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="tbSearch" Name="ProjectName" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="tbSearch" Name="RelationshipType" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="tbSearch" Name="SpecificProjectActivity" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <h2>WWU Entities</h2>
                    <asp:ListView ID="lvWWUEntity" runat="server" DataKeyNames="WWUEntityID" DataSourceID="sdsWWUEntity">
                        <EmptyDataTemplate>
                            <span>No data</span>
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

                            <%--<span style="">WWUEntityID:
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
                    <hr />
                    <h2>Clients</h2>
                    <div class="row">
                        <asp:ListView ID="lvClient" runat="server" DataKeyNames="ClientID" DataSourceID="sdsClient">
                            <EmptyDataTemplate>
                                <span>No data</span>
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

                                <%--<span style="">ClientID:
                            <asp:Label ID="ClientIDLabel" runat="server" Text='<%# Eval("ClientID") %>' />
                                <br />
                                OrganizationName:
                            <asp:Label ID="OrganizationNameLabel" runat="server" Text='<%# Eval("OrganizationName") %>' />
                                <br />
                                ContactName:
                            <asp:Label ID="ContactNameLabel" runat="server" Text='<%# Eval("ContactName") %>' />
                                <br />
                                Address:
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                                <br />
                                City:
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                                <br />
                                State:
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                                <br />
                                Zip:
                            <asp:Label ID="ZipLabel" runat="server" Text='<%# Eval("Zip") %>' />
                                <br />
                                Email:
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                <br />
                                Phone:
                            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                                <br />
                                WWUEntityID:
                            <asp:Label ID="WWUEntityIDLabel" runat="server" Text='<%# Eval("WWUEntityID") %>' />
                                <br />
                                ClientType:
                            <asp:Label ID="ClientTypeLabel" runat="server" Text='<%# Eval("ClientType") %>' />
                                <br />
                                <br />
                            </span>--%>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                    <hr />
                    <h2>University Partners</h2>
                    <div class="row">
                        <asp:ListView ID="lvUPartner" runat="server" DataKeyNames="UniversityPartnerID" DataSourceID="sdsUPartner">
                            <EmptyDataTemplate>
                                <span>No data</span>
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

                                <%--<span style="">UniversityPartnerID:
                            <asp:Label ID="UniversityPartnerIDLabel" runat="server" Text='<%# Eval("UniversityPartnerID") %>' />
                                <br />
                                OrganizationName:
                            <asp:Label ID="OrganizationNameLabel" runat="server" Text='<%# Eval("OrganizationName") %>' />
                                <br />
                                ContactName:
                            <asp:Label ID="ContactNameLabel" runat="server" Text='<%# Eval("ContactName") %>' />
                                <br />
                                Address:
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                                <br />
                                City:
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                                <br />
                                State:
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                                <br />
                                ZIP:
                            <asp:Label ID="ZIPLabel" runat="server" Text='<%# Eval("ZIP") %>' />
                                <br />
                                Email:
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                <br />
                                Phone:
                            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                                <br />
                                WWUEntityID:
                            <asp:Label ID="WWUEntityIDLabel" runat="server" Text='<%# Eval("WWUEntityID") %>' />
                                <br />
                                Notes:
                            <asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes") %>' />
                                <br />
                                <br />
                            </span>--%>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                    <hr />
                    <h2>Projects</h2>
                    <asp:ListView ID="lvProjects" runat="server" DataKeyNames="ProjectID" DataSourceID="sdsProject">
                        <EmptyDataTemplate>
                            <span>No data</span>
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

                            <%--<span style="">ProjectID:
                            <asp:Label ID="ProjectIDLabel" runat="server" Text='<%# Eval("ProjectID") %>' />
                                <br />
                                ProjectName:
                            <asp:Label ID="ProjectNameLabel" runat="server" Text='<%# Eval("ProjectName") %>' />
                                <br />
                                ClientID:
                            <asp:Label ID="ClientIDLabel" runat="server" Text='<%# Eval("ClientID") %>' />
                                <br />
                                WWUEntityID:
                            <asp:Label ID="WWUEntityIDLabel" runat="server" Text='<%# Eval("WWUEntityID") %>' />
                                <br />
                                StartOfEngagement:
                            <asp:Label ID="StartOfEngagementLabel" runat="server" Text='<%# Eval("StartOfEngagement") %>' />
                                <br />
                                EndOfEngagement:
                            <asp:Label ID="EndOfEngagementLabel" runat="server" Text='<%# Eval("EndOfEngagement") %>' />
                                <br />
                                SpecificProjectActivity:
                            <asp:Label ID="SpecificProjectActivityLabel" runat="server" Text='<%# Eval("SpecificProjectActivity") %>' />
                                <br />
                                UniversityPartnerID:
                            <asp:Label ID="UniversityPartnerIDLabel" runat="server" Text='<%# Eval("UniversityPartnerID") %>' />
                                <br />
                                NumberOfFaculty:
                            <asp:Label ID="NumberOfFacultyLabel" runat="server" Text='<%# Eval("NumberOfFaculty") %>' />
                                <br />
                                NumberOfStaff:
                            <asp:Label ID="NumberOfStaffLabel" runat="server" Text='<%# Eval("NumberOfStaff") %>' />
                                <br />
                                NumberOfStudents:
                            <asp:Label ID="NumberOfStudentsLabel" runat="server" Text='<%# Eval("NumberOfStudents") %>' />
                                <br />
                                <asp:CheckBox ID="ActivityFeeCheckBox" runat="server" Checked='<%# Eval("ActivityFee") %>' Enabled="false" Text="ActivityFee" />
                                <br />
                                ActivityType:
                            <asp:Label ID="ActivityTypeLabel" runat="server" Text='<%# Eval("ActivityType") %>' />
                                <br />
                                RelationshipType:
                            <asp:Label ID="RelationshipTypeLabel" runat="server" Text='<%# Eval("RelationshipType") %>' />
                                <br />
                                EngagementType:
                            <asp:Label ID="EngagementTypeLabel" runat="server" Text='<%# Eval("EngagementType") %>' />
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

