using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Member
{
    public partial class EditInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                if (!string.IsNullOrEmpty(Session["kakaoProfileImage"].ToString()))
                {
                    this.profileImg.Src = Session["kakaoProfileImage"].ToString();
                }

                this.producerIdx.Value = Session["producerIdx"].ToString();
                this.name.Value = Session["name"].ToString();
                this.nickname.Value = Session["nickname"].ToString();
                string[] contactNumber = Session["producerContactNumber"].ToString().Split('-');
                this.txtContactNumber1.Value = contactNumber[0];
                this.txtContactNumber2.Value = contactNumber[1];
                this.txtContactNumber3.Value = contactNumber[2];
                this.txtBaseAddress.Value = string.Format("{0} {1}", Session["address1"], Session["address2"]);
                this.txtDetailAddress.Value = Session["detailAddress"].ToString();
                this.txtZipNo.Value = Session["zipCode"].ToString();
                this.contactNumber.Value = Session["producerContactNumber"].ToString();
                this.address1.Value = Session["address1"].ToString();
                this.address2.Value = Session["address2"].ToString();
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}