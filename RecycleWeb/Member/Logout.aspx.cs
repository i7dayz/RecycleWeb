using RecycleWeb.util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Member
{
    public partial class Logout : System.Web.UI.Page
    {
        const string KAKAO_KAPI_URI = "https://kapi.kakao.com";

        const string GET_LOGOUT_RESOURCE = "v1/user/logout";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                string temp = WebApiUtil.Logout(KAKAO_KAPI_URI, GET_LOGOUT_RESOURCE, Session["accessToken"].ToString());

                Session["kakaoId"] = string.Empty;
                Session["kakaoId"] = string.Empty;
                Session["kakaoNickname"] = string.Empty;
                Session["kakaoEmail"] = string.Empty;
                Session["kakaoThumbnailImage"] = string.Empty;
                Session["kakaoProfileImage"] = string.Empty;
                Session["accessToken"] = string.Empty;
                Session["refreshToken"] = string.Empty;
                Session["producerIdx"] = string.Empty;
                Session["producerContactNumber"] = string.Empty;
                Session["zipCode"] = string.Empty;
                Session["address1"] = string.Empty;
                Session["address2"] = string.Empty;
                Session["detailAddress"] = string.Empty;
                Session["producePoint"] = string.Empty;
                Session["producePointExpireDate"] = string.Empty;
                Session["totalDonationPoint"] = string.Empty;
                Session["rank"] = string.Empty;
                Session["nickname"] = string.Empty;
                Session["expirePoint"] = string.Empty;
                Session["name"] = string.Empty;

                Session.Abandon();

                ScriptManager.RegisterStartupScript(
                    this,
                    this.GetType(),
                    "redirect",
                    "window.location='" + Request.ApplicationPath + "Default.aspx';",
                    true
                );
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}