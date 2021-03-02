<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Order-Details.aspx.cs" Inherits="E_Book_Shoppy.Admin.Order_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-7">
                        <div class="card">
                        <div class="card-header">
                            <h5 class="text-primary text-uppercase"><span class="fa fa-info-circle fa-2x">           Order Details</span></h5>
                        </div>

                        <div class="card-body">
                            <asp:GridView ID="grdshwdetails" runat="server" CssClass="table table-responsive table-bordered" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnPageIndexChanging="grdshwdetails_PageIndexChanging" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger">
                                <Columns>
                                    <asp:TemplateField HeaderText="S. No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    <asp:BoundField DataField="Book_Name" HeaderText="Book Name" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    <asp:BoundField DataField="No_Of_Items" HeaderText="No Of Items" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    <asp:BoundField DataField="Price" HeaderText="Total Price" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </div>
                    </div>
                        </div>
                     <div class="col-md-3"></div>
                     </div>
                 </div>
             </div>
           </div>
</asp:Content>
