﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<%@ Register Src="~/controls/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>
<%@ Register Src="~/controls/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>



<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="cphNavigation" runat="Server">
    <uc1:Navigation runat="server" ID="Navigation" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>Reporting</h3>
                </div>
                <div class="panel-body">
                    <h3>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Reporting/WWUEntityReporting.aspx">WWU Entity</asp:HyperLink><br />
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Reporting/ProjectReporting.aspx">Project</asp:HyperLink><br />
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Reporting/PartnerReporting.aspx">University Partner</asp:HyperLink><br />
                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Reporting/ClientReporting.aspx">Clients</asp:HyperLink>
                    </h3>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>Entity Management</h3>
                </div>
                <div class="panel-body">
                    <h3>
                        <asp:HyperLink ID="hlWWUEntityManagement" runat="server" NavigateUrl="~/EntityManagement/WWUEntityManagement.aspx">WWU Entities</asp:HyperLink><br />
                        <asp:HyperLink ID="hlClientManagement" runat="server" NavigateUrl="~/EntityManagement/ClientEntityManagement.aspx">Client Entities</asp:HyperLink><br />
                        <asp:HyperLink ID="hlUniversityPartnerManagement" runat="server" NavigateUrl="~/EntityManagement/PartnersManagement.aspx">University Partner Entities</asp:HyperLink><br />
                        <asp:HyperLink ID="hlProjectManagement" runat="server" NavigateUrl="~/EntityManagement/ProjectManagement.aspx">Project Entities</asp:HyperLink>
                    </h3>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>AES Overview</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <asp:SqlDataSource ID="sdsDashboard" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT dbStatsReport.* FROM [URCD_UniversityProjects].[WWU\swanso31].[dbStatsReport]"></asp:SqlDataSource>
                        <asp:ListView ID="lvDashboard" runat="server" DataSourceID="sdsDashboard">
                            <EmptyDataTemplate>
                                <span>No data was returned.</span>
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <span style="">
                                    <div class="row">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-3 text-center panel panel-primary panel-body">
                                            <h1><small>Number of Clients:</small><br />
                                            <asp:Label ID="ClientCountLabel" runat="server" Text='<%# Eval("ClientCount") %>' /></h1>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-2 text-center panel panel-primary panel-body">
                                            <h1><small>Project Partners:</small><br />
                                            <asp:Label ID="PartnerCountLabel" runat="server" Text='<%# Eval("PartnerCount") %>' /></h1>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-3 text-center panel panel-primary panel-body">
                                            <h1><small>Western Entities:</small><br />
                                            <asp:Label ID="WWUCountLabel" runat="server" Text='<%# Eval("WWUCount") %>' /></h1>
                                        </div>
                                        <div class="col-sm-1"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-4"></div>
                                        <div class="col-sm-4 text-center panel panel-primary panel-body">
                                            <h1><small>Total Projects Recorded:</small><br />
                                            <asp:Label ID="ProjectCountLabel" runat="server" Text='<%# Eval("ProjectCount") %>' /></h1>
                                        </div>
                                        <div class="col-sm-4"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-3 text-center panel panel-primary panel-body">
                                            <h1><small>Logged Faculty Hours:</small><br />
                                            <asp:Label ID="TotalFacultyHoursLabel" runat="server" Text='<%# Eval("TotalFacultyHours") %>' /></h1>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-2 text-center panel panel-primary panel-body">
                                            <h1><small>Logged Student Hours:</small><br />
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("TotalStudentHours") %>' /></h1>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-3 text-center panel panel-primary panel-body">
                                            <h1><small>Logged Staff Hours:</small><br />
                                            <asp:Label ID="TotalStaffHoursLabel" runat="server" Text='<%# Eval("TotalStaffHours") %>' /></h1>
                                        </div>
                                        <div class="col-sm-1"></div>
                                    </div>
                                    <br />
                                </span>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-2"></div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" runat="Server">
    <uc1:Footer runat="server" ID="Footer" />
</asp:Content>

