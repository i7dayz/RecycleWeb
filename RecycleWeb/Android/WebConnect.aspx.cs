using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Android
{
    public partial class WebConnect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string type = Request.Form["type"];

            Session["snsType"] = Request.Form["snsType"];
            Session["kakaoId"] = Request.Form["snsId"];
            Session["kakaoEmail"] = Request.Form["email"];
            Session["kakaoThumbnailImage"] = Request.Form["snsUrl"];
            Session["kakaoProfileImage"] = Request.Form["snsUrl"];
            Session["kakaoNickname"] = Request.Form["snsNickname"];
            Session["carrierId"] = Request.Form["carrierId"];
            Session["appVersion"] = Request.Form["appVersion"];

            text1.Value = Session["snsType"].ToString();
            text2.Value = Session["kakaoId"].ToString();
            text3.Value = Session["kakaoEmail"].ToString();
            text4.Value = Session["kakaoThumbnailImage"].ToString();
            text5.Value = Session["kakaoProfileImage"].ToString();
            text6.Value = Session["kakaoNickname"].ToString();
            text7.Value = Session["carrierId"].ToString();
            text8.Value = Session["appVersion"].ToString();

            if (type.Equals("s"))
            {
                Response.Redirect("../Main.aspx");
            }
            else if (type.Equals("f"))
            {
                Response.Redirect("../Member/TermsAgree.aspx");
            }
        }
    }
}