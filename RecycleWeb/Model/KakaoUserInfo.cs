using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecycleWeb.Model
{
    public class KakaoUserInfo
    {
        public int code { get; set; }
        public string msg { get; set; }
        public string kaccount_email { get; set; }
        public bool kaccount_email_verified { get; set; }
        public int id { get; set; }
        public Properties properties { get; set; }
    }
}