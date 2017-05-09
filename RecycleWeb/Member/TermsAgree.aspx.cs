using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Member
{
    public partial class TermsAgree : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                this.kakaoId.Value = Session["kakaoId"].ToString();
                this.kakaoNickname.Value = Session["kakaoNickname"].ToString();
                this.kakaoEmail.Value = Session["kakaoEmail"].ToString();
                this.kakaoThumbnailImage.Value = Session["kakaoThumbnailImage"].ToString();
                this.kakaoProfileImage.Value = Session["kakaoProfileImage"].ToString();
                //this.accessToken.Value = Session["accessToken"].ToString();
                //this.refreshToken.Value = Session["refreshToken"].ToString();
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}