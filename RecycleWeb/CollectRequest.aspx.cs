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
    public partial class CollectRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                getMarketPrice();
                getCollectReserve();
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

            RootObjectMarketView rootObj = JsonConvert.DeserializeObject<RootObjectMarketView>(msg);

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
                            this.txtProduct06.Value = rootObj.collectReserve.product_6.ToString();
                            //productList += string.Format("헌옷 {0}, ", rootObj.collectReserve.product_6.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_7.ToString()))
                        {
                            this.txtProduct07.Value = rootObj.collectReserve.product_7.ToString();
                            //productList += string.Format("휴대폰 {0}, ", rootObj.collectReserve.product_7.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_9.ToString()))
                        {
                            this.txtProduct09.Value = rootObj.collectReserve.product_9.ToString();
                            //productList += string.Format("소형가전 {0}, ", rootObj.collectReserve.product_9.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_8.ToString()))
                        {
                            this.txtProduct08.Value = rootObj.collectReserve.product_8.ToString();
                            //productList += string.Format("대형가전 {0}, ", rootObj.collectReserve.product_8.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_1.ToString()))
                        {
                            this.txtProduct01.Value = rootObj.collectReserve.product_1.ToString();
                            //productList += string.Format("폐지 {0}, ", rootObj.collectReserve.product_1.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_2.ToString()))
                        {
                            this.txtProduct02.Value = rootObj.collectReserve.product_2.ToString();
                            //productList += string.Format("병 {0}, ", rootObj.collectReserve.product_2.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_4.ToString()))
                        {
                            this.txtProduct04.Value = rootObj.collectReserve.product_4.ToString();
                            //productList += string.Format("고철 {0}, ", rootObj.collectReserve.product_4.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_5.ToString()))
                        {
                            this.txtProduct05.Value = rootObj.collectReserve.product_5.ToString();
                            //productList += string.Format("비철 {0}, ", rootObj.collectReserve.product_5.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.product_10.ToString()))
                        {
                            this.chkProduct10.Checked = true;
                            //productList += string.Format("이삿짐, ", rootObj.collectReserve.product_10.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.etc_1.ToString()))
                        {
                            this.chkEtc1.Checked = true;
                            //productList += string.Format("기타, ", rootObj.collectReserve.etc_1.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.etc_2.ToString()))
                        {
                            this.chkEtc2.Checked = true;
                            //productList += string.Format("폐기서비스, ", rootObj.collectReserve.etc_2.ToString());
                        }
                        else if (!string.IsNullOrEmpty(rootObj.collectReserve.etc_3.ToString()))
                        {
                            this.chkEtc3.Checked = true;
                            //productList += string.Format("유품정리, ", rootObj.collectReserve.etc_3.ToString());
                        }

                        this.hdProducerIdx.Value = Session["producerIdx"].ToString();
                        this.hdProduceIdx.Value = rootObj.collectReserve.product_3.ToString();

                        this.not_reserved.Style["display"] = "none";
                        this.reserved.Style["display"] = "block";
                    }
                    else
                    {
                        this.not_reserved.Style["display"] = "block";
                        this.reserved.Style["display"] = "none";
                    }
                }
            }
        }
    }
}