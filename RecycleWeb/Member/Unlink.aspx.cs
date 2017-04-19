﻿using Newtonsoft.Json;
using RecycleWeb.Model;
using RecycleWeb.util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Member
{
    public partial class Unlink : System.Web.UI.Page
    {
        const string APP_SERVER_URI = "http://geno47.cafe24.com:8080";
        const string USER_LEAVE = "producer/userLeave";

        const string KAKAO_KAPI_URI = "https://kapi.kakao.com";
        const string GET_UNLINK_RESOURCE = "v1/user/unlink";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                Dictionary<string, string> param = new Dictionary<string, string>();
                param.Add("producerIdx", Session["producerIdx"].ToString());
                param.Add("leaveReasonIdx", "1");
                param.Add("leaveComment", string.Empty);

                RootObject rootObj = JsonConvert.DeserializeObject<RootObject>(WebApiUtil.RestRequest(APP_SERVER_URI, USER_LEAVE, param));

                if (rootObj.value == 0)
                {
                    string result = WebApiUtil.Unlink(KAKAO_KAPI_URI, GET_UNLINK_RESOURCE, Session["accessToken"].ToString());

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
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}