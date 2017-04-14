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

namespace RecycleWeb
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                if (!string.IsNullOrEmpty(Session["kakaoProfileImage"].ToString()))
                {
                    this.profileImg.Src = Session["kakaoProfileImage"].ToString();
                }

                DateTime dateValue = DateTime.Parse(Session["producePointExpireDate"].ToString());
                this.exDate.InnerText = dateValue.ToString("yyyy.MM.dd");
                this.exPoint.InnerText = Session["expirePoint"].ToString();

                this.nickname.InnerText = Session["nickname"].ToString();
                this.point.InnerText = Session["producePoint"].ToString();

                getCollectReserve();
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

                        if (!string.IsNullOrEmpty(rootObj.collectReserve.product_6.ToString()))
                        {
                            productList += string.Format("헌옷 {0}, ", rootObj.collectReserve.product_6.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_7.ToString()))
                        {
                            productList += string.Format("휴대폰 {0}, ", rootObj.collectReserve.product_7.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_9.ToString()))
                        {
                            productList += string.Format("소형가전 {0}, ", rootObj.collectReserve.product_9.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_8.ToString()))
                        {
                            productList += string.Format("대형가전 {0}, ", rootObj.collectReserve.product_8.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_1.ToString()))
                        {
                            productList += string.Format("폐지 {0}, ", rootObj.collectReserve.product_1.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_2.ToString()))
                        {
                            productList += string.Format("병 {0}, ", rootObj.collectReserve.product_2.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_4.ToString()))
                        {
                            productList += string.Format("고철 {0}, ", rootObj.collectReserve.product_4.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_5.ToString()))
                        {
                            productList += string.Format("비철 {0}, ", rootObj.collectReserve.product_5.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_10.ToString()))
                        {
                            productList += string.Format("이삿짐, ", rootObj.collectReserve.product_10.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.etc_1.ToString()))
                        {
                            productList += string.Format("기타, ", rootObj.collectReserve.etc_1.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.etc_2.ToString()))
                        {
                            productList += string.Format("폐기서비스, ", rootObj.collectReserve.etc_2.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.etc_3.ToString()))
                        {
                            productList += string.Format("유품정리, ", rootObj.collectReserve.etc_3.ToString());
                        }

                        if (string.IsNullOrEmpty(rootObj.collectReserve.collectorImageUrl.ToString()))
                        {
                            this.collectorImg.Src = "/img/collector_profile/010-4320-1721.png"; // " + collectorContactNumber + "
                        }
                        else
                        {
                            this.collectorImg.Src = "/img/pro_icon.jpg";
                        }
                        this.collectList.InnerText = productList;
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

    public class CollectReserve
    {
        public int product_1 { get; set; }
        public int product_2 { get; set; }
        public int product_3 { get; set; }
        public int product_4 { get; set; }
        public int product_5 { get; set; }
        public int product_6 { get; set; }
        public int product_7 { get; set; }
        public int product_8 { get; set; }
        public int product_9 { get; set; }
        public int product_10 { get; set; }
        public string collectorImageUrl { get; set; }
        public string collectorName { get; set; }
        public string collectorContactNumber { get; set; }
        public string hopeCollectDate { get; set; }
        public int etc_1 { get; set; }
        public int etc_2 { get; set; }
        public int etc_3 { get; set; }
    }

    public class RootObjectCollectReserve
    {
        public string result_msg { get; set; }
        public string server_time { get; set; }
        public CollectReserve collectReserve { get; set; }
        public string server_ver { get; set; }
        public int value { get; set; }
    }
}