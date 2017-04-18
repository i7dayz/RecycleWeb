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
                }
                else
                {
                    Response.Redirect("/Main.aspx");
                }

                this.hdProducerIdx.Value = Session["producerIdx"].ToString();
                this.currPoint.Value = int.Parse(Session["producePoint"].ToString()).ToString("N0");
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}