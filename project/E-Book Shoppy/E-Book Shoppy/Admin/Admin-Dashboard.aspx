<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin-Dashboard.aspx.cs" Inherits="E_Book_Shoppy.Admin.Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="  au-card m-b-30 text-center alert-primary ">
                            <div class="au-card-inner">
                                <a class="title-2 m-b-40 text-dark" href="Registered-User.aspx">User Registered</a>
                                <span class="fa fa-user fa-2x"></span><br />
                                <asp:Label ID="lblusers" runat="server" CssClass="text text-danger" Style="font-size: 30px"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="au-card m-b-30 text-center alert-primary">
                            <div class="au-card-inner">
                                <a class="title-2 m-b-40 text-dark" href="Add-Books.aspx">Books</a><br />
                                <span class="fa fa-book  fa-2x"></span><br />
                                <asp:Label ID="lblbooks" runat="server" CssClass="text text-danger" Style="font-size: 30px"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="au-card m-b-30 text-center alert-primary">
                            <div class="au-card-inner">
                                <a class="title-2 m-b-40 text-dark" href="Add-Magzines.aspx">Magzines</a><br />
                                <span class="fa fa-newspaper fa-2x"></span><br />
                                <asp:Label ID="lblmsg" runat="server" CssClass="text text-danger" Style="font-size: 30px"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="au-card m-b-30 text-center alert-primary">
                            <div class="au-card-inner">
                                <a class="title-2 m-b-40 text-dark" href="Upcoming.aspx">Upcomings</a><br />
                                <span class="fa fa-arrow-right  fa-2x"></span><br />
                                <asp:Label ID="lblupcoming" runat="server" CssClass="text text-danger" Style="font-size: 30px"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
