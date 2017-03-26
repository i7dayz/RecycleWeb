using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Member
{
    public partial class Info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                if (!string.IsNullOrEmpty(Session["kakaoProfileImage"].ToString()))
                {
                    this.profileImg.Src = Session["kakaoProfileImage"].ToString();
                }

                this.name.InnerHtml = "이름";
                this.nickname.InnerHtml = Session["nickname"].ToString();
                this.txtContactNumber.Value = Session["producerContactNumber"].ToString();
                this.txtBaseAddress.Value = string.Format("{0} {1}", Session["address1"], Session["address2"]);
                this.txtDetailAddress.Value = Session["detailAddress"].ToString();
                this.txtZipNo.Value = Session["zipCode"].ToString();
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}