<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Contact-Us.aspx.cs" Inherits="E_Book_Shoppy.Contact_Us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .glyphicon {
    font-size: 30px;
}
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="hero-wrap" style="background-image: url('images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-3 bread"><span class="glyphicon glyphicon-phone"></span>Contact Us</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section contact-section bg-light">
      <div class="container">
        <div class="row d-flex mb-5 contact-info">
          <div class="col-md-12 mb-4">
            <h2 class="h3">Contact Information</h2>
          </div>
          <div class="w-100"></div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Address:</span> A Block , Dayal Residency , Faizabad Road , Lucknow</p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Phone:</span> <a href="tel://91 7238873988">+91 723 8873 988</a></p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Email:</span> <a href="mailto:bookshoppyinfo@gmail.com">bookshoppyinfo@gmail.com</a></p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Website</span> <a href="#">bookshoppy.com</a></p>
	          </div>
          </div>
        </div>
        <div class="row block-9">
          <div class="col-md-6 order-md-last d-flex">
            <div  class="bg-white p-5 contact-form">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Name" id="txtname" style="border-radius: 5px 5px" runat="server">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Email" id="txtemail" pattern="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" title="Please enter a valid email-Id" style="border-radius: 5px 5px" runat="server">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Subject" id="txtsub" style="border-radius: 5px 5px" runat="server">
              </div>
                <div class="form-group">
                <input type="text" class="form-control" placeholder="Subject" id="txtno" style="border-radius: 5px 5px" runat="server" pattern="[0-9]{10}" title="Enter a valid 10 digits mobile number...">
              </div>
              <div class="form-group">
                <textarea   cols="30" rows="7" class="form-control" placeholder="Message" id="txtmsg" style="border-radius: 5px 5px" runat="server"></textarea >
              </div>
              <div class="form-group">
                  <asp:Button class="btn btn-primary py-3 px-5" runat="server" Text="Submit" ID="btnsubmit" OnClick="btnsubmit_Click" />
              </div>
                 <div>
              <asp:Label ID="lblmsg" runat="server" CssClass="alert alert-danger" Visible="false"></asp:Label>
          </div>
            </div>
         
          </div>

          <div class="col-md-6 d-flex">
          	<div id="map" class="bg-white"></div>
          </div>
        </div>
      </div>
    </section>
	
</asp:Content>
