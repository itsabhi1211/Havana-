using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.Admin
{
    public partial class Update_Blocks : System.Web.UI.Page
    {
        tblblockcategory block = new tblblockcategory();
        InsertionLayer objlayer = new InsertionLayer();
        ShowDataLayer objshw = new ShowDataLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetDetailsInQueryString();
                bindblocklist();
            }
        }


        /// <summary>
        /// code to insert block details
        /// </summary>
        void insertblock()
        {
            try
            {

                block.BlockName = txtblock.Value;
               
                int issuccessfull = InsertionLayer.insertblocks(block);
                if(issuccessfull==1)
                {
                    lblmsg.Text = "You have Successfully Added The Block With Name  "
                        +txtblock.Value;
                    bindblocklist();
                }
                else
                {
                    lblmsg.Text = "Technical Error Please Try After Sometime";
                }
                txtblock.Value = "";
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }

        /// <summary>
        /// code to bind block list
        /// </summary>
        void bindblocklist()

        {
            try
            {
                dvblockdetails.DataSource = objshw.AvailableBlocks();
                dvblockdetails.DataBind();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        /// <summary>
        /// code to get details in query string of blocks
        /// </summary>
        void GetDetailsInQueryString()
        {
            try
            {
                if(Request.QueryString["Id"]!=null)
                {
                    var q = objshw.blockcategories(Convert.ToInt32(Request.QueryString["Id"]));
                    if (q.Any())
                    {
                        foreach(tblblockcategory k in q)
                        {
                            txtblock.Value = k.BlockName;
                        }
                    }
                    btnsubmit.Text = "Update Block Name";
                }
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        /// <summary>
        /// code to edit block names
        /// </summary>
        /// 
        void EditBlockName()
        {
            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    int IsUpdated = Editlayer.EditBlockName(Convert.ToInt32(Request.QueryString["Id"]), txtblock.Value);
                    if (IsUpdated == 1)
                    {

                        Response.Redirect("Update-Blocks");
                    }
                    else
                    {
                        lblmsg.Text = "Block Name Not Updated";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
               
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }


        void SubmitOnChanges()
        {
            try
            {
                var q = objshw.blockcategories(Convert.ToInt32(Request.QueryString["Id"]));
                if (q.Any())
                {
                    EditBlockName();
                }
                else
                {
                    insertblock();
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SubmitOnChanges();
            }
            catch(Exception ex)
            {
                lblmsg.Text =ex.Message;
            }
        }

        protected void dvblockdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                dvblockdetails.PageIndex = e.NewPageIndex;
                bindblocklist();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;

            }
        }


        /// <summary>
        /// code to delete blocks..
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkdelte_Command(object sender, CommandEventArgs e)
        {
            int ids = Convert.ToInt32(e.CommandArgument);
            Editlayer.DeleteBlock(ids);
            bindblocklist();
        }
    }
}