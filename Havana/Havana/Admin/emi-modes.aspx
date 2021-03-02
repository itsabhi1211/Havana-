<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminindex.Master" AutoEventWireup="true" CodeBehind="emi-modes.aspx.cs" Inherits="Havana.Admin.emi_modes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Plans updation starts here--%><br />
    <div class="container ">
        <div class="row">

            <div class="col-md-6">
                <div class="text-center">
                    <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-danger text-center" Visible="false"></asp:Label>
                </div>
                <br />
                <div class="card shadow-lg mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-tasks fa-2x"></span>EMI Modes</h4>
                    </div>
                    <div class="card-body shadow-lg">
                        <div class="table-responsive-lg">
                            <div class="table table-borderless table-hover">
                                <table>
                                    <tr>
                                        <th><span class="fa fa-building fa-2x"></span></th>
                                        <td>
                                            <asp:DropDownList ID="ddlproperty" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlproperty_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="text-dark" style="font-size: 18px">EMI Plans</label></th>
                                        <td>
                                            <asp:DropDownList ID="ddlplanmaster" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlplanmaster_SelectedIndexChanged" AutoPostBack="true" Enabled="false">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="text-dark" style="font-size: 18px">Plan Charges</label></th>
                                        <td>
                                            <asp:DropDownList ID="ddlplancharges" runat="server" CssClass="form-control" Enabled="false" OnSelectedIndexChanged="ddlplancharges_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="text-dark" style="font-size: 18px">Modes</label></th>
                                        <td>
                                            <asp:DropDownList ID="ddlmodes" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlmodes_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="0" Text="Choose mode"></asp:ListItem>
                                                <asp:ListItem Value="1" Text="Monthly"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="2 Monthly"></asp:ListItem>
                                                <asp:ListItem Value="3" Text="Quaterly"></asp:ListItem>
                                                <asp:ListItem Value="4" Text="Half Yearly"></asp:ListItem>
                                                <asp:ListItem Value="5" Text="One Time Payment"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="text-dark" style="font-size: 18px" id="lblinstallment" runat="server">Installment</label></th>
                                        <td>
                                            <input type="text" runat="server" id="txtinstallment" value="0" class="form-control" required="required" style="border-radius: 5px 5px" visible="true">
                                        </td>
                                    </tr>


                                    <tr>
                                        <th>
                                            <label class="text-dark" style="font-size: 18px" id="lblemiamt" runat="server">EMI Amount</label></th>
                                        <td>
                                            <input type="text" runat="server" id="txtEmiAMt" value="0" class="form-control" required="required" style="border-radius: 5px 5px" visible="true">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <asp:Label class="text-dark" Style="font-size: 18px" runat="server" Visible="false" ID="lbltaxed" Text="Tax"></asp:Label></th>
                                        <td>
                                            <asp:TextBox ID="txttax" runat="server" CssClass="form-control" Visible="false" OnTextChanged="txttax_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        </td>
                                    </tr>



                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass=" btn btn-primary btn-block" Style="border-radius: 5px 5px" OnClick="btnsubmit_Click" />
                                        </td>
                                    </tr>
                                </table>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <div class="col-md-5">
                <br />
                <div class="card shadow-lg mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-house-damage fa-2x"></span>Property Charges</h4>
                    </div>
                    <div class="card-body shadow-lg">
                        <div class="table-responsive-lg">
                            <div class="table table-borderless table-hover">
                                <div class="table-responsive">
                                    <div>
                                        <table>

                                            <tr>
                                                <th>
                                                    <label class="text-dark" style="font-size: 18px">Price</label></th>
                                                <td>
                                                    <asp:Label ID="lblprice" CssClass="text text-danger" runat="server"></asp:Label>
                                                </td>
                                            </tr>


                                            <tr>
                                                <th>
                                                    <label class="text-dark" style="font-size: 18px">Total EMI</label></th>
                                                <td>
                                                    <asp:Label ID="lbltotalEMI" CssClass="text text-danger" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>

                                                <th>
                                                    <label class="text-dark" style="font-size: 18px">EMI</label></th>
                                                <td>
                                                    <asp:Label ID="lblEMI" CssClass="text text-danger" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="text-dark" style="font-size: 18px">TAX  (%)</label></th>
                                                <td>
                                                    <asp:Label ID="lbltax" CssClass="text text-danger" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="text-dark" style="font-size: 18px">Taxed Amount</label></th>
                                                <td>
                                                    <asp:Label ID="lbltaxedamt" CssClass="text text-danger" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="text-dark" style="font-size: 18px">Monthly Amount</label></th>
                                                <td>
                                                    <asp:Label ID="lblmonthlyamt" CssClass="text text-danger" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="text-dark" style="font-size: 18px">Total Amount</label></th>
                                                <td>
                                                    <asp:Label ID="lbltotalamt" CssClass="text text-danger" runat="server"></asp:Label>
                                                </td>
                                            </tr>

                                        </table>

                                    </div>

                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <%--ends here--%>

    <%--grid starts here--%>

    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-info-circle fa-2x"></span>  &nbsp;EMI Details of Properties</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class="table table-bordered" id="dataTable">
                                <div>
                                    <asp:GridView ID="grdshw" runat="server" CssClass="table" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnPageIndexChanging="grdshw_PageIndexChanging" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="PropertyName" HeaderText="Property Details" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Mode" HeaderText="Mode" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />

                                            <asp:BoundField DataField="Installment" HeaderText="Installment" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Amount" HeaderText="Amount" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkdelte" runat="server" CssClass="fa fa-trash-alt fa-1x" ForeColor="Red" CommandArgument='<%# Eval("Id") %>' OnCommand="lnkdelte_Command" OnClientClick="if ( !confirm('Are you sure you want to Delete this Detail?')) return false;"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>

                                    </asp:GridView>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>

    <%--end here--%>
</asp:Content>
