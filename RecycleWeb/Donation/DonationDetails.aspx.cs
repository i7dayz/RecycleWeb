using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Donation
{
    public partial class DonationDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"].ToString()))
                {
                    this.hdGroupIdx.Value = Request.QueryString["id"].ToString();

                    //this.lblGroupName.InnerText = item[1];
                    //this.lblGroupDesc.InnerHtml = item[2].Replace("\\n","<br />");
                    //this.imgGroup.Src = item[3];
                }
                else
                {
                    Response.Redirect("/Main.aspx");
                }

                this.hdProducerIdx.Value = Session["producerIdx"].ToString();
                this.currPoint.InnerText = Session["producePoint"].ToString();
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}