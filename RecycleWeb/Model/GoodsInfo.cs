using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecycleWeb.Model
{
    public class GoodsInfoDetail
    {
        public string GOODS_ID { get; set; }
        public string GOODS_NAME { get; set; }
        public string BRAND_ID { get; set; }
        public string BRAND_NAME { get; set; }
        public string PRICE { get; set; }
        public string SPRICE { get; set; }
        public string IMG_URL { get; set; }
        public string EXDATE { get; set; }
        public string GOODS_MEMO { get; set; }
        public string BRAND_MEMO { get; set; }
        public string STATUS { get; set; }
    }
}