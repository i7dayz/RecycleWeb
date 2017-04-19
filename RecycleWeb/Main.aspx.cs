using System;
using System.Collections.Generic;
using System.Web.Configuration;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RecycleWeb.util;
using Newtonsoft.Json;
using RecycleWeb.Model;
using RecycleWeb.Member;

namespace RecycleWeb
{
    public partial class Main : System.Web.UI.Page
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

                    hdRank.Value = rootObj.login.rank.ToString();
                    hdTotalDonationPoint.Value = rootObj.login.totalDonationPoint.ToString();

                    if (!string.IsNullOrEmpty(Session["kakaoProfileImage"].ToString()))
                    {
                        this.profileImg.Src = Session["kakaoProfileImage"].ToString();
                    }

                    if (Session["producePointExpireDate"] != null && Session["expirePoint"] != null)
                    {
                        DateTime dateValue = DateTime.Parse(Session["producePointExpireDate"].ToString());
                        this.exDate.InnerText = dateValue.ToString("yyyy.MM.dd");
                        this.exPoint.InnerText = int.Parse(Session["expirePoint"].ToString()).ToString("N0");
                    }

                    this.nickname.InnerText = Session["nickname"].ToString();
                    this.point.InnerText = int.Parse(Session["producePoint"].ToString()).ToString("N0");

                    getCollectReserve();
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        private void getCollectReserve()
        {
            if (Session["producerIdx"] != null)
            {
                string url = "http://geno47.cafe24.com:8080/producer/collectReserve";

                Dictionary<string, string> param = new Dictionary<string, string>();
                param.Add("producerIdx", Session["producerIdx"].ToString());

                string msg = string.Empty;

                WebApiUtil.HttpPostJSON(url, param, out msg);

                RootObjectCollectReserve rootObj = JsonConvert.DeserializeObject<RootObjectCollectReserve>(msg);

                if (rootObj.value == 0)
                {
                    if (rootObj.collectReserve != null)
                    {
                        string productList = string.Empty;

                        if (!string.IsNullOrEmpty(rootObj.collectReserve.product_6.ToString()) && rootObj.collectReserve.product_6 > 0)
                        {
                            productList += string.Format("헌옷 {0}, ", rootObj.collectReserve.product_6.ToString());
                        }

                        if (!string.IsNullOrEmpty(rootObj.collectReserve.product_7.ToString()) && rootObj.collectReserve.product_7 > 0)
                        {
                            productList += string.Format("휴대폰 {0}, ", rootObj.collectReserve.product_7.ToString());
                        }

                        if (!string.IsNullOrEmpty(rootObj.collectReserve.product_9.ToString()) && rootObj.collectReserve.product_9 > 0)
                        {
                            productList += string.Format("소형가전 {0}, ", rootObj.collectReserve.product_9.ToString());
                        }

                        if (!string.IsNullOrEmpty(rootObj.collectReserve.product_8.ToString()) && rootObj.collectReserve.product_8 > 0)
                        {
                            productList += string.Format("대형가전 {0}, ", rootObj.collectReserve.product_8.ToString());
                        }

                        if (!string.IsNullOrEmpty(rootObj.collectReserve.product_1.ToString()) && rootObj.collectReserve.product_1 > 0)
                        {
                            productList += string.Format("폐지 {0}, ", rootObj.collectReserve.product_1.ToString());
                        }

                        if (!string.IsNullOrEmpty(rootObj.collectReserve.product_2.ToString()) && rootObj.collectReserve.product_2 > 0)
                        {
                            productList += string.Format("병 {0}, ", rootObj.collectReserve.product_2.ToString());
                        }

                        if (!string.IsNullOrEmpty(rootObj.collectReserve.product_4.ToString()) && rootObj.collectReserve.product_4 > 0)
                        {
                            productList += string.Format("고철 {0}, ", rootObj.collectReserve.product_4.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_5.ToString()) && rootObj.collectReserve.product_5 > 0)
                        {
                            productList += string.Format("비철 {0}, ", rootObj.collectReserve.product_5.ToString());
                        }

                        if (!string.IsNullOrEmpty(rootObj.collectReserve.product_10.ToString()) && rootObj.collectReserve.product_10 > 0)
                        {
                            productList += string.Format("이삿짐, ", rootObj.collectReserve.product_10.ToString());
                        }

                        if (!string.IsNullOrEmpty(rootObj.collectReserve.etc_1.ToString()) && rootObj.collectReserve.etc_1 > 0)
                        {
                            productList += string.Format("기타, ", rootObj.collectReserve.etc_1.ToString());
                        }

                        if (!string.IsNullOrEmpty(rootObj.collectReserve.etc_2.ToString()) && rootObj.collectReserve.etc_2 > 0)
                        {
                            productList += string.Format("폐기서비스, ", rootObj.collectReserve.etc_2.ToString());
                        }

                        if (!string.IsNullOrEmpty(rootObj.collectReserve.etc_3.ToString()) && rootObj.collectReserve.etc_3 > 0)
                        {
                            productList += string.Format("유품정리, ", rootObj.collectReserve.etc_3.ToString());
                        }

                        if (!string.IsNullOrEmpty(rootObj.collectReserve.collectorImageUrl.ToString()))
                        {
                            this.collectorImg.Src = string.Format("/img/collector_profile/{0}", rootObj.collectReserve.collectorImageUrl.ToString());
                        }
                        else
                        {
                            this.collectorImg.Src = "/img/pro_icon.jpg";
                        }

                        this.collectList.InnerText = productList.Substring(0, productList.Length - 2);
                        this.collectorName.InnerText = rootObj.collectReserve.collectorName;
                        this.collectorContactNumber.InnerText = rootObj.collectReserve.collectorContactNumber;
                        this.collectorHopeDate.InnerText = rootObj.collectReserve.hopeCollectDate;

                        this.hdProducerIdx.Value = Session["producerIdx"].ToString();
                        this.hdProduceIdx.Value = rootObj.collectReserve.product_3.ToString();

                        this.reserved.Style["display"] = "block";
                        this.notReserved.Style["display"] = "none";

                        this.btnQuickRequest.Style["display"] = "none";
                        this.btnQuickRequestCancel.Style["display"] = "block";
                    }
                    else
                    {
                        this.reserved.Style["display"] = "none";
                        this.notReserved.Style["display"] = "block";

                        this.btnQuickRequest.Style["display"] = "block";
                        this.btnQuickRequestCancel.Style["display"] = "none";
                    }
                }
            }
        }        
    }
}