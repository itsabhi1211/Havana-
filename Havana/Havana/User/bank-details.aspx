<%@ Page Title="" Language="C#" MasterPageFile="~/User/Userindex.Master" AutoEventWireup="true" CodeBehind="bank-details.aspx.cs" Inherits="Havana.User.bank_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br /><br /><br /><br /><br /><br /><br />
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-9">

                <div class="text-center">
                    <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-secondary text-center" Visible="false"></asp:Label>
                </div>
               
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="text-dark text-center"><span class="fa fa-print fa-2x" style="color:#62ebeb"></span>      &nbsp;Payment History</h3>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-body">
                        <div class="table-responsive">
                    <div class="table " >
                        <div>
                            <asp:GridView ID="grdbank" runat="server" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger"  CssClass="table" AutoGenerateColumns="false">
                                 <Columns>
                                    <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <asp:BoundField DataField="BankName"  HeaderText="Bank Name" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     
                                      <asp:BoundField DataField="BankBranch"   HeaderText="Bank Branch" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                      <asp:BoundField DataField="Check"   HeaderText="Cheque No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="DD"   HeaderText="Demand Draft" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="TransactionID"   HeaderText="Transaction ID" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    
                                 
                                                                  
                                        </Columns>

                            </asp:GridView>
                        </div>
                        <asp:Label ID="Label3" runat="server" ></asp:Label>
                    </div>
                </div>
                    </div>
                         
                   
                    </div>

            </div>
           
            </div>
       
    </div>
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>
