<%@ Page Title="" Language="C#" MasterPageFile="~/User/Userindex.Master" AutoEventWireup="true" CodeBehind="Update-BankDetails.aspx.cs" Inherits="Havana.User.Update_BankDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <%--kyc form starts here--%><br />
    <br />
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
                        <h3 class="text-dark text-center"><span class="fa fa-bank fa-2x" style="color:#62ebeb"></span>     Update Bank Details</h3>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-body">
                        <table class="table table-responsive-lg table-hover">
                            <tr >
                                <th><span class="fa fa-bank fa-2x" style="color:#62ebeb"></span></th>
                                <td colspan="3">
                                    <input type="text" runat="server" id="txtbank" placeholder=" Bank Name...." class="form-control" required="required" style="border-radius: 5px 5px"/>
                                </td>

                            </tr>

                           <tr >
                                <th><span class="fa fa-bank fa-2x" style="color:#62ebeb"></span></th>
                                <td colspan="3">
                                    <input type="text" runat="server" id="txtbranch" placeholder=" Branch Name...." class="form-control" required="required" style="border-radius: 5px 5px"/>
                                </td>

                            </tr>
                            <tr >
                                <th><span class="fa fa-code fa-2x" style="color:#62ebeb"></span></th>
                                <td colspan="3">
                                    <input type="text" runat="server" id="txtifsc" placeholder=" IFS Code...." class="form-control" required="required" style="border-radius: 5px 5px"/>
                                </td>

                            </tr>
                            <tr >
                                <th><span class="fa fa-info-circle fa-2x" style="color:#62ebeb"></span></th>
                                <td colspan="3">
                                    <input type="text" runat="server" id="txtacc" placeholder=" Account No...." class="form-control" required="required" style="border-radius: 5px 5px"/>
                                </td>

                            </tr>
                                   
                            <tr>
                                <td colspan="4">
                                    <asp:Button ID="btnsbmt" runat="server" Text="Update" CssClass=" btn btn-primary btn-block" Style="border-radius: 5px 5px" OnClick="btnsbmt_Click"/>
                                </td>

                            </tr>

                        </table>
                    </div>
                         <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-secondary text-center" Visible="false"></asp:Label>
                    </div>

            </div>
            <div class="col-md-4">
            </div>
        </div>
    </div><br /><br /><br /><br /><br /><br /><br /><br /><br />
    <%--kyc ends here--%>
</asp:Content>
