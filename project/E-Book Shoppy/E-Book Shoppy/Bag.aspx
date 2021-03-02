<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Bag.aspx.cs" Inherits="E_Book_Shoppy.Bag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .glyphicon {
            font-size: 40px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero-wrap" style="background-image: url('images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-3 bread"><span class="glyphicon glyphicon-shopping-cart"></span>Order Details</h1>
          </div>
        </div>
      </div>
    </div>
    <br /><asp:HiddenField ID="hdfvalue" runat="server" />
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 ">
                <div class="jumbotron">
                    <div class="text text-warning" style="font-size:36px"><span class="glyphicon glyphicon-shopping-cart"></span>                                Order Details</div>
                </div>
                 <div>
                    <asp:Label ID="lblmsg" runat="server"  Visible="false" CssClass="alert alert-danger" Style="font-size:larger"></asp:Label>
                </div>
                <div class=" bg-white p-5 contact-form ">
                    <div class="form-group">
                        <table class="table table-responsive table-borderless shadow-lg">
                            <tr>
                                <td><label runat="server" class="text-secondary" style="font-size:24px">Name</label></td>
                                <td>
                                   <asp:Label ID="lblname" runat="server" CssClass="text-primary"  style="font-size:20px"></asp:Label>
                            </tr>
                            <tr>
                               <td><label runat="server" class="text-secondary" style="font-size:24px">Author</label></td>
                                <td>
                                   <asp:Label ID="lblauthor" runat="server" CssClass="text-primary"   style="font-size:20px"></asp:Label>
                            </tr>
                            <tr>
                               <td><label runat="server" class="text-secondary" style="font-size:24px">Publisher</label></td>
                                <td>
                                    <asp:Label ID="lblpublisher" runat="server" CssClass="text-primary" style="font-size:20px"></asp:Label></td>
                            </tr>
                            <tr>
                               <td><label runat="server" class="text-secondary" style="font-size:24px">No of Items</label></td>
                                <td>
                                   <asp:DropDownList runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlcount_SelectedIndexChanged" ID="ddlcount" AutoPostBack="true" style="border-radius:5px 5px">
                                       <asp:ListItem Value="0" Text="Choose no. of Items"></asp:ListItem>
                                       <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                       <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                       <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                   </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                              <td><label runat="server" class="text-secondary" style="font-size:24px">Price</label></td>
                                <td>
                                    <asp:Label ID="lblprice" runat="server" CssClass="text-danger" style="font-size:20px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                               <td><label runat="server" class="text-secondary" style="font-size:24px">Total Price</label></td>
                                <td>
                                    <asp:Label ID="lbltotalprice" runat="server" CssClass="text-danger" style="font-size:20px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnorder" Text="Order Now" CssClass="form-group btn btn-outline-primary btn-block py-3 px-5" runat="server" Style="border-radius: 5px 5px; font-size: large" OnClick="btnorder_Click" />
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
               
            </div>

            <div class="col-md-3"></div>
        </div>
    </div>
</asp:Content>
