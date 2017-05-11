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
                    hdGroupIdx.Value = Request.QueryString["id"].ToString();
                }
                else
                {
                    Response.Redirect("/Main.aspx");
                }

                if (!Session["kakaoId"].ToString().Equals("n"))
                {
                    hdProducerIdx.Value = Session["producerIdx"].ToString();
                    currPoint.Value = int.Parse(Session["producePoint"].ToString()).ToString("N0");
                }
                else
                {
                    hdProducerIdx.Value = "0";
                }

                if (Session["name"] == null)
                {
                    hdProducerName.Value = "";
                }
                else
                {
                    hdProducerName.Value = Session["name"].ToString();
                }

            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}