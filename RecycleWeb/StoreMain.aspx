<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreMain.aspx.cs" Inherits="RecycleWeb.StoreMain" %>

<!-- #include file="./include/header.html" --> 
    <link href="script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />
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
        <input type="hidden" runat="server" id="hdProducerIdx" />    
        <input type="hidden" runat="server" id="hdProducerName" /> 

	    <div class="description">
    	    <img src="./img/page_description/5_1top.gif" width="100%" />
        </div>
        <div class="three_con">
            <a href="javascript:;">
    	        <div class="three_01" name="store" id="giftcard">
                    <p><img src="./img/sugeo/su_icon2/sto_01.png" class="img65"></p>
                    <p class="su_name" style="padding-top:10px">상품권</p>
                </div>
            </a>
            <a href="javascript:;">
                <div class="three_02" name="store" id="cv">
                    <p><img src="./img/sugeo/su_icon2/sto_02.png" class="img65"></p>
                    <p class="su_name" style="padding-top:10px">편의점</p>
                </div>
            </a>
            <a href="javascript:;">
                <div class="three_03" name="store" id="cafe">
                    <p><img src="./img/sugeo/su_icon2/sto_03.png" class="img65"></p>
                    <p class="su_name" style="padding-top:10px">카페</p>
                </div>
            </a>
            <div class="line_d"></div>
        </div>
        <div class="three_con">
            <a href="javascript:;">
    	        <div class="three_01" name="store" id="bakery">
                    <p><img src="./img/sugeo/su_icon2/sto_04.png" class="img65"></p>
                    <p class="su_name" style="padding-top:10px">베이커리</p>
                </div>
            </a>
            <a href="javascript:;">
                <div class="three_02" name="store" id="restaurant">
                    <p><img src="./img/sugeo/su_icon2/sto_05.png" class="img65"></p>
                    <p class="su_name" style="padding-top:10px">레스토랑</p>
                </div>
            </a>
            <a href="javascript:;">
                <div class="three_03" name="store" id="icecream">
                    <p><img src="./img/sugeo/su_icon2/sto_06.png" class="img65"></p>
                    <p class="su_name" style="padding-top:10px">아이스크림/간식</p>
                </div>
            </a>
            <div class="line_d"></div>
        </div>
        <div class="three_con">
            <a href="javascript:;">
    	        <div class="three_01" name="store" id="movie">
                    <p><img src="./img/sugeo/su_icon2/sto_07.png" class="img65"></p>
                    <p class="su_name" style="padding-top:10px">영화/도서</p>
                </div>
            </a>
            <a href="javascript:;">
                <div class="three_02" name="store" id="beauty">
                    <p><img src="./img/sugeo/su_icon2/sto_08.png" class="img65"></p>
                    <p class="su_name" style="padding-top:10px">뷰티/악세사리</p>
                </div>
            </a>

            <div class="line_d"></div>
        </div>
        <div class="su_submit pdt30"><div class="btn_grean" style="cursor:pointer" id="btnCoupon">쿠폰함 바로가기</div></div>
    </div> <!-- //스토어 tab -->

    <iframe src="/temp.html"  style="visibility:hidden;display:none" scrolling="no"></iframe>

    <script type="text/javascript" src="script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="script/common.js"></script>
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
                    $(document).on('click', '#btnMyCoupon', function () {
                        if (page.fn.checkSignedIn()) {
                            if (page.fn.checkAddInfo()) {
                                location.href = "/Member/MyCoupon.aspx";
                            }
                        }
                    });
                    $(document).on('click', '#btnMemberInfoModify', function () {
                        if (page.fn.checkSignedIn()) {
                            location.href = "/Member/Info.aspx";
                        }
                    });

                    $(document).on('click', '#btnPointHistory', function () {
                        if (page.fn.checkSignedIn()) {
                            if (page.fn.checkAddInfo()) {
                                location.href = "/Member/PointHistory.aspx";
                            }
                        }
                    });

                    $(document).on('click', '#btnDonationHistory', function () {
                        if (page.fn.checkSignedIn()) {
                            if (page.fn.checkAddInfo()) {
                                location.href = "/Donation/DonationHistory.aspx";
                            }
                        }
                    });
                    $(document).on('click', 'div[name=store]', function () {
                        location.href = "/Store/Goods.aspx?store=" + $(this).attr("id") + "&brandId=";
                    });
                    $(document).on('click', '#btnCoupon', function () {
                        if (page.fn.checkSignedIn()) {
                            if (page.fn.checkAddInfo()) {
                                location.href = "/Member/MyCoupon.aspx";
                            }
                        }
                    });
                },
                fn: {
                    checkAddInfo: function () {
                        var isAddInfo = $("#hdProducerName").val() == "" ? false : true;
                        if (!isAddInfo) {
                            confirmBox("추가 정보 입력이 필요한 메뉴입니다.<br/>입력페이지로 이동하시겠습니까?", page.fn.goUrl, { url: "/AddMemberInfo" });
                            return isAddInfo;
                        }

                        return isAddInfo;
                    },
                    checkSignedIn: function () {
                        var isSignedIn = $("#hdProducerIdx").val() === "0" ? false : true;
                        if (!isSignedIn) {
                            confirmBox("회원가입이 필요한 메뉴입니다.<br/>회원가입 페이지로 이동하시겠습니까?", page.fn.goUrl, { url: "/NonMemberLogin" });
                            return isSignedIn;
                        }

                        return isSignedIn;
                    },
                    goUrl: function (urlData) {
                        location.href = urlData.url;
                    },
                }
            };

            $(document).on('ready', function () {
                page.init();
                $('.drawer').drawer({
                    iscroll: {
                        mouseWheel: true,
                        preventDefault: false
                    },
                    showOverlay: true
                });
            });
        })();
    </script>
</body>
</html>