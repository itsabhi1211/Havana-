<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Flat-Details.aspx.cs" Inherits="Havana.Flat_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
   <br />

    <%--starts--%>
    
    <section class="listings-content-wrapper section-padding-100" style="background-image: url(img/bg-img/1.jpg);">
        <div class="container"><br />
            <div class="text-right">
                 <input type="button" ID="Booked"  Class="btn-success btn-lg" value="Booked"/>
                 <input type="button" ID="Not Booked"  Class="btn-danger btn-lg" value="Not Booked"/>
            </div>
           <input type="button" ID="Button1"  Class="btn-primary btn-lg" value="Block-1" /><hr class="progress-bar" style="height:3px"/>
            
            <div class="row">

                <!-- Single Featured Property -->
                <% for (int i = 0; i < dt.Rows.Count; i++)
                 {                   %>
                <div class="col-md-1">
                    <div class="single-featured-property  shadow-lg">
                        <!-- Property Thumbnail -->
                        
                            <input type="button" style="width:65px;height:65px;font-size:24px;border-radius:50px 50px;" value="<%= dt.Rows[i]["BlockNo"].ToString().TrimStart(mychar) %>" />
                       
                       <%-- value='<%#Eval("IsBooked").ToString()=="1"?System.Drawing.Color.Green : System.Drawing.Color.Red %>'--%>
                        <!-- Property Content -->
                        
                    </div> <br />
                </div>
                
               <%} %>               

            
            </div>


            <input type="button" ID="Button2"  Class="btn-secondary btn-lg" value="Block-2"/><hr class="progress-bar" style="height:3px"/>

            <div class="row">

                <!-- Single Featured Property -->
                <% for (int i = 0; i < dt1.Rows.Count; i++)
                    {                   %>
                <div class="col-md-1">
                    <div class="single-featured-property  shadow-lg">
                        <!-- Property Thumbnail -->
                        
                            <input type="button" style="width:65px;height:65px;font-size:24px;border-radius:50px 50px;" color: value="<%= dt1.Rows[i]["BlockNo"].ToString().TrimStart(mychar) %>" />
                        
                        <!-- Property Content -->
                        
                    </div> <br />
                </div>
                
               <%} %>               

            
            </div>

            <input type="button" ID="Button7"  Class="btn-warning btn-lg" value="Block-7"/><hr class="progress-bar" style="height:3px"/>
            <div class="row">

                <!-- Single Featured Property -->
                <% for (int i = 0; i < dt2.Rows.Count; i++)
                 {                   %>
                <div class="col-md-1">
                    <div class="single-featured-property  shadow-lg">
                        <!-- Property Thumbnail -->
                        
                            <input type="button" style="width:65px;height:65px;font-size:24px;border-radius:50px 50px;" color: value="<%= dt2.Rows[i]["BlockNo"].ToString().TrimStart(mychar) %>" />
                        
                        <!-- Property Content -->
                        
                    </div> <br />
                </div>
                
               <%} %>               

            
            </div>
            
        </div>
    </section>
  
    <%--end--%>

</asp:Content>
