<%@ Page Title="" Language="C#" MasterPageFile="~/User/Userindex.Master" AutoEventWireup="true" CodeBehind="Update-profile.aspx.cs" Inherits="Havana.User.Update_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $('#txtdob').datepicker({
                changeYear: true,
                yearRange: "1960:2030",
                changeMonth: true,
                dateFormat: "dd-mm-yyyy",
                monthName: ["01", "02", "03", "04", "05", "06", "06", "08", "09", "10", "11", "12"],
                minDate:0
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- update profile form starts here--%><br /><br /><br /><br /><br /><br />
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-7">
                <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-secondary text-center" Visible="false"></asp:Label>
                <asp:HiddenField ID="hdfapp" runat="server" />
                <asp:HiddenField ID="hdf1" runat="server" />
                <asp:HiddenField ID="hdf2" runat="server" />
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="text-dark text-center"><span class="fa fa-user-circle fa-2x " style="color:#62ebeb"></span>   Update Profile</h3>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-body">
                        <table class="table table-responsive-lg table-hover">
                            <tr>
                                <th><span class="fa fa-image fa-2x" style="color:#62ebeb"></span></th>
                                <td>
                                     <asp:FileUpload ID="txtimg" runat="server" style="border-radius: 5px 5px" class="form-control" Height="40px"/>
                                </td>
                               
                            </tr>
                            <tr>
                                <th><span class="fa fa-users fa-2x" style="color:#62ebeb"></span></th>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddlgender" Style="border-radius: 5px 5px" class="form-control">
                                        <asp:ListItem Value="0" Text="Choose Your Gender"></asp:ListItem>
                                          <asp:ListItem Value="1" Text="Male"></asp:ListItem>
                                          <asp:ListItem Value="2" Text="Female"></asp:ListItem>
                                          <asp:ListItem Value="3" Text="Other"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <th><span class="fa fa-address-card fa-2x" style="color:#62ebeb"></span></th>
                                <td>
                                    <input type="text" runat="server" id="txtstate" placeholder=" State...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                </td>
                                <tr>
                                <th><span class="fa fa-address-card fa-2x" style="color:#62ebeb"></span></th>
                                <td>
                                    <input type="text" runat="server" id="txtcity" placeholder=" City...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                </td>
                            <tr>
                                <th><span class="fa fa-address-card fa-2x" style="color:#62ebeb"></span></th>
                                <td>
                                    <input type="text" runat="server" id="txtaddress" placeholder=" Address...." class="form-control" required="required" style="border-radius: 5px 5px" Height="40px" />
                                </td>
                            </tr>
                            <tr>
                                <th><span class="fa fa-code fa-2x" style="color:#62ebeb"></span></th>
                                <td>
                                    <input type="text" runat="server" id="txtpincode" placeholder=" Pin Code...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                </td>
                            </tr>
                            <tr>
                                <th><span class="fa fa-birthday-cake fa-2x" style="color:#62ebeb"></span></th>
                                <td>
                                    <input type="date" runat="server" id="txtdob" placeholder="dd-mm-yyyy...." class="form-control" required="required" style="border-radius: 5px 5px" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnsbmt" runat="server" Text="Update" CssClass=" btn btn-primary btn-block" Style="border-radius: 5px 5px" OnClick="btnsbmt_Click"/>
                                </td>

                            </tr>

                        </table>
                    </div>
                    <div class="panel">
                <div class="panel-body">
                     <asp:Image runat="server" ID="userimg"/>
                </div>
                </div>

            </div>

        </div>
        <div class="col-md-4" >
           
            </div>
        </div>
    </div>
</asp:Content>
