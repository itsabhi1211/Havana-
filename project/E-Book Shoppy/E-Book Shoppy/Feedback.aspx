<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="E_Book_Shoppy.Feedback" %>

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
                    <h1 class="mb-3 bread"><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;Feedback</h1>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 ">
                <div class="jumbotron">
                    <h2 class="text text-dark"><span class="glyphicon glyphicon-comment"></span>                                Drop Your Valueable Feedback Here</h2>
                </div>
                 <div>
                    <asp:Label ID="lblmsg" runat="server" CssClass="alert alert-danger" Visible="false"></asp:Label>
                </div>
                <div class=" bg-white p-5 contact-form ">
                    <div class="form-group">
                        <table class="table table-responsive table-active table-borderless shadow-lg">
                            <tr>
                                <th><span class="glyphicon glyphicon-user"></span></th>
                                <td>
                                    <input type="text" class="form-control" placeholder="Your Name" id="txtname" style="border-radius: 5px 5px" runat="server"></td>
                            </tr>
                            <tr>
                                <th><span class="glyphicon glyphicon-envelope"></span></th>
                                <td>
                                    <input type="text" class="form-control" placeholder="Your Email" id="txtemail" pattern="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" title="Please enter a valid email-Id" style="border-radius: 5px 5px" runat="server"></td>
                            </tr>
                            <tr>
                                <th><span class="glyphicon glyphicon-comment"></span></th>
                                <td>
                                    <textarea type="text" class="form-control" placeholder="Your Feedback" id="txtmsg" style="border-radius: 5px 5px" runat="server" cols="20" rows="10"></textarea></td>
                            </tr>
                            <tr>
                                <th><span class="glyphicon glyphicon-tasks"></span></th>
                                <td>
                                    <asp:RadioButtonList runat="server" ID="ddlrating" CssClass="" TextAlign="Right" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="Good" Value="G"></asp:ListItem>
                                        <asp:ListItem Text="Average" Value="A"></asp:ListItem>
                                        <asp:ListItem Text="Excellent" Value="E"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnsubmit" Text="Feedback" CssClass="form-group btn btn-outline-primary btn-block py-3 px-5" runat="server" Style="border-radius: 5px 5px; font-size: large" OnClick="btnsubmit_Click" />
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
               
            </div>

            <div class="col-md-3"></div>
        </div>
    </div>
</asp:Content>
