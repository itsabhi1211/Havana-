<%@ Page Title="" Language="C#" MasterPageFile="~/User/Userindex.Master" AutoEventWireup="true" CodeBehind="complete-property-details.aspx.cs" Inherits="Havana.User.complete_property_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-5">

                <div class="text-center">
                    <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-secondary text-center" Visible="false"></asp:Label>
                </div>

                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="text-dark text-center"><span class="fa fa-print fa-2x" style="color: #62ebeb"></span>&nbsp;Emi Mode Details</h3>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div class="table ">
                                <div>
                                    <asp:GridView ID="grdbank" runat="server" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger" CssClass="table" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Mode" HeaderText="Mode" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Installment" HeaderText="Installment" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Amount" DataFormatString="{0:c}" HeaderText="Total Amount (&#8377;)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />


                                        </Columns>

                                    </asp:GridView>
                                </div>

                            </div>
                        </div>
                    </div>


                </div>

            </div>


            <div class="col-md-5">

                <div class="text-center">
                    <asp:Label ID="lblflats" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-secondary text-center" Visible="false"></asp:Label>
                </div>

                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="text-dark text-center"><span class="fa fa-home fa-2x" style="color: #62ebeb"></span>&nbsp;Flat Details</h3>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div class="table ">
                                <div>
                                    <asp:GridView ID="grdflat" runat="server" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger" CssClass="table" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="FlatNo" HeaderText="Flat No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />


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
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-5">

                <div class="text-center">
                    <asp:Label ID="lblblock" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-secondary text-center" Visible="false"></asp:Label>
                </div>

                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="text-dark text-center"><span class="fa fa-building fa-2x" style="color: #62ebeb"></span>&nbsp;Block Details</h3>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div class="table ">
                                <div>
                                    <asp:GridView ID="grdblock" runat="server" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger" CssClass="table" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Mode" HeaderText="Mode" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Installment" HeaderText="Installment" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Amount" DataFormatString="{0:c}" HeaderText="Total Amount (&#8377;)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />


                                        </Columns>

                                    </asp:GridView>
                                </div>

                            </div>
                        </div>
                    </div>


                </div>

            </div>


            <div class="col-md-5">

                <div class="text-center">
                    <asp:Label ID="Label3" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-secondary text-center" Visible="false"></asp:Label>
                </div>

                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="text-dark text-center"><span class="fa fa-print fa-2x" style="color: #62ebeb"></span>&nbsp;Emi Mode Details</h3>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div class="table ">
                                <div>
                                    <asp:GridView ID="GridView3" runat="server" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger" CssClass="table" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Mode" HeaderText="Mode" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Installment" HeaderText="Installment" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                            <asp:BoundField DataField="Amount" DataFormatString="{0:c}" HeaderText="Total Amount (&#8377;)" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />


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
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
