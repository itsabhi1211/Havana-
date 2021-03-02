<%@ Page Title="" Language="C#" MasterPageFile="~/User/Userindex.Master" AutoEventWireup="true" CodeBehind="booking-report.aspx.cs" Inherits="Havana.User.booking_report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br /> 
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-10">
                <div class="text-center">
                    <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-secondary text-center" Visible="false"></asp:Label>
                </div>
                <asp:HiddenField ID="hdfapp" runat="server" />
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="text-dark text-center"><span class="fa fa-navicon fa-2x" style="color:#62ebeb"></span>    &nbsp; Booking Report</h3>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-body">
                        <div class="table-responsive">
                    <div class="table " id="dataTable">
                        <div>
                            <asp:GridView ID="grdshw" runat="server" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger" CssClass="table"   AutoGenerateColumns="false">
                                 <Columns>
                                    <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <asp:BoundField DataField="TotalAmount"  DataFormatString="{0:c}" HeaderText="Total Amount (&#8377;)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="PaidAmount" DataFormatString="{0:c}" HeaderText="Paid Amount (&#8377;)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="DueAmount" DataFormatString="{0:c}" HeaderText="Due Amount (&#8377;)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="ExtraCharge"  DataFormatString="{0:c}" HeaderText="Extra Charges (&#8377;)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="InstallmentNo"   HeaderText="Installment" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="PaymentDate"   HeaderText="Payment Date" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                     <asp:BoundField DataField="NextDate"   HeaderText="Next Due Date" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    
                                   <asp:TemplateField HeaderText="Payment Completed" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                   <ItemTemplate >
                                        <asp:Label ID="lblcompleted" runat="server" Text='<%# (bool)Eval("IsPaymentCompleted")==true?"Accepted":"Pending" %>' ForeColor='<%# (bool)Eval("IsPaymentCompleted")==true?System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                                   </ItemTemplate>
                               </asp:TemplateField>
   
                                    <asp:TemplateField HeaderText="Payment History" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                           
                                          <asp:HyperLink ID="hyppyment" runat="server" NavigateUrl='<%# "booking-details.aspx?Id="+Eval("Id")+"&EmiMode="+Eval("EmiId") %>' CssClass="fa fa-print fa-2x" Target="_blank"></asp:HyperLink>
                                                                                     
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Bank Details" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                           
                                          <asp:HyperLink ID="hypbnk" runat="server" NavigateUrl='<%# "bank-details.aspx?Id="+Eval("Id")+"&EmiMode="+Eval("EmiId") %>' CssClass="fa fa-bank fa-2x" Target="_blank"></asp:HyperLink>
                                                                                     
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                      

                                     <asp:TemplateField HeaderText="Complete Property Details" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hypemis" runat="server" NavigateUrl='<%# "complete-property-details.aspx?Id="+Eval("Id")+"&EmiMode="+Eval("EmiId")+"&flatId="+Eval("FlatId") %>' CssClass="fa fa-building fa-2x" Target="_blank"></asp:HyperLink>                                           
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
    
    

    <br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>
