<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="User-Registration.aspx.cs" Inherits="E_Book_Shoppy.User_Registration" %>
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
            <h2 class="mb-4"><span class="glyphicon glyphicon-user"></span>         User Registration</h2>
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
                         <h2 class="text-dark text-center"><span class="glyphicon glyphicon-user "></span>         User Registration</h2>
                     </div>
                     <div class="card-body">
                         <table class="table table-responsive-lg table-hover shadow-lg table-borderless">
                             <tr>
                                 <th ><span class="icon icon-user"></span></th>
                                 <td>
                                      <input type="text" runat="server" id="txtname" placeholder=" Name...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                 </td>
                             </tr>
                             <tr>
                                 <th><span class="icon icon-birthday-cake"></span></th>
                                 <td>
                                    <input type="date" runat="server" id="txtbirthday" placeholder=" ...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                 </td>
                             </tr>
                            <tr>
                                 <th><span class="icon icon-mobile-phone"></span></th>
                                 <td>
                                    <input type="number" runat="server" id="txtmob" placeholder=" Contact No...." class="form-control" required="required" style="border-radius: 5px 5px" pattern="[0-9]{10}" title="Please enter a valid 10 digits mobile number" />
                                 </td>
                             </tr>
                             <tr>
                                 <th><span class="icon icon-envelope"></span></th>
                                 <td>
                                    <input type="text" runat="server" id="txtemail" placeholder=" Email...." class="form-control" required="required" style="border-radius: 5px 5px" pattern="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" title="Please enter a valid email-Id"/>
                                 </td>
                             </tr>
                             <tr>
                                 <th><span class="icon icon-lock"></span></th>
                                 <td>
                                    <input type="password" runat="server" id="txtpswd" placeholder=" Password...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                 </td>
                             </tr>
                             <tr>
                                 <th><span class="icon icon-lock"></span></th>
                                 <td>
                                    <input type="text" runat="server" id="txtcnfpswd" placeholder=" Confirm Password...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                 </td>
                             </tr>
                          <tr> 
                              <th><span class="icon icon-save"></span></th>
                                 <td>
                                     <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="form-group btn btn-outline-primary btn-block py-3 px-5" style="border-radius: 5px 5px;font-size:large" OnClick="btnsubmit_Click" />
                                        
                                 </td>
                                 
                             </tr>
                         </table>
                        
                       <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Larger" CssClass="alert alert-danger text-center" Visible="false"></asp:Label>
             </div>
                     </div>
                 </div>
              
             <div class="col-md-3"></div>
        </div>
    <br /><br />
    <%--user login form ends here--%>
</asp:Content>
