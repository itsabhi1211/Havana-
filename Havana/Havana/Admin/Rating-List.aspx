<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminindex.Master" AutoEventWireup="true" CodeBehind="Rating-List.aspx.cs" Inherits="Havana.Admin.Rating_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <%-- feedbacks listing starts here--%>
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-info-circle"></span>     Feedback Rating List</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class="table table-bordered" id="dataTable1">
                                <div>
                                    <asp:GridView ID="grdRating" runat="server" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger" CssClass="table" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnPageIndexChanging="grdRating_PageIndexChanging">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                              <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            
                                        </Columns>

                                    </asp:GridView>
                                </div>
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
             <div class="col-md-2"></div>
        </div>
    </div>
   <%-- feedbacks listing ends here--%>
</asp:Content>
