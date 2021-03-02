<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminindex.Master" AutoEventWireup="true" CodeBehind="Plans-Details.aspx.cs" Inherits="Havana.Admin.Plans_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Plans updation starts here--%><br />
    <div class="container ">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-5" id="payemntcalculator" runat="server">
                <div>
                    <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-danger text-center" Visible="false"></asp:Label>
                </div>
                <br />
                <div class="card shadow-lg mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-tasks fa-2x"></span>Payment Plans Details</h4>
                    </div>
                    <div class="card-body shadow-lg">
                        <div class="table-responsive">
                            <div class="table table-borderless table-hover">
                                <table>
                                    <tr>
                                        <th>
                                            <label class="text-dark" style="font-size: 18px">Property</label></th>
                                        <td>
                                            <asp:DropDownList ID="ddlproperty" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlproperty_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="text-dark" style="font-size: 18px">Price</label></th>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtprice" Text="0" class="form-control" required="required" Style="border-radius: 5px 5px" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="text-dark" style="font-size: 18px">Plan</label></th>
                                        <td>
                                            <asp:DropDownList ID="ddlplans" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>
                                            <label class="text-dark" style="font-size: 18px">Total EMI</label></th>
                                        <td>

                                            <asp:TextBox runat="server" ID="txttotalEMI" class="form-control" Style="border-radius: 5px 5px" Text="0" OnTextChanged="txttotalEMI_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>

                                        <th>
                                            <label class="text-dark" style="font-size: 18px">Installment(Exc. TAX)</label></th>
                                        <td>
                                            <input type="text" runat="server" id="txtEMI" placeholder=" EMI...." class="form-control" required="required"  style="border-radius: 5px 5px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="text-dark" style="font-size: 18px">TAX (%)</label></th>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtTAX" Text="0" class="form-control" required="required" Style="border-radius: 5px 5px" OnTextChanged="txtTAX_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="text-dark" style="font-size: 18px">Taxed Amount</label></th>
                                        <td>
                                            <asp:TextBox runat="server" ID="txttaxedamount" Text="0" class="form-control" required="required" Style="border-radius: 5px 5px" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="text-dark" style="font-size: 18px">Monthly Amount</label></th>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtsubtotalamt" Text="0" class="form-control" required="required" Style="border-radius: 5px 5px" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="text-dark" style="font-size: 18px">Total Amount</label></th>
                                        <td>
                                            <asp:TextBox runat="server" ID="txttotalamt" Text="0" class="form-control" required="required" Style="border-radius: 5px 5px" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>



                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="btnupld" runat="server" Text="Submit" CssClass=" btn btn-primary btn-block" Style="border-radius: 5px 5px" OnClick="btnupld_Click" />
                                        </td>
                                    </tr>
                                </table>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>

    <%--ends here--%>

    <%--plan details starts here--%>
    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-tasks"></span>Plans List</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class="table table-bordered" id="dataTable1">
                                <div>
                                    <asp:GridView ID="grdplandetails" runat="server" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger" CssClass="table" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="Price" HeaderText="Price" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />

                                            <asp:BoundField DataField="EMI" HeaderText="EMI (Rs)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Total_EMI" HeaderText="Total EMI" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Tax" HeaderText="Tax (%)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Taxed_Amount" HeaderText="Taxed Amount (Rs)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Monthly_Amount" HeaderText="Monthly Amount (Rs)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Total_Amount" HeaderText="Total Amount (Rs)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:TemplateField HeaderText="Edit" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hypedit" runat="server" CssClass="fa fa-edit fa-1x" ForeColor="Blue" NavigateUrl='<%# "Plans-Details.aspx?Id="+Eval("PlanChargesId") %>'></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkdelte" runat="server" Enabled='<%# (bool)Eval("IsActive")==true?true:false %>' CssClass="fa fa-trash-alt fa-1x" ForeColor="Red" CommandArgument='<%# Eval("PlanChargesId") %>' OnCommand="lnkdelte_Command" OnClientClick="if ( !confirm('Are you sure you want to Delete this Plan?')) return false;"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View Property Details" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hypedit" runat="server" CssClass="fa fa-house-damage fa-1x" ForeColor="Magenta" NavigateUrl='<%# "Update-Properties.aspx?PropertyId="+Eval("PropertyId") %>'></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View Plans Details" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hypedit" runat="server" CssClass="fa fa-info-circle fa-1x" ForeColor="#990033" NavigateUrl='<%# "Plans.aspx?PlanMasterId="+Eval("PlanMasterId") %>'></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>

                                    </asp:GridView>
                                </div>
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
    <%--plan details ends here--%>
</asp:Content>
