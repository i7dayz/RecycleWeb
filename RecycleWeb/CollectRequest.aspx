<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CollectRequest.aspx.cs" Inherits="RecycleWeb.CollectRequest" %>

<!-- #include file="./include/header.html" --> 

    <!-- 수거신청 탭 -->        
    <div class="container" style="">
	    <div class="description">
    	    <img src="./img/page_description/4_1top.gif" width="100%" />
        </div>
        <div class="text_title">
            <span class="font_size14b">수거서비스</span>
            <span class="font_size10_bbb">수거가능/불가능 품목 확인</span>
        </div>
        <div class="harf_con2">
    	    <div class="harf_l">
                <p><a href="#"><img src="./img/sugeo/su_icon/pck_01.png" class="img65"></a></p>
                <p class="su_name">헌옷</p>
                <p class="su_pm"><span class="kg_m">-</span><span class="kg">0kg</span><span class="kg_p">+</span></p>
            </div>
            <div class="harf_r">
                <p><a href="#"><img src="./img/sugeo/su_icon/pck_02.png" class="img65"></a></p>
                <p class="su_name">휴대폰</p>
                <p class="su_pm"><span class="kg_m">-</span><span class="kg">0kg</span><span class="kg_p">+</span></p>
            </div>
        </div>
        <div class="line_d"></div>
        <div class="harf_con2">
    	    <div class="harf_l">
                <p><a href="#"><img src="./img/sugeo/su_icon/pck_03.png" class="img65"></a></p>
                <p class="su_name">소형가전</p>
                <p class="su_pm"><span class="kg_m">-</span><span class="kg">0kg</span><span class="kg_p">+</span></p>
            </div>
            <div class="harf_r">
                <p><a href="#"><img src="./img/sugeo/su_icon/pck_04.png" class="img65"></a></p>
                <p class="su_name">대형가전</p>
                <p class="su_pm"><span class="kg_m">-</span><span class="kg">0kg</span><span class="kg_p">+</span></p>
            </div>
        </div>
        <div class="line_d"></div>
        <div class="harf_con2">
    	    <div class="harf_l">
                <p><a href="#"><img src="./img/sugeo/su_icon/pck_05.png" class="img65"></a></p>
                <p class="su_name">폐지</p>
                <p class="su_pm"><span class="kg_m">-</span><span class="kg">0kg</span><span class="kg_p">+</span></p>
            </div>
            <div class="harf_r">
                <p><a href="#"><img src="./img/sugeo/su_icon/pck_06.png" class="img65"></a></p>
                <p class="su_name">병</p>
                <p class="su_pm"><span class="kg_m">-</span><span class="kg">0kg</span><span class="kg_p">+</span></p>
            </div>
        </div>
        <div class="line_d"></div>
        <div class="harf_con2">
    	    <div class="harf_l">
                <p><a href="#"><img src="./img/sugeo/su_icon/pck_07.png" class="img65"></a></p>
                <p class="su_name">고철</p>
                <p class="su_pm"><span class="kg_m">-</span><span class="kg">0kg</span><span class="kg_p">+</span></p>
            </div>
            <div class="harf_r">
                <p><a href="#"><img src="./img/sugeo/su_icon/pck_08.png" class="img65"></a></p>
                <p class="su_name">비철</p>
                <p class="su_pm"><span class="kg_m">-</span><span class="kg">0kg</span><span class="kg_p">+</span></p>
            </div>
        </div>
        <div class="line_d"></div>
        <div class="harf_con2">
    	    <div class="harf_l">
                <p><a href="#"><img src="./img/sugeo/su_icon/pck_09.png" class="img65"></a></p>
                <p class="su_name">이삿짐</p>
                <p class="su_onoff"><img src="./img/baechul/pck-slt.png" height="20px" /></p>
            </div>
            <div class="harf_r">
                <p><a href="#"><img src="./img/sugeo/su_icon/pck_10.png" class="img65"></a></p>
                <p class="su_name">기타</p>
                <p class="su_onoff"><img src="./img/baechul/pck-slt.png" height="20px" /></p>
            </div>
        </div>
        <p class="text_title">
    	    <span class="font_size14b">대형서비스</span>
            <span class="font_size10_bbb">수거가능/불가능 품목 확인</span>
        </p>
        <div class="harf_con2">
    	    <div class="harf_l">
                <p><a href="#"><img src="./img/sugeo/su_icon/pck_big01.png" class="img65"></a></p>
                <p class="su_name">폐기대행</p>
                <p class="su_onoff"><img src="./img/baechul/pck-slt.png"  height="20px" /></p>
            </div>
            <div class="harf_r">
                <p><a href="#"><img src="./img/sugeo/su_icon/pck_big02.png" class="img65"></a></p>
                <p class="su_name">유품정리</p>
                <p class="su_onoff"><img src="./img/baechul/pck-usl.png"  height="20px" /></p>
            </div>
        </div>
        <p class="su_btn">
    	    수거하기
        </p>
    </div> <!-- //수거신청 tab -->
        
    <script type="text/javascript" src="script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script type="text/javascript" src="script/dropdown.min.js"></script>
    <script type="text/javascript" src="script/drawer.min.js"></script>

    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    $('.drawer').drawer();
                    $("#tabRequest").find("img").attr("src", "/img/top_menu/top02o.png");
                },
                initEvent: function () {
                    $(document).on('click', '#tabHome', function () {
                        location.href = "Main.aspx";
                    });
                    $(document).on('click', '#tabStore', function () {
                        location.href = "StoreMain.aspx";
                    });
                    $(document).on('click', '#tabDonate', function () {
                        location.href = "Donate.aspx";
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
</body>
</html>