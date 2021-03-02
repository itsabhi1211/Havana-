<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="E_Book_Shoppy.Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .glyphicon {
            font-size: 30px
        }
        .radius{
            border-radius:5px 5px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero-wrap" style="background-image: url('images/bg_1.jpg');">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <h1 class="mb-3 bread"><span class="glyphicon glyphicon-book"></span>                               Books</h1>
                </div>
            </div>
        </div>
    </div>
   <section class="ftco-section bg-light">
        <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section text-center ftco-animate">
                    <span class="subheading">Books</span>
                    <h2 class="mb-4">Books We Have</h2>
                </div>
            </div>
            <div class="row d-flex">
                <% for(int i=0;i<dt.Rows.Count;i++)
                    {%>
                <div class="col-md-4 d-flex ftco-animate">
                    <div class="blog-entry align-self-stretch">
                        <img  src="<%= dt.Rows[i]["Image"].ToString().TrimStart(mychar) %>" style="width: 300px; height: 300px; border-radius: 5px 5px" class="shadow-lg" />
                        <div class="text mt-3 d-block">
                            <h3 class="heading mt-3 text-center"><%= dt.Rows[i]["Name"].ToString().TrimStart(mychar) %></h3>
                            <div class="card-body shadow-lg radius ftco-animate">
                            <table class="table table-responsive table-borderless">
                                <tr>
                                    <th class="thead-dark">
                                        <label class="text text-dark" style="font-size: 20px">Author&nbsp;&nbsp;</label></th>
                                    <td>
                                        <label class="text text-warning" style="font-size: 15px">&nbsp;&nbsp;<%= dt.Rows[i]["Author"].ToString().TrimStart(mychar) %></label></td>
                                </tr>
                                <tr>
                                    <th class="thead-dark">
                                        <label class="text text-dark" style="font-size: 20px">Publisher&nbsp;</label></th>
                                    <td>
                                        <label class="text text-warning" style="font-size: 15px">&nbsp;&nbsp;<%= dt.Rows[i]["Publisher"].ToString().TrimStart(mychar) %></label></td>
                                </tr>
                                <tr>
                                    <th class="thead-dark">
                                        <label class="text text-dark" style="font-size: 20px">Year&nbsp;&nbsp;&nbsp;</label></th>
                                    <td>
                                        <label class="text text-warning" style="font-size: 15px">&nbsp;&nbsp;<%= dt.Rows[i]["Year"].ToString().TrimStart(mychar) %></label></td>
                                </tr>
                                <tr>
                                    <th class="thead-dark">
                                        <label class="text text-dark" style="font-size: 20px">Price</label></th>
                                    <td>
                                        <label class="text text-danger" style="font-size: 15px">&nbsp;&nbsp;<%= dt.Rows[i]["Price"].ToString().TrimStart(mychar) %></label></td>
                                </tr>
                                <tr>
                                   
                                    <td colspan="2">
                                        <a href="Bag.aspx?id=<%= Convert.ToInt32(dt.Rows[i]["Id"].ToString()) %>" Class="form-group btn btn-outline-primary btn-block py-3 px-5" style="font-size:large">Order Now</a>
                                            </td>
                                </tr>
                            </table>
                        </div>
                        </div>
                    </div>
                </div>
                <%} %>
               
            </div>
        </div>
    </section>
</asp:Content>
