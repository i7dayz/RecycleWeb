using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Member
{
    public partial class PointHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                this.hdProducerIdx.Value = Session["producerIdx"].ToString();
                if (!string.IsNullOrEmpty(Session["kakaoProfileImage"].ToString()))
                {
                    this.profileImg.Src = Session["kakaoProfileImage"].ToString();
                }

                DateTime dateValue = DateTime.Parse(Session["producePointExpireDate"].ToString());
                this.exDate.InnerText = dateValue.ToString("yyyy.MM.dd");
                this.exPoint.InnerText = int.Parse(Session["expirePoint"].ToString()).ToString("N0"); // 현재 로그인시에 넘어오는 값이 없음

                this.nickname.InnerText = Session["nickname"].ToString();
                this.point.InnerText = int.Parse(Session["producePoint"].ToString()).ToString("N0");
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}