<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminindex.Master" AutoEventWireup="true" CodeBehind="Update-Properties.aspx.cs" Inherits="Havana.Admin.Update_Properties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Properties updation starts here--%><br />
    <div class="container ">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8" id="propertylist" runat="server">
                 <div class="text-center">
                    <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-danger text-center" Visible="false"></asp:Label>
                </div><br />
                <div class="card shadow-lg mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-building fa-2x"></span>Update Properties</h4>
                    </div>
                    <div class="card-body shadow-lg">
                        <div class="table-responsive-lg">
                            <div class="table table-borderless table-hover">
                                <table>
                                    <tr>
                                        <th><span class="fa fa-building fa-2x"></span></th>
                                         <td>
                                            <asp:DropDownList runat="server" ID="ddlblocks" AutoPostBack="true" Style="border-radius: 5px 5px" class="form-control" OnSelectedIndexChanged="ddlblocks_SelectedIndexChanged">
                                               

                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="fa fa-house-damage fa-2x"></span></th>
                                         <td>
                                            <asp:DropDownList runat="server" ID="ddlflats" Style="border-radius: 5px 5px" class="form-control" Enabled="false">
                                               

                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="fa fa-image fa-2x"></span></th>
                                        <td>
                                            <asp:FileUpload ID="txtimg" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="fa fa-address-book fa-2x"></span></th>
                                        <td>
                                            <input type="text" runat="server" id="txtaddress" placeholder=" Address...." class="form-control" required="required" style="border-radius: 5px 5px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="fa fa-money-check fa-2x"></span></th>
                                        <td>
                                            <input type="text" runat="server" id="txtprice" placeholder=" Price...." class="form-control" required="required" style="border-radius: 5px 5px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="fa fa-bed fa-2x"></span></th>
                                        <td>
                                            <input type="text" runat="server" id="txtbed" placeholder=" No of Bedrooms...." class="form-control" required="required" style="border-radius: 5px 5px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="fa fa-bath fa-2x"></span></th>
                                        <td>
                                            <input type="text" runat="server" id="txtwashrooms" placeholder=" No of Washrooms...." class="form-control" required="required" style="border-radius: 5px 5px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="fa fa-chart-area fa-2x"></span></th>
                                        <td>
                                            <input type="text" runat="server" id="txtarea" placeholder=" Area...." class="form-control" required="required" style="border-radius: 5px 5px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="fa fa-typo3 fa-2x"></span></th>
                                        <td>
                                            <asp:DropDownList runat="server" ID="ddlfor" Style="border-radius: 5px 5px" class="form-control">
                                                <asp:ListItem Value="0" Text="Choose For"></asp:ListItem>
                                                <asp:ListItem Value="S" Text="Sale"></asp:ListItem>
                                                <asp:ListItem Value="R" Text="Rent"></asp:ListItem>

                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="btnupld" runat="server" Text="Upload" CssClass=" btn btn-primary btn-block" Style="border-radius: 5px 5px" OnClick="btnupld_Click" />
                                        </td>
                                    </tr>
                                </table>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>

    <%--ends here--%>

    <%-- Properties starts here--%>
    <div class="container">
        <div class="row">
            
            <div class="col-md-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-info-circle fa-2x"></span>                        Property Details</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class="table table-bordered" id="dataTable">
                                <div>
                                    <asp:GridView ID="grdshw" runat="server" CssClass="table" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnPageIndexChanging="grdshw_PageIndexChanging" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:BoundField DataField="BlockNo" HeaderText="Block Name" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                             <asp:BoundField DataField="FlatNo" HeaderText="Flat No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:TemplateField HeaderText="Image" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:Image ID="img1" ImageUrl='<%#   Eval("Image") %>' runat="server" Width="100px" Height="75px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Area" HeaderText="Area" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Bedroom" HeaderText="Bedroom" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Bathroom" HeaderText="Bathroom" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Price" HeaderText="Price" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Type" HeaderText="Type" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            
                                            <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                     <asp:HyperLink ID="hypedit" runat="server" CssClass="fa fa-edit fa-1x" ForeColor="Blue"  NavigateUrl='<%# "Update-Properties.aspx?Id="+Eval("Id") %>'></asp:HyperLink>
                                                    &nbsp;|&nbsp;
                                                    <asp:LinkButton ID="lnkdelte" runat="server"  CssClass="fa fa-trash-alt fa-1x" ForeColor="Red" CommandArgument='<%# Eval("Id") %>' OnCommand="lnkdelte_Command" OnClientClick="if ( !confirm('Are you sure you want to Delete this Property?')) return false;"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                        </Columns>

                                    </asp:GridView>
                                </div>
                                <asp:Label ID="lblmsg1" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
           
        </div>
    </div>
    <asp:HiddenField ID="hdf" runat="server" />
    <%--  ends here--%>
</asp:Content>
