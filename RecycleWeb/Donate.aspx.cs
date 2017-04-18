using Newtonsoft.Json;
using RecycleWeb.Model;
using RecycleWeb.util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb
{
    public partial class Donate : System.Web.UI.Page
    {
        const string APP_SERVER_URI = "http://geno47.cafe24.com:8080";

        const string PRODUCER_LOGIN = "producer/login";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {

                Dictionary<string, string> param = new Dictionary<string, string>();
                param.Add("snsType", "1");
                param.Add("snsId", Session["kakaoId"].ToString());
                param.Add("snsURL", Session["kakaoThumbnailImage"].ToString());
                param.Add("snsNickname", Session["kakaoNickname"].ToString());
                param.Add("carrierId", "31");
                param.Add("appVersion", "1.0.0");

                RootObjectLogin rootObj = JsonConvert.DeserializeObject<RootObjectLogin>(WebApiUtil.RestRequest(APP_SERVER_URI, PRODUCER_LOGIN, param));

                if (rootObj.value == 0)
                {
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
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}