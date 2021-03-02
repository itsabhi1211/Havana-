<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User-registration.aspx.cs" Inherits="Havana.User_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="UTF-8" />
    <meta name="description" content="" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title> Home</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico" />

    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css" />
</head>
<body>

    <form id="form1" runat="server">
        <!-- Preloader -->
    <div id="preloader">
        <div class="south-load"></div>
    </div>
         <!-- ##### Header Area Start ##### -->
    <header class="header-area">

        <!-- Top Header Area -->
        <div class="top-header-area">
            <div class="h-100 d-md-flex justify-content-between align-items-center">
                <div class="email-address">
                    <a href="mailto:Havanaestate1211@gmail.com"><b>havanaestate1211@gmail.com</b></a>
                </div>
                <div class="phone-number d-flex">
                    <div class="icon">
                        <img src="img/icons/user.png" alt="">
                    </div>
                    <div class="number">
                        <a href="UserLogin"><b>User Login</b></a>
                    </div>
                </div>
                <div class="phone-number d-flex">
                    <div class="icon">
                        <img src="img/icons/admin.png" alt="">
                    </div>
                    <div class="number">
                        <a href="AdminLogin.aspx"><b>Admin Login</b></a>
                    </div>
                </div>
                <div class="phone-number d-flex">
                    <div class="icon">
                        <img src="img/icons/phone-call.png" alt="" />
                    </div>
                    <div class="number">
                        <a href="tel:+91 854 5841 111">+91 854 5841 111</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Header Area -->
        <div class="main-header-area" id="stickyHeader">
            <div class="classy-nav-container breakpoint-off">
                <!-- Classy Menu -->
                <nav class="classy-navbar justify-content-between" id="southNav">

                    <!-- Logo -->
                    <a class="nav-brand" href="Homepage.aspx"><img src="img/core-img/logo.png" alt="" /></a>

                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>

                    <!-- Menu -->
                    <div class="classy-menu">

                        <!-- close btn -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>

                        <!-- Nav Start -->
                        <div class="classynav">
                            <ul>
                                <li><a href="Homepage.aspx">Home</a></li>
                               <li><a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="Homepage.aspx">Home</a></li>
                                        <li><a href="About-us.aspx">About Us</a></li>
                                        <li><a href="#">Listings</a>
                                            <ul class="dropdown">
                                                <li><a href="Listing.aspx">Listings</a></li>
                                                <li><a href="Single-listing.aspx">Single Listings</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Blog</a>
                                            <ul class="dropdown">
                                                <li><a href="Blog.aspx">Blog</a></li>
                                                <li><a href="Single-Blog.aspx">Single Blog</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="Contact-us.aspx">Contact</a></li>
                                        <li><a href="Elements.aspx">Elements</a></li>
                                    </ul>
                                </li>
                                <li><a href="About-us.aspx">About Us</a></li>
                                <li><a href="Listing.aspx">Properties</a></li>
                                <li><a href="Blog.aspx">Blog</a></li>
                                <li><a href="User-registration.aspx">User Registration</a></li>
                                
                                <li><a href="Contact-us.aspx">Contact</a></li>
                            </ul>

                            <!-- Search Form -->
                                                    </div>
                        <!-- Nav End -->
                    </div>
                </nav>
            </div>
        </div>
    </header>
    <%--<!-- ##### Header Area End ##### -->
        <%-- user registration form starts here--%><br /><br /><br /><br /><br /><br />
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
             <div class="col-md-8"><br />
                  <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Smaller" CssClass="alert alert-secondary text-center" Visible="false"></asp:Label>
                  <asp:Label ID="lblmsg1" runat="server" Font-Italic="false" Font-Size="Smaller" CssClass="alert alert-secondary text-center" Visible="false"></asp:Label>
                 <br /><br /><br />
                 <asp:HiddenField ID="hdfapp" runat="server" />
                 <%--<div class="panel">--%>
                     <div class="jumbotron shadow-lg">
                         <h3 class="text-dark text-center"><span class="fa fa-user-circle fa-2x"></span>   User Registration</h3>
                     </div>
                     <div class="card-body">
                         <table class="table table-responsive-lg table-hover shadow-lg">
                             <tr>
                                 <th ><span class="fa fa-user-circle-o fa-2x"></span></th>
                                 <td>
                                      <input type="text" runat="server" id="txtname" placeholder=" Name...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                 </td>
                             </tr>
                             <tr>
                                 <th><span class="fa fa-envelope-o fa-2x"></span></th>
                                 <td>
                                    <input type="text" runat="server" id="txtemail" placeholder=" Email...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                 </td>
                             </tr>
                             <tr>
                                 <th><span class="fa fa-mobile-phone fa-2x"></span></th>
                                 <td>
                                   <input type="text" runat="server" id="txtcontact" placeholder=" Contact Number...." class="form-control" required="required" style="border-radius: 5px 5px" pattern="[0-9]{10}" title="Enter a Valid Contact Number"/>
                                 </td>
                             </tr>
                             <tr>
                                 <th><span class="fa fa-lock fa-2x"></span></th>
                                 <td>
                                    <input type="password" runat="server" id="txtpassword" placeholder=" Password...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                 </td>
                             </tr>
                             <tr>
                                 <th><span class="fa fa-lock fa-2x"></span></th>
                                 <td>
                                    <input type="text" runat="server" id="txtcnfpassword" placeholder="Confirm Password...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                 </td>
                             </tr>
                          <tr> 
                                 <td colspan="2">
                                     <asp:Button ID="btnsbmt" runat="server" Text="Submit" CssClass=" btn btn-outline-dark btn-block south-btn" OnClick="btnsbmt_Click" style="border-radius: 5px 5px"/>
                                 </td>
                                 
                             </tr>
                             
                         </table>
                     </div>
                 </div>
            
             </div>
             <div class="col-md-2"></div>
        </div>
         <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area section-padding-100-0 bg-img gradient-background-overlay" style="background-image: url(img/bg-img/cta.jpg);">
        <!-- Main Footer Area -->
        <div class="main-footer-area">
            <div class="container">
                <div class="row">

                    <!-- Single Footer Widget -->
                    <div class="col-12 col-sm-6 col-xl-3">
                        <div class="footer-widget-area mb-100">
                            <!-- Widget Title -->
                            <div class="widget-title">
                                <h6>About Us</h6>
                            </div>

                            <img src="img/bg-img/footer.jpg" alt="" />
                            <div class="footer-logo my-4">
                                <img src="img/core-img/logo.png" alt="" />
                            </div>
                            <h6 class="text-light">Client Focused. Results Driven.</h6>
                        </div>
                    </div>

                    <!-- Single Footer Widget -->
                    <div class="col-12 col-sm-6 col-xl-3">
                        <div class="footer-widget-area mb-100">
                            <!-- Widget Title -->
                            <div class="widget-title">
                                <h6>Hours</h6>
                            </div>
                            <!-- Office Hours -->
                            <div class="weekly-office-hours">
                                <ul>
                                    <li class="d-flex align-items-center justify-content-between"><span>Monday - Friday</span> <span>09 AM - 19 PM</span></li>
                                    <li class="d-flex align-items-center justify-content-between"><span>Saturday</span> <span>09 AM - 14 PM</span></li>
                                    <li class="d-flex align-items-center justify-content-between"><span>Sunday</span> <span>Closed</span></li>
                                </ul>
                            </div>
                            <!-- Address -->
                            <div class="address">
                                <h6><img src="img/icons/phone-call.png" alt="" /> +91 854 5841 111</h6>
                                <h6><img src="img/icons/envelope.png" alt="" /> havanaestate@gmail.com</h6>
                                <h6><img src="img/icons/location.png" alt="" /> C Block Dayal Residency, Faizabad Road, Lucknow</h6>
                            </div>
                        </div>
                    </div>

                    <!-- Single Footer Widget -->
                    <div class="col-12 col-sm-6 col-xl-3">
                        <div class="footer-widget-area mb-100">
                            <!-- Widget Title -->
                            <div class="widget-title">
                                <h6>Useful Links</h6>
                            </div>
                            <!-- Nav -->
                            <ul class="useful-links-nav d-flex align-items-center">
                                <li><a href="#">Home</a></li>
                                <li><a href="#">About us</a></li>
                                <li><a href="#">About us</a></li>
                                <li><a href="#">Services</a></li>
                                <li><a href="#">Properties</a></li>
                                <li><a href="#">Listings</a></li>
                                <li><a href="#">Testimonials</a></li>
                                <li><a href="#">Properties</a></li>
                                <li><a href="#">Blog</a></li>
                                <li><a href="#">Testimonials</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Elements</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </div>
                    </div>

                    <!-- Single Footer Widget -->
                    <div class="col-12 col-sm-6 col-xl-3">
                        <div class="footer-widget-area mb-100">
                            <!-- Widget Title -->
                            <div class="widget-title">
                                <h6>Featured Properties</h6>
                            </div>
                            <!-- Featured Properties Slides -->
                            <div class="featured-properties-slides owl-carousel">
                                <!-- Single Slide -->
                                <div class="single-featured-properties-slide">
                                    <a href="#"><img src="img/bg-img/fea-product.jpg" alt="" /></a>
                                </div>
                                <!-- Single Slide -->
                                <div class="single-featured-properties-slide">
                                    <a href="#"><img src="img/bg-img/fea-product.jpg" alt="" /></a>
                                </div>
                                <!-- Single Slide -->
                                <div class="single-featured-properties-slide">
                                    <a href="#"><img src="img/bg-img/fea-product.jpg" alt="" /></a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Copywrite Text -->
        <div class="copywrite-text d-flex align-items-center justify-content-center">
            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<%:DateTime.Now.Year %> All rights reserved | 
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->
   <%-- end here--%>
    </form>
     <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <script src="js/classy-nav.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
    <script>
        $(document).ready(function ()
        {
            $('lblmsg').delay(5000).fadeOut('fast');
        }
            );
    </script>
</body>
</html>
