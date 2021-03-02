<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminindex.Master" AutoEventWireup="true" CodeBehind="Feedback-Report.aspx.cs" Inherits="Havana.Admin.Feedback_Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <%-- feedbacks listing starts here--%>
    <div class="container">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-info-circle"></span>     Feedback Rating List</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class="table table-bordered" id="dataTable1">
                                <div>
                                    <asp:GridView ID="grdRating" runat="server" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger" CssClass="table" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rating" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hypRply" runat="server" Text='<%# Eval("Rating") %>' NavigateUrl='<%# "Rating-List.aspx?Rating="+Eval("Rating") %>'></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Total" HeaderText="Total" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            
                                            
                                        </Columns>

                                    </asp:GridView>
                                </div>
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
             <div class="col-md-4"></div>
        </div>
    </div>
   <%-- feedbacks listing ends here--%>
     <%--feedback reports starts here--%>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-info-circle"></span>     Feedback Report</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class="table table-bordered" id="dataTable">
                                <div>
                                    <asp:GridView ID="grdshw" runat="server" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger" CssClass="table" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnPageIndexChanging="grdshw_PageIndexChanging">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Msg" HeaderText="Message" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                             <asp:BoundField DataField="Rating" HeaderText="Rating" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblstatus" runat="server" Text='<%# (bool)Eval("IsActive")==true?"Active":"In-Active" %>' ForeColor='<%# (bool)Eval("IsActive")==true?System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rply" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hypRply" runat="server" NavigateUrl='<%# "Feedback-Reply.aspx?Id="+Eval("Id") %>' CssClass="fa fa-reply fa-1x" Target="_blank" ForeColor="red"></asp:HyperLink>

                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View-Replies" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hypview" runat="server" NavigateUrl='<%# "View-Feedback-Replies.aspx?Id="+Eval("Id") %>' CssClass="fa fa-info-circle fa-1x" Target="_blank" ForeColor="Green"></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Delete" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                     <asp:LinkButton ID="lnkdeactivate" runat="server" Enabled='<%# (bool)Eval("IsActive")==true?true:false %>' CssClass="fa fa-trash fa-1x" ForeColor="BlueViolet" CommandArgument='<%# Eval("Id") %>' OnCommand="lnkdeactivate_Command" OnClientClick="if ( !confirm('Are you sure you want to Delete this Feedback?')) return false;"></asp:LinkButton>
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
        </div>
    </div>
    <%--feedback reports ends here--%>
  
</asp:Content>
