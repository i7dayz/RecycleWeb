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
            if (!IsPostBack)
            {
                if (Session["kakaoId"] != null)
                {
                    // 로그인 진행
                    string url = "http://geno47.cafe24.com:8080/producer/userInfoDetail";

                    Dictionary<string, string> param = new Dictionary<string, string>();
                    param.Add("producerIdx", Session["producerIdx"].ToString());

                    string msg = string.Empty;

                    WebApiUtil.HttpPostJSON(url, param, out msg);

                    RootObject1 rootObj = JsonConvert.DeserializeObject<RootObject1>(msg);

                    if (rootObj.value == 0)
                    {
                        Session["producerIdx"] = Session["producerIdx"].ToString();
                        Session["producerContactNumber"] = rootObj.userInfoDetail.producerContactNumber;
                        Session["zipCode"] = rootObj.userInfoDetail.zipCode;
                        Session["address1"] = rootObj.userInfoDetail.address1;
                        Session["address2"] = rootObj.userInfoDetail.address2;
                        Session["detailAddress"] = rootObj.userInfoDetail.detailAddress;
                        Session["producePoint"] = rootObj.userInfoDetail.producePoint;
                        Session["producePointExpireDate"] = rootObj.userInfoDetail.producePointExpireDate;
                        Session["nickname"] = rootObj.userInfoDetail.nickname;
                    }

                    if (!string.IsNullOrEmpty(Session["kakaoProfileImage"].ToString()))
                    {
                        this.profileImg.Src = Session["kakaoProfileImage"].ToString();
                    }

                    this.name.InnerText = "이름";
                    this.nickname.InnerText = Session["nickname"].ToString();

                    if (!string.IsNullOrEmpty(Session["producerContactNumber"].ToString()))
                    {
                        string[] contactNumber = Session["producerContactNumber"].ToString().Split('-');
                        this.txtContactNumber1.Value = contactNumber[0];
                        this.txtContactNumber2.Value = contactNumber[1];
                        this.txtContactNumber3.Value = contactNumber[2];
                    }
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

    public class UserInfoDetail
    {
        public int producerSNSType { get; set; }
        public string producerSNSId { get; set; }
        public string producerSNSProfileURL { get; set; }
        public string producerSNSNickname { get; set; }
        public string producerStoreName { get; set; }
        public string producerContactNumber { get; set; }
        public int zipCode { get; set; }
        public string address1 { get; set; }
        public string address2 { get; set; }
        public string detailAddress { get; set; }
        public int producePoint { get; set; }
        public string recommendNickname { get; set; }
        public string nickname { get; set; }
        public string producePointExpireDate { get; set; }
        public int producePoint2 { get; set; }
        public object addressEtc { get; set; }
        public int snsinviteCnt { get; set; }
    }

    public class RootObject1
    {
        public string result_msg { get; set; }
        public UserInfoDetail userInfoDetail { get; set; }
        public string server_time { get; set; }
        public string server_ver { get; set; }
        public int value { get; set; }
    }
}