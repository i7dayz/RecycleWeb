using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Collection
{
    public partial class RequestDone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                this.hdProducerIdx.Value = Session["producerIdx"].ToString();

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
    }
}