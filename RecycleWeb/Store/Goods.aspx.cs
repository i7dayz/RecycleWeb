using Newtonsoft.Json;
using RecycleWeb.util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Store
{
    public partial class Goods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = "https://wapi.gift-n.net:443/getGoodsInfoList";
            string msg = string.Empty;
            WebApiUtil.HttpGet(url + "?cid=" + WebConfigurationManager.AppSettings["cid"] + "&brand_id=83&enc=" + WebApiUtil.MD5Hash(WebConfigurationManager.AppSettings["giftn_auth_key"] + WebConfigurationManager.AppSettings["cid"] + "83"), out msg);

            this.hdMsg.Value = msg;


            url = "https://wapi.gift-n.net:443/getBrandImage";
            msg = string.Empty;
            WebApiUtil.HttpGet(url + "?cid=" + WebConfigurationManager.AppSettings["cid"] + "&brand_id=83", out msg);

            Brand brand = JsonConvert.DeserializeObject<Brand>(msg);

            if (brand != null && brand.STATUS.Equals("Y"))
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat(@"<li style=""width: 24.7 %; height: 100px; float:left;"">
                                      <div style=""padding-top:10px; text-align: center;"">       
                                         <img src=""{0}"" style=""width: 60px"">          
                                      </div>
                                      <p>{1}</p>
                                  </li>", brand.IMG_URL, brand.BRAND_NAME);

                this.brandList.InnerHtml += sb.ToString();
            }
        }
    }

    public class Brand
    {
        public string BRAND_NAME { get; set; }
        public string IMG_URL { get; set; }
        public string STATUS { get; set; }
    }
}