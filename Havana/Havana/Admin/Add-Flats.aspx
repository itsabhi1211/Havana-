<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminindex.Master" AutoEventWireup="true" CodeBehind="Add-Flats.aspx.cs" Inherits="Havana.Admin.Add_Flats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="position: center">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-building"></span>      Add Flats</h4>
                    </div>
                    <div class="card-body shadow-lg">
                        <table class="table table-responsive table-borderless table-hover">
                            <tr>
                                <td><span class="fa fa-building fa-2x text-primary"></span></td>
                                <td>
                                    <asp:DropDownList ID="ddlflats" AutoPostBack="true" runat="server" class="form-control">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="fa fa-house-damage fa-2x text-primary"></span></td>
                                <td>
                                    <input type="text" id="txtflats" runat="server" class="form-control" style="border-radius: 5px 5px" placeholder="Insert No Of flats...." /></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-block btn-primary" Text="Add flats" OnClick="btnsubmit_Click" />
                                </td>


                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label runat="server" ID="lblmsg" CssClass="alert-danger"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-house-damage"></span>
                            Flats Details</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class="table table-bordered" id="dataTable">
                                <asp:GridView ID="flatdetails" runat="server" AutoGenerateColumns="false" CssClass="table"  AllowPaging="true" PageSize="5" OnPageIndexChanging="flatdetails_PageIndexChanging">
                                    <Columns>
                                        <asp:BoundField DataField="BlockName" HeaderText="Block Name" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                        <asp:BoundField DataField="BlockNumber" HeaderText="Block Number" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                        <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                            <ItemTemplate>
                                                <asp:Label ID="lblstatus" runat="server" Text='<%# (bool)Eval("IsActive")==true?"Active":"In-Active" %>' ForeColor='<%# (bool)Eval("IsActive")==true?System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Edit" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hypeditblock" runat="server" CssClass="fa fa-edit" ForeColor="Blue" NavigateUrl='<%# "Add-Flats.aspx?Id="+Eval("Id") %>'></asp:HyperLink>
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
    </div><br />
</asp:Content>
