<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Registered-User.aspx.cs" Inherits="E_Book_Shoppy.Admin.Registered_User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <%-- user details starts here--%>
      <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">                   
                    <div class="col-md-11">
                        <div class="card">
                        <div class="card-header">
                            <h5 class="text-primary text-uppercase"><span class="fa fa-user-circle fa-2x">Registered Users Details</span></h5>
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
                                    <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                                    <asp:BoundField DataField="DOB" HeaderText="Date Of Birth" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center " />
                                    <asp:BoundField DataField="ContactNo" HeaderText="Mobile No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                                    <asp:TemplateField HeaderText="Delete" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkdelete" runat="server" CommandName="Delete" CausesValidation="False" CssClass="fa fa-remove fa-2x" ForeColor="Red" OnClientClick="if ( !confirm('Are you sure you want to Delete this Column?')) return false;"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </div>
                    </div>
                        </div>
                     </div>
                 </div>
             </div>
           </div>
     
    <%--user details ends here--%>
</asp:Content>
