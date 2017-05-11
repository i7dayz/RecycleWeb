using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
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
        /* **** 상품권
         * 197	스마트문화상품권
         * 17	온라인해피머니상품권
         * 15	온라인틴캐시
         * 16	온라인도서상품권
         * 222	온라인문화상품권
         * 200	아이템베이
         * 173	신세계백화점
         * 69	버츠비
         * 131	몽키3
         * 138	드마리스식사권
         * 116	글라스박스
         * 199	LGU+
         * 102	SKT
         * 22	GS25상품권
         * 62	BRCD
         * 74	1577대리운전
         */
        string[] giftcardBrandNos = { "197", "17", "15", "16", "222", "200", "173", "69", "131", "138", "116", "199", "102", "22", "62", "74" };

        /* **** 편의점
         * 92	GS25
         * 7    세븐일레븐
         * 4    CU
         */
        string[] cvBrandNos = { "92", "7", "4" };

        /* **** 카페
         * 226	이디야
         * 210	프랭크서울
         * 45	할리스커피
         * 208	키스더티라미수
         * 54	투썸플레이스
         * 97	크리스피크림도넛
         * 44	커핀그루나루
         * 29	카페띠아모
         * 2	엔제리너스
         * 183	스타벅스
         * 38	스무디킹
         * 60	망고식스
         * 180	뚜레쥬르
         * 196	파스쿠찌
         * 176	던킨도너츠
         */
        string[] cafeBrandNos = { "226", "210", "45", "208", "54", "97", "44", "29", "2", "183", "38", "60", "180", "196", "176" };

        /* **** 베이커리
         * 61	브레댄코
         * 125	떡보의하루
         * 174	파리바게뜨
         */
        string[] bakeryBrandNos = { "61", "125", "174" };

        /* **** 레스토랑
         * 207	쁘띠렌
         * 204	포호아
         * 34	한스델리
         * 53	차이나팩토리
         * 124	오니기리와이규동
         * 49	아웃백
         * 52	빕스
         * 76	드마리스
         * 194	TGIF
         */
        string[] restaurantBrandNos = { "207", "204", "34", "53", "124", "49", "52", "76", "194" };

        /* **** 아이스크림/간식
         * 35	장충동왕족발
         * 227	토스트럭
         * 107	페리카나
         * 37	올떡볶이
         * 114	빨봉분식
         * 30	미스터피자
         * 129	모스버거
         * 33	멕시카나치킨
         * 50	롯데리아
         * 63	도미노피자
         * 46	나뚜루POP
         * 175	배스킨라빈스
         * 104	KFC
         * 39	BHC
         */
        string[] icecreamBrandNos = { "35", "227", "107", "37", "114", "30", "129", "33", "50", "63", "46", "175", "104", "39" };

        /* **** 영화/도서
         * 214	메가박스
         */
        string[] movieBrandNos = { "214" };

        /* **** 뷰티/악세사리
         * 66	토니모리
         * 118	플라워365
         * 115	이가자헤어비스
         * 167	메리앤지
         * 127	더풋샵
         * 67	네이처리퍼블릭
         */
        string[] beauty = { "66", "118", "115", "167", "127", "67" };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                if (Request["store"] != null && !string.IsNullOrEmpty(Request["store"].ToString()))
                {
                    if (!Session["kakaoId"].ToString().Equals("n"))
                    {
                    }
                    else
                    {
                        hdProducerIdx.Value = "0";
                    }

                    string[] brandNos = null;
                    switch (Request["store"].ToString())
                    {
                        case "giftcard":
                            brandNos = giftcardBrandNos;
                            this.title.InnerText = "상품권";
                            break;
                        case "cv":
                            brandNos = cvBrandNos;
                            this.title.InnerText = "편의점";
                            break;
                        case "cafe":
                            brandNos = cafeBrandNos;
                            this.title.InnerText = "카페";
                            break;
                        case "bakery":
                            brandNos = bakeryBrandNos;
                            this.title.InnerText = "베이커리";
                            break;
                        case "restaurant":
                            brandNos = restaurantBrandNos;
                            this.title.InnerText = "레스토랑";
                            break;
                        case "icecream":
                            brandNos = icecreamBrandNos;
                            this.title.InnerText = "아이스크림/간식";
                            break;
                        case "movie":
                            brandNos = movieBrandNos;
                            this.title.InnerText = "영화/도서";
                            break;
                        case "beauty":
                            brandNos = beauty;
                            this.title.InnerText = "뷰티/악세사리";
                            break;
                    }

                    if (brandNos != null)
                    {
                        getBrandList(brandNos);
                    }

                    if (Request["brandId"] != null && !string.IsNullOrEmpty(Request["brandId"].ToString()))
                    {
                        getGoodsList(Request["brandId"].ToString());
                    }
                }

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

        private void getBrandList(string[] brandNos)
        {
            for (int i = 0; i < brandNos.Length; i++)
            {
                string cls = string.Format("four_0{0}", (i % 4 + 1));
                getBrand(brandNos[i], cls, i + 1);
            }

            if (brandNos.Length < 4)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append(@"<div class=""line_d""></div>");
                this.baseBrandList.InnerHtml += sb.ToString();
                this.list_onoff.Style["display"] = "none";
            }
            else
            {
                if (brandNos.Length % 4 != 0)
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append(@"<div class=""line_d""></div>");
                    this.moreBrandList.InnerHtml += sb.ToString();
                }
            }
        }

        private void getBrand(string brandNo, string cls, int cnt)
        {
            //string url = "https://wapi.gift-n.net:443/getGoodsInfoList";
            //string msg = string.Empty;

            //WebApiUtil.HttpGet(url + "?cid=" + WebConfigurationManager.AppSettings["cid"] + "&brand_id=" + brandNo + "&enc=" + WebApiUtil.MD5Hash(WebConfigurationManager.AppSettings["giftn_auth_key"] + WebConfigurationManager.AppSettings["cid"] + brandNo), out msg);

            //this.hdMsg.Value = msg;

            string url = "https://wapi.gift-n.net:443/getBrandImage";
            string msg = string.Empty;
            WebApiUtil.HttpGet(url + "?cid=" + WebConfigurationManager.AppSettings["cid"] + "&brand_id=" + brandNo, out msg);

            BrandInfo brand = JsonConvert.DeserializeObject<BrandInfo>(msg);

            if (brand != null && brand.STATUS.Equals("Y"))
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat(@"  <a href=""javascript:move('{3}','{4}');"">
                                        <div class=""{2}"">
                                            <p><img src=""{0}"" class=""img65 lazy""></p>
                                            <p class=""su_name pad_t4"">{1}</p>
                                        </div>
                                    </a>", brand.IMG_URL, brand.BRAND_NAME, cls, Request["store"], brandNo);
                if (cls.Equals("four_04"))
                {
                    sb.Append(@"<div class=""line_d""></div>");
                }

                if (cnt <= 4)
                {
                    this.baseBrandList.InnerHtml += sb.ToString();
                }
                else
                {
                    this.moreBrandList.InnerHtml += sb.ToString();

                    if (Request["more"] != null && Request["more"].ToString().Equals("Y"))
                    {
                        this.moreBrandList.Style["display"] = "";
                        list_onoff.InnerText = "접기";
                    }
                    else
                    {
                        this.moreBrandList.Style["display"] = "none";
                        list_onoff.InnerText = "더보기";
                    }
                }
            }
        }

        private void getGoodsList(string brandId)
        {
            // 제외상품
            List<string> exceptGoods = new List<string>();
            exceptGoods.Add("0000003244"); // [SKT] T데이터쿠폰 100MB, 이미지 없음

            exceptGoods.Add("0000007123"); // [엔제리너스] 아메리카노(S), 이미지 없음

            exceptGoods.Add("0000007155"); // [배스킨라빈스] 쿼터아이스크림, 이미지 없음
            exceptGoods.Add("0000007157"); // [배스킨라빈스] 하프갤론, 이미지 없음

            // 2017-04-21 요청
            exceptGoods.Add("0000006119"); // [신세계상품권] 5만원권_정가, 내부 조정건
            exceptGoods.Add("0000006798"); // [신세계상품권] 5만원권_조건다름, 내부 조정건
            exceptGoods.Add("0000006799"); // [신세계상품권] 2만원권_조건다름, 내부 조정건

            // 2017-04-21 요청
            exceptGoods.Add("0000000597"); // [GS25] 모바일상품권 1천원, 공급사이슈
            exceptGoods.Add("0000000598"); // [GS25] 모바일상품권 2천원, 공급사이슈
            exceptGoods.Add("0000000599"); // [GS25] 모바일상품권 3천원, 공급사이슈
            exceptGoods.Add("0000000600"); // [GS25] 모바일상품권 4천원, 공급사이슈
            exceptGoods.Add("0000000601"); // [GS25] 모바일상품권 5천원, 공급사이슈
            exceptGoods.Add("0000000602"); // [GS25] 모바일상품권 7천원, 공급사이슈
            exceptGoods.Add("0000000603"); // [GS25] 모바일상품권 8천원, 공급사이슈
            exceptGoods.Add("0000000604"); // [GS25] 모바일상품권 1만원, 공급사이슈
            exceptGoods.Add("0000000605"); // [GS25] 모바일상품권 2만원, 공급사이슈
            exceptGoods.Add("0000000606"); // [GS25] 모바일상품권 3만원, 공급사이슈
            exceptGoods.Add("0000000607"); // [GS25] 모바일상품권 5만원, 공급사이슈

            string url = "https://wapi.gift-n.net:443/getGoodsInfoList";
            string msg = string.Empty;

            WebApiUtil.HttpGet(url + "?cid=" + WebConfigurationManager.AppSettings["cid"] + "&brand_id=" + brandId + "&enc=" + WebApiUtil.MD5Hash(WebConfigurationManager.AppSettings["giftn_auth_key"] + WebConfigurationManager.AppSettings["cid"] + brandId), out msg);
            
            msg = msg.TrimStart('\"');
            msg = msg.TrimEnd('\"');
            msg = msg.Replace("\\", "");
            List<GoodsInfo> goodsList = JsonConvert.DeserializeObject<List<GoodsInfo>>(msg);
            StringBuilder sb = new StringBuilder();            
            for (int i = 0; i < goodsList.Count; i++)
            {
                if (!exceptGoods.Contains(goodsList[i].GOODS_ID))
                {
                    sb.AppendFormat(@"  <a href=""GoodsDetails.aspx?store={4}&goods_id={5}"">
                                            <div class=""reser"">
                                                <div class=""reser_icon reser_icon2"">
                                                    <img src=""{0}"" class=""lazy""/>
                                                </div >
                                                <div class=""reser_con"">
                                                    <div><span class=""font_size14bi color_b7b7b7"">{1}</span></div>
                                                    <div> 
                                                        <p class=""font_size14bi color_000"" style=""text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"">{2}</p>
                                                        <div class=""total2 color_fff"">{3} p</span></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>", goodsList[i].IMG_URL, goodsList[i].BRAND_NAME, goodsList[i].GOODS_NAME, int.Parse(goodsList[i].PRICE).ToString("N0"), Request["store"], goodsList[i].GOODS_ID);
                }
            }
            this.goodsList.InnerHtml += sb.ToString();
        }
    }

    public class BrandInfo
    {
        public string BRAND_NAME { get; set; }
        public string IMG_URL { get; set; }
        public string STATUS { get; set; }
    }
    
    public class GoodsInfo
    {
        public string GOODS_ID { get; set; }
        public string GOODS_NAME { get; set; }
        public string BRAND_NAME { get; set; }
        public string PRICE { get; set; }
        public string IMG_URL { get; set; }
        public string STATUS { get; set; }
        public string MSG_TYPE { get; set; }
    }
}
 
 
 
 
 