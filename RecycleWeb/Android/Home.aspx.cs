using Newtonsoft.Json;
using RecycleWeb.Model;
using RecycleWeb.util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Android
{
    public partial class Home : System.Web.UI.Page
    {
        string url = WebConfigurationManager.AppSettings["server_url"];

        string PRODUCER_LOGIN = "/producer/login";
        string COLLECT_RESERVE = "/producer/collectReserve";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form.AllKeys.Length > 0)
            {
                Dictionary<string, string> param = new Dictionary<string, string>();
                param.Add("snsType", Request.Form["sysType"].ToString());
                param.Add("snsId", Request.Form["kakaoId"].ToString());
                param.Add("snsURL", Request.Form["kakaoThumbnailImage"].ToString());
                param.Add("snsNickname", Request.Form["kakaoNickname"].ToString());
                param.Add("carrierId", Request.Form["carrierId"].ToString());
                param.Add("appVersion", Request.Form["appVersion"].ToString());

                RootObjectLogin rootObj = JsonConvert.DeserializeObject<RootObjectLogin>(WebApiUtil.RestRequest(url, PRODUCER_LOGIN, param));

                if (rootObj.value == 0)
                {
                }
            }
        }
    }
}