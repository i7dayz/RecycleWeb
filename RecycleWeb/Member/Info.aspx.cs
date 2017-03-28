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
    public partial class Info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                // 로그인 진행
                string url = "http://geno47.cafe24.com:8080/producer/login";

                Dictionary<string, string> param = new Dictionary<string, string>();
                param.Add("snsType", "1");
                param.Add("snsId", Session["kakaoId"].ToString());
                param.Add("snsURL", Session["kakaoProfileImage"].ToString());
                param.Add("snsNickname", Session["kakaoNickname"].ToString());
                param.Add("carrierId", "31");
                param.Add("appVersion", "1.0.0");

                string msg = string.Empty;

                WebApiUtil.HttpPostJSON(url, param, out msg);

                RootObject rootObj = JsonConvert.DeserializeObject<RootObject>(msg);

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
                }

                if (!string.IsNullOrEmpty(Session["kakaoProfileImage"].ToString()))
                {
                    this.profileImg.Src = Session["kakaoProfileImage"].ToString();
                }

                this.name.InnerHtml = "이름";
                this.nickname.InnerHtml = Session["nickname"].ToString();
                this.txtContactNumber.Value = Session["producerContactNumber"].ToString();
                this.txtBaseAddress.Value = string.Format("{0} {1}", Session["address1"], Session["address2"]);
                this.txtDetailAddress.Value = Session["detailAddress"].ToString();
                this.txtZipNo.Value = Session["zipCode"].ToString();
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}