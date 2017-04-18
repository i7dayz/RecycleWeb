using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecycleWeb.Model
{
    public class Login
    {
        public int producerIdx { get; set; }
        public string producerContactNumber { get; set; }
        public int zipCode { get; set; }
        public string address1 { get; set; }
        public string address2 { get; set; }
        public string detailAddress { get; set; }
        public int producePoint { get; set; }
        public string producePointExpireDate { get; set; }
        public int totalDonationPoint { get; set; }
        public int rank { get; set; }
        public string nickname { get; set; }
        public string expirePoint { get; set; }
        public string name { get; set; }
    }
}