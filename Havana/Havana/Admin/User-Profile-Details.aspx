<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminindex.Master" AutoEventWireup="true" CodeBehind="User-Profile-Details.aspx.cs" Inherits="Havana.Admin.User_Profile_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--User profile  details starts here--%>
    <div class="container">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-5">
          <div class="card">
        <div class="card-header py-3">
            <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-info-circle"></span>
                       User Profile Details</h4>
             </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="table table-bordered" id="dataTable">
                       <asp:DetailsView ID="userbasicdetail" runat="server" AutoGenerateRows="false" OnPageIndexChanging="userbasicdetail_PageIndexChanging" AllowPaging="true" CssClass="table" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger">
                           <Fields>
                                    <asp:BoundField DataField="RegNo" HeaderText="RegNo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" /> 
                               <asp:BoundField DataField="Password" HeaderText="Password" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" /> 
                               <asp:TemplateField HeaderText="IsVerified" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                   <ItemTemplate >
                                        <asp:Label ID="lblverify" runat="server" Text='<%# (bool)Eval("IsVerified")==true?"True":"False" %>' ForeColor='<%# (bool)Eval("IsVerified")==true?System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                                   </ItemTemplate>
                               </asp:TemplateField>
                                   <asp:BoundField DataField="Crdt" DataFormatString="{0:D}" HeaderText="Crdt" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    <asp:BoundField DataField="Updt" DataFormatString="{0:D}" HeaderText="Updt" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark"  />
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
             <div class="col-md-3"></div>
        </div>

    </div><br />
   <%-- User profile details ends here--%>
</asp:Content>
