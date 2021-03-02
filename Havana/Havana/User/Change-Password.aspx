<%@ Page Title="" Language="C#" MasterPageFile="~/User/Userindex.Master" AutoEventWireup="true" CodeBehind="Change-Password.aspx.cs" Inherits="Havana.User.Change_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> <br />
    <br />
    <br />
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-7">
                <asp:HiddenField ID="hdfapp" runat="server" />
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="text-dark text-center"><span class="fa fa-lock fa-2x" style="color:#62ebeb"></span>     Change Password</h3>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-body">
                        <table class="table table-responsive-lg table-hover">
                            <tr >
                                <th><span class="fa fa-lock fa-2x" style="color:#62ebeb"></span></th>
                                <td colspan="3">
                                    <input type="password" runat="server" id="txtold" placeholder=" Old Password..." class="form-control" required="required" style="border-radius: 5px 5px" />
                                </td>

                            </tr>
                            <tr >
                                <th><span class="fa fa-lock fa-2x" style="color:#62ebeb"></span></th>
                                <td colspan="3">
                                    <input type="password" runat="server" id="txtnew" placeholder=" New Password..." class="form-control" required="required" style="border-radius: 5px 5px" />
                                </td>
                               
                            </tr>
                            <tr >
                                <th><span class="fa fa-lock fa-2x" style="color:#62ebeb"></span></th>
                                <td colspan="3">
                                    <input type="password" runat="server" id="txtcnf" placeholder=" Confirm New Password..." class="form-control" required="required" style="border-radius: 5px 5px" />
                                </td>

                            </tr>

                            
                                   
                            <tr>
                                <td colspan="4">
                                    <asp:Button ID="btnchange" runat="server" Text="Change Password" CssClass=" btn btn-primary btn-block" Style="border-radius: 5px 5px" OnClick="btnchange_Click"/>
                                </td>

                            </tr>

                        </table>
                    </div>
                         <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-secondary text-center" Visible="false"></asp:Label>
                     <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Not Matched.. Please Try Again.." ControlToCompare="txtnew" ValueToCompare="txtnew" ControlToValidate="txtcnf"></asp:CompareValidator>
                    </div>

            </div>
            <div class="col-md-4">
            </div>
        </div>
    </div><br /><br /><br /><br /><br /><br /><br /><br /><br />
    <%--kyc ends here--%>
</asp:Content>
