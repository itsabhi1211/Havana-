<%@ Page Title="" Language="C#" MasterPageFile="~/User/Userindex.Master" AutoEventWireup="true" CodeBehind="Update-KYC.aspx.cs" Inherits="Havana.User.Update_KYC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function ()
        {
            $("input").keyup(function () {
                if (this.value.length == this.maxLength) {
                    $(this).next('input').focus();
                }
            } );
        }
            );
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--kyc form starts here--%><br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:HiddenField ID="hdf" runat="server"/>
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-7">
                <div class="text-center">
                     <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-secondary text-center" Visible="false"></asp:Label>
                </div>
                <asp:HiddenField ID="hdfapp" runat="server" />
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="text-dark text-center"><span class="fa fa-file-o fa-2x" style="color:#62ebeb"></span>     Update KYC Details</h3>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-body">
                        <table class="table table-responsive-lg table-hover">
                            <tr >
                                <th><span class="fa fa-id-card-o fa-2x" style="color:#62ebeb"></span></th>
                                <td colspan="3">
                                    <input type="text" runat="server" id="txtPAN" placeholder=" PAN No...." class="form-control" required="required" style="border-radius: 5px 5px" pattern="[A-Z]{5}\d{4}[A-Z]{1}" title="Enter a Valid 10 digits PAN Number" maxlength="10"/>
                                </td>

                            </tr>

                            <tr>
                                <th><span class="fa fa-id-card-o fa-2x" style="color:#62ebeb"></span></th>
                                <td><input type="text" runat="server" id="txtAadhar1" placeholder=" Aadhar No...." class="form-control" required="required" style="border-radius: 5px 5px" pattern="[0-9]{4}" title="Enter a Valid 4 digits Aadhar Number" maxlength="4" />
                                </td>
                                <td><input type="text" runat="server" id="txtAadhar2" placeholder=" Aadhar No...." class="form-control" required="required" style="border-radius: 5px 5px" pattern="[0-9]{4}" title="Enter a Valid 4 digits Aadhar Number" maxlength="4"/>
                                </td>
                                <td><input type="text" runat="server" id="txtAadhar3" placeholder=" Aadhar No...." class="form-control" required="required" style="border-radius: 5px 5px" pattern="[0-9]{4}" title="Enter a Valid 4 digits Aadhar Number" maxlength="4"/>
                                </td>
                                </tr>
                                   
                            <tr>
                                <td colspan="4">
                                    <asp:Button ID="btnsbmt" runat="server" Text="Update" CssClass=" btn btn-primary btn-block" Style="border-radius: 5px 5px" OnClick="btnsbmt_Click"/>
                                </td>

                            </tr>

                        </table>
                    </div>
                        
                    </div>

            </div>
            <div class="col-md-4">
            </div>
        </div>
    </div><br /><br /><br /><br /><br /><br /><br /><br /><br />
    <%--kyc ends here--%>
</asp:Content>
