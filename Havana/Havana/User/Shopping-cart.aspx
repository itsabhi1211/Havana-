<%@ Page Title="" Language="C#" MasterPageFile="~/User/Userindex.Master" AutoEventWireup="true" CodeBehind="Shopping-cart.aspx.cs" Inherits="Havana.User.Shopping_cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br />  <br /><br /><br />
     <div class="container">
        <div class="row">
           <div class="col-md-2"></div>
            <div class="col-md-6">
                <div class="text-center">
                    <asp:Label ID="lblmsg" runat="server" CssClass="alert alert-danger" Visible="false"></asp:Label>
                </div>
                <asp:HiddenField ID="hdfapp" runat="server" />
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="text-dark text-center"><span class="fa fa-shopping-cart fa-2x" style="color:#62ebeb"></span>     Shopping Cart</h3>
                    </div>
               
               
                    <div class="panel-body">
                        <table class="table table-responsive-lg table-hover">
                            
                            <tr >
                                <th><label class="text-dark" style="font-size: 18px">Total Amount</label></th>
                                <td colspan="3">
                                    <input type="text" runat="server" id="txttotalamt" placeholder=" Total Amount" class="form-control" required="required" style="border-radius: 5px 5px" readonly="readonly"/>
                                </td>
                               
                            </tr>
                            <tr >
                                <th><label class="text-dark" style="font-size: 18px">Paid Amount</label></th>
                                <td colspan="3">
                                    
                                    <asp:TextBox  runat="server" ID="txtpaidamt" placeholder=" Paid Amount..." class="form-control"  style="border-radius: 5px 5px" OnTextChanged="txtpaidamt_TextChanged" AutoPostBack="true"></asp:TextBox>
                                </td>

                            </tr>
                            <tr >
                                <th><label class="text-dark" style="font-size: 18px">Due Amount</label></th>
                                <td colspan="3">
                                    <input type="text" runat="server" id="txtdueamt" placeholder=" Due Amount..." class="form-control" required="required" style="border-radius: 5px 5px" />
                                </td>

                            </tr>
                            <tr >
                                <th><label class="text-dark" style="font-size: 18px">Extra Charge</label></th>
                                <td colspan="3">
                                    <input type="text" runat="server" id="txtextrachrge" placeholder=" Extra Charge..." class="form-control" required="required" style="border-radius: 5px 5px" />
                                </td>

                            </tr>
                       
                           
                            
                                   
                            <tr>
                                <td colspan="4">
                                    <asp:Button ID="btnbuy"  runat="server" Text="Buy Now" CssClass=" btn btn-primary btn-block" Style="border-radius: 5px 5px" OnClick="btnbuy_Click"/>
                                </td>

                            </tr>

                        </table>
                    

            </div>
            <div class="col-md-4">
            </div>
        </div>
    </div>

            <div class="col-md-4">
                <div class="text-center">
                    <asp:Label ID="lblmsg1" runat="server" CssClass="alert alert-danger" Visible="false"></asp:Label>
                </div>
                <asp:HiddenField ID="hdfvalue" runat="server" />
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="text-dark text-center"><span class="fa fa-shopping-cart fa-2x" style="color:#62ebeb"></span>     Shopping Cart</h3>
                    </div>
               
               
                    <div class="panel-body">
                        <table class="table table-responsive-lg table-hover">
                            
                            <tr >
                                <th><label class="text-dark" style="font-size: 18px">Mode</label></th>
                                <td colspan="3">
                                    <asp:DropDownList ID="ddlmode" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlmode_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="0" Text="Payment Mode"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Cash"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Cheque"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="DD"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="Online"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                               
                            </tr>
                            <tr >
                                <th><label class="text-dark" style="font-size: 18px" id="lblchq" runat="server" >Cheque No</label></th>
                                <td colspan="3">
                                    
                                   <input type="text" runat="server" id="txtcheque" value="0" class="form-control" required="required" style="border-radius: 5px 5px" />
                                </td>
                               

                            </tr>
                            <tr >
                                <th><label class="text-dark" style="font-size: 18px" id="lblbnknme" runat="server">Bank Name</label></th>
                                <td colspan="3">
                                    <input type="text" runat="server" id="txtbnk" placeholder=" Bank Name..." class="form-control" required="required" style="border-radius: 5px 5px" />
                                </td>

                            </tr>
                            <tr >
                                <th><label class="text-dark" style="font-size: 18px" id="lblbnkbrnch" runat="server">Bank Branch</label></th>
                                <td colspan="3">
                                    <input type="text" runat="server" id="txtbnkbrnch" placeholder=" Bank Branch..." class="form-control" required="required" style="border-radius: 5px 5px" />
                                </td>

                            </tr>
                            <tr >
                                <th><label class="text-dark" style="font-size: 18px" id="lbldd" runat="server">Demand Draft</label></th>
                                <td colspan="3">
                                    <input type="text" runat="server" id="txtdemand" placeholder="Demand Draft..." class="form-control" required="required" value="0" style="border-radius: 5px 5px" />
                                </td>

                            </tr>
                            <tr >
                                <th><label class="text-dark" style="font-size: 18px" id="lbltrans" runat="server">Transaction Id</label></th>
                                <td colspan="3">
                                    <input type="text" runat="server" id="txttransaction" value="0" class="form-control" required="required" style="border-radius: 5px 5px" />
                                </td>

                            </tr>
                                 
                            

                        </table>
                    

            </div>
            <div class="col-md-4">
            </div>
        </div>
    </div>
        </div>

     </div>
            <br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>
