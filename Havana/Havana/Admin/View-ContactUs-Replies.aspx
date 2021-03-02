<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminindex.Master" AutoEventWireup="true" CodeBehind="View-ContactUs-Replies.aspx.cs" Inherits="Havana.Admin.View_Replies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <%--contact us replies starts here--%>
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
          <div class="card">
        <div class="card-header py-3">
            <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-info-circle"></span>
                       Reply Details</h4>
             </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="table table-bordered" id="dataTable">
                       <asp:GridView ID="userrplydetails" runat="server" AutoGenerateColumns="false" CssClass="table" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger">
                           <Columns>
                                    <asp:BoundField DataField="Crdt" HeaderText="Time" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="Rply" HeaderText="Reply" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%# (bool)Eval("IsActive")==true?"Active":"In-Active" %>' ForeColor='<%# (bool)Eval("IsActive")==true?System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    
                               
                                     
                           </Columns>
                       </asp:GridView>
                      <asp:Label ID="lblmsg" runat="server" ></asp:Label>
                    </div>
                </div>
            </div>

        </div>
            </div>
             <div class="col-md-3"></div>
        </div>

    </div><br />
    <%--contact us replies ends here--%>
</asp:Content>
