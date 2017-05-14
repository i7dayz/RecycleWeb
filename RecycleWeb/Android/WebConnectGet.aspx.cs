using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Android
{
    public partial class WebConnectGet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string type = Request["type"];

            Session["snsType"] = Request["snsType"];
            Session["kakaoId"] = Request["snsId"];
            Session["kakaoEmail"] = Request["email"];
            Session["kakaoThumbnailImage"] = Request["snsUrl"];
            Session["kakaoProfileImage"] = Request["snsUrl"];
            Session["kakaoNickname"] = Request["snsNickname"];
            Session["carrierId"] = Request["carrierId"];
            Session["appVersion"] = Request["appVersion"];
            Session["deviceInfo"] = Request["deviceInfo"];

            if (type.Equals("s"))
            {
                Response.Redirect("../Main.aspx");
            }
            else if (type.Equals("f"))
            {
                Response.Redirect("../Member/TermsAgree.aspx");
            }
            else if (type.Equals("n"))
            {
                Session["kakaoId"] = "n";
                Response.Redirect("../Main.aspx");
            }
            //text1.Value = Session["snsType"].ToString();
            //text2.Value = Session["kakaoId"].ToString();
            //text3.Value = Session["kakaoEmail"].ToString();
            //text4.Value = Session["kakaoThumbnailImage"].ToString();
            //text5.Value = Session["kakaoProfileImage"].ToString();
            //text6.Value = Session["kakaoNickname"].ToString();
            //text7.Value = Session["carrierId"].ToString();
            //text8.Value = Session["appVersion"].ToString();
        }
    }
}