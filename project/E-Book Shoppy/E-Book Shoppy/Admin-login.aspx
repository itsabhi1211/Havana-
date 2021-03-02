<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Admin-login.aspx.cs" Inherits="E_Book_Shoppy.Admin_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .glyphicon {
    font-size: 30px;
}
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <%--user login form starts here--%>
    <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_1.jpg);">
         <div class="container">
    		<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
            <h2 class="mb-4"><span class="icon icon-user-circle-o"></span>     Admin Login</h2>
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
                         <h2 class="text-dark text-center"><span class="icon icon-user-circle"></span>             Admin Login</h2>
                     </div>
                     <div class="card-body">
                         <table class="table table-responsive-lg table-hover shadow-lg table-borderless">
                             <tr>
                                 <th ><span class="icon icon-user-circle"></span></th>
                                 <td>
                                      <input type="text" runat="server" id="txtuserid" placeholder=" Email/Contact...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                 </td>
                             </tr>
                             <tr>
                                 <th><span class="icon icon-lock"></span></th>
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
                        
                       <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Larger" CssClass="alert alert-secondary text-center" Visible="false"></asp:Label>
             </div>
                     </div>
                 </div>
              
             <div class="col-md-3"></div>
        </div>
    <br /><br />
</asp:Content>
