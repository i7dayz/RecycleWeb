using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecycleWeb.Model
{
    public class KakaoAccessTokenInfo
    {
        public int code { get; set; }
        public string msg { get; set; }
        public int id { get; set; }
        public int expiresInMillis { get; set; }
    }
}