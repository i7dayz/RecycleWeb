using Newtonsoft.Json;
using RecycleWeb.util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb
{
    public partial class CollectRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                getMarketPrice();
            }
            else
            {
                Response.Redirect("Default.aspx");
            }            
        }

        private void getMarketPrice()
        {
            string url = "http://geno47.cafe24.com:8080/producer/marketPriceView";

            string msg = string.Empty;

            WebApiUtil.HttpPostJSON(url, null, out msg);

            RootObject rootObj = JsonConvert.DeserializeObject<RootObject>(msg);

            if (rootObj.value == 0)
            {
                this.hdProduce_1_price.Value = rootObj.marketPriceView[0][1].ToString();
                this.hdProduce_2_price.Value = rootObj.marketPriceView[1][1].ToString();
                this.hdProduce_3_price.Value = rootObj.marketPriceView[2][1].ToString();
                this.hdProduce_4_price.Value = rootObj.marketPriceView[3][1].ToString();
                this.hdProduce_5_price.Value = rootObj.marketPriceView[4][1].ToString();
                this.hdProduce_6_price.Value = rootObj.marketPriceView[5][1].ToString();
                this.hdProduce_7_price.Value = rootObj.marketPriceView[6][1].ToString();
                this.hdProduce_8_price.Value = rootObj.marketPriceView[7][1].ToString();
                this.hdProduce_9_price.Value = rootObj.marketPriceView[8][1].ToString();
                this.hdProduce_10_price.Value = rootObj.marketPriceView[9][1].ToString();
            }
        }
    }

    public class RootObject
    {
        public string result_msg { get; set; }
        public string server_time { get; set; }
        public string server_ver { get; set; }
        public int value { get; set; }
        public List<List<int>> marketPriceView { get; set; }
    }
}