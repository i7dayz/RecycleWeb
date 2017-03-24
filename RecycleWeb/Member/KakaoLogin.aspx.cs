using Newtonsoft.Json;
using RecycleWeb.util;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Member
{
    public partial class KakaoLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string code = Request.QueryString["code"];
            this.hdCode.Value = code;

            if (!string.IsNullOrEmpty(code))
            {
                // 토큰요청
                string url = "https://kauth.kakao.com/oauth/token";

                Dictionary<string, string> param = new Dictionary<string, string>();
                param.Add("grant_type", "authorization_code");
                param.Add("client_id", "7ac9ab630f44e0b7910f477934bb9f9a");
                param.Add("redirect_uri", "http://localhost:52491/Member/KakaoLogin.aspx");
                param.Add("code", code);

                string msg = string.Empty;

                WebApiUtil.HttpPost(url, param, out msg);

                Dictionary<string, string> token = JsonConvert.DeserializeObject<Dictionary<string, string>>(msg);
                Console.Write(token.Count);

                // 앱연결, 여기합니다.. 2017.03.24.
            }
        }
    }

    class KakaoToken
    {
        string accessToken = string.Empty;
        string tokenType = string.Empty;
        string refreshToken = string.Empty;
        string expiresIn = string.Empty;
        string scope= string.Empty;

        string getAccessToken() { return accessToken;  }
        void setAccessToken(string accessToken) { this.accessToken = accessToken; }

        string getTokenType() { return tokenType; }
        void setTokenType(string tokenType) { this.tokenType = tokenType; }

        string getRefreshToken() { return refreshToken; }
        void setRefreshToken(string refreshToken) { this.refreshToken = refreshToken; }

        string getExpiresIn() { return expiresIn; }
        void setExpiresIn(string expiresIn) { this.expiresIn = expiresIn; }

        string getScope() { return scope; }
        void setScope(string scope) { this.scope = scope; }
    }
}