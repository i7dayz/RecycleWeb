using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Member
{
    public partial class EditAddress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                if (!string.IsNullOrEmpty(Session["kakaoProfileImage"].ToString()))
                {
                    this.profileImg.Src = Session["kakaoProfileImage"].ToString();
                }

                this.hdProducerIdx.Value = Session["producerIdx"].ToString();
                this.name.InnerHtml = Session["name"].ToString();
                this.nickname.InnerHtml = Session["nickname"].ToString();

                if (!string.IsNullOrEmpty(Request["id"].ToString()))
                {
                    // 수정
                    this.hdAddressIdx.Value = Request["id"].ToString();
                }

                this.hdProducerIdx.Value = Session["producerIdx"].ToString();
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}