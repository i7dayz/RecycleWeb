<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SimpleUsageGuide.aspx.cs" Inherits="RecycleWeb.Support.SimpleUsageGuide" %>

<!-- #include file="/include/header_b.html" --> 
    <link href="../script/extention/swiper-3.4.2/swiper.min.css" rel="stylesheet" type="text/css">

    <style>
        .swiper-slide {  }
        .swiper-slide img { width: 80%; height: auto; margin: 1% 10%; border:1px solid #eeeeee; }
    </style>
    <header>
        <div class="su_header">
            <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>이용안내
        </div>
    </header>
    <div class="container" style="">                     
        <!-- Swiper -->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="../img/usage_guide_1.png" /></div>
                <div class="swiper-slide"><img src="../img/usage_guide_2.png" /></div>
                <div class="swiper-slide"><img src="../img/usage_guide_3.png" /></div>
                <div class="swiper-slide"><img src="../img/usage_guide_4.png" /></div>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
            <!-- Add Arrows -->
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </div>

    <iframe src="../temp.html"  style="visibility:hidden;display:none" scrolling="no"></iframe>

    <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script type="text/javascript" src="../script/extention/swiper-3.4.2/swiper.jquery.min.js"></script>
  <script src="../script/drawer.min.js" charset="utf-8"></script>
        
    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    var swiper = new Swiper('.swiper-container', {
                        pagination: '.swiper-pagination',
                        paginationClickable: true,
                        nextButton: '.swiper-button-next',
                        prevButton: '.swiper-button-prev',
                        spaceBetween: 30
                    });
                },
                initEvent: function () {
                    $(document).on('click', '.back-btn', function () {
                        window.history.back();
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

