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
                    <h3>Project Partner Management</h3>
                </div>
                <div class="panel-body">
                    <asp:SqlDataSource ID="sdsGrid" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT * FROM [tblUniversityPartner]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsDetail" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" DeleteCommand="DELETE FROM [tblUniversityPartner] WHERE [UniversityPartnerID] = @UniversityPartnerID" InsertCommand="INSERT INTO [tblUniversityPartner] ([OrganizationName], [ContactName], [Address], [City], [State], [ZIP], [Email], [Phone], [WWUEntityID], [Notes]) VALUES (@OrganizationName, @ContactName, @Address, @City, @State, @ZIP, @Email, @Phone, @WWUEntityID, @Notes)" SelectCommand="SELECT * FROM [tblUniversityPartner] WHERE ([UniversityPartnerID] = @UniversityPartnerID)" UpdateCommand="UPDATE [tblUniversityPartner] SET [OrganizationName] = @OrganizationName, [ContactName] = @ContactName, [Address] = @Address, [City] = @City, [State] = @State, [ZIP] = @ZIP, [Email] = @Email, [Phone] = @Phone, [WWUEntityID] = @WWUEntityID, [Notes] = @Notes WHERE [UniversityPartnerID] = @UniversityPartnerID">
                        <DeleteParameters>
                            <asp:Parameter Name="UniversityPartnerID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="OrganizationName" Type="String" />
                            <asp:Parameter Name="ContactName" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="ZIP" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="WWUEntityID" Type="Int32" />
                            <asp:Parameter Name="Notes" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="UniversityPartnerID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="OrganizationName" Type="String" />
                            <asp:Parameter Name="ContactName" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="ZIP" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="WWUEntityID" Type="Int32" />
                            <asp:Parameter Name="Notes" Type="String" />
                            <asp:Parameter Name="UniversityPartnerID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dropDownWWU" runat="server" ConnectionString="<%$ ConnectionStrings:CEBR_projectsDatabaseConnectionString %>" SelectCommand="SELECT [WWUEntityID], [EntityName] FROM [tblWWUEntity]"></asp:SqlDataSource>


                    <asp:DetailsView ID="DetailsView1" runat="server" Width="80%" AutoGenerateRows="False" DataKeyNames="UniversityPartnerID" DataSourceID="sdsDetail" HorizontalAlign="Center" GridLines="None" CssClass="table table-striped table-hover">
                        <Fields>
                            <asp:BoundField DataField="UniversityPartnerID" HeaderText="UniversityPartnerID" InsertVisible="False" ReadOnly="True" SortExpression="UniversityPartnerID" />
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
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("OrganizationName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact Name" SortExpression="ContactName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ContactName") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ContactName") %>' CssClass="form-control"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ContactName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address" SortExpression="Address">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Address") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Address") %>' CssClass="form-control"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City" SortExpression="City">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("City") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("City") %>' CssClass="form-control"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="State" SortExpression="State">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("State") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("State") %>' CssClass="form-control"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ZIP" SortExpression="ZIP">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("ZIP") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("ZIP") %>' CssClass="form-control"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("ZIP") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Phone") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Phone") %>' CssClass="form-control"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="WWUEntityID*" SortExpression="WWUEntityID">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dropDownWWU" DataTextField="EntityName" DataValueField="WWUEntityID" SelectedValue='<%# Bind("WWUEntityID") %>' CssClass="form-control chosen-select"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field is Required" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                                    <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("WWUEntityID") %>'></asp:TextBox>--%>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dropDownWWU" DataTextField="EntityName" DataValueField="WWUEntityID" SelectedValue='<%# Bind("WWUEntityID") %>' CssClass="form-control chosen-select"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field is Required" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                                    <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("WWUEntityID") %>'></asp:TextBox>--%>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("WWUEntityID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Notes" SortExpression="Notes">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Notes") %>' TextMode="MultiLine" Height="100px" Width="75%" CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Notes") %>' TextMode="MultiLine" Height="100px" Width="75%" CssClass="form-control"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Notes") %>' TextMode="MultiLine" Height="100px" Width="75%"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
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
                    <br />
                    <br />
                    <h6>Click column headings to sort</h6>

                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="UniversityPartnerID" DataSourceID="sdsGrid" AllowSorting="True" HorizontalAlign="Center" Width="100%" CssClass="table-hover" GridLines="Horizontal" BorderStyle="None" CellPadding="5">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="UniversityPartnerID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="UniversityPartnerID" HeaderStyle-Width="2%" />
                            <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" SortExpression="OrganizationName" HeaderStyle-Width="10%" />
                            <asp:BoundField DataField="ContactName" HeaderText="Contact Name" SortExpression="ContactName" HeaderStyle-Width="7%" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" HeaderStyle-Width="5%" />
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" HeaderStyle-Width="6%" />
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" HeaderStyle-Width="3%" />
                            <asp:BoundField DataField="ZIP" HeaderText="ZIP" SortExpression="ZIP" HeaderStyle-Width="5%" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" HeaderStyle-Width="12%" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" HeaderStyle-Width="7%" />
                            <asp:BoundField DataField="WWUEntityID" HeaderText="Created by WWU Entity" SortExpression="WWUEntityID" />
                            <asp:BoundField DataField="Notes" HeaderText="Additional Notes" SortExpression="Notes" />
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

