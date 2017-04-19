using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecycleWeb.Model
{
    public class RootObjectGoodsBuyHistory
    {
        public string result_msg { get; set; }
        public string server_time { get; set; }
        public string server_ver { get; set; }
        public List<List<object>> goodsBuyHistory { get; set; }
        public int value { get; set; }
    }
}