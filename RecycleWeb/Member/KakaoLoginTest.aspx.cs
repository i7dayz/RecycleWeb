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
            string accessToken = Request.Form["accessToken"];
            string refreshToken = Request.Form["refreshToken"];

            
            string msg = string.Empty;

            WebApiUtil.HttpPost("https://kapi.kakao.com/v1/user/signup", accessToken, out msg);

            Console.Write(msg);
        }
    }
}