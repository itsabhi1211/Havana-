<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminindex.Master" AutoEventWireup="true" CodeBehind="PendingUsers.aspx.cs" Inherits="Havana.Admin.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- pending user list starts here--%>
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-info-circle"></span>
                            Pending Users</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class="table table-bordered" id="dataTable">
                                <div>
                                    <asp:GridView ID="grdshw" runat="server" CssClass="table" AutoGenerateColumns="false" AllowPaging="true" PageSize="4" OnPageIndexChanging="grdshw_PageIndexChanging" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger">
                                        <Columns>
                                            <asp:BoundField DataField="RegNo" HeaderText="RegNo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:TemplateField HeaderText="Name" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hypname" Text='<%# Eval("Name") %>' Target="_blank" runat="server" NavigateUrl='<%# "User-Profile-Details.aspx?Name="+Eval("Id") %> '>
                                                    </asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="IsVerified" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                   <ItemTemplate >
                                        <asp:Label ID="lblnonverify" runat="server" Text='<%# (bool)Eval("IsVerified")==true?"True":"False" %>' ForeColor='<%# (bool)Eval("IsVerified")==true?System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                                   </ItemTemplate>
                               </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblstatus" runat="server" Text='<%# (bool)Eval("IsActive")==true?"Active":"In-Active" %>' ForeColor='<%# (bool)Eval("IsActive")==true?System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Activate" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkactivate" runat="server" Enabled='<%# (bool)Eval("IsActive")==false?true:false %>' CssClass="fa fa-arrow-alt-circle-up fa-2x" ForeColor="Green" CommandArgument='<%# Eval("Id") %>' OnCommand="lnkactivate_Command" OnClientClick="if ( !confirm('Are you sure you want to Activate this user?')) return false;"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>

                                    </asp:GridView>
                                </div>
                                <asp:Label ID="lblmsg" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
    <%-- pending user list ends here--%>
</asp:Content>
