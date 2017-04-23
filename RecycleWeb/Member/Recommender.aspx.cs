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
                this.hdProducerIdx.Value = Session["producerIdx"].ToString();
                this.hdNickname.Value = Session["nickname"].ToString();
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}