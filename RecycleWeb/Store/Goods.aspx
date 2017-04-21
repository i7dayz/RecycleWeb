<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Goods.aspx.cs" Inherits="RecycleWeb.Store.Goods" %>
<!-- #include file="/include/header_b.html" --> 
<style>
    .lazy {
        display: none;
    }
</style>
<script>
function form_submit() {
}
</script>
    <header>
        <div class="su_header">
            <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span><label runat="server" id="title"></label>
        </div>
    </header>
<div class="container" style="">
    <input type="hidden" runat="server" id="hdMsg" />
    <div class="four_con" runat="server" id="baseBrandList"></div>
    <div class="four_con" runat="server" id="moreBrandList"></div>
    <div id="list_onoff" class="list_view" runat="server">더보기<!--img src="./img/baechul/btn-vie1.png"  /--></div>
    <div class="text_title pad7">
        <span class="font_size14b" runat="server" id="brandName"></span>
    </div>
    <div id="goodsList" runat="server"></div>
    <div class="su_submit pdt30"><div class="btn_grean" style="cursor:pointer" id="btnCoupon">쿠폰함 바로가기</div></div>
</div>
    <script type="text/javascript" src="../script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.lazyload/1.9.1/jquery.lazyload.min.js"></script>
    <script type="text/javascript" src="../script/drawer.min.js"></script>
    <script type="text/javascript" src="../script/store.js"></script>
    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    $('.drawer').drawer();
                    $("img.lazy").show().lazyload({
                        effect: "fadeIn", // 나타날때 Fadein 효과
                        threshold: 200, // 스크롤 200 픽셀 전에 미리 로딩
                        placeholder: "../img/loading_green.gif" // 로딩전 보여줄 이미지 설정
                    });
                },
                initEvent: function () {
                    $(document).on('click', '.back-btn', function () {
                        location.replace("/StoreMain.aspx")
                    });

                    $(document).on('click', '#list_onoff', function () {
                        $('#moreBrandList').toggle();

                        if ($('#moreBrandList').css('display') == "none") {
                            $('#list_onoff').text("더보기");
                        } else {
                            $('#list_onoff').text("접기");
                        }
                    });

                    $(document).on('click', '#btnCoupon', function() {
                        location.href = "/Member/MyCoupon.aspx";
                    });
                },
                fn: {
                }
            };

            $(document).on('ready', function () {
                page.init();
            });
        })();

        function move(store, brandId) {
            var more;
            if ($('#moreBrandList').css('display') == "none") {
                more = "N";
            }
            else {
                more = "Y";
            }

            location.replace("/Store/Goods.aspx?store=" + store + "&brandId=" + brandId + "&more=" + more);
        }
    </script>
</body>
</html>
