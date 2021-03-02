<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminindex.Master" AutoEventWireup="true" CodeBehind="Update-Blocks.aspx.cs" Inherits="Havana.Admin.Update_Blocks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" >
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-4">
                 <div>
                    <asp:Label ID="lblmsg" runat="server" Font-Italic="false" Font-Size="Medium" CssClass="alert alert-secondary text-center" Visible="false"></asp:Label>
                </div><br />
                <div class="card">
                    <div class="card-header">
                        <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-building"></span>        Update Blocks</h4>
                    </div>
                    <div class="card-body shadow-lg" >
                        <table class="table table-responsive table-borderless table-hover">
                            <tr>
                                <td ><span class="fa fa-house-damage fa-2x text-primary"></span></td>
                                <td>
                                    <input type="text" id="txtblock" runat="server" class="form-control" style="border-radius: 5px 5px" placeholder="Block Name...."/></td>
                            </tr>
                            <tr >
                                <td colspan="2">
                                    <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-block btn-primary" Text="Add Blocks" OnClick="btnsubmit_Click" />
                                </td>
                                
                                
                            </tr>
                            
                        </table>
                    </div>
                </div>

            </div>
            <div class="col-md-7">
                <div class="card">
        <div class="card-header py-3">
            <h4 class="m-0 font-weight-bold text-primary"><span class="fa fa-building"></span>
                       Block Details</h4>
             </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="table table-bordered" id="dataTable">
                       <asp:GridView ID="dvblockdetails" runat="server" AutoGenerateColumns="false" CssClass="table"  AllowPaging="true" PageSize="5" OnPageIndexChanging="dvblockdetails_PageIndexChanging" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger">
                           <Columns>
                 
                                    <asp:BoundField DataField="BlockName" HeaderText="BlockName" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark" />
                                    <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%# (bool)Eval("IsActive")==true?"Active":"In-Active" %>' ForeColor='<%# (bool)Eval("IsActive")==true?System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                                        </ItemTemplate>
                                    
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hypeditblock" runat="server" CssClass="fa fa-edit" ForeColor="Blue" NavigateUrl='<%# "Update-Blocks.aspx?Id="+Eval("Id") %>'></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                               <asp:TemplateField HeaderText="Delete" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-dark">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkdelte" runat="server" Enabled='<%# (bool)Eval("IsActive")==true?true:false %>' CssClass="fa fa-trash-alt fa-1x" ForeColor="Red" CommandArgument='<%# Eval("Id") %>' OnCommand="lnkdelte_Command" OnClientClick="if ( !confirm('Are you sure you want to Delete this Property?')) return false;"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                               
                                     
                           </Columns>
                       </asp:GridView>
                      <asp:Label ID="Label1" runat="server" ></asp:Label>
                    </div>
                </div>
            </div>

        </div>
            </div>
        </div>
    </div><br />
</asp:Content>
