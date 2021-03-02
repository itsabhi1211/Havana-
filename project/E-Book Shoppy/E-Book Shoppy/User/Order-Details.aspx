<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Order-Details.aspx.cs" Inherits="E_Book_Shoppy.User.Order_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"><br /><br />
    <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">  
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="card">
                        <div class="header">
                            <h3 class="title text-primary"><span class="fa fa-info-circle"></span>                                                               &nbsp; Order Details</h3>
                        </div><br />

                        <div class="card-body">
                            <asp:GridView ID="grdshwdetails" runat="server" CssClass="table table-responsive table-bordered" AutoGenerateColumns="false" OnRowDeleting="grdshwdetails_RowDeleting" AllowPaging="true" PageSize="5" OnPageIndexChanging="grdshwdetails_PageIndexChanging" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger">
                                <Columns>
                                    <asp:TemplateField HeaderText="S. No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-danger">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblid" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Book_Name" HeaderText="Name Of Book" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-danger" />
                                    <asp:BoundField DataField="No_Of_Items" HeaderText="No Of Items" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-danger" />
                                    <asp:BoundField DataField="Price" HeaderText="Total Price" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-danger" />
                                    <asp:TemplateField HeaderText="Delete" ItemStyle-CssClass="text-center " HeaderStyle-CssClass="text-center text-danger">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkdelete" runat="server" CommandName="Delete" CausesValidation="False" CssClass="fa fa-trash-o fa-2x" ForeColor="BlueViolet" OnClientClick="if ( !confirm('Are you sure you want to Delete this Column?')) return false;"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </div>
                    </div>
                        </div>
                    <div class="col-md-2"></div>
                     </div>
                 </div>
             </div>
           </div>
</asp:Content>
