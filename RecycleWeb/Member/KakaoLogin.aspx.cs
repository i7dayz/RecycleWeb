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
        //    protected void Page_Load(object sender, EventArgs e)
        //    {
        //        string kakaoId = Request.Form["kakaoId"];
        //        string kakaoNickname = Request.Form["kakaoNickname"];
        //        string kakaoEmail = Request.Form["kakaoEmail"];
        //        string kakaoThumbnailImage = Request.Form["kakaoThumbnailImage"];
        //        string kakaoProfileImage = Request.Form["kakaoProfileImage"];
        //        string accessToken = Request.Form["accessToken"];
        //        string refreshToken = Request.Form["refreshToken"];

        //        if (!string.IsNullOrEmpty(kakaoId))
        //        {
        //            // 로그인 진행
        //            string url = "http://geno47.cafe24.com:8080/producer/login";

        //            Dictionary<string, string> param = new Dictionary<string, string>();
        //            param.Add("snsType", "1");
        //            param.Add("snsId", kakaoId);
        //            param.Add("snsURL", kakaoProfileImage);
        //            param.Add("snsNickname", kakaoNickname);
        //            param.Add("carrierId", "31");
        //            param.Add("appVersion", "1.0.0");

        //            string msg = string.Empty;

        //            WebApiUtil.HttpPostJSON(url, param, out msg);

        //            //Dictionary<string, string> token = JsonConvert.DeserializeObject<Dictionary<string, string>>(msg);
        //            RootObjectLogin rootObj = JsonConvert.DeserializeObject<RootObjectLogin>(msg);

        //            if (rootObj.value == 0)
        //            {
        //                Session["kakaoId"] = kakaoId;
        //                Session["kakaoNickname"] = kakaoNickname;
        //                Session["kakaoEmail"] = kakaoEmail;
        //                Session["kakaoThumbnailImage"] = kakaoThumbnailImage;
        //                Session["kakaoProfileImage"] = kakaoProfileImage;
        //                Session["accessToken"] = accessToken;
        //                Session["refreshToken"] = refreshToken;

        //                Session["producerIdx"] = rootObj.login.producerIdx;
        //                Session["producerContactNumber"] = rootObj.login.producerContactNumber;
        //                Session["zipCode"] = rootObj.login.zipCode;
        //                Session["address1"] = rootObj.login.address1;
        //                Session["address2"] = rootObj.login.address2;
        //                Session["detailAddress"] = rootObj.login.detailAddress;
        //                Session["producePoint"] = rootObj.login.producePoint;
        //                Session["producePointExpireDate"] = rootObj.login.producePointExpireDate;
        //                Session["totalDonationPoint"] = rootObj.login.totalDonationPoint;
        //                Session["rank"] = rootObj.login.rank;
        //                Session["nickname"] = rootObj.login.nickname;
        //                Session["expirePoint"] = rootObj.login.expirePoint;
        //                Session["name"] = rootObj.login.name;

        //                Response.Redirect("/Main.aspx");
        //            }
        //            else
        //            {
        //                Response.Redirect("/Member/TermsAgree.aspx");
        //            }
        //        }
        //        else
        //        {
        //            Response.Redirect("/Default.aspx");
        //        }
        //    }
        //}

        //public class Login
        //{
        //    public int producerIdx { get; set; }
        //    public string producerContactNumber { get; set; }
        //    public int zipCode { get; set; }
        //    public string address1 { get; set; }
        //    public string address2 { get; set; }
        //    public string detailAddress { get; set; }
        //    public int producePoint { get; set; }
        //    public string producePointExpireDate { get; set; }
        //    public int totalDonationPoint { get; set; }
        //    public int rank { get; set; }
        //    public string nickname { get; set; }
        //    public string expirePoint { get; set; }
        //    public string name { get; set; }
        //}

        //public class RootObjectLogin
        //{
        //    public string result_msg { get; set; }
        //    public string server_time { get; set; }
        //    public string server_ver { get; set; }
        //    public Login login { get; set; }
        //    public int value { get; set; }
        //}
    }
}