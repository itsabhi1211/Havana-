<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminindex.Master" AutoEventWireup="true" CodeBehind="User-Bank-Details.aspx.cs" Inherits="Havana.Admin.User_Bank_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%-- user bank details starts here--%>
      <div class="container text-center">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
          <div class="card">
        <div class="card-header py-3">
            <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-info-circle"></span>
                       User Bank Details</h4>
             </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="table table-bordered" id="dataTable">
                       <asp:DetailsView ID="userbankdetail" runat="server" AutoGenerateRows="false" CssClass="table" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger">
                           <Fields>
                 
                                    <asp:BoundField DataField="BankName" HeaderText="BankName" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="BankBranch" HeaderText="BankBranch" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                <asp:BoundField DataField="AccountNo" HeaderText="AccountNo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" /> 
                                    <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%# (bool)Eval("IsActive")==true?"Active":"In-Active" %>' ForeColor='<%# (bool)Eval("IsActive")==true?System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    
                               
                                     
                           </Fields>
                       </asp:DetailsView>
                      <asp:Label ID="lblmsg" runat="server" ></asp:Label>
                    </div>
                </div>
            </div>

        </div>
            </div>
             <div class="col-md-4"></div>
        </div>

    </div><br />
   <%-- user bank details ends here--%>
</asp:Content>
