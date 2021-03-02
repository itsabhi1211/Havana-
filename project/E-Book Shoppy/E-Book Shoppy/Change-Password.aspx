<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Change-Password.aspx.cs" Inherits="E_Book_Shoppy.Change_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>BookShoppy</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet"/>

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css"/>
    <link rel="stylesheet" href="css/animate.css"/>

    <link rel="stylesheet" href="css/owl.carousel.min.css"/>
    <link rel="stylesheet" href="css/owl.theme.default.min.css"/>
    <link rel="stylesheet" href="css/magnific-popup.css"/>

    <link rel="stylesheet" href="css/aos.css"/>

    <link rel="stylesheet" href="css/ionicons.min.css"/>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/bootstrap-datepicker.css"/>
    <link rel="stylesheet" href="css/jquery.timepicker.css"/>
    <link href="Content/Site.css" rel="stylesheet" />

    <link rel="stylesheet" href="css/flaticon.css"/>
    <link rel="stylesheet" href="css/icomoon.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <style>
        .icon
        {
            font-size:30px
        }
    </style>
     <script src="js/jquery.min.js"></script>
        <script>
        $(document).ready(function()
        {
            $('#lblmsg').delay(5000).fadeOut('fast');
            
        });
    </script>
</head>
    <body>
<form runat="server">
        <div class="top">
            <div class="container">
                <div class="row d-flex align-items-center">
                    <div class="col">
                        <p class="social d-flex">
                            <a href="#"><span class="icon-facebook"></span></a>
                            <a href="#"><span class="icon-instagram"></span></a>
                        </p>
                    </div>
                    <div class="col d-flex justify-content-end">
                        <p class="num"><span class="icon-phone"></span>+91 723 8873 988</p>
                    </div>
                </div>
            </div>
        </div>

        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="Homepage.aspx">Book<span>Shoppy</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span>Menu
	     
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <asp:Button class="btn btn-lg btn-danger" runat="server" Style="font-size:18px" Text="Logout" OnClick="btnlogout_Click" ID="btnlogout"></asp:Button>

                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->
         <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_1.jpg);">
         <div class="container">
    		<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
            <h2 class="mb-4"><span class="glyphicon glyphicon-lock"></span>           Change Password</h2>
          </div>
        </div>
             </div>
         </section><br /><br /><br />
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="panel">
                        <div class="panel-heading panel-primary">
                            <h1 class="text-primary"><span class="glyphicon glyphicon-lock"></span>                                      Change Password</h1>
                        </div>
                        <div class="panel-body">
                            <div class="content table-responsive table-active">
                            <table class="table table-borderless">
                                <tr>
                                    <th><span class="glyphicon glyphicon-user"></span></th>
                                    <td>
                                        <asp:TextBox ID="txtuserid" runat="server" CssClass="form-control" Placeholder="UserId" Style="border-radius:5px 5px"></asp:TextBox>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th><span class="glyphicon glyphicon-lock"></span></th>
                                    <td>
                                        <asp:TextBox ID="txtoldpassword" runat="server" CssClass="form-control" Placeholder="Old Password..." Style="border-radius:5px 5px" TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="glyphicon glyphicon-lock"></span></th>
                                    <td>
                                        <asp:TextBox ID="txtnewpassword" runat="server" CssClass="form-control" Placeholder="New Password..." TextMode="Password" Style="border-radius:5px 5px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="glyphicon glyphicon-lock"></span></th>
                                    <td>
                                        <asp:TextBox ID="txtcnfpassword" runat="server" CssClass="form-control" Placeholder="Confirm New Password..." Style="border-radius:5px 5px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td class="text-center">
                                        <asp:Button ID="btnlogin" CssClass="btn btn-default btn-block" runat="server" Text="Change Password" style="font-size:large" OnClick="btnlogin_Click"/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        </div>
                        <div>
                            <asp:Label ID="lblmsg" runat="server" CssClass="alert alert-danger" Visible="false"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </div><br /><br />
        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">BookShoppy</h2>
                            <p>Far far away, behind the word mountains, far from countries, there live the blind texts.</p>
                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4 ml-md-5">
                            <h2 class="ftco-heading-2">Buy</h2>
                            <ul class="list-unstyled">
                                <li><a href="Books.aspx" class="py-2 d-block">Books</a></li>
                                <li><a href="Magzines.aspx" class="py-2 d-block">Magzines</a></li>
                                <li><a href="Upcoming.aspx" class="py-2 d-block">Upcomings</a></li>
                                <li><a href="Services.aspx" class="py-2 d-block">Services</a></li>
                                <li><a href="Contact-Us.aspx" class="py-2 d-block">Contact Us</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                             <h2 class="ftco-heading-2">Buy</h2>
                            <ul class="list-unstyled">
                                <li><a href="Books.aspx" class="py-2 d-block">Books</a></li>
                                <li><a href="Magzines.aspx" class="py-2 d-block">Magzines</a></li>
                                <li><a href="Upcoming.aspx" class="py-2 d-block">Upcomings</a></li>
                                <li><a href="Services.aspx" class="py-2 d-block">Services</a></li>
                                <li><a href="Contact-Us.aspx" class="py-2 d-block">Contact Us</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Have a Questions?</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">A Block , Dayal Residency , Faizabad Road , Lucknow</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+91 723 8873 988</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">bookshoppyinfo@gmail.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">

                        <p>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                            All rights reserved | Made By Amit Kasera
 
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
            </div>
        </footer><svg class="circular" width="48px" height="48px">
                <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
                <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
            </svg>



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen">
            </div>


       
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery.timepicker.min.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>
    </form>
    </body>
</html>
