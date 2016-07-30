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
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" runat="Server">
    <uc1:Footer runat="server" ID="Footer" />
</asp:Content>

