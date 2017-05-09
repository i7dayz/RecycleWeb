using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Member
{
    public partial class Recommender : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                if (!Session["kakaoId"].ToString().Equals("n"))
                {
                    hdProducerIdx.Value = Session["producerIdx"].ToString();
                    hdNickname.Value = Session["nickname"].ToString();
                }
                else
                {
                    hdProducerIdx.Value = "0";
                }
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}