<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RecycleWeb.Default" %>

<!-- #include file="./include/header_b.html" --> 

<%--<header>
    <div class="su_header">
        <span class="su_leftbtn"><img src="./img/baechul/back-btn.png" width="13" /></span>로그인
    </div>
</header>--%>
<div class="container" style="">
	<p class="txt_cen pad100"><img src="./img/sugeo/0_1.png" width="33%" /></p>   
    <p class="txt_cen"><a href="javascript:;" id="btnKakaoLogin"><img src="./img/sugeo/kakao_login.png" class="kakao_link" /></a></p>
    <div class="harf_con fix_btm">
        <div class="harf_l2">
            <img src="./img/l_hrx.png" width="100%"/>
        </div>
        <div class="harf_r2">
            <img src="./img/l_kas.png" width="100%"/>
        </div>
    </div>
</div>

<script type="text/javascript" src="script/extention/jquery.js"></script>
<script type="text/javascript" src="script/extention/jquery.modal-master/js/jquery.modal.js"></script>
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
            },
            initEvent: function () {
                $(document).on('click', '#btnKakaoLogin', function () {
                    var clientId = '7ac9ab630f44e0b7910f477934bb9f9a';
                    var redirectUri = 'http://' + jQuery(location).attr('host') + '/Member/KakaoLogin.aspx';
                    var url = 'https://kauth.kakao.com/oauth/authorize?client_id=' + clientId + '&redirect_uri=' + redirectUri + '&response_type=code';

                    location.href = url;
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

<!-- #include file="./include/footer_b.html" -->

