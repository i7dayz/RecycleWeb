using Newtonsoft.Json;
using RecycleWeb.util;
using RecycleWeb.Model;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.Configuration;

namespace RecycleWeb.Member
{
    public partial class KakaoLogin : System.Web.UI.Page
    {
        string KAKAO_KAPI_URI = "https://kapi.kakao.com";
        string KAKAO_KAUTH_URI = "https://kauth.kakao.com";
        string APP_SERVER_URI = WebConfigurationManager.AppSettings["server_url"];

        string GET_AUTH_TOKEN_RESOURCE = "oauth/token";
        string GET_SIGNUP_RESOURCE = "v1/user/signup";
        string GET_REQUEST_ME_RESOURCE = "v1/user/me";
        string PRODUCER_LOGIN = "/producer/login";

        protected void Page_Load(object sender, EventArgs e)
        {
            string uri = Request.Url.Scheme + System.Uri.SchemeDelimiter + Request.Url.Host + (Request.Url.IsDefaultPort ? "" : ":" + Request.Url.Port);
            string code = string.Empty;
            Dictionary<string, string> param = null;

            if (!string.IsNullOrEmpty(Request["code"]))
            {
                // 1. 코드받기 (로그인 버튼 클릭시 먼저 사용자 동의를 거쳐 토큰을 발급 받을 수 있는 코드를 받아와야 함)
                code = Request["code"];

                // 2. 사용자 토큰 받기
                param = new Dictionary<string, string>();
                param.Add("grant_type", "authorization_code");
                param.Add("client_id", "31571a3371ddd1ea8d002eb018b7fb88");
                param.Add("redirect_uri", uri + "/Member/KakaoLogin.aspx");
                param.Add("code", code);

                KakaoToken kakaoToken = JsonConvert.DeserializeObject<KakaoToken>(WebApiUtil.GetAuthToken(KAKAO_KAUTH_URI, GET_AUTH_TOKEN_RESOURCE, param));

                if (kakaoToken.code == 0)
                {
                    // 2-1. 정상
                    // 3. 앱연결
                    KakaoSignup kakaoSignup = JsonConvert.DeserializeObject<KakaoSignup>(WebApiUtil.SignUp(KAKAO_KAPI_URI, GET_SIGNUP_RESOURCE, kakaoToken.access_token));

                    if (kakaoSignup.code == 0)
                    {
                        // 3-1. 최초 앱등록일 경우 회원가입 프로세스를 진행
                        KakaoUserInfo kakaoUserInfo = JsonConvert.DeserializeObject<KakaoUserInfo>(WebApiUtil.RequestMe(KAKAO_KAPI_URI, GET_REQUEST_ME_RESOURCE, kakaoToken.access_token));

                        Session["kakaoId"] = kakaoUserInfo.id.ToString();
                        Session["kakaoNickname"] = kakaoUserInfo.properties.nickname;
                        Session["kakaoEmail"] = kakaoUserInfo.kaccount_email;
                        Session["kakaoThumbnailImage"] = kakaoUserInfo.properties.thumbnail_image;
                        Session["kakaoProfileImage"] = kakaoUserInfo.properties.profile_image;
                        Session["accessToken"] = kakaoToken.access_token;
                        Session["refreshToken"] = kakaoToken.refresh_token;

                        Response.Redirect("/Member/TermsAgree.aspx");
                    }
                    else
                    {
                        // 3-2. 최초 앱등록이 아닐 경우 로그인 프로세스를 진행
                        // 4. 카카오 로그인
                        KakaoUserInfo kakaoUserInfo = JsonConvert.DeserializeObject<KakaoUserInfo>(WebApiUtil.RequestMe(KAKAO_KAPI_URI, GET_REQUEST_ME_RESOURCE, kakaoToken.access_token));

                        if (kakaoUserInfo.code == 0)
                        {
                            // 4-1. 카카오 로그인 성공
                            // 5. 앱 로그인 진행
                            param = new Dictionary<string, string>();
                            param.Add("snsType", "1");
                            param.Add("snsId", kakaoUserInfo.id.ToString());
                            param.Add("snsURL", kakaoUserInfo.properties.profile_image);
                            param.Add("snsNickname", kakaoUserInfo.properties.nickname);
                            param.Add("carrierId", "31");
                            param.Add("appVersion", "1.0.0");

                            RootObjectLogin rootObj = JsonConvert.DeserializeObject<RootObjectLogin>(WebApiUtil.RestRequest(APP_SERVER_URI, PRODUCER_LOGIN, param));

                            if (rootObj.value == 0)
                            {
                                Session["kakaoId"] = kakaoUserInfo.id.ToString();
                                Session["kakaoNickname"] = kakaoUserInfo.properties.nickname;
                                Session["kakaoEmail"] = kakaoUserInfo.kaccount_email;
                                Session["kakaoThumbnailImage"] = kakaoUserInfo.properties.thumbnail_image;
                                Session["kakaoProfileImage"] = kakaoUserInfo.properties.profile_image;
                                Session["accessToken"] = kakaoToken.access_token;
                                Session["refreshToken"] = kakaoToken.refresh_token;

                                Session["producerIdx"] = rootObj.login.producerIdx;
                                Session["producerContactNumber"] = rootObj.login.producerContactNumber;
                                Session["zipCode"] = rootObj.login.zipCode;
                                Session["address1"] = rootObj.login.address1;
                                Session["address2"] = rootObj.login.address2;
                                Session["detailAddress"] = rootObj.login.detailAddress;
                                Session["producePoint"] = rootObj.login.producePoint;
                                Session["producePointExpireDate"] = rootObj.login.producePointExpireDate;
                                Session["totalDonationPoint"] = rootObj.login.totalDonationPoint;
                                Session["rank"] = rootObj.login.rank;
                                Session["nickname"] = rootObj.login.nickname;
                                Session["expirePoint"] = rootObj.login.expirePoint;
                                Session["name"] = rootObj.login.name;

                                Response.Redirect("/Main.aspx");
                            }
                            else
                            {
                                Session["kakaoId"] = kakaoUserInfo.id.ToString();
                                Session["kakaoNickname"] = kakaoUserInfo.properties.nickname;
                                Session["kakaoEmail"] = kakaoUserInfo.kaccount_email;
                                Session["kakaoThumbnailImage"] = kakaoUserInfo.properties.thumbnail_image;
                                Session["kakaoProfileImage"] = kakaoUserInfo.properties.profile_image;
                                Session["accessToken"] = kakaoToken.access_token;
                                Session["refreshToken"] = kakaoToken.refresh_token;

                                Response.Redirect("/Member/TermsAgree.aspx");
                            }
                        }
                        else
                        {
                            // 4-2. 카카오 로그인 실패
                            ScriptManager.RegisterStartupScript(
                                this,
                                this.GetType(),
                                "alert",
                                "alert('" + WebApiUtil.GetErrorMsg(kakaoUserInfo.code) + "'); window.location='" + Request.ApplicationPath + "Default.aspx';",
                                true
                            );
                        }
                    }
                }
                else
                {
                    // 2-2. 사용자 토큰 받기 실패
                    ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "redirect",
                        "alert('" + WebApiUtil.GetErrorMsg(kakaoToken.code) + "'); window.location='" + Request.ApplicationPath + "Default.aspx';",
                        true
                    );
                }
            }
        }
    }
}