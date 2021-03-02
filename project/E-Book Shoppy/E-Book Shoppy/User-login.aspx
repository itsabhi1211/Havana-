<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="User-login.aspx.cs" Inherits="E_Book_Shoppy.User_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .glyphicon {
    font-size: 40px;
}
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--user login form starts here--%>
    <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_1.jpg);">
         <div class="container">
    		<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
            <h2 class="mb-4"><span class="glyphicon glyphicon-user"></span>     User Login</h2>
          </div>
        </div>
             </div>
         </section>
    <div class="container"><br /><br /><br />
        <div class="row">
            <div class="col-md-3"></div>
             <div class="col-md-6">
                 <%--<div class="panel">--%>
                     <div class="jumbotron shadow-lg ftco-animate">
                         <h2 class="text-dark text-center"><span class="glyphicon glyphicon-user"></span>         User Login</h2>
                     </div>
                 <asp:Label ID="lblmsg" runat="server" Font-Size="Larger" CssClass="alert alert-danger text-center" Visible="false"></asp:Label>
                     <div class="card-body ">
                         <table class="table table-responsive-lg table-hover shadow-lg table-borderless">
                             <tr>
                                 <th ><span class="glyphicon glyphicon-user"></span></th>
                                 <td>
                                      <input type="text" runat="server" id="txtuserid" placeholder=" Email/Contact...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                 </td>
                             </tr>
                             <tr>
                                 <th><span class="glyphicon glyphicon-lock"></span></th>
                                 <td>
                                    <input type="password" runat="server" id="txtpassword" placeholder=" Password...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                 </td>
                             </tr>
                            
                          <tr> 
                              <th><span class="glyphicon glyphicon-log-in"></span></th>
                                 <td>
                                     <asp:Button ID="btnlogin" runat="server" Text="Sign In" CssClass="form-group btn btn-primary btn-block py-3 px-5" style="border-radius: 5px 5px;font-size:large" OnClick="btnlogin_Click" />
                                        
                                 </td>
                                 
                             </tr>
                         </table>
                        <div class="text-right">
                            <a href="User-Id.aspx" class="text-danger" style="font-size:medium">Having trouble in SignIn ?</a>
                        </div>
                       
             </div>
                     </div>
                 </div>
              
             <div class="col-md-3"></div>
        </div>
    <br /><br />
    <%--user login form ends here--%>
</asp:Content>
