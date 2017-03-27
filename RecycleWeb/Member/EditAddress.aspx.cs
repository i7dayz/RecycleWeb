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

                this.producerIdx.Value = Session["producerIdx"].ToString();
                this.name.InnerHtml = "이름";
                this.nickname.InnerHtml = Session["nickname"].ToString();

                if (!string.IsNullOrEmpty(Request["id"].ToString()))
                {
                    // 수정
                    this.addressIdx.Value = Request["id"].ToString();
                }
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}