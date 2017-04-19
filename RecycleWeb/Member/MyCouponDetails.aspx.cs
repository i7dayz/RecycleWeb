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

namespace RecycleWeb.Member
{
    public partial class MyCouponDetails : System.Web.UI.Page
    {
        string orderId = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                if (Request["url"] != null && !string.IsNullOrEmpty(Request["url"].ToString()))
                {
                    goodsImg.Src = Request["url"].ToString();
                }

                if (Request["pin"] != null && !string.IsNullOrEmpty(Request["pin"].ToString()))
                {
                    hdPin.Value = Request["pin"].ToString();
                }

                if (Request["order_id"] != null && !string.IsNullOrEmpty(Request["order_id"].ToString()))
                {
                    orderId = Request["order_id"].ToString();

                    if (!orderId.Equals(string.Empty))
                    {
                        getEpinStatus();
                    }
                }

                if (Request["brand"] != null && !string.IsNullOrEmpty(Request["brand"].ToString()))
                {
                    string[] brand = Request["brand"].ToString().Split('|');

                    this.branchName.InnerText = brand[0];
                    goodsName.InnerText = brand[1];
                }

                if (Request["exdate"] != null && !string.IsNullOrEmpty(Request["exdate"].ToString()))
                {
                    exDate.InnerText = Request["exdate"].ToString();
                }
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }

        private void getEpinStatus()
        {
            string url = "https://wapi.gift-n.net:443/StatusSendEPin";
            string msg = string.Empty;

            WebApiUtil.HttpGet(url + "?cid=" + WebConfigurationManager.AppSettings["cid"] + "&enc=" + WebApiUtil.MD5Hash(WebConfigurationManager.AppSettings["giftn_auth_key"] + WebConfigurationManager.AppSettings["cid"] + orderId) + "&order_id=" + orderId, out msg);

            EPinStatus ePinStatus = JsonConvert.DeserializeObject<EPinStatus>(msg);
            if (ePinStatus != null && ePinStatus.rstCode.Equals("0"))
            {
                this.useStatus.InnerText = ePinStatus.use.Equals("Y") ? "사용완료" : "사용안함";
                //this.branchName.InnerText = ePinStatus.branchname;
            }
        }
    }
}