<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Upcoming.aspx.cs" Inherits="E_Book_Shoppy.Admin.Upcoming" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3"></div>
                     
                    <div class="col-lg-7">
                        <div>
                        <asp:Label ID="lblmsg1" runat="server" CssClass="alert alert-danger" Visible="false"></asp:Label>
                    </div>
                        <div class="table-responsive table--no-card m-b-30">
                            <table class="table table-borderless table-striped table-earning">
                                <tbody>
                                    <tr>
                                        <th><span class="fa fa-newspaper fa-2x"></span></th>
                                        <td>
                                            <asp:TextBox ID="txtmagname" runat="server" CssClass="form-control" Placeholder="Magzine Name/Book Name..."></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <th><span class="fa fa-user fa-2x"></span></th>
                                        <td>
                                            <asp:TextBox ID="txtauthor" runat="server" CssClass="form-control" Placeholder="Author..."></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <th><span class="fa fa-newspaper fa-2x"></span></th>
                                        <td>
                                            <asp:TextBox ID="txtpublisher" runat="server" CssClass="form-control" Placeholder="Publisher..."></asp:TextBox></td>

                                    </tr>
                                    <tr>
                                        <th><span class="fa fa-calendar fa-2x"></span></th>
                                        <td>
                                            <asp:TextBox ID="txtyear" runat="server" CssClass="form-control" Placeholder="Year..." MaxLength="4"></asp:TextBox></td>

                                    </tr>
                                    <tr>
                                        <th><span class="fa fa-money-bill-alt fa-2x"></span></th>
                                        <td>
                                            <asp:TextBox ID="txtprice" runat="server" CssClass="form-control" Placeholder="Price..."></asp:TextBox></td>

                                    </tr>
                                    <tr>
                                        <th><span class="fa fa-upload fa-2x"></span></th>
                                        <td>
                                            <asp:FileUpload ID="txtfile" runat="server" CssClass="form-control" /></td>

                                    </tr>
                                    <tr>
                                        <th><span class="fa fa-typo3 fa-2x"></span></th>
                                        <td>
                                      <asp:DropDownList ID="ddltype" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0" Text="Choose"></asp:ListItem>
                                                <asp:ListItem Text="Book" Value="B"></asp:ListItem>
                                                <asp:ListItem Text="Magzine" Value="M"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="btnupload" Text="Upload" runat="server" CssClass="btn btn-block btn-outline-secondary" OnClick="btnupload_Click" />
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                        </div>

                    </div>

                    <div class="col-md-3"></div>
                   
                </div>
            </div>
        </div>
    </div>
    <%-- books details starts here--%>
      <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="card">
                        <div class="card-header">
                            <h5 class="text-primary text-uppercase"><span class="fa fa-arrow-right fa-2x">           Upcoming Details</span></h5>
                        </div>

                        <div class="card-body">
                            <asp:GridView ID="grdshwdetails" runat="server" CssClass="table table-responsive table-bordered" AutoGenerateColumns="false" OnRowDeleting="grdshwdetails_RowDeleting" AllowPaging="true" PageSize="5" OnPageIndexChanging="grdshwdetails_PageIndexChanging" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger">
                                <Columns>
                                    <asp:TemplateField HeaderText="S. No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblid" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Image" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <asp:Image Id="img1" ImageUrl='<%# Eval("Image") %>' runat="server"  Height="100px" Width="150px"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    <asp:BoundField DataField="Author" HeaderText="Author" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    <asp:BoundField DataField="Publisher" HeaderText="Publisher" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    <asp:BoundField DataField="Year" HeaderText="Year" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    <asp:BoundField DataField="Price" HeaderText="Price   (In Rs)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    <asp:BoundField DataField="_For" HeaderText="Type" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    <asp:TemplateField HeaderText="Delete" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkdelete" runat="server" CommandName="Delete" CausesValidation="False" CssClass="fa fa-trash-alt fa-2x" ForeColor="Red" OnClientClick="if ( !confirm('Are you sure you want to Delete this Column?')) return false;"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </div>
                    </div>
                        </div>
                     <div class="col-md-1"></div>
                     </div>
                 </div>
             </div>
           </div>
     
    <%--magzines details ends here--%>
</asp:Content>
