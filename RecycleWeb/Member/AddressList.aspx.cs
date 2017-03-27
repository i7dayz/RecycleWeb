using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Member
{
    public partial class AddressList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                if (!string.IsNullOrEmpty(Session["kakaoProfileImage"].ToString()))
                {
                    this.profileImg.Src = Session["kakaoProfileImage"].ToString();
                }

                this.name.InnerHtml = "이름";
                this.nickname.InnerHtml = Session["nickname"].ToString();

                this.hdProducerIdx.Value = Session["producerIdx"].ToString();
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}