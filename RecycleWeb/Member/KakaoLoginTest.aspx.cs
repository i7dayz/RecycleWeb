using Newtonsoft.Json;
using RecycleWeb.util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Member
{
    public partial class KakaoLoginTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string serverDomain = Request.Url.Scheme + System.Uri.SchemeDelimiter + Request.Url.Host + (Request.Url.IsDefaultPort ? "" : ":" + Request.Url.Port);
            //string accessToken = Request.Form["accessToken"];
            //string refreshToken = Request.Form["refreshToken"];

            //string msg = string.Empty;

            //WebApiUtil.HttpPost("https://kapi.kakao.com/v1/user/signup", accessToken, out msg);

            //Console.Write(msg);

            if (!string.IsNullOrEmpty(Request["code"]))
            {
                string code = Request["code"];
                //this.test.Value = code;

                // 사용자 토큰 받기
                string url = "https://kauth.kakao.com/oauth/token";

                Dictionary<string, string> param = new Dictionary<string, string>();
                param.Add("grant_type", "authorization_code");
                param.Add("client_id", "7ac9ab630f44e0b7910f477934bb9f9a");
                param.Add("redirect_uri", serverDomain + "/Member/KakaoLoginTest.aspx");
                param.Add("code", code);

                string msg = string.Empty;

                WebApiUtil.HttpPost(url, param, out msg);

                KakaoToken kakaoToken = JsonConvert.DeserializeObject<KakaoToken>(msg);

                //this.access.Value = kakaoToken.access_token;

                // 앱연결
                url = "https://kapi.kakao.com/v1/user/me";
                WebApiUtil.HttpPostAuthHeader(url, kakaoToken.access_token, out msg);

                //this.msg.Value = msg;
                KakaoObj kakaoObj = JsonConvert.DeserializeObject<KakaoObj>(msg);

                if (!string.IsNullOrEmpty(kakaoObj.id.ToString()))
                {
                    // 로그인 진행
                    url = "http://geno47.cafe24.com:8080/producer/login";

                    param = new Dictionary<string, string>();
                    param.Add("snsType", "1");
                    param.Add("snsId", kakaoObj.id.ToString());
                    param.Add("snsURL", kakaoObj.properties.profile_image);
                    param.Add("snsNickname", kakaoObj.properties.nickname);
                    param.Add("carrierId", "31");
                    param.Add("appVersion", "1.0.0");

                    msg = string.Empty;

                    WebApiUtil.HttpPostJSON(url, param, out msg);

                    //Dictionary<string, string> token = JsonConvert.DeserializeObject<Dictionary<string, string>>(msg);
                    RootObjectLogin rootObj = JsonConvert.DeserializeObject<RootObjectLogin>(msg);

                    if (rootObj.value == 0)
                    {
                        Session["kakaoId"] = kakaoObj.id.ToString();
                        Session["kakaoNickname"] = kakaoObj.properties.nickname;
                        Session["kakaoEmail"] = kakaoObj.kaccount_email;
                        Session["kakaoThumbnailImage"] = kakaoObj.properties.thumbnail_image;
                        Session["kakaoProfileImage"] = kakaoObj.properties.profile_image;
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
                        Response.Redirect("/Member/TermsAgree.aspx");
                    }
                }
                else
                {
                    Response.Redirect("/Default.aspx");
                }
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }

    public class KakaoToken
    {
        public string access_token { get; set; }
        public string token_type { get; set; }
        public string refresh_token { get; set; }
        public int expires_in { get; set; }
        public string scope { get; set; }
    }

    public class Properties
    {
        public string profile_image { get; set; }
        public string nickname { get; set; }
        public string thumbnail_image { get; set; }
    }

    public class KakaoObj
    {
        public string kaccount_email { get; set; }
        public bool kaccount_email_verified { get; set; }
        public int id { get; set; }
        public Properties properties { get; set; }
    }
}