<%@ Control Language="C#" ClassName="Navigation" %>

<script runat="server">

</script>
<div class="row hidden-print PrintNone">
    <h3>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Home</asp:HyperLink></h3>
    <br />
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>Entities</h3>
                </div>
                <div class="panel-body">
                    <asp:LinkButton ID="lbSearch" runat="server" CssClass="btn btn-primary" PostBackUrl="~/EntityManagement/EntitySearch.aspx">Search Entities</asp:LinkButton>
                    <br />
                    <br />
                    <asp:HyperLink ID="hlWWUEntityManagement" runat="server" NavigateUrl="~/EntityManagement/WWUEntityManagement.aspx">WWU Entities</asp:HyperLink><br />
                    <asp:HyperLink ID="hlClientManagement" runat="server" NavigateUrl="~/EntityManagement/ClientEntityManagement.aspx">Client Entities</asp:HyperLink><br />
                    <asp:HyperLink ID="hlUniversityPartnerManagement" runat="server" NavigateUrl="~/EntityManagement/PartnersManagement.aspx">Partner Entities</asp:HyperLink><br />
                    
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>Project Entry</h3>
                </div>
                <div class="panel-body">
                    <asp:HyperLink ID="hlProjectManagement" runat="server" NavigateUrl="~/EntityManagement/ProjectManagement.aspx">Project</asp:HyperLink><br />
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>Reporting</h3>
                </div>
                <div class="panel-body">
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Reporting/ProjectReporting.aspx">Project</asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Reporting/WWUEntityReporting.aspx">WWU Entity</asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Reporting/PartnerReporting.aspx">Project Partner</asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Reporting/ClientReporting.aspx">Clients</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</div>
