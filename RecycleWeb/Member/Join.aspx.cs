﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Member
{
    public partial class Join : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null)
            {
                string kakaoId = Request.Form["kakaoId"];
                string kakaoNickname = Request.Form["kakaoNickname"];
                string kakaoEmail = Request.Form["kakaoEmail"];
                string kakaoThumbnailImage = Request.Form["kakaoThumbnailImage"];
                string kakaoProfileImage = Request.Form["kakaoProfileImage"];
                string accessToken = Request.Form["accessToken"];
                string refreshToken = Request.Form["refreshToken"];

                this.kakaoId.Value = kakaoId;
                this.kakaoNickname.Value = kakaoNickname;
                this.kakaoEmail.Value = kakaoEmail;
                this.kakaoThumbnailImage.Value = kakaoThumbnailImage;
                this.kakaoProfileImage.Value = kakaoProfileImage;
                this.accessToken.Value = accessToken;
                this.refreshToken.Value = refreshToken;

                if (!string.IsNullOrEmpty(kakaoProfileImage))
                {
                    this.profileImg.Src = kakaoProfileImage;
                }
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
}
    }
}