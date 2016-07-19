<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableViewState="False" %>

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
                    <h3>WWU Entity Management</h3>
                </div>
                <div class="panel-body">
                    <asp:SqlDataSource ID="sdsList" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblWWUEntity]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsDetail" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblWWUEntity] WHERE ([WWUEntityID] = @WWUEntityID)" DeleteCommand="DELETE FROM [tblWWUEntity] WHERE [WWUEntityID] = @WWUEntityID" InsertCommand="INSERT INTO [tblWWUEntity] ([Wnumber], [EntityName], [EntityPurpose], [ContactPerson], [ActivityType], [ClientIsInternalWWU], [ClientIsForProfit], [ClientIsNonProfit], [ClientIsGovernment], [ClientIsTribal], [EngagementIsProject], [EngagementIsQuarter], [EngagementIsContract]) VALUES (@Wnumber, @EntityName, @EntityPurpose, @ContactPerson, @ActivityType, @ClientIsInternalWWU, @ClientIsForProfit, @ClientIsNonProfit, @ClientIsGovernment, @ClientIsTribal, @EngagementIsProject, @EngagementIsQuarter, @EngagementIsContract)" UpdateCommand="UPDATE [tblWWUEntity] SET [Wnumber] = @Wnumber, [EntityName] = @EntityName, [EntityPurpose] = @EntityPurpose, [ContactPerson] = @ContactPerson, [ActivityType] = @ActivityType, [ClientIsInternalWWU] = @ClientIsInternalWWU, [ClientIsForProfit] = @ClientIsForProfit, [ClientIsNonProfit] = @ClientIsNonProfit, [ClientIsGovernment] = @ClientIsGovernment, [ClientIsTribal] = @ClientIsTribal, [EngagementIsProject] = @EngagementIsProject, [EngagementIsQuarter] = @EngagementIsQuarter, [EngagementIsContract] = @EngagementIsContract WHERE [WWUEntityID] = @WWUEntityID">
                        <DeleteParameters>
                            <asp:Parameter Name="WWUEntityID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Wnumber" Type="String" />
                            <asp:Parameter Name="EntityName" Type="String" />
                            <asp:Parameter Name="EntityPurpose" Type="String" />
                            <asp:Parameter Name="ContactPerson" Type="String" />
                            <asp:Parameter Name="ActivityType" Type="String" />
                            <asp:Parameter Name="ClientIsInternalWWU" Type="Boolean" />
                            <asp:Parameter Name="ClientIsForProfit" Type="Boolean" />
                            <asp:Parameter Name="ClientIsNonProfit" Type="Boolean" />
                            <asp:Parameter Name="ClientIsGovernment" Type="Boolean" />
                            <asp:Parameter Name="ClientIsTribal" Type="Boolean" />
                            <asp:Parameter Name="EngagementIsProject" Type="Boolean" />
                            <asp:Parameter Name="EngagementIsQuarter" Type="Boolean" />
                            <asp:Parameter Name="EngagementIsContract" Type="Boolean" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="WWUEntityID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Wnumber" Type="String" />
                            <asp:Parameter Name="EntityName" Type="String" />
                            <asp:Parameter Name="EntityPurpose" Type="String" />
                            <asp:Parameter Name="ContactPerson" Type="String" />
                            <asp:Parameter Name="ActivityType" Type="String" />
                            <asp:Parameter Name="ClientIsInternalWWU" Type="Boolean" />
                            <asp:Parameter Name="ClientIsForProfit" Type="Boolean" />
                            <asp:Parameter Name="ClientIsNonProfit" Type="Boolean" />
                            <asp:Parameter Name="ClientIsGovernment" Type="Boolean" />
                            <asp:Parameter Name="ClientIsTribal" Type="Boolean" />
                            <asp:Parameter Name="EngagementIsProject" Type="Boolean" />
                            <asp:Parameter Name="EngagementIsQuarter" Type="Boolean" />
                            <asp:Parameter Name="EngagementIsContract" Type="Boolean" />
                            <asp:Parameter Name="WWUEntityID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <div class="hidden-print">
                        <asp:DetailsView ID="DetailsView1" runat="server" Width="80%" AutoGenerateRows="False" DataKeyNames="WWUEntityID" DataSourceID="sdsDetail" HorizontalAlign="Center" GridLines="None" CssClass="table table-striped table-hover">
                            <Fields>
                                <asp:BoundField DataField="WWUEntityID" HeaderText="WWUEntityID" InsertVisible="False" ReadOnly="True" SortExpression="WWUEntityID" />
                                <asp:TemplateField HeaderText="W Number" SortExpression="Wnumber">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Wnumber") %>' CssClass="form-control"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Wnumber") %>' CssClass="form-control"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Wnumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Entity Name*" SortExpression="EntityName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EntityName") %>' CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EntityName") %>' CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("EntityName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Entity Purpose*" SortExpression="EntityPurpose">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EntityPurpose") %>' CssClass="form-control" TextMode="MultiLine" Height="85px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EntityPurpose") %>' CssClass="form-control"  TextMode="MultiLine" Height="85px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("EntityPurpose") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact Person*" SortExpression="ContactPerson">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ContactPerson") %>' CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ContactPerson") %>' CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ContactPerson") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Activity Type*" SortExpression="ActivityType">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" selectedValue='<%# Bind("ActivityType") %>'>
                                            <asp:ListItem>Course: Credit</asp:ListItem>
                                            <asp:ListItem>Course: Non-Credit</asp:ListItem>
                                            <asp:ListItem>Consulting</asp:ListItem>
                                            <asp:ListItem>Service Learning</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" selectedValue='<%# Bind("ActivityType") %>'>
                                            <asp:ListItem>Course: Credit</asp:ListItem>
                                            <asp:ListItem>Course: Non-Credit</asp:ListItem>
                                            <asp:ListItem>Consulting</asp:ListItem>
                                            <asp:ListItem>Service Learning</asp:ListItem>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ActivityType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CheckBoxField DataField="ClientIsInternalWWU" HeaderText="Clients: Internal to WWU" SortExpression="ClientIsInternalWWU" />
                                <asp:CheckBoxField DataField="ClientIsForProfit" HeaderText="Clients:For Profit" SortExpression="ClientIsForProfit" />
                                <asp:CheckBoxField DataField="ClientIsNonProfit" HeaderText="Clients: NonProfit" SortExpression="ClientIsNonProfit" />
                                <asp:CheckBoxField DataField="ClientIsGovernment" HeaderText="Clients: Government" SortExpression="ClientIsGovernment" />
                                <asp:CheckBoxField DataField="ClientIsTribal" HeaderText="Clients: Tribal" SortExpression="ClientIsTribal" />
                                <asp:CheckBoxField DataField="EngagementIsProject" HeaderText="Engagement: Project" SortExpression="EngagementIsProject" />
                                <asp:CheckBoxField DataField="EngagementIsQuarter" HeaderText="Engagement: Quarter" SortExpression="EngagementIsQuarter" />
                                <asp:CheckBoxField DataField="EngagementIsContract" HeaderText="Engagement: Contract" SortExpression="EngagementIsContract" />
                                
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger pull-right"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary pull-right"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger pull-right"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary pull-right"></asp:LinkButton>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger pull-right"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-info pull-right"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-primary pull-right"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <EmptyDataTemplate>
                                <asp:Button ID="InsertButton" runat="server" CommandName="New" Text="Click to insert new record" CssClass="btn btn-primary" />
                            </EmptyDataTemplate>
                        </asp:DetailsView>
                    </div>
                    <br />
                    <br />
                    <h6>Click column headings to sort</h6>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="WWUEntityID" DataSourceID="sdsList" Width="100%" HorizontalAlign="Center" AllowPaging="True" AllowSorting="True" CssClass="table-hover" GridLines="Horizontal" BorderStyle="None">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" ItemStyle-Width="3%"/>
                            <asp:BoundField DataField="WWUEntityID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="WWUEntityID" HeaderStyle-Width="2%" />
                            <asp:BoundField DataField="Wnumber" HeaderText="W#" SortExpression="Wnumber" HeaderStyle-Width="5%" />
                            <asp:BoundField DataField="EntityName" HeaderText="Entity Name" SortExpression="EntityName" HeaderStyle-Width="8%" />
                            <asp:BoundField DataField="EntityPurpose" HeaderText="Entity Purpose" SortExpression="EntityPurpose" HeaderStyle-Width="15%" />
                            <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" SortExpression="ContactPerson" HeaderStyle-Width="8%" />
                            <asp:BoundField DataField="ActivityType" HeaderText="Activity Type" SortExpression="ActivityType" HeaderStyle-Width="12%" />
                            <asp:CheckBoxField DataField="ClientIsInternalWWU" HeaderText="Client: Internal" SortExpression="ClientIsInternalWWU" />
                            <asp:CheckBoxField DataField="ClientIsForProfit" HeaderText="Client: Profit" SortExpression="ClientIsForProfit" />
                            <asp:CheckBoxField DataField="ClientIsNonProfit" HeaderText="Client: NonProfit" SortExpression="ClientIsNonProfit" />
                            <asp:CheckBoxField DataField="ClientIsGovernment" HeaderText="Client: Government" SortExpression="ClientIsGovernment" />
                            <asp:CheckBoxField DataField="ClientIsTribal" HeaderText="Client: Tribal" SortExpression="ClientIsTribal" />
                            <asp:CheckBoxField DataField="EngagementIsProject" HeaderText="Engagement: Project" SortExpression="EngagementIsProject" />
                            <asp:CheckBoxField DataField="EngagementIsQuarter" HeaderText="Engagement: Quarter" SortExpression="EngagementIsQuarter" />
                            <asp:CheckBoxField DataField="EngagementIsContract" HeaderText="Engagement: Contract" SortExpression="EngagementIsContract" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" runat="Server">
    <uc1:Footer runat="server" ID="Footer" />
</asp:Content>

