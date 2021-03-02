<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="E_Book_Shoppy.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .radius
        {
            border-radius: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="home-slider owl-carousel">
        <div class="slider-item" style="background-image: url(images/bg_1.jpg);">
        </div>
        <div class="slider-item" style="background-image: url(images/bg_2.jpg);">
        </div>
        <div class="slider-item" style="background-image: url(images/bg_3.jpg);">
        </div>
        <div class="slider-item" style="background-image: url(images/bg_4.jpg);">
        </div>
    </section>
    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row d-flex">
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services py-4 d-block text-center">
                        <div class="d-flex justify-content-center">
                            <div class="icon"><span class="icon-book"></span></div>
                        </div>
                        <div class="media-body p-2 mt-2">
                            <h3 class="heading mb-3">Find Books Of Your Choice</h3>
                            <p>A place to buy books of your choice.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services py-4 d-block text-center">
                        <div class="d-flex justify-content-center">
                            <div class="icon"><span class="flaticon-detective"></span></div>
                        </div>
                        <div class="media-body p-2 mt-2">
                            <h3 class="heading mb-3">We Have Experts With Experience</h3>
                            <p>They are having a good experience in providing book of your choice.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex align-sel Searchf-stretch ftco-animate">
                    <div class="media block-6 services py-4 d-block text-center">
                        <div class="d-flex justify-content-center">
                            <div class="icon"><span class="flaticon-purse"></span></div>
                        </div>
                        <div class="media-body p-2 mt-2">
                            <h3 class="heading mb-3"> Books At Reasonable Price</h3>
                            <p>Providing books at reasonable price is our main target.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services py-4 d-block text-center">
                        <div class="d-flex justify-content-center">
                            <div class="icon"><span class="icon-bell"></span></div>
                        </div>
                        <div class="media-body p-2 mt-2">
                            <h3 class="heading mb-3">Offers</h3>
                            <p>A small step in making good offers for buyers..</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
                                        <a href="Bag.aspx?id=<%= Convert.ToInt32(dt.Rows[i]["Id"].ToString()) %>" Class="form-group btn btn-outline-primary btn-block py-3 px-5" style="font-size:large">Buy Now</a>
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
    
   

   <%-- magzines section starts --%>
     <section class="ftco-section bg-light">
        <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section text-center ftco-animate">
                    <span class="subheading">Magzines</span>
                    <h2 class="mb-4">Magzines We Have</h2>
                </div>
            </div>
            <div class="row d-flex">
                <% for(int i=0;i<dt1.Rows.Count;i++)
                    {%>
                <div class="col-md-4 d-flex ftco-animate">
                    <div class="blog-entry align-self-stretch">
                        <img  src="<%= dt1.Rows[i]["Image"].ToString().TrimStart(mychar) %>" style="width: 300px; height: 300px; border-radius: 5px 5px" class="shadow-lg" />
                        <div class="text mt-3 d-block">
                            <h3 class="heading mt-3 text-center"><%= dt1.Rows[i]["Name"].ToString().TrimStart(mychar) %></h3>
                            <div class="card-body shadow-lg radius ftco-animate">
                            <table class="table table-responsive table-borderless">
                                <tr>
                                    <th class="thead-dark">
                                        <label class="text text-dark" style="font-size: 20px">Author&nbsp;&nbsp;</label></th>
                                    <td>
                                        <label class="text text-warning" style="font-size: 15px">&nbsp;&nbsp;<%= dt1.Rows[i]["Author"].ToString().TrimStart(mychar) %></label></td>
                                </tr>
                                <tr>
                                    <th class="thead-dark">
                                        <label class="text text-dark" style="font-size: 20px">Publisher&nbsp;</label></th>
                                    <td>
                                        <label class="text text-warning" style="font-size: 15px">&nbsp;&nbsp;<%= dt1.Rows[i]["Publisher"].ToString().TrimStart(mychar) %></label></td>
                                </tr>
                                <tr>
                                    <th class="thead-dark">
                                        <label class="text text-dark" style="font-size: 20px">Year&nbsp;&nbsp;&nbsp;</label></th>
                                    <td>
                                        <label class="text text-warning" style="font-size: 15px">&nbsp;&nbsp;<%= dt1.Rows[i]["Year"].ToString().TrimStart(mychar) %></label></td>
                                </tr>
                                <tr>
                                    <th class="thead-dark">
                                        <label class="text text-dark" style="font-size: 20px">Price</label></th>
                                    <td>
                                        <label class="text text-danger" style="font-size: 15px">&nbsp;&nbsp;<%= dt1.Rows[i]["Price"].ToString().TrimStart(mychar) %></label></td>
                                </tr>
                                <tr>
                                   
                                    <td colspan="2">
                                        <a href="Bag.aspx?id=<%= Convert.ToInt32(dt1.Rows[i]["Id"].ToString()) %>" Class="form-group btn btn-outline-primary btn-block py-3 px-5" style="font-size:large">Buy Now</a>
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
  
   

   <%-- recommended books starts here--%>
     <section class="ftco-section bg-light">
        <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section text-center ftco-animate">
                    <span class="subheading">Offer</span>
                    <h2 class="mb-4">Most Recommended Book</h2>
                </div>
            </div>
            <div class="row d-flex">
                <% for(int i=0;i< dt2.Rows.Count;i++)
                    {%>
                <div class="col-md-4 d-flex ftco-animate">
                    <div class="blog-entry align-self-stretch">
                        <img  src="<%= dt2.Rows[i]["Image"].ToString().TrimStart(mychar) %>" style="width: 300px; height: 300px; border-radius: 5px 5px" class="shadow-lg" />
                        <div class="text mt-3 d-block">
                            <h3 class="heading mt-3 text-center"><%= dt2.Rows[i]["Name"].ToString().TrimStart(mychar) %></h3>
                            <div class="card-body shadow-lg radius ftco-animate">
                            <table class="table table-responsive table-borderless">
                                <tr>
                                    <th class="thead-dark">
                                        <label class="text text-dark" style="font-size: 20px">Author&nbsp;&nbsp;</label></th>
                                    <td>
                                        <label class="text text-warning" style="font-size: 15px">&nbsp;&nbsp;<%= dt2.Rows[i]["Author"].ToString().TrimStart(mychar) %></label></td>
                                </tr>
                                <tr>
                                    <th class="thead-dark">
                                        <label class="text text-dark" style="font-size: 20px">Publisher&nbsp;</label></th>
                                    <td>
                                        <label class="text text-warning" style="font-size: 15px">&nbsp;&nbsp;<%= dt2.Rows[i]["Publisher"].ToString().TrimStart(mychar) %></label></td>
                                </tr>
                                <tr>
                                    <th class="thead-dark">
                                        <label class="text text-dark" style="font-size: 20px">Year&nbsp;&nbsp;&nbsp;</label></th>
                                    <td>
                                        <label class="text text-warning" style="font-size: 15px">&nbsp;&nbsp;<%= dt2.Rows[i]["Year"].ToString().TrimStart(mychar) %></label></td>
                                </tr>
                                <tr>
                                    <th class="thead-dark">
                                        <label class="text text-dark" style="font-size: 20px">Price</label></th>
                                    <td>
                                        <label class="text text-danger" style="font-size: 15px">&nbsp;&nbsp;<%= dt2.Rows[i]["Price"].ToString().TrimStart(mychar) %></label></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <a href="Bag.aspx?id=<%= Convert.ToInt32(dt2.Rows[i]["Id"].ToString()) %>" Class="form-group btn btn-outline-primary btn-block py-3 px-5" style="font-size:large">Buy Now</a>
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
