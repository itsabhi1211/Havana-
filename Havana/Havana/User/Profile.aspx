<%@ Page Title="" Language="C#" MasterPageFile="~/User/Userindex.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Havana.User.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper site-min-height">
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="row content-panel">
                        <div class="col-md-4 profile-text mt mb centered">
                            <div class="right-divider hidden-sm hidden-xs">
                                <h4>1922</h4>
                                <h6>FOLLOWERS</h6>
                                <h4>290</h4>
                                <h6>FOLLOWING</h6>
                            </div>
                        </div>
                        <!-- /col-md-3 -->
                        <div class="col-md-4 profile-text">
                            <br />
                            <asp:Label ID="lblname" runat="server" Font-Size="X-Large" ForeColor="Black" Font-Bold="true"></asp:Label>
                        </div>
                        <!-- /col-md-4 -->
                        <div class="col-md-4 centered">
                            <div class="profile-pic">
                                <p>
                                    <img src="img/avatar.png" class="img-circle" id="profileimg" runat="server" width="128" height="128"></p>
                                <p>
                                    <asp:FileUpload CssClass="btn btn-theme" ID="txtimg" runat="server"/><br />
                              <asp:Button ID="btnupld" runat="server" class="btn btn-theme" Text="Upload Profile" OnClick="btnupld_Click" />
                                </p>
                            </div>
                        </div>
                        <!-- /col-md-4 -->
                    </div>
                    <!-- /row -->
                </div>
                <!-- /col-lg-12 -->
                <div class="col-lg-12 mt">
                    <div class="row content-panel">
                        <div class="panel-heading">
                            <ul class="nav nav-tabs nav-justified">
                                <li class="active">
                                    <a data-toggle="tab" href="#overview">Overview</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#contact" class="contact-map">Contact</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#edit">Profile Details</a>
                                </li>
                            </ul>
                        </div>
                        <!-- /panel-heading -->
                        <div class="tab-content">
                            <div id="overview" class="tab-pane active">
                                <div class="row">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-6">
                                        <br />
                                        <br />
                                        <div class="panel">
                                            <div class="panel-body">
                                                <table class="table table-responsive-lg">
                                                    <tr>
                                                        <th><span class="fa fa-envelope fa-2x" style="color:#62ebeb"></span></th>
                                                        <td>
                                                            <asp:Label ID="lblmail" runat="server"  Height="40px" Font-Size="Medium" CssClass="text-info"></asp:Label>
                                                        </td>

                                                    </tr>
                                                   
                                                    <tr>
                                                        <th><span class="fa fa-birthday-cake fa-2x" style="color:#62ebeb"></span></th>
                                                        <td>
                                                            <asp:Label ID="lbldob" runat="server"  Height="40px" Font-Size="Medium" CssClass="text-info"></asp:Label>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </div>
                                        </div>
                                        <!-- /detailed -->
                                    </div>
                                    <div class="col-md-3"></div>
                                </div>
                                <!-- /OVERVIEW -->
                            </div>
                            <!-- /tab-pane -->
                            <div id="contact" class="tab-pane">
                                <div class="row">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-6">
                                        <div class="panel">
                                            <div class="panel-body">
                                                <table class="table table-responsive-lg">
                                                    <tr>
                                                        <th><span class="fa fa-mobile-phone fa-2x " style="color:#62ebeb"></span></th>
                                                        <td>
                                          <asp:Label ID="lblcontact" runat="server"  Height="40px" Font-Size="Medium" CssClass="text-info"></asp:Label>
                                                        </td>
                                                    <tr>
                                                        <th><span class="fa fa-address-card-o fa-2x " style="color:#62ebeb"></span></th>
                                                        <td>
                                          <asp:Label ID="lblstate" runat="server"  Height="40px" Font-Size="Medium" CssClass="text-info"></asp:Label>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <th><span class="fa fa-address-card-o fa-2x" style="color:#62ebeb"></span></th>
                                                        <td>
                                     <asp:Label ID="lblcity" runat="server"  Height="40px" Font-Size="Medium" CssClass="text-info"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th><span class="fa fa-address-card-o fa-2x" style="color:#62ebeb"></span></th>
                                                        <td>
                                            <asp:Label ID="lbladd" runat="server"  Height="40px" Font-Size="Medium" CssClass="text-info"></asp:Label>
                                                            </td>
                                                        </tr>
                                                       
                                                             <tr>
                                                        <th><span class="fa fa-code-fork fa-2x" style="color:#62ebeb"></span></th>
                                                        <td>
                                            <asp:Label ID="lblpin" runat="server"  Height="40px" Font-Size="Medium" CssClass="text-info"></asp:Label>
                                                        </td>
                                                                 </tr>
                                                    
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3"></div>
                                    <!-- /col-md-6 -->

                                    <!-- /col-md-6 -->
                                </div>
                                <!-- /row -->
                            </div>
                            <!-- /tab-pane -->
                            <div id="edit" class="tab-pane">
                                <div class="row">

                                    <div class="col-lg-6 col-lg-offset-2 detailed">
                                        <h4 class="mb">Personal Information</h4>
                                        <div class="panel">
                                            <div class="panel-body">
                                                <table class="table table-responsive-lg">
                                                    <tr>
                                                        <th><span class="fa fa-envelope fa-2x" style="color:#62ebeb"></span></th>
                                                        <td>
                                                            <input type="text" runat="server" id="txtemail" placeholder=" Email...." class="form-control" style="border-radius: 5px 5px" />
                                                        </td>

                                                    </tr>
                                                    

                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3"></div>
                                    <!-- /col-md-6 -->

                                    <!-- /col-md-6 -->

                                    <div class="col-lg-6 col-lg-offset-2 detailed mt">
                                        <h4 class="mb">Contact Information</h4>
                                        <div class="panel">
                                            <div class="panel-body">
                                                <table class="table table-responsive-lg">
                                                    <tr>
                                                        <th><span class="fa fa-address-card-o fa-2x" style="color:#62ebeb"></span></th>
                                                        <td>
                                                            <input type="text" runat="server" id="txtcity" placeholder=" City...." class="form-control" style="border-radius: 5px 5px" />
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <th><span class="fa fa-address-card-o fa-2x" style="color:#62ebeb"></span></th>
                                                        <td>
                                                            <input type="text" runat="server" id="txtstate" placeholder="  State...." class="form-control" style="border-radius: 5px 5px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th><span class="fa fa-address-card-o fa-2x" style="color:#62ebeb"></span></th>
                                                        <td>
                                                            <textarea rows="5" cols="20" type="text" runat="server" id="txtadd" placeholder=" Address...." class="form-control" style="border-radius: 5px 5px" ></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th><span class="fa fa-mobile-phone fa-2x" style="color:#62ebeb"></span></th>
                                                        <td>
                                                            <input type="text" runat="server" id="txtcontactno" placeholder=" Contact No...." class="form-control" style="border-radius: 5px 5px" />
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <th><span class="fa fa-code-fork fa-2x" style="color:#62ebeb"></span></th>
                                                        <td>
                                          <input type="text" runat="server" id="txtpin" placeholder=" Pincode...." class="form-control" style="border-radius: 5px 5px" />
                                                        </td>
                                                                 </tr>
                                                             <tr>
                                                        <td>
                                                            <asp:Label ID="lblmsg" runat="server"  Height="40px" Font-Size="Medium" CssClass="text-danger"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3"></div>
                                    <!-- /col-lg-6 -->
                                </div>
                                <!-- /row -->
                            </div>
                            <!-- /tab-pane -->
                        </div>
                        <!-- /tab-content -->
                    </div>
                    <!-- /panel-body -->
                </div>
                <!-- /col-lg-12 -->
            </div>
            <!-- /row -->
            <!-- /container -->
        </section>
        <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
</asp:Content>
