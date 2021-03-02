<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminindex.Master" AutoEventWireup="true" CodeBehind="Plans.aspx.cs" Inherits="Havana.Admin.Plans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <%--Plans updation starts here--%><br />
    <div class="container ">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4" id="paymentcalculator" runat="server">
                 <div>
                    <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-danger text-center" Visible="false"></asp:Label>
                </div><br />
                <div class="card shadow-lg mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-tasks fa-2x"></span>                               Payment Plans</h4>
                    </div>
                    <div class="card-body shadow-lg">
                        <div class="table-responsive">
                            <div class="table table-borderless table-hover">
                                <table>
                                    
                                    <tr>
                                        <th><span class="fa fa-building fa-2x"></span></th>
                                        <td>
                                            <asp:DropDownList ID="ddlproperties" runat="server" CssClass="form-control">
                 
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="fa fa-tasks fa-2x"></span></th>
                                        <td>
                                            <input type="text" runat="server" id="txtplan" placeholder=" Plans...." class="form-control" required="required" style="border-radius: 5px 5px">
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
      <%-- feedbacks listing starts here--%>
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-tasks"></span>     Plans List</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class="table table-bordered" id="dataTable1">
                                <div>
                                    <asp:GridView ID="grdplan" runat="server" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger" CssClass="table" AutoGenerateColumns="false" OnPageIndexChanging="grdplan_PageIndexChanging" AllowPaging="true" PageSize="5">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Text" HeaderText="Description" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="PlanName" HeaderText="Plan Name" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:TemplateField HeaderText="Edit" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hypedit" runat="server" CssClass="fa fa-edit fa-1x" ForeColor="Blue"  NavigateUrl='<%# "Plans.aspx?Id="+Eval("PlanId") %>'></asp:HyperLink>
                                                    </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkdelte" runat="server" Enabled='<%# (bool)Eval("IsActive")==true?true:false %>' CssClass="fa fa-trash-alt fa-1x" ForeColor="Red" CommandArgument='<%# Eval("PlanId") %>' OnCommand="lnkdelte_Command1" OnClientClick="if ( !confirm('Are you sure you want to Delete this Plan?')) return false;"></asp:LinkButton>
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
             <div class="col-md-3"></div>
        </div>
    </div>
   <%-- feedbacks listing ends here--%>
</asp:Content>
