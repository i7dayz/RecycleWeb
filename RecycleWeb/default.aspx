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
                    <span class="logo">
                    </span>
                        <img src="img/reborn.jpg" />
                </div>
            </div>
        </div>
        <div class="btn-area-index">
            <!--<a id="kakao-login-btn" style="width:100%"></a>
            <a href="http://alpha-developers.kakao.com/logout"></a>-->
            <a href="javascript:;" id="btnKakaoLogin" class="ui-btn ui-corner-all">카카오계정으로 로그인</a>
            <!-- 임시버튼 -->
            <a href="javascript:;" id="btnNext" class="ui-btn ui-corner-all">약관동의화면 이동</a>
        </div>
    </div>

    <script type="text/javascript" src="script/extention/jquery.js"></script>
    <script type="text/javascript" src="script/common.js"></script>
        
    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                },
                initEvent: function () {        
                    $('#btnNext').click(function() {
                        location.href = "Member/TermsAgree.aspx";
                    });

                    $(document).on('click', '#btnKakaoLogin', function () {
                        location.href = "https://kauth.kakao.com/oauth/authorize?client_id=7ac9ab630f44e0b7910f477934bb9f9a&redirect_uri=http://localhost:52491/Member/KakaoLogin.aspx&response_type=code";
                    });
                },
                fn: {
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
