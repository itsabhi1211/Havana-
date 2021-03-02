<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Listing.aspx.cs" Inherits="Havana.Listing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img" style="background-image: url(img/bg-img/hero1.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content">
                        <h3 class="breadcumb-title">Properties</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
 
    <!-- ##### Listing Content Wrapper Area Start ##### -->
    <section class="listings-content-wrapper section-padding-100">
        <div class="container">
            
             
            <div class="row">
                 <%for(int i=0;i<dt.Rows.Count;i++)
                   {          %> 
                <!-- Single Featured Property -->
                
                <div class="col-12 col-md-6 col-xl-4">
                    <div class="single-featured-property mb-50 shadow-lg">
                        <!-- Property Thumbnail -->
                        <div class="property-thumb ">
                         <a href="Userlogin.aspx?Id=<%=dt.Rows[i]["Id"].ToString().TrimStart(mychar) %>"><img src="<%=dt.Rows[i]["Image"].ToString().TrimStart(mychar) %>" alt="" style="height:300px;width:400px"></a> 

                            <div class="tag">
                                <span><%=dt.Rows[i]["PType"].ToString().TrimStart(mychar) %></span>
                            </div>
                            <div class="list-price">
                              <p>  &#8377;<%=dt.Rows[i]["Price"].ToString().TrimStart(mychar) %></p>
                            </div>
                        </div>
                        <!-- Property Content -->
                        <div class="property-content">
                            <h5>Villa in Los Angeles</h5>
                            <p class="location"><img src="img/icons/location.png" alt=""><%=dt.Rows[i]["Address"].ToString().TrimStart(mychar) %></p>
                           
                            <div class="property-meta-data d-flex align-items-end justify-content-between">
                                <div class="new-tag">
                                    <img src="img/icons/new.png" alt="">
                                </div>
                                <div class="bathroom">
                                    <img src="img/icons/bathtub.png" alt="">
                                    <span><%=dt.Rows[i]["Bathroom"].ToString().TrimStart(mychar) %></span>
                                </div>
                                <div class="garage">
                                    <img src="img/icons/garage.png" alt="">
                                    <span><%=dt.Rows[i]["Bedroom"].ToString().TrimStart(mychar) %></span>
                                </div>
                                <div class="space">
                                    <img src="img/icons/space.png" alt="">
                                    <span><%=dt.Rows[i]["Area"].ToString().TrimStart(mychar) %></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                 <%} %>
                <!-- Single Featured Property -->
                <%--<div class="col-12 col-md-6 col-xl-4">
                    <div class="single-featured-property mb-50">
                        <!-- Property Thumbnail -->
                        <div class="property-thumb">
                            <img src="img/bg-img/feature2.jpg" alt="">

                            <div class="tag">
                                <span>For Sale</span>
                            </div>
                            <div class="list-price">
                                <p>$945 679</p>
                            </div>
                        </div>
                        <!-- Property Content -->
                        <div class="property-content">
                            <h5>Town House in Los Angeles</h5>
                            <p class="location"><img src="img/icons/location.png" alt="">Upper Road 3411, no.34 CA</p>
                            <p>Integer nec bibendum lacus. Suspendisse dictum enim sit amet libero malesuada.</p>
                            <div class="property-meta-data d-flex align-items-end justify-content-between">
                                <div class="new-tag">
                                    <img src="img/icons/new.png" alt="">
                                </div>
                                <div class="bathroom">
                                    <img src="img/icons/bathtub.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="garage">
                                    <img src="img/icons/garage.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="space">
                                    <img src="img/icons/space.png" alt="">
                                    <span>120 sq ft</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <!-- Single Featured Property -->
                <%--<div class="col-12 col-md-6 col-xl-4">
                    <div class="single-featured-property mb-50">
                        <!-- Property Thumbnail -->
                        <div class="property-thumb">
                            <img src="img/bg-img/feature3.jpg" alt="">

                            <div class="tag">
                                <span>For Sale</span>
                            </div>
                            <div class="list-price">
                                <p>$945 679</p>
                            </div>
                        </div>
                        <!-- Property Content -->
                        <div class="property-content">
                            <h5>Town House in Los Angeles</h5>
                            <p class="location"><img src="img/icons/location.png" alt="">Upper Road 3411, no.34 CA</p>
                            <p>Integer nec bibendum lacus. Suspendisse dictum enim sit amet libero malesuada.</p>
                            <div class="property-meta-data d-flex align-items-end justify-content-between">
                                <div class="new-tag">
                                    <img src="img/icons/new.png" alt="">
                                </div>
                                <div class="bathroom">
                                    <img src="img/icons/bathtub.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="garage">
                                    <img src="img/icons/garage.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="space">
                                    <img src="img/icons/space.png" alt="">
                                    <span>120 sq ft</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <!-- Single Featured Property -->
                <%--<div class="col-12 col-md-6 col-xl-4">
                    <div class="single-featured-property mb-50">
                        <!-- Property Thumbnail -->
                        <div class="property-thumb">
                            <img src="img/bg-img/feature4.jpg" alt="">

                            <div class="tag">
                                <span>For Sale</span>
                            </div>
                            <div class="list-price">
                                <p>$945 679</p>
                            </div>
                        </div>
                        <!-- Property Content -->
                        <div class="property-content">
                            <h5>Villa in Los Angeles</h5>
                            <p class="location"><img src="img/icons/location.png" alt="">Upper Road 3411, no.34 CA</p>
                            <p>Integer nec bibendum lacus. Suspendisse dictum enim sit amet libero malesuada.</p>
                            <div class="property-meta-data d-flex align-items-end justify-content-between">
                                <div class="new-tag">
                                    <img src="img/icons/new.png" alt="">
                                </div>
                                <div class="bathroom">
                                    <img src="img/icons/bathtub.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="garage">
                                    <img src="img/icons/garage.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="space">
                                    <img src="img/icons/space.png" alt="">
                                    <span>120 sq ft</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <!-- Single Featured Property -->
                <%--<div class="col-12 col-md-6 col-xl-4">
                    <div class="single-featured-property mb-50">
                        <!-- Property Thumbnail -->
                        <div class="property-thumb">
                            <img src="img/bg-img/feature5.jpg" alt="">

                            <div class="tag">
                                <span>For Sale</span>
                            </div>
                            <div class="list-price">
                                <p>$945 679</p>
                            </div>
                        </div>
                        <!-- Property Content -->
                        <div class="property-content">
                            <h5>Town House in Los Angeles</h5>
                            <p class="location"><img src="img/icons/location.png" alt="">Upper Road 3411, no.34 CA</p>
                            <p>Integer nec bibendum lacus. Suspendisse dictum enim sit amet libero malesuada.</p>
                            <div class="property-meta-data d-flex align-items-end justify-content-between">
                                <div class="new-tag">
                                    <img src="img/icons/new.png" alt="">
                                </div>
                                <div class="bathroom">
                                    <img src="img/icons/bathtub.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="garage">
                                    <img src="img/icons/garage.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="space">
                                    <img src="img/icons/space.png" alt="">
                                    <span>120 sq ft</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <!-- Single Featured Property -->
                <%--<div class="col-12 col-md-6 col-xl-4">
                    <div class="single-featured-property mb-50">
                        <!-- Property Thumbnail -->
                        <div class="property-thumb">
                            <img src="img/bg-img/feature6.jpg" alt="">

                            <div class="tag">
                                <span>For Sale</span>
                            </div>
                            <div class="list-price">
                                <p>$945 679</p>
                            </div>
                        </div>
                        <!-- Property Content -->
                        <div class="property-content">
                            <h5>Town House in Los Angeles</h5>
                            <p class="location"><img src="img/icons/location.png" alt="">Upper Road 3411, no.34 CA</p>
                            <p>Integer nec bibendum lacus. Suspendisse dictum enim sit amet libero malesuada.</p>
                            <div class="property-meta-data d-flex align-items-end justify-content-between">
                                <div class="new-tag">
                                    <img src="img/icons/new.png" alt="">
                                </div>
                                <div class="bathroom">
                                    <img src="img/icons/bathtub.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="garage">
                                    <img src="img/icons/garage.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="space">
                                    <img src="img/icons/space.png" alt="">
                                    <span>120 sq ft</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <!-- Single Featured Property -->
                <%--<div class="col-12 col-md-6 col-xl-4">
                    <div class="single-featured-property mb-50">
                        <!-- Property Thumbnail -->
                        <div class="property-thumb">
                            <img src="img/bg-img/feature7.jpg" alt="">

                            <div class="tag">
                                <span>For Sale</span>
                            </div>
                            <div class="list-price">
                                <p>$945 679</p>
                            </div>
                        </div>
                        <!-- Property Content -->
                        <div class="property-content">
                            <h5>Town House in Los Angeles</h5>
                            <p class="location"><img src="img/icons/location.png" alt="">Upper Road 3411, no.34 CA</p>
                            <p>Integer nec bibendum lacus. Suspendisse dictum enim sit amet libero malesuada.</p>
                            <div class="property-meta-data d-flex align-items-end justify-content-between">
                                <div class="new-tag">
                                    <img src="img/icons/new.png" alt="">
                                </div>
                                <div class="bathroom">
                                    <img src="img/icons/bathtub.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="garage">
                                    <img src="img/icons/garage.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="space">
                                    <img src="img/icons/space.png" alt="">
                                    <span>120 sq ft</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <!-- Single Featured Property -->
                <%--<div class="col-12 col-md-6 col-xl-4">
                    <div class="single-featured-property mb-50">
                        <!-- Property Thumbnail -->
                        <div class="property-thumb">
                            <img src="img/bg-img/feature8.jpg" alt="">

                            <div class="tag">
                                <span>For Sale</span>
                            </div>
                            <div class="list-price">
                                <p>$945 679</p>
                            </div>
                        </div>
                        <!-- Property Content -->
                        <div class="property-content">
                            <h5>Town House in Los Angeles</h5>
                            <p class="location"><img src="img/icons/location.png" alt="">Upper Road 3411, no.34 CA</p>
                            <p>Integer nec bibendum lacus. Suspendisse dictum enim sit amet libero malesuada.</p>
                            <div class="property-meta-data d-flex align-items-end justify-content-between">
                                <div class="new-tag">
                                    <img src="img/icons/new.png" alt="">
                                </div>
                                <div class="bathroom">
                                    <img src="img/icons/bathtub.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="garage">
                                    <img src="img/icons/garage.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="space">
                                    <img src="img/icons/space.png" alt="">
                                    <span>120 sq ft</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <!-- Single Featured Property -->
                <%--<div class="col-12 col-md-6 col-xl-4">
                    <div class="single-featured-property mb-50">
                        <!-- Property Thumbnail -->
                        <div class="property-thumb">
                            <img src="img/bg-img/feature9.jpg" alt="">

                            <div class="tag">
                                <span>For Sale</span>
                            </div>
                            <div class="list-price">
                                <p>$945 679</p>
                            </div>
                        </div>
                        <!-- Property Content -->
                        <div class="property-content">
                            <h5>Town House in Los Angeles</h5>
                            <p class="location"><img src="img/icons/location.png" alt="">Upper Road 3411, no.34 CA</p>
                            <p>Integer nec bibendum lacus. Suspendisse dictum enim sit amet libero malesuada.</p>
                            <div class="property-meta-data d-flex align-items-end justify-content-between">
                                <div class="new-tag">
                                    <img src="img/icons/new.png" alt="">
                                </div>
                                <div class="bathroom">
                                    <img src="img/icons/bathtub.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="garage">
                                    <img src="img/icons/garage.png" alt="">
                                    <span>2</span>
                                </div>
                                <div class="space">
                                    <img src="img/icons/space.png" alt="">
                                    <span>120 sq ft</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
            

            <%--<div class="row">
                <div class="col-12">
                    <div class="south-pagination d-flex justify-content-end">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link active" href="#">01</a></li>
                                <li class="page-item"><a class="page-link" href="#">02</a></li>
                                <li class="page-item"><a class="page-link" href="#">03</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>--%>
        </div>
    </section>
   
    <!-- ##### Listing Content Wrapper Area End ##### -->
</asp:Content>
