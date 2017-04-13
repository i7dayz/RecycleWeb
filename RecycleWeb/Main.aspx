<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="RecycleWeb.Main" %>

<!-- #include file="./include/header.html" --> 

    <!-- #home tab -->              
    <div class="container" style="">
	    <div class="member_po">
    	    <p class="rtext">만료예정일 : 2018-12-31</p>
            <p class="rtext">만료예정 포인트 : 8,500</p>
            <p class="ctext"><img src="./img/baechul/character.png" class="img90" /></p>
            <p class="ctext color_b7b7b7 font_size12">happusoylee</p>
            <p class="ctext font_size34b ">20,000 <img src="./img/d-pnt-56.png" class="img20" /></p>
        </div>
        <div class="slide">
        <!-- #include file="./include/main_full_slide.html" -->
        </div>
        <div class="reser">
    	    <div class="reser_icon">
        	    <img src="./img/pro_icon.jpg" />
            </div>
            <div class="reser_con">
        	    <div><img src="./img/baechul/i-cld.png" class="img27f" /><span class="font_size14bi"> 예약현황</span></div>
                <div class="font_size12 color_b7b7b7"> 
            	    <p>고철 1, 헌옷3, 비철5, 병 2 외 2건</p>
            	    <p>담당자 : 손혁기 기사님</p>
                    <p>연락처 : 010-2442-7363</p>
                    <p>희망수거일시 : 2017-02-28 10:00AM</p>
                </div>
                <a href="#" ><span class="btn_grean">수거신청</span></a>
            </div>
        </div>
        <div class="harf_con">
    	    <div class="harf_l">
        	    <span class="cic_icon">12</span>
                <p><a href="#"><img src="./img/baechul/i-ntc.png" class="img27" /></a></p>
                <p><a href="#">공지사항 / 이벤트</a></p>
            </div>
            <div class="harf_r">
        	    <span class="cic_icon2"><img src="./img/baechul/ird-icn.png" class="img40" /></span>
                <p><a href="#"><img src="./img/baechul/i-inf.png" class="img30" /></a></p>
                <p><a href="#">이용안내</a></p>
            </div>
        </div>
    </div>

    <!-- #include file="./include/footer.html" -->

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
                    $("#tabHome").find("img").attr("src", "/img/top_menu/top01o.png");
                },
                initEvent: function () {
                    $(document).on('click', '#tabRequest', function () {
                        location.href = "CollectRequest.aspx";
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