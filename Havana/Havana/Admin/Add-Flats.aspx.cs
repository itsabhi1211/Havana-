using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HavanaDAL;

namespace Havana.Admin
{
    public partial class Add_Flats : System.Web.UI.Page
    {
        ShowDataLayer objshw = new ShowDataLayer();
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    
                    bindflatsdetails();
                    BindFlatsList();
                    GetDetailsInQueryString();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
        /// <summary>
        /// code to bind blocks in ddl
        /// </summary>
        void bindflatsdetails()
        {
            try
            {

                ddlflats.DataValueField = "Id";
                ddlflats.DataTextField = "BlockName";
                ddlflats.DataSource = objshw.showblockcategories();
                ddlflats.DataBind();
                ddlflats.Items.Insert(0, "Choose Flat");

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        void insertflats()
        {
            try
            {
                for(int i=1;i<=Convert.ToInt32(txtflats.Value);i++)
                {
                    tblavailableblock avlblock = new tblavailableblock();

                    avlblock.BlockId = Convert.ToInt32(ddlflats.SelectedValue);
                    avlblock.BlockNo = i;
                    int ISSuccessfull= InsertionLayer.insertNoOFflats(avlblock);
                   if(ISSuccessfull==1)
                    {

                        lblmsg.Text = "You Have Successfully Added The Flat In  " + ddlflats.SelectedItem.Text;
                        BindFlatsList();
                       
                    }
                    else
                    {
                        lblmsg.Text = "Technical error Please Try After Sometime";
                    }

                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        void BindFlatsList()
        {
            try
            {
                flatdetails.DataSource = objshw.JoinTwoTables();
                flatdetails.DataBind();
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        void GetDetailsInQueryString()
        {
            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    var q = objshw.EditAvlflatsName(Convert.ToInt32(Request.QueryString["Id"]));
                    if (q.Any())
                    {
                        foreach (tblavailableblock k in q)
                        {
                            txtflats.Value = k.BlockNo.ToString();
                            ddlflats.Items.FindByValue(k.BlockId.ToString()).Selected = true;
                        }
                    }
                    btnsubmit.Text = "Update Flat Name";
                }
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        void EditFlatName()
        {
            try
            {
                if (Request.QueryString["Id"] != null)
                {
                    int IsUpdated = Editlayer.EditFlatsName(Convert.ToInt32(Request.QueryString["Id"]), Convert.ToInt32(txtflats.Value),Convert.ToInt32(ddlflats.SelectedValue));
                    if (IsUpdated == 1)
                    {

                        Response.Redirect("Add-Flats");
                    }
                    else
                    {
                        lblmsg.Text = "Flat Name Not Updated";
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
                var q = objshw.EditAvlflatsName(Convert.ToInt32(Request.QueryString["Id"]));
                if (q.Any())
                {
                    EditFlatName();
                }
                else
                {
                    insertflats();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        void Clearsection()
        {
            txtflats.Value = "";
            ddlflats.ClearSelection();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SubmitOnChanges();
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;

            }
        }

        protected void flatdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                flatdetails.PageIndex = e.NewPageIndex;
                BindFlatsList();
            }
            catch(Exception ex)
            {
                lblmsg.Text = ex.Message;
                
            }
        }
    }
}