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
         */
        string[] cvBrandNos = { "92" };

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
                if (!string.IsNullOrEmpty(Request["store"].ToString()))
                {
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

                    if (!string.IsNullOrEmpty(Request["brandId"].ToString()))
                    {
                        getGoodsList(Request["brandId"].ToString());
                    }
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
                sb.AppendFormat(@"  <a href=""/Store/Goods.aspx?store={3}&brandId={4}"">
                                        <div class=""{2}"">
                                            <p><img src=""{0}"" class=""img65""></p>
                                            <p class=""su_name"">{1}</p>
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
                    this.moreBrandList.Style["display"] = "none";
                }
            }
        }

        private void getGoodsList(string brandId)
        {
            string url = "https://wapi.gift-n.net:443/getGoodsInfoList";
            string msg = string.Empty;

            WebApiUtil.HttpGet(url + "?cid=" + WebConfigurationManager.AppSettings["cid"] + "&brand_id=" + brandId + "&enc=" + WebApiUtil.MD5Hash(WebConfigurationManager.AppSettings["giftn_auth_key"] + WebConfigurationManager.AppSettings["cid"] + brandId), out msg);

            //List<GoodsInfo> goodsList = JsonConvert.DeserializeObject<List<GoodsInfo>>("[{\"GOODS_ID\":\"0000006826\",\"GOODS_NAME\":\"[이디야커피] 카페모카HOT(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"5000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006826_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006827\",\"GOODS_NAME\":\"[이디야커피] 바닐라라떼HOT(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"5000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006827_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006828\",\"GOODS_NAME\":\"[이디야커피] 밀크티ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006828_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006829\",\"GOODS_NAME\":\"[이디야커피] 밀크티HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006829_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006830\",\"GOODS_NAME\":\"[이디야커피] 페퍼민트티ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006830_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006831\",\"GOODS_NAME\":\"[이디야커피] 페퍼민트티HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006831_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006832\",\"GOODS_NAME\":\"[이디야커피] 캐모마일레드티ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006832_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006833\",\"GOODS_NAME\":\"[이디야커피] 캐모마일레드티HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006833_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006834\",\"GOODS_NAME\":\"[이디야커피] 로즈쟈스민티ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006834_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006835\",\"GOODS_NAME\":\"[이디야커피] 로즈쟈스민티HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006835_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006836\",\"GOODS_NAME\":\"[이디야커피] 얼그레이홍차ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006836_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006837\",\"GOODS_NAME\":\"[이디야커피] 얼그레이홍차HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006837_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006838\",\"GOODS_NAME\":\"[이디야커피] 어린잎녹차ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006838_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006839\",\"GOODS_NAME\":\"[이디야커피] 어린잎녹차HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006839_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006844\",\"GOODS_NAME\":\"[이디야커피] 카페모카ICE(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"5000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006844_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006845\",\"GOODS_NAME\":\"[이디야커피] 바닐라라떼ICE(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"5000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006845_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006846\",\"GOODS_NAME\":\"[이디야커피] 청포도모히토\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006846_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006847\",\"GOODS_NAME\":\"[이디야커피] 라임모히토\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006847_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006848\",\"GOODS_NAME\":\"[이디야커피] 딸기쉐이크\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006848_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006850\",\"GOODS_NAME\":\"[이디야커피] 초코쿠키쉐이크\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006850_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006854\",\"GOODS_NAME\":\"[이디야커피] 비니스트마일드50T\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"10400\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006854_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006855\",\"GOODS_NAME\":\"[이디야커피] 비니스트오리지널50T\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"10400\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006855_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006856\",\"GOODS_NAME\":\"[이디야커피] 생일축하해세트\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"10200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006856_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006862\",\"GOODS_NAME\":\"[이디야커피] 비니스트마일드15T\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3300\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006862_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006863\",\"GOODS_NAME\":\"[이디야커피] 비니스트마일드6T\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"1400\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006863_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006864\",\"GOODS_NAME\":\"[이디야커피] 비니스트오리지널15T\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3300\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006864_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006865\",\"GOODS_NAME\":\"[이디야커피] 비니스트오리지널6T\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"1400\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006865_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006866\",\"GOODS_NAME\":\"[이디야커피] 카라멜플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006866_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006867\",\"GOODS_NAME\":\"[이디야커피] 민트초콜릿칩플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006867_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006868\",\"GOODS_NAME\":\"[이디야커피] 딸기요거트플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006868_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006869\",\"GOODS_NAME\":\"[이디야커피] 블루베리요거트플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006869_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006870\",\"GOODS_NAME\":\"[이디야커피] 플레인요거트플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006870_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006871\",\"GOODS_NAME\":\"[이디야커피] 녹차플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006871_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006872\",\"GOODS_NAME\":\"[이디야커피] 자몽플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006872_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006873\",\"GOODS_NAME\":\"[이디야커피] 망고플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006873_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006874\",\"GOODS_NAME\":\"[이디야커피] 초콜렛칩플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006874_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006876\",\"GOODS_NAME\":\"[이디야커피] 레몬에이드ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006876_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006877\",\"GOODS_NAME\":\"[이디야커피] 자몽에이드ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006877_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006878\",\"GOODS_NAME\":\"[이디야커피] 토피넛라떼ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006878_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006879\",\"GOODS_NAME\":\"[이디야커피] 토피넛라떼HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006879_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006880\",\"GOODS_NAME\":\"[이디야커피] 민트초콜릿ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006880_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006881\",\"GOODS_NAME\":\"[이디야커피] 민트초콜릿HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006881_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006882\",\"GOODS_NAME\":\"[이디야커피] 녹차라떼ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006882_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006883\",\"GOODS_NAME\":\"[이디야커피] 녹차라떼HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006883_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006884\",\"GOODS_NAME\":\"[이디야커피] 초콜릿ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006884_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006885\",\"GOODS_NAME\":\"[이디야커피] 초콜릿HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006885_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006886\",\"GOODS_NAME\":\"[이디야커피] 카푸치노HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006886_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006889\",\"GOODS_NAME\":\"[이디야커피] 카라멜마키아또ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006889_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006890\",\"GOODS_NAME\":\"[이디야커피] 카라멜마키아또HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006890_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006891\",\"GOODS_NAME\":\"[이디야커피] 카페모카ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006891_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006892\",\"GOODS_NAME\":\"[이디야커피] 카페모카HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006892_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006893\",\"GOODS_NAME\":\"[이디야커피] 카페라떼ICE(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4700\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006893_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006894\",\"GOODS_NAME\":\"[이디야커피] 카페라떼HOT(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4700\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006894_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006895\",\"GOODS_NAME\":\"[이디야커피] 카페라떼ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006895_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006896\",\"GOODS_NAME\":\"[이디야커피] 카페라떼HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006896_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006897\",\"GOODS_NAME\":\"[이디야커피] 카페아메리카노ICE(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006897_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006898\",\"GOODS_NAME\":\"[이디야커피] 카페아메리카노HOT(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006898_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006899\",\"GOODS_NAME\":\"[이디야커피] 카페아메리카노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006899_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006900\",\"GOODS_NAME\":\"[이디야커피] 카페아메리카노HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006900_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"}]");
            //this.hdMsg.Value = "[{\"GOODS_ID\":\"0000006826\",\"GOODS_NAME\":\"[이디야커피] 카페모카HOT(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"5000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006826_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006827\",\"GOODS_NAME\":\"[이디야커피] 바닐라라떼HOT(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"5000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006827_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006828\",\"GOODS_NAME\":\"[이디야커피] 밀크티ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006828_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006829\",\"GOODS_NAME\":\"[이디야커피] 밀크티HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006829_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006830\",\"GOODS_NAME\":\"[이디야커피] 페퍼민트티ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006830_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006831\",\"GOODS_NAME\":\"[이디야커피] 페퍼민트티HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006831_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006832\",\"GOODS_NAME\":\"[이디야커피] 캐모마일레드티ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006832_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006833\",\"GOODS_NAME\":\"[이디야커피] 캐모마일레드티HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006833_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006834\",\"GOODS_NAME\":\"[이디야커피] 로즈쟈스민티ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006834_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006835\",\"GOODS_NAME\":\"[이디야커피] 로즈쟈스민티HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006835_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006836\",\"GOODS_NAME\":\"[이디야커피] 얼그레이홍차ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006836_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006837\",\"GOODS_NAME\":\"[이디야커피] 얼그레이홍차HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006837_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006838\",\"GOODS_NAME\":\"[이디야커피] 어린잎녹차ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006838_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006839\",\"GOODS_NAME\":\"[이디야커피] 어린잎녹차HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006839_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006844\",\"GOODS_NAME\":\"[이디야커피] 카페모카ICE(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"5000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006844_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006845\",\"GOODS_NAME\":\"[이디야커피] 바닐라라떼ICE(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"5000\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006845_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006846\",\"GOODS_NAME\":\"[이디야커피] 청포도모히토\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006846_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006847\",\"GOODS_NAME\":\"[이디야커피] 라임모히토\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006847_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006848\",\"GOODS_NAME\":\"[이디야커피] 딸기쉐이크\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006848_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006850\",\"GOODS_NAME\":\"[이디야커피] 초코쿠키쉐이크\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006850_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006854\",\"GOODS_NAME\":\"[이디야커피] 비니스트마일드50T\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"10400\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006854_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006855\",\"GOODS_NAME\":\"[이디야커피] 비니스트오리지널50T\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"10400\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006855_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006856\",\"GOODS_NAME\":\"[이디야커피] 생일축하해세트\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"10200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006856_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006862\",\"GOODS_NAME\":\"[이디야커피] 비니스트마일드15T\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3300\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006862_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006863\",\"GOODS_NAME\":\"[이디야커피] 비니스트마일드6T\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"1400\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006863_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006864\",\"GOODS_NAME\":\"[이디야커피] 비니스트오리지널15T\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3300\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006864_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006865\",\"GOODS_NAME\":\"[이디야커피] 비니스트오리지널6T\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"1400\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006865_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006866\",\"GOODS_NAME\":\"[이디야커피] 카라멜플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006866_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006867\",\"GOODS_NAME\":\"[이디야커피] 민트초콜릿칩플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006867_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006868\",\"GOODS_NAME\":\"[이디야커피] 딸기요거트플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006868_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006869\",\"GOODS_NAME\":\"[이디야커피] 블루베리요거트플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006869_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006870\",\"GOODS_NAME\":\"[이디야커피] 플레인요거트플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006870_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006871\",\"GOODS_NAME\":\"[이디야커피] 녹차플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006871_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006872\",\"GOODS_NAME\":\"[이디야커피] 자몽플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006872_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006873\",\"GOODS_NAME\":\"[이디야커피] 망고플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006873_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006874\",\"GOODS_NAME\":\"[이디야커피] 초콜렛칩플랫치노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006874_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006876\",\"GOODS_NAME\":\"[이디야커피] 레몬에이드ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006876_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006877\",\"GOODS_NAME\":\"[이디야커피] 자몽에이드ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006877_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006878\",\"GOODS_NAME\":\"[이디야커피] 토피넛라떼ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006878_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006879\",\"GOODS_NAME\":\"[이디야커피] 토피넛라떼HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006879_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006880\",\"GOODS_NAME\":\"[이디야커피] 민트초콜릿ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006880_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006881\",\"GOODS_NAME\":\"[이디야커피] 민트초콜릿HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006881_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006882\",\"GOODS_NAME\":\"[이디야커피] 녹차라떼ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006882_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006883\",\"GOODS_NAME\":\"[이디야커피] 녹차라떼HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006883_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006884\",\"GOODS_NAME\":\"[이디야커피] 초콜릿ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006884_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006885\",\"GOODS_NAME\":\"[이디야커피] 초콜릿HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006885_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006886\",\"GOODS_NAME\":\"[이디야커피] 카푸치노HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006886_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006889\",\"GOODS_NAME\":\"[이디야커피] 카라멜마키아또ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006889_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006890\",\"GOODS_NAME\":\"[이디야커피] 카라멜마키아또HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006890_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006891\",\"GOODS_NAME\":\"[이디야커피] 카페모카ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006891_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006892\",\"GOODS_NAME\":\"[이디야커피] 카페모카HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3500\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006892_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006893\",\"GOODS_NAME\":\"[이디야커피] 카페라떼ICE(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4700\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006893_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006894\",\"GOODS_NAME\":\"[이디야커피] 카페라떼HOT(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"4700\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006894_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006895\",\"GOODS_NAME\":\"[이디야커피] 카페라떼ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006895_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006896\",\"GOODS_NAME\":\"[이디야커피] 카페라떼HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3200\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006896_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006897\",\"GOODS_NAME\":\"[이디야커피] 카페아메리카노ICE(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006897_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006898\",\"GOODS_NAME\":\"[이디야커피] 카페아메리카노HOT(Extra)\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"3800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006898_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006899\",\"GOODS_NAME\":\"[이디야커피] 카페아메리카노ICE\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006899_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"},{\"GOODS_ID\":\"0000006900\",\"GOODS_NAME\":\"[이디야커피] 카페아메리카노HOT\",\"BRAND_NAME\":\"이디야\",\"PRICE\":\"2800\",\"IMG_URL\":\"http://image.gift-n.net/goods/0000006900_1.jpg\",\"STATUS\":\"Y\",\"MSG_TYPE\":\"2\"}]";

            //this.hdMsg.Value = goodsList.ToString();
            msg = msg.TrimStart('\"');
            msg = msg.TrimEnd('\"');
            msg = msg.Replace("\\", "");
            List<GoodsInfo> goodsList = JsonConvert.DeserializeObject<List<GoodsInfo>>(msg);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < goodsList.Count; i++)
            {
                sb.AppendFormat(@"  <a href=""GoodsDetails.aspx?store={4}&goods_id={5}"">
                                        <div class=""reser"">
                                            <div class=""reser_icon reser_icon2"">
                                                <img src=""{0}""/>
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
 
 
 
 
 