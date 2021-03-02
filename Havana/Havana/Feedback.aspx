<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="Havana.Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="breadcumb-area bg-img" style="background-image: url(img/bg-img/hero1.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content">
                        <h3 class="breadcumb-title">Feedback </h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="blog-area section-padding-100" style="text-align: center;">
        <div class="container">
            <div class="row">
                <div class="col-md-3 "></div>
                <div class="col-md-6">
                    <!-- Leave A Comment -->
                    <div class="leave-comment-area mt-70 clearfix">
                        <div class="comment-form">
                            <h3 class="breadcumb-title ">Drop Your Valueable Feedback Here</h3>
                            <br />
                            <!-- Comment Form -->
                            <div class="form-group">
                                <input type="text" class="form-control" id="txtname" placeholder="Name" style="border-color: #947054; border: 2px medium" runat="server" required="required">
                            </div>
                            <div class="form-group" style="text-align: center">
                                <input type="email" class="form-control" id="txtemail" placeholder="Email" style="border-color: #947054; border: 2px medium" runat="server" required="required">
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" id="txtnum" placeholder="Contact No." style="border-color: #947054; border: 2px medium" runat="server" required="required" pattern="[0-9]{10}" title="Please Enter A Valid 10 Digit Mobile Number..">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="message" cols="30" rows="10" placeholder="Message" style="border-color: #947054; border: 2px medium" runat="server" id="txtmsg" required="required"></textarea>
                            </div>
                            <div>
                                <table class="table table-responsive table-borderless">
                                    <tr>
                                        <td>
                                            <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" RepeatColumns="3" CssClass="contact-form">
                                                <asp:ListItem Value="G">Good</asp:ListItem>
                                                <asp:ListItem Value="A">Average</asp:ListItem>
                                                <asp:ListItem Value="E">Excellent</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <asp:Button ID="btnsubmit" runat="server" CssClass="btn south-btn" Text="Submit" Style="border-radius: 5px 5px" OnClick="btnsubmit_Click" />
                        </div>
                    </div>
                     <asp:Label ID="lblmsg" runat="server" Visible="false" CssClass="alert alert-danger text-danger"></asp:Label>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
