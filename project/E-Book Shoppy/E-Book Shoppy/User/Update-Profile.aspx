<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Update-Profile.aspx.cs" Inherits="E_Book_Shoppy.User.Update_Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hdfvalue" runat="server" />
    <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Update Profile Details</h4>
                            </div>
                            <div class="content">
                                <div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input type="text" class="form-control" placeholder="Name" runat="server" id="txtname" required="required">
                                            </div>
                                        </div>
                                        
                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Date Of Birth</label>
                                                <input type="text" class="form-control" placeholder="DOB" runat="server" id="txtdob" required="required">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Contact No</label>
                                                <input type="text" class="form-control" placeholder="Contact No" runat="server" id="txtcontactno" required="required">
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="text" class="form-control" placeholder="Email" runat="server" id="txtmail" required="required">
                                            </div>
                                        </div>
                                        
                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Gender</label>
                                                <asp:DropDownList runat="server" class="form-control" ID="ddlgender" required="required">
                                                    <asp:ListItem Text="Choose Your Gender" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                                                    <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                                                    <asp:ListItem Text="Other" Value="O"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Pincode</label>
                                                <input type="text" class="form-control" placeholder="Pincode" runat="server" id="txtpin">
                                            </div>
                                        </div>
                                        
                                    </div>                                 

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>City</label>
                                                <input type="text" class="form-control" placeholder="City" runat="server" id="txtcity" required="required">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>State</label>
                                                <input type="text" class="form-control" placeholder="State" runat="server" id="txtstate" required="required">
                                            </div>
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Address</label>
                                                <input type="text" class="form-control" placeholder="Home Address" runat="server" id="txtadd" required="required" >
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Button text="Update Profile" CssClass="btn btn-info btn-fill pull-right" runat="server" OnClick="btnupdate_Click" ID="btnupdate"></asp:Button>
                                    <div class="clearfix"></div>
                                </div> 
                            </div>
                        </div>
                        <div>
                        <asp:Label ID="lblmsg1" runat="server" CssClass="alert alert-danger" Visible="false"></asp:Label>
                    </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="card card-user">
                            <div class="image">
                                <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400" alt="..."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                     <a href="#">
                                    <img class="avatar border-gray" id="img1" alt="No Image" src="Images/avatar.png" runat="server"/>                                        
                                    </a>
                                </div>
                                <div>
                                    <asp:FileUpload ID="txtfile" runat="server" CssClass="form-control" />
                                </div><br />
                                <div class="text-center">
                                    <asp:Button ID="btnuploadimage" Text="Update Picture" runat="server" CssClass="btn btn-info btn-fill" OnClick="btnuploadimage_Click"/>
                                </div>
                            </div>
                            <hr>
                        </div>
                    </div>

                </div>
            </div>
        </div>
</asp:Content>
