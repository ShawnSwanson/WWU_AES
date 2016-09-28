<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableViewState="false" %>

<%@ Register Src="~/controls/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>
<%@ Register Src="~/controls/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>



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
                    <h3>Client Entity Management</h3>
                </div>
                <div class="panel-body">
                    <asp:SqlDataSource ID="sdsGrid" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [URCD_UniversityProjects].[WWU\swanso31].[tblClient]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsDetail" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" DeleteCommand="DELETE FROM [URCD_UniversityProjects].[WWU\swanso31].[tblClient] WHERE [ClientID] = @ClientID" InsertCommand="INSERT INTO [URCD_UniversityProjects].[WWU\swanso31].[tblClient] ([OrganizationName], [ContactName], [Address], [City], [State], [Zip], [Email], [Phone], [WWUEntityID], [ClientType]) VALUES (@OrganizationName, @ContactName, @Address, @City, @State, @Zip, @Email, @Phone, @WWUEntityID, @ClientType)" SelectCommand="SELECT * FROM [URCD_UniversityProjects].[WWU\swanso31].[tblClient] WHERE ([ClientID] = @ClientID)" UpdateCommand="UPDATE [URCD_UniversityProjects].[WWU\swanso31].[tblClient] SET [OrganizationName] = @OrganizationName, [ContactName] = @ContactName, [Address] = @Address, [City] = @City, [State] = @State, [Zip] = @Zip, [Email] = @Email, [Phone] = @Phone, [WWUEntityID] = @WWUEntityID, [ClientType] = @ClientType WHERE [ClientID] = @ClientID">
                        <DeleteParameters>
                            <asp:Parameter Name="ClientID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="OrganizationName" Type="String" />
                            <asp:Parameter Name="ContactName" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="Zip" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="WWUEntityID" Type="Int32" />
                            <asp:Parameter Name="ClientType" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="ClientID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="OrganizationName" Type="String" />
                            <asp:Parameter Name="ContactName" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="Zip" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="WWUEntityID" Type="Int32" />
                            <asp:Parameter Name="ClientType" Type="String" />
                            <asp:Parameter Name="ClientID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsDropDownWWU" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT [WWUEntityID], [EntityName] FROM [URCD_UniversityProjects].[WWU\swanso31].[tblWWUEntity]"></asp:SqlDataSource>
                    <asp:DetailsView ID="DetailsView1" runat="server" Width="80%" AutoGenerateRows="False" DataKeyNames="ClientID" DataSourceID="sdsDetail" HorizontalAlign="Center" GridLines="None" CssClass="table table-striped table-hover">
                        <Fields>
                            <asp:BoundField DataField="ClientID" HeaderText="ClientID" InsertVisible="False" ReadOnly="True" SortExpression="ClientID" />
                            <asp:TemplateField HeaderText="Organization Name*" SortExpression="OrganizationName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("OrganizationName") %>' CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("OrganizationName") %>' CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("OrganizationName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact Name*" SortExpression="ContactName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ContactName") %>' CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field is Required" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ContactName") %>' CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field is Required"  ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ContactName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address" SortExpression="Address">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Address") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Address") %>' CssClass="form-control"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City" SortExpression="City">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("City") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("City") %>' CssClass="form-control"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="State" SortExpression="State">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("State") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("State") %>' CssClass="form-control"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Zip" SortExpression="Zip">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Zip") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Zip") %>' CssClass="form-control"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Zip") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbEmail" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="tbEmail" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Phone") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Phone") %>' CssClass="form-control"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Select your WWU Entity*" SortExpression="WWUEntityID">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control chosen-select" DataSourceID="sdsDropDownWWU" DataTextField="EntityName" DataValueField="WWUEntityID" SelectedValue='<%# Bind("WWUEntityID") %>'></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Field is required" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                                    <%--                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("WWUEntityID") %>'></asp:TextBox>--%>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control chosen-select" DataSourceID="sdsDropDownWWU" DataTextField="EntityName" DataValueField="WWUEntityID" SelectedValue='<%# Bind("WWUEntityID") %>'></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Field is required" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                                    <%--                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("WWUEntityID") %>'></asp:TextBox>--%>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("WWUEntityID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Client Type*" SortExpression="ClientType">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("ClientType") %>' CssClass="form-control">
                                        <asp:ListItem>Internal to WWU</asp:ListItem>
                                        <asp:ListItem>For Profit</asp:ListItem>
                                        <asp:ListItem>Non-Profit</asp:ListItem>
                                        <asp:ListItem>Government</asp:ListItem>
                                        <asp:ListItem>Tribal</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Field is Required" ControlToValidate="DropDownList2"></asp:RequiredFieldValidator>
                                    <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ClientType") %>'></asp:TextBox>--%>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("ClientType") %>' CssClass="form-control">
                                        <asp:ListItem>Internal to WWU</asp:ListItem>
                                        <asp:ListItem>For Profit</asp:ListItem>
                                        <asp:ListItem>Non-Profit</asp:ListItem>
                                        <asp:ListItem>Government</asp:ListItem>
                                        <asp:ListItem>Tribal</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Field is Required" ControlToValidate="DropDownList2"></asp:RequiredFieldValidator>
                                    <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ClientType") %>'></asp:TextBox>--%>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ClientType") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger pull-right"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary pull-right"></asp:LinkButton>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger pull-right"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary pull-right" ></asp:LinkButton>
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
                    <br />
                    <br />
                    <h6>Click column headings to sort</h6>
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ClientID" DataSourceID="sdsGrid" HorizontalAlign="Center" AllowSorting="True" CssClass="table-hover" GridLines="Horizontal" BorderStyle="None">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ClientID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ClientID" />
                            <asp:BoundField DataField="OrganizationName" HeaderText="OrganizationName" SortExpression="OrganizationName" />
                            <asp:BoundField DataField="ContactName" HeaderText="ContactName" SortExpression="ContactName" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                            <asp:BoundField DataField="WWUEntityID" HeaderText="Created by WWU Entity" SortExpression="WWUEntityID" />
                            <asp:BoundField DataField="ClientType" HeaderText="ClientType" SortExpression="ClientType" />
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

