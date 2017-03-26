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
                if (Request.QueryString[0] != null)
                {
                    string[] item = Request.QueryString[0].Split(',');
                    this.hdGroupIdx.Value = item[0];
                    this.lblGroupName.InnerText = item[1];
                    this.lblGroupDesc.InnerHtml = item[2].Replace("\\n","<br />");
                    this.imgGroup.Src = item[3];
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