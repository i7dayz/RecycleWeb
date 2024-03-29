﻿using Newtonsoft.Json;
using RecycleWeb.Model;
using RecycleWeb.util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Store
{
    public partial class GoodsDetails : System.Web.UI.Page
    {
        string url = WebConfigurationManager.AppSettings["server_url"];
        string GOODS_BUY_RESULT = "/producer/goodsBuyResult";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                if (!Session["kakaoId"].ToString().Equals("n"))
                {
                    if (Request["goods_id"] != null && !string.IsNullOrEmpty(Request["goods_id"].ToString()))
                    {
                        if (Request["store"] != null && !string.IsNullOrEmpty(Request["store"].ToString()))
                        {
                            if (IsPostBack)
                            {
                                Dictionary<string, string> param = new Dictionary<string, string>();
                                param.Add("producerIdx", Session["producerIdx"].ToString());
                                param.Add("goodsId", Request["goods_id"].ToString());
                                param.Add("phoneNumber", Session["producerContactNumber"].ToString());

                                hdIsPostback.Value = "Y";

                                hdProducerIdx.Value = Session["producerIdx"].ToString();
                                hdGoodsId2.Value = Request["goods_id"].ToString();
                                hdProducerContactNumber.Value = Session["producerContactNumber"].ToString();

                                RootObjectGoodsBuyResult rootObj = JsonConvert.DeserializeObject<RootObjectGoodsBuyResult>(WebApiUtil.RestRequest(url, GOODS_BUY_RESULT, param));

                                if (rootObj.value == 0)
                                {
                                    Session["producePoint"] = rootObj.userPointInfo.producePoint.ToString();
                                    hdTest.Value = rootObj.userPointInfo.producePoint.ToString();
                                    ScriptManager.RegisterStartupScript(
                                        Page,
                                        Page.GetType(),
                                        "alert",
                                        "onSuccess('상품구입이 완료되었습니다. 현재 잔여 포인트는 " + int.Parse(Session["producePoint"].ToString()).ToString("N0") + " 포인트입니다.');",
                                        true
                                    );
                                }
                                else
                                {
                                    this.hdTest.Value = rootObj.value.ToString();
                                    ScriptManager.RegisterStartupScript(
                                        Page,
                                        Page.GetType(),
                                        "alert",
                                        "onError('" + WebApiUtil.GetErrorMsg(rootObj.value) + "');",
                                        true
                                    );
                                }
                            }

                            switch (Request["store"].ToString())
                            {
                                case "giftcard":
                                    this.title.InnerText = "상품권";
                                    break;
                                case "cv":
                                    this.title.InnerText = "편의점";
                                    break;
                                case "cafe":
                                    this.title.InnerText = "카페";
                                    break;
                                case "bakery":
                                    this.title.InnerText = "베이커리";
                                    break;
                                case "restaurant":
                                    this.title.InnerText = "레스토랑";
                                    break;
                                case "icecream":
                                    this.title.InnerText = "아이스크림/간식";
                                    break;
                                case "movie":
                                    this.title.InnerText = "영화/도서";
                                    break;
                                case "beauty":
                                    this.title.InnerText = "뷰티/악세사리";
                                    break;
                            }
                        }

                        this.hdStore.Value = Request["store"].ToString();
                        this.hdGoodsId.Value = Request["goods_id"].ToString();

                        getGoodsInfo(Request["goods_id"].ToString());

                        if (Session["name"] == null)
                        {
                            hdProducerName.Value = "";
                        }
                        else
                        {
                            hdProducerName.Value = Session["name"].ToString();
                        }
                    }
                    else
                    {
                        Response.Redirect("/Default.aspx");
                    }
                }
                else
                {
                    hdProducerIdx.Value = "0";
                }
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
        private void getGoodsInfo(string goodsId)
        {
            string giftnUrl = "https://wapi.gift-n.net:443/getGoodsInfo";
            string msg = string.Empty;

            WebApiUtil.HttpGet(giftnUrl + "?cid=" + WebConfigurationManager.AppSettings["cid"] + "&goods_id=" + goodsId + "&enc=" + WebApiUtil.MD5Hash(WebConfigurationManager.AppSettings["giftn_auth_key"] + WebConfigurationManager.AppSettings["cid"] + goodsId), out msg);


            GoodsInfoDetail goodsInfo = JsonConvert.DeserializeObject<GoodsInfoDetail>(msg);
            if (goodsInfo != null && goodsInfo.STATUS.Equals("Y"))
            {
                //this.hdGoodsId.Value = goodsInfo.GOODS_ID;
                this.goodsName.InnerText = goodsInfo.GOODS_NAME;
                this.goodsImg.Src = goodsInfo.IMG_URL;
                this.brandName.InnerText = goodsInfo.BRAND_NAME;
                this.price.InnerText = int.Parse(goodsInfo.PRICE).ToString("N0");
                this.exDate.InnerText = goodsInfo.EXDATE;
                this.desc.InnerHtml = string.IsNullOrEmpty(goodsInfo.GOODS_MEMO) ? goodsInfo.BRAND_MEMO.Replace("\n","<br/>") : goodsInfo.GOODS_MEMO.Replace("\n", "<br/>");
            }
        }
    }
}