<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreMain.aspx.cs" Inherits="RecycleWeb.StoreMain" %>

<!-- #include file="./include/header.html" --> 
<style>
.btn_grean a {
    color: #fff;
}
.three_01, .three_02 {
    width: 33%;
    float: left;
    text-align: center;
    border-right: 1px solid #e4e4e4;
    padding: 12px 0;
}
.three_03 {
    width: 32%;
    float: left;
    text-align: center;
    padding: 12px 0;
}
</style>
    <!-- 스토어 탭--> 
    <div class="container" style="">        
	    <div class="description">
    	    <img src="./img/page_description/5_1top.gif" width="100%" />
        </div>
        <div class="three_con">
    	    <div class="three_01">
                <p><a href="#"><img src="./img/sugeo/su_icon2/sto_01.png" class="img65"></a></p>
                <p class="su_name">상품권</p>
            </div>
            <div class="three_02">
                <p><a href="#"><img src="./img/sugeo/su_icon2/sto_02.png" class="img65"></a></p>
                <p class="su_name">편의점</p>
            </div>
            <div class="three_03">
                <p><a href="#"><img src="./img/sugeo/su_icon2/sto_03.png" class="img65"></a></p>
                <p class="su_name">카페</p>
            </div>
            <div class="line_d"></div>
        </div>
        <div class="three_con">
    	    <div class="three_01">
                <p><a href="#"><img src="./img/sugeo/su_icon2/sto_04.png" class="img65"></a></p>
                <p class="su_name">베이커리</p>
            </div>
            <div class="three_02">
                <p><a href="#"><img src="./img/sugeo/su_icon2/sto_05.png" class="img65"></a></p>
                <p class="su_name">레스토랑</p>
            </div>
            <div class="three_03">
                <p><a href="#"><img src="./img/sugeo/su_icon2/sto_06.png" class="img65"></a></p>
                <p class="su_name">아이스크림</p>
            </div>
            <div class="line_d"></div>
        </div>
        <div class="three_con">
    	    <div class="three_01">
                <p><a href="#"><img src="./img/sugeo/su_icon2/sto_07.png" class="img65"></a></p>
                <p class="su_name">영화/도서</p>
            </div>
            <div class="three_02">
                <p><a href="#"><img src="./img/sugeo/su_icon2/sto_08.png" class="img65"></a></p>
                <p class="su_name">뷰티/악세사리</p>
            </div>

            <div class="line_d"></div>
        </div>
        <div class="su_submit pdt30"><div class="btn_grean"><a href="#">쿠폰함 바로가기</a></div></div>
    </div> <!-- //스토어 tab -->

    <script type="text/javascript" src="script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script type="text/javascript" src="script/dropdown.min.js"></script>
    <script type="text/javascript" src="script/drawer.min.js"></script>
    <script type="text/javascript" src="script/store.js"></script>
        
    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    $('.drawer').drawer();
                    $("#tabStore").find("img").attr("src", "/img/top_menu/top03o.png");
                },
                initEvent: function () {
                    $(document).on('click', '#tabHome', function () {
                        location.href = "Main.aspx";
                    });
                    $(document).on('click', '#tabRequest', function () {
                        location.href = "CollectRequest.aspx";
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