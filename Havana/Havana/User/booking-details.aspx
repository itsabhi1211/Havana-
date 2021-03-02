<%@ Page Title="" Language="C#" MasterPageFile="~/User/Userindex.Master" AutoEventWireup="true" CodeBehind="booking-details.aspx.cs" Inherits="Havana.User.booking_details" %>
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
                                   <asp:BoundField DataField="InvoiceNo"  HeaderText="Invoice No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="TotalAmount" DataFormatString="{0:c}" HeaderText="Total Amount (&#8377;)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="PaidAmount" DataFormatString="{0:c}" HeaderText="Paid Amount (&#8377;)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="DueAmount"  DataFormatString="{0:c}" HeaderText="Due Amount (&#8377;)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                      <asp:BoundField DataField="ExtraCharge"  DataFormatString="{0:c}" HeaderText="Extra Charge (&#8377;)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                      <asp:BoundField DataField="InstallmentNo"   HeaderText="Installment" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                      <asp:BoundField DataField="PaymentDate"   HeaderText="Payment Date" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="NextDate"   HeaderText="Next Due Date" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    
                                  <asp:TemplateField HeaderText="Payment Completed" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                   <ItemTemplate >
                                        <asp:Label ID="lblcompleted" runat="server" Text='<%# (bool)Eval("IsPaymentCompleted")==true?"Accepted":"Pending" %>' ForeColor='<%# (bool)Eval("IsPaymentCompleted")==true?System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                                   </ItemTemplate>
                               </asp:TemplateField>
                                                                  
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
