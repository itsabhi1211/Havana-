<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminindex.Master" AutoEventWireup="true" CodeBehind="Reply.aspx.cs" Inherits="Havana.Admin.Rply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container" >
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body shadow-lg" >
                         <asp:Label runat="server" ID="lblmsg" CssClass="alert-danger"></asp:Label>
                        <table class="table table-responsive table-borderless table-hover">
                            <tr>

                                <td ><span class="fa fa-user-circle fa-2x text-secondary"></span></td>
                                <td>
                                    <input type="text" id="txtname" runat="server" class="form-control" style="border-radius: 5px 5px"/></td>
                               
                            </tr>
                            <tr>
                                 <td ><span class="fa fa-mobile fa-2x text-secondary"></span></td>
                                 <td>
                                      <input type="text" id="txtcontact" runat="server" class="form-control" style="border-radius: 5px 5px"/>
                                </td>
                            </tr>
                            <tr>
                                 <td ><span class="fa fa-envelope fa-2x text-secondary"></span></td>
                                 <td>
                                      <input type="text" id="txtemail" runat="server" class="form-control" style="border-radius: 5px 5px" />
                                </td>
                            </tr>
                            <tr>
                                 <td ><span class="fa fa-reply fa-2x text-secondary"></span></td>
                                 <td>
                                      <textarea type="text" id="txtrply" cols="5" rows="10" runat="server" class="form-control" style="border-radius: 5px 5px" required="required"/>
                                </td>
                            </tr>
                            <tr >
                                <td colspan="2">
                                    <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-block btn-primary" Text="Reply" OnClick="btnsubmit_Click" />
                                </td>
                                
                                
                            </tr>
                        </table>
                    </div>
                </div>

            </div>
            <div class="col-md-3">
                
            </div>
        </div>
    </div><br />
</asp:Content>
