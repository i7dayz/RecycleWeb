<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RecycleWeb.Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>고물상</title>
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,width=device-width">

    <link href="css/layout.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/adjustment.css" rel="stylesheet" type="text/css" media="all">

    <link href="script/extention/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
    <link href="script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css">

    <style>
        html, body {
            height: 100%;
            overflow: hidden;
        }
        .container, .colgroup {
            height: 90%;
        }
    </style>
</head>
<body class="all" contenteditable="false">
    <div class="wrap" id="wrap" style="background-color:#fff !important">
        <!-- #container -->
        <div class="container" id="container" style="margin:0 !important">
            <div class="colgroup">
                <div class="reborn">
                    <span class="logo"></span>
                    <img src="img/reborn.jpg" />
                </div>
            </div>
        </div>
        <div class="btn-area-index">
            <a id="custom-login-btn" class="ui-btn ui-corner-all" style="background-color:#FEDC00; border:none;">
                <%--<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>--%>       
                <img src="img/kakao-login.png" style="padding-right: 50px; width: 24px; height: auto; vertical-align: middle;"/>
                <span style="padding-right:25px; vertical-align:middle;">카카오 계정으로 로그인</span>         
            </a>
            <%--<a href="javascript:;" id="btnKakaoLogin" class="ui-btn ui-corner-all">카카오계정으로 로그인</a>--%>
            <!-- 임시버튼 -->
            <%--<a href="javascript:;" id="btnNext" class="ui-btn ui-corner-all">약관동의화면 이동</a>--%>
            <div class="logo">
                <img src="img/hrx.png" /><img src="img/kasy.png" />
            </div>
        </div>
    </div>

    <script type="text/javascript" src="script/extention/jquery.js"></script>
    <script type="text/javascript" src="script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <%--<script type="text/javascript" src="script/extention/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>--%>
    <script type="text/javascript" src="script/common.js"></script>
    <script type="text/javascript" src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    
        
    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    //<![CDATA[
                    // 사용할 앱의 JavaScript 키를 설정해 주세요.
                    Kakao.init('5fbf9e293f3ee6416b6b387bdfcaafb3');
                    //]]>
                },
                initEvent: function () {        
                    //$('#btnNext').click(function() {
                    //    location.href = "Member/TermsAgree.aspx";
                    //});

                    $(document).on('click', '#custom-login-btn', function () {
                        page.fn.loginWithKakao();
                        //location.href = "https://kauth.kakao.com/oauth/authorize?client_id=7ac9ab630f44e0b7910f477934bb9f9a&redirect_uri=http://localhost:52491/Member/KakaoLogin.aspx&response_type=code"
                    });

                    //$(document).on('click', '#btnKakaoLogin', function () {
                    //    location.href = "https://kauth.kakao.com/oauth/authorize?client_id=7ac9ab630f44e0b7910f477934bb9f9a&redirect_uri=http://localhost:52491/Member/KakaoLogin.aspx&response_type=code";
                    //});
                },
                fn: {
                    loginWithKakao: function () {
                        // 로그인 창을 띄웁니다.
                        Kakao.Auth.login({
                            success: function (authObj) {
                                //alert(JSON.stringify(authObj));
                                //infoBox(JSON.stringify(authObj));

                                var f = document.createElement("form");
                                f.setAttribute("method", "post");
                                f.setAttribute("action", "/Member/KakaoLoginTest.aspx");
                                document.body.appendChild(f);

                                var accessToken = Kakao.Auth.getAccessToken();
                                var refreshToken = Kakao.Auth.getRefreshToken();

                                var i_accessToken = document.createElement("input");
                                i_accessToken.setAttribute("type", "hidden");
                                i_accessToken.setAttribute("name", "accessToken");
                                i_accessToken.setAttribute("value", accessToken);
                                f.appendChild(i_accessToken);

                                var i_refreshToken = document.createElement("input");
                                i_refreshToken.setAttribute("type", "hidden");
                                i_refreshToken.setAttribute("name", "refreshToken");
                                i_refreshToken.setAttribute("value", refreshToken);
                                f.appendChild(i_refreshToken);

                                f.submit();

                                // 로그인 성공시, API를 호출합니다.
                                //Kakao.API.request({
                                //    url: '/v1/user/me',
                                //    success: function (res) {
                                //        //alert(JSON.stringify(res));
                                //        //infoBox(JSON.stringify(res));
                                //        //return;
                                //        var data = JSON.stringify(res);
                                //        data = JSON.parse(data);
                                //        var id = data.id;
                                //        var nickname = data.properties.nickname;
                                //        var emil = data.kaccount_email;
                                //        var thumbnailImage = data.properties.thumbnail_image;
                                //        var profileImage = data.properties.profile_image;

                                //        var f = document.createElement("form");
                                //        f.setAttribute("method", "post");
                                //        f.setAttribute("action", "/Member/KakaoLogin.aspx");
                                //        document.body.appendChild(f);

                                //        var i_id = document.createElement("input");
                                //        i_id.setAttribute("type", "hidden");
                                //        i_id.setAttribute("name", "kakaoId");
                                //        i_id.setAttribute("value", id);
                                //        f.appendChild(i_id);

                                //        var i_nick = document.createElement("input");
                                //        i_nick.setAttribute("type", "hidden");
                                //        i_nick.setAttribute("name", "kakaoNickname");
                                //        i_nick.setAttribute("value", nickname);
                                //        f.appendChild(i_nick);

                                //        var i_mail = document.createElement("input");
                                //        i_mail.setAttribute("type", "hidden");
                                //        i_mail.setAttribute("name", "kakaoEmail");
                                //        i_mail.setAttribute("value", emil);
                                //        f.appendChild(i_mail);

                                //        var i_thum = document.createElement("input");
                                //        i_thum.setAttribute("type", "hidden");
                                //        i_thum.setAttribute("name", "kakaoThumbnailImage");
                                //        i_thum.setAttribute("value", thumbnailImage);
                                //        f.appendChild(i_thum);

                                //        var i_profile = document.createElement("input");
                                //        i_profile.setAttribute("type", "hidden");
                                //        i_profile.setAttribute("name", "kakaoProfileImage");
                                //        i_profile.setAttribute("value", profileImage);
                                //        f.appendChild(i_profile);

                                //        var accessToken = Kakao.Auth.getAccessToken();
                                //        var refreshToken = Kakao.Auth.getRefreshToken();

                                //        var i_accessToken = document.createElement("input");
                                //        i_accessToken.setAttribute("type", "hidden");
                                //        i_accessToken.setAttribute("name", "accessToken");
                                //        i_accessToken.setAttribute("value", accessToken);
                                //        f.appendChild(i_accessToken);

                                //        var i_refreshToken = document.createElement("input");
                                //        i_refreshToken.setAttribute("type", "hidden");
                                //        i_refreshToken.setAttribute("name", "refreshToken");
                                //        i_refreshToken.setAttribute("value", refreshToken);
                                //        f.appendChild(i_refreshToken);

                                //        //page.fn.getLoginInfo(id, profileImage, nickname);

                                //        f.submit();
                                //    },
                                //    fail: function (error) {
                                //        //alert(JSON.stringify(error));
                                //        errorBox(JSON.stringify(error));
                                //    }
                                //});
                            },
                            fail: function (err) {
                                //alert(JSON.stringify(err));
                                errorBox(JSON.stringify(err));
                                return;
                            }
                        });
                    },
                    //getLoginInfo: function (id, url, nickname) {
                    //    var params = {
                    //        snsType: "1",
                    //        snsId: id,
                    //        snsURL: url,
                    //        snsNickname: nickname,
                    //        carrierId: "31",
                    //        appVersion: "1.0.0",
                    //    };

                    //    Server.ajax("/producer/login", params, function (respone, status, xhr) {
                    //        var f = document.getElementsByTagName("form");

                    //        if (respone.value == 0) {
                    //            var loginInfo = respone.login;
                    //            f.setAttribute("action", "Main.aspx");

                    //            var i_refreshToken = document.createElement("input");
                    //            i_refreshToken.setAttribute("type", "hidden");
                    //            i_refreshToken.setAttribute("name", "refreshToken");
                    //            i_refreshToken.setAttribute("value", refreshToken);
                    //            f.appendChild(i_refreshToken);
                    //        } else {
                    //            f.setAttribute("action", "TermsAgree.aspx");
                    //        }
                    //    }, "post", false);
                    //}
                }
            };

            $(document).on('ready', function () {
                page.init();
            });
        })();
    </script>

    <script type="text/javascript" src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
        
    <script type="text/javascript">
        // //<![CDATA[
        // // 사용할 앱의 JavaScript 키를 설정해 주세요.
        // Kakao.init('5fbf9e293f3ee6416b6b387bdfcaafb3');
        // // 카카오 로그인 버튼을 생성합니다.
        // Kakao.Auth.createLoginButton({
        //     container: '#kakao-login-btn',
        //     success: function(authObj) {
        //     alert(JSON.stringify(authObj));
        //     },
        //     fail: function(err) {
        //         alert(JSON.stringify(err));
        //     }
        // });
        // //]]>
    </script>
</body>
</html>
