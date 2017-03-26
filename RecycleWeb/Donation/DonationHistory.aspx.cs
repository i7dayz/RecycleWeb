using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Member
{
    public partial class DonationHistory : System.Web.UI.Page
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
                this.exPoint.InnerText = string.Empty; // 현재 로그인시에 넘어오는 값이 없음

                this.nickname.InnerText = Session["nickname"].ToString();
                this.point.InnerText = Session["producePoint"].ToString();
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}