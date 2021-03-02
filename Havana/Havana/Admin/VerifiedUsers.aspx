<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminindex.Master" AutoEventWireup="true" CodeBehind="VerifiedUsers.aspx.cs" Inherits="Havana.Admin.VerifiedUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%-- verification form starts here--%>
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-info-circle"></span>            Verified Users</h4>
             </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="table table-bordered" id="dataTable">
                        <div>
                            <asp:GridView ID="grdshw" runat="server" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger"  CssClass="table" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnPageIndexChanging="grdshw_PageIndexChanging">
                                 <Columns>
                                    <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <asp:BoundField DataField="RegNo" HeaderText="RegNo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    <asp:TemplateField HeaderText="Name" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                         <ItemTemplate>
                                            <asp:HyperLink ID="hypname" Text='<%# Eval("Name") %>' Target="_blank" runat="server" NavigateUrl='<%# "User-Profile-Details.aspx?Name="+Eval("Id") %> '>
                                            </asp:HyperLink>
                                             </ItemTemplate>
                                     </asp:TemplateField>
                                   <asp:TemplateField HeaderText="IsVerified" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                   <ItemTemplate >
                                        <asp:Label ID="lblverify" runat="server" Text='<%# (bool)Eval("IsVerified")==true?"True":"False" %>' ForeColor='<%# (bool)Eval("IsVerified")==true?System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                                   </ItemTemplate>
                               </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%# (bool)Eval("IsVerified")==true?"Verified":"Non-Verified" %>' ForeColor='<%# (bool)Eval("IsVerified")==true?System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                           <%-- <asp:HyperLink ID="hypregdetails" runat="server" NavigateUrl='<%# "Reg-Details.aspx?Id="+Eval("Id") %>' CssClass="fa fa-info-circle fa-1x" Target="_blank"></asp:HyperLink>--%>
                                          <asp:HyperLink ID="hypkyc" runat="server" NavigateUrl='<%# "Users-KYC-Details.aspx?Id="+Eval("Id") %>' CssClass="fa fa-id-card-alt fa-1x" Target="_blank"></asp:HyperLink>
                                            <asp:HyperLink ID="hypbank" runat="server" NavigateUrl='<%# "User-Bank-Details.aspx?Id="+Eval("Id") %>' CssClass="fa fa-piggy-bank fa-1x" Target="_blank"></asp:HyperLink>                                           
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Deny" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkdeny" runat="server" Enabled='<%# (bool)Eval("IsVerified")==true?true:false %>' CssClass="fa fa-arrow-alt-circle-down fa-2x" ForeColor="Red" CommandArgument='<%# Eval("Id") %>' OnCommand="lnkdeny_Command" OnClientClick="if ( !confirm('Are you sure you want to deny this user?')) return false;"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                                                   </Columns>

                            </asp:GridView>
                        </div>
                        <asp:Label ID="lblmsg" runat="server" ></asp:Label>
                    </div>
                </div>
            </div>

        </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
    
  <%--  ends here--%>
</asp:Content>
