<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="User-Dashboard.aspx.cs" Inherits="E_Book_Shoppy.User.User_Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="header">
                                <h4 class="title"><span class="fa fa-image"></span>                                                               &nbsp;&nbsp; Profile Picture</h4>
                                
                            </div>
                            <div class="content text-center">        
                                    <asp:Image CssClass="avatar border-gray" ID="img1"  runat="server" Style="height:200px;width:200px"  ImageUrl="Images/avatar.png"/>                                      
                                  
                                </div>

                                <div class="footer">
                                   
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-clock-o"></i> Updated 1 min ago..
                                    </div>
                                </div>
                           
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title"><span class="fa fa-info-circle"></span>                                                                 &nbsp;&nbsp;Users Basic Details</h4>
                                
                            </div>
                            <div class="content">
                                <table class="table table-responsive table-condensedsa">
                                    <tr>
                                        <td><span class="fa fa-user fa-2x"></span></td>
                                        <td> <asp:Label runat="server" ID="lblname" CssClass="text-danger" style="font-size:18px"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span class="fa fa-birthday-cake fa-2x"></span></td>
                                        <td> <asp:Label runat="server" ID="lbldob" CssClass="text-danger" style="font-size:18px"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span class="fa fa-mobile-phone fa-2x"></span></td>
                                        <td> <asp:Label runat="server" ID="lblcontact" CssClass="text-danger" style="font-size:18px"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>  <span class="fa fa-envelope fa-2x"></span></td>
                                        <td><asp:Label runat="server" ID="lblemail" CssClass="text-danger" style="font-size:18px"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span class="fa fa-home fa-2x"></span></td>
                                        <td> <asp:Label runat="server" ID="lblcity" CssClass="text-danger" style="font-size:18px"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>  <span class="fa fa-home fa-2x"></span></td>
                                        <td> <asp:Label runat="server" ID="lblstate" CssClass="text-danger" style="font-size:18px"></asp:Label></td>
                                    </tr>
                                     <tr>
                                        <td><span class="fa fa-code-fork fa-2x"></span></td>
                                        <td><asp:Label runat="server" ID="lblpincode" CssClass="text-danger" style="font-size:18px"></asp:Label></td>
                                    </tr>
                                     <tr>
                                        <td><span class="fa fa-home fa-2x"></span></td>
                                        <td> <asp:Label runat="server" ID="lbladd" CssClass="text-danger" style="font-size:18px"></asp:Label></td>
                                    </tr>
                                </table>
                                <div class="footer">
                                    
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-history"></i> Updated 3 minutes ago
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



                
            </div>
        </div>
</asp:Content>
