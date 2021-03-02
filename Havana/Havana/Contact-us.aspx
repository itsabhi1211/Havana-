<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Contact-us.aspx.cs" Inherits="Havana.Contact_us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img" style="background-image: url(img/bg-img/hero1.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content">
                        <h3 class="breadcumb-title">Contact</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <section class="south-contact-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="contact-heading">
                        <h6>Contact info</h6>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-lg-4">
                    <div class="content-sidebar">
                        <!-- Office Hours -->
                        <div class="weekly-office-hours">
                            <ul>
                                <li class="d-flex align-items-center justify-content-between"><span>Monday - Friday</span> <span>09 AM - 19 PM</span></li>
                                <li class="d-flex align-items-center justify-content-between"><span>Saturday</span> <span>09 AM - 14 PM</span></li>
                                <li class="d-flex align-items-center justify-content-between"><span>Sunday</span> <span>Closed</span></li>
                            </ul>
                        </div>
                        <!-- Address -->
                        <div class="address mt-30">
                            <h6><img src="img/icons/phone-call.png" alt=""> +91 854 5841 111</h6>
                            <h6><img src="img/icons/envelope.png" alt=""> havanahomes4u@gmail.com</h6>
                            <h6><img src="img/icons/location.png" alt="">  C Block Dayal Residency, Faizabad Road, Lucknow</h6>
                        </div>
                    </div>
                </div>

                <!-- Contact Form Area -->
                <div class="col-12 col-lg-8">
                    <div class="contact-form">
                        
                            <div class="form-group">
                                <input type="text" class="form-control" name="text" id="txtname" placeholder="Your Name" runat="server">
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="number" id="txtno" placeholder="Your Phone" runat="server">
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" name="email" id="txtmail" placeholder="Your Email" runat="server">
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" name="message" id="txtmsg" cols="30" rows="10" placeholder="Your Message" runat="server"></textarea>
                            </div>
                        <asp:Button runat="server" text="Submit" class="btn south-btn" ID="btnsubmit" style="border-radius: 5px 5px" OnClick="btnsubmit_Click"/>
                       
                    </div>
                     <asp:Label ID="lblmsg" runat="server" CssClass="text text-danger alert-danger" Visible="false"></asp:Label>
                </div>
                
            </div>
        </div>
    </section>

</asp:Content>
