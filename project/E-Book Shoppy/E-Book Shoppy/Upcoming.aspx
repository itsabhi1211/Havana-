<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Upcoming.aspx.cs" Inherits="E_Book_Shoppy.Upcoming" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .radius
        {
            border-radius: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <%-- recommended books starts here--%>
     <section class="ftco-section bg-light">
        <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section text-center ftco-animate">
                    <span class="subheading">You also may like</span>
                    <h2 class="mb-4">Upcomings</h2>
                </div>
            </div>
            <div class="row d-flex">
                <% for(int i=0;i< dt.Rows.Count;i++)
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
