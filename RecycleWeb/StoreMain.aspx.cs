﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb
{
    public partial class StoreMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                if (!Session["kakaoId"].ToString().Equals("n"))
                {
                }
                else
                {
                    hdProducerIdx.Value = "0";
                }

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