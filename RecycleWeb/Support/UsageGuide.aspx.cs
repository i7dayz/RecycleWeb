using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Support
{
    public partial class UsageGuide : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}