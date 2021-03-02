using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;
using System.IO;

namespace Havana.Admin
{
    public partial class Update_Properties : System.Web.UI.Page
    {
        tblProperty property = new tblProperty();
        InsertionLayer objlayer = new InsertionLayer();
        ShowDataLayer objshw = new ShowDataLayer();
        Editlayer objedit = new Editlayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ddlflats.Items.Insert(0, "Choose flat no");
                bindpropertylist();
                bindblocklists();
                GetDetailsOnQueryString();
                bindPropertydetailsOnQueryString();
            }
            

        }


        void bindblocklists()
        {
            try
            {
                ddlblocks.DataValueField = "Id";
                ddlblocks.DataTextField = "BlockName";
                ddlblocks.DataSource = objshw.showblockcategories();
                ddlblocks.DataBind();
                ddlblocks.Items.Insert(0, "Choose block");

            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

       /// <summary>
       /// code for properties updation
       /// </summary>
       
        void updateproperties()
        {
            string s1 = "";
            try
            {
                string FileName = "";
                string FilePath = "~/Admin/img/Properties/";

                if (txtimg.PostedFile.ContentLength > 0 && txtimg.PostedFile != null)
                {
                    FileName = Guid.NewGuid().ToString() + Path.GetExtension(txtimg.FileName);
                    string Extension = Path.GetExtension(txtimg.FileName);
                    int Length = txtimg.PostedFile.ContentLength;
                    s1 = FilePath + FileName;
                    #region checking out File Length

                    if (Length <= 1000000)
                    {
                        #region Checking file Extensions
                        switch (Extension.ToLower())
                        {
                            #region When File Extension Is .JPG

                            case ".jpg":
                                txtimg.SaveAs(Server.MapPath(FilePath + FileName));
                                property.FlatId = Convert.ToInt32(ddlflats.SelectedValue);
                                property.Image = s1;
                                property.For = ddlfor.SelectedValue;
                                property.Bathroom = Convert.ToInt32(txtwashrooms.Value);
                                property.Bedroom = Convert.ToInt32(txtbed.Value);
                                property.Address = txtaddress.Value;
                                property.Area = Convert.ToInt64(txtarea.Value);
                                property.Price = Convert.ToInt32(txtprice.Value);
                                InsertionLayer.PropertyUpdation(property);
                                lblmsg.Text = "Property Uploaded Successfully.";
                                lblmsg.ForeColor = System.Drawing.Color.BlueViolet;
                                clearsection();
                                // img1.ImageUrl = FilePath + FileName;


                                break;

                            #endregion


                            #region When File Extension Is .JPEG

                            case ".jpeg":
                                txtimg.SaveAs(Server.MapPath(FilePath + FileName));
                                property.Image = s1;
                                property.FlatId = Convert.ToInt32(ddlflats.SelectedValue);
                                property.For = ddlfor.SelectedValue;
                                property.Bathroom = Convert.ToInt32(txtwashrooms.Value);
                                property.Bedroom = Convert.ToInt32(txtbed.Value);
                                property.Address = txtaddress.Value;
                                property.Area = Convert.ToInt64(txtarea.Value);
                                property.Price = Convert.ToInt32(txtprice.Value);
                                InsertionLayer.PropertyUpdation(property);
                                lblmsg.Text = "Property Uploaded Successfully.";
                                lblmsg.ForeColor = System.Drawing.Color.BlueViolet;
                                clearsection();
                                // img1.ImageUrl = FilePath + FileName;
                                break;

                            #endregion


                            #region When File Extension Is .PNG

                            case ".png":
                                txtimg.SaveAs(Server.MapPath(FilePath + FileName));
                                property.Image = s1;
                                property.FlatId = Convert.ToInt32(ddlflats.SelectedValue);
                                property.For = ddlfor.SelectedValue;
                                property.Bathroom = Convert.ToInt32(txtwashrooms.Value);
                                property.Bedroom = Convert.ToInt32(txtbed.Value);
                                property.Address = txtaddress.Value;
                                property.Area = Convert.ToInt64(txtarea.Value);
                                property.Price = Convert.ToInt32(txtprice.Value);
                                InsertionLayer.PropertyUpdation(property);
                                lblmsg.Text = "Property Uploaded Successfully.";
                                lblmsg.ForeColor = System.Drawing.Color.BlueViolet;
                                clearsection();
                                // img1.ImageUrl = FilePath + FileName;
                                break;

                            #endregion

                            default:
                                lblmsg.Text = "Only jpg jpeg and png file accepted";
                                lblmsg.ForeColor = System.Drawing.Color.Red;
                                break;

                        }

                        #endregion
                    }
                    else
                    {
                        lblmsg.Text = "File must be  less than 1 mb";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                    #endregion

                }
                else
                {
                    lblmsg.Text = "please choose the file";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }


            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
           
        }

        /// <summary>
        ///code for clear section
        /// </summary>
        /// 
        void clearsection()
        {
            txtaddress.Value = "";
            txtprice.Value = "";
            txtwashrooms.Value = "";
            txtbed.Value = "";
            txtarea.Value = "";
            ddlfor.ClearSelection();

        }

        /// <summary>
        /// code to bind property list
        /// </summary>
        void bindpropertylist()
        {

            try
            {
                grdshw.DataSource = objshw.Propertydetails();
                grdshw.DataBind();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;

            }
        }

        

        protected void btnupld_Click(object sender, EventArgs e)
        {
            try
            {
                 submitdetails();
                lblmsg.Visible = true;
                bindpropertylist();
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Visible = true;
            }
        }

        protected void lnkdelte_Command(object sender, CommandEventArgs e)
        {
            int Ids = Convert.ToInt32(e.CommandArgument);
            Editlayer.DeletePropertiesDetails(Ids);
            bindpropertylist();
        }


        protected void grdshw_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdshw.PageIndex = e.NewPageIndex;
                bindpropertylist();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        /// <summary>
        /// code to get details in query string for editing properties details..
        /// </summary>
        void GetDetailsOnQueryString()
        {
            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    ddlflats.Enabled = true;
                    var q = objshw.showPropertiesDetails(Convert.ToInt32(Request.QueryString["Id"]));
                    if (q.Any())
                    {
                        foreach (tblProperty k in q)
                        {
                            txtprice.Value = k.Price.ToString();
                            ddlfor.SelectedValue = k.For;
                            txtaddress.Value = k.Address;                          
                            txtarea.Value = k.Area.ToString();
                            txtbed.Value = k.Bedroom.ToString();                          
                            txtwashrooms.Value = k.Bathroom.ToString();
                            int BlockId = objshw.GetBlockIdOnFlatId(Convert.ToInt32(k.FlatId));
                            ddlblocks.Items.FindByValue(BlockId.ToString()).Selected = true;
                            BindOnQueryString();
                            ddlflats.Items.FindByValue(k.FlatId.ToString()).Selected = true;
                            

                            
                        }
                    }
                    btnupld.Text = "Update Property ";
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        /// <summary>
        /// code to get details of single property 
        /// </summary>
        void bindPropertydetailsOnQueryString()
        {
            try
            {
                if (Request.QueryString["PropertyId"] != null)
                {
                    grdshw.DataSource = objshw.PropertydetailsOnId(Convert.ToInt32(Request.QueryString["PropertyId"]));
                    grdshw.DataBind();
                    propertylist.Visible = false;
                }
            }
            catch(Exception ex)
            {
                lblmsg1.Text = ex.Message;
            }
        }

        /// <summary>
        /// code for editing the propert details
        /// </summary>
        void EditpropertyDetails()
        {
            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    int IsUpdated = Editlayer.updatePropertyDetails(Convert.ToInt32(Request.QueryString["Id"]),txtaddress.Value,Convert.ToInt64( txtprice.Value),Convert.ToInt32(txtbed.Value), Convert.ToInt32(txtwashrooms.Value), Convert.ToInt64(txtarea.Value), ddlfor.SelectedValue,Convert.ToInt32(ddlflats.SelectedValue));
                    if (IsUpdated == 1)
                    {

                        Response.Redirect("Update-Properties");
                    }
                    else
                    {
                        lblmsg.Text = "Property  Not Updated";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    updateproperties();
                }
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        void submitdetails()
        {
            try
            {
                var q = objshw.showPropertiesDetails(Convert.ToInt32(Request.QueryString["Id"]));
                if (q.Any())
                {
                    EditpropertyDetails();
                }
                else
                {
                    updateproperties();
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void ddlblocks_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlblocks.SelectedIndex!=0)
            {
                ddlflats.Enabled = true;
                ddlflats.DataValueField = "Id";
                ddlflats.DataTextField = "BlockNo";
                ddlflats.DataSource = objshw.showavailableblocksonId(Convert.ToInt32(ddlblocks.SelectedValue));
                ddlflats.DataBind();
                ddlflats.Items.Insert(0, "Choose flat number");
            }
            else
            {
                ddlflats.ClearSelection();
                lblmsg.Text = "Please Select the Block first...";
               
            }
           
        }

        #region BindDropDown On QueryString

        void BindOnQueryString()
        {
            ddlflats.DataValueField = "Id";
            ddlflats.DataTextField = "BlockNo";
            ddlflats.DataSource = objshw.showavailableblocksonId(Convert.ToInt32(ddlblocks.SelectedValue));
            ddlflats.DataBind();
            ddlflats.Items.Insert(0, "Choose flat number");
        }

        #endregion
    }
}