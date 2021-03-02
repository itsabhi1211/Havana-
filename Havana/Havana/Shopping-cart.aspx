<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Shopping-cart.aspx.cs" Inherits="Havana.Shopping_cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <section class="breadcumb-area bg-img" style="background-image: url(img/bg-img/hero1.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content">
                        <h3 class="breadcumb-title">Shopping Cart</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Blog Area Start ##### -->
    <section class="blog-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-4">
                    <div class="text-center">
                        <asp:Label runat="server" ID="lblmsg" CssClass="alert alert-danger" Visible="false"></asp:Label>
                    </div>
                    <div class="blog-sidebar-area">
                        <!-- Catagories Widget -->
                        <div class="south-catagories-card mb-70">
                            <div class="card">
                                <div class="card-body">
                                    <img id="imgproperty" runat="server" class="img-fluid" src="" style="height: 300px; width: 300px" />
                                </div>                             
                            </div> <br />
                            <div class="text-center">
                                <%--<asp:Label ID="lblmsg" runat="server"></asp:Label>--%>
                                    <asp:Button ID="btnorder" Text="Buy Now" runat="server" CssClass="btn south-btn" />
                                </div>
                        </div>

                       

                    </div>
                </div>
                 <asp:HiddenField ID="hdfimage" runat="server" />
                <div class="col-12 col-lg-6" >
                    
                        <div class="card ">
                            <div class="card-header text-center">
                                <h2 class="text-success">Property Details</h2>
                            </div>                           
                            <div class="card-body">
                                <table class="table table-borderless table-responsive-lg">
                                    <tbody>
                                        <tr>
                                            <th><span class="fa fa-map-marker fa-2x"></span></th>
                                            <td>  <asp:Label ID="lbladd" runat="server" CssClass="text-primary" style="font-size:28px"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <th><span class="fa fa-rupee fa-2x"></span></th>
                                            <td>  <asp:Label ID="lblprice" runat="server" CssClass="text-success" style="font-size:28px"></asp:Label></td>
                                        </tr>
                                        <tr>
                                           <th><span class="fa fa-area-chart fa-2x"></span></th>
                                            <td>  <asp:Label ID="lblarea" runat="server" CssClass="text-danger" style="font-size:28px"></asp:Label></td>
                                        </tr>
                                        <tr>
                                           <th><span class="fa fa-arrow-circle-o-right fa-2x"></span></th>
                                            <td>  <asp:Label ID="lblfor" runat="server" CssClass="text-danger" style="font-size:28px"></asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                                
                           
                            <!-- Comment Form -->
                            </div>
                        </div>

                
                   
                    </div>
                    <!-- Leave A Comment -->
                </div>                  
    </section>
    <div class="container">
        <div class="row">
            <div class=" col-md-1"></div>
            <div class=" col-md-10">
                
                <div class="card">
        <div class="card-header py-3">
            <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-building"></span>
                       EMI Details</h4>
             </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="table table-bordered" id="dataTable">
                       <asp:GridView ID="grdemidetails" runat="server" AutoGenerateColumns="false" CssClass="table">
                           <Columns>
                               <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                   <ItemTemplate>
                                       <%# Container.DataItemIndex+1 %>
                                   </ItemTemplate>
                               </asp:TemplateField>
                                  <asp:BoundField DataField="PlanName" HeaderText="Plan Name" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                               <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Original Price (&#8377;)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                <asp:BoundField DataField="Total_Amount" DataFormatString="{0:c}" HeaderText="Taxed Price (&#8377;)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                               <asp:BoundField DataField="Amount" DataFormatString="{0:c}" HeaderText="EMI's (&#8377;)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                               <asp:BoundField DataField="EmiMode" HeaderText="Emi Mode" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                               <asp:BoundField DataField="Installment" HeaderText="Installment" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                             
                            
                                    <asp:TemplateField HeaderText="Pay" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hyppay" runat="server" CssClass="fa fa-credit-card" ForeColor="Blue" NavigateUrl='<%# "User/Shopping-cart.aspx?EmiModeId="+Eval("EmiModeId")+"&EmiMode="+Eval("EmiMode")+"&FlatId="+Eval("FlatId") %>'></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 
                           </Columns>
                       </asp:GridView>
                    
                    </div>
                </div>
            </div>

        </div>
            </div>
                   <div class=" col-md-1"></div>
        </div>
    </div><br/>
    <!-- ##### Blog Area End ##### -->
</asp:Content>
