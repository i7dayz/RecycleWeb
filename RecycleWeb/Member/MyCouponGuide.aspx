<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCouponGuide.aspx.cs" Inherits="RecycleWeb.Member.MyCouponGuide" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>고물상</title>
    <meta name="format-detection" content="telephone=no">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <link href="../css/layout.css" rel="stylesheet" type="text/css" media="all">
    <link href="../css/adjustment.css" rel="stylesheet" type="text/css" media="all">

    <link href="../script/extention/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
</head>
<body class="all" contenteditable="false">
    <div class="wrap" id="wrap">            
        <div data-role="page" class="nd2-no-menu-swipe">
            <!-- #header -->
            <div class="header" id="header">
                <div data-role="header" class="wow fadeIn">
                    <div class="ci use-search-reset" style="width:100%">
                        <a href="#panel">
                            <em class="img-menu ci-logo"><img src="../img/back-btn.png" style="width:8px; height:12px; margin:6px;" alt=""></em>                           
                        </a>
                        <div>
                            쿠폰 사용안내
                        </div>
                    </div>
                </div>
            </div>
            <!-- //#header -->
            <!-- #container -->
            <div class="container" id="container">
                <div class="colgroup">
                    <div class="content fixed" id="content">
                        <div class="coupon-guide">
                            <div class="title">사용안내</div>
                            <div class="content">
                                <h6>[상품설명]</h6>
                                <p>스타벅스의 깔끔한 맛을 자랑하는 커피로, 스타벅스 파트너들이 가장 좋아하는 커피입니다.</p>
                                <h6>[사용불가매장]</h6>
                                <p>용산미8군점, 용산타운하우스, 오산에어베이스, 평택험프리, 대구캠프워커, 군산에어베이스, 캠프캐롤, 캠프케이시, 오션월드입구점, 오션월드점 등</p>
                                <h6>[유의사항]</h6>
                                <p>
                                    - 포인트 적립불가(추가금액을 지불하여 교환한 스타벅스 제품에 대해서는 그 금액만큼 적립가능)<br/>
                                    - 핫/아이스는 모두 요청 가능<br/>
                                    - 행사기간에 할인가격은 적용불가<br/>
                                    - 추가금액 지불하여 사이즈업 및 메뉴변경 가능<br/>
                                </p>
                                <h6>[환불기준]</h6>
                                <p>
                                    - 포인트 적립불가(추가금액을 지불하여 교환한 스타벅스 제품에 대해서는 그 금액만큼 적립가능)<br/>
                                    - 핫/아이스는 모두 요청 가능<br/>
                                    - 행사기간에 할인가격은 적용불가<br/>
                                    - 추가금액 지불하여 사이즈업 및 메뉴변경 가능<br/>
                                </p>
                                <h6>[고객문의]</h6>
                                <p>
                                    - 포인트 적립불가(추가금액을 지불하여 교환한 스타벅스 제품에 대해서는 그 금액만큼 적립가능)<br/>
                                    - 핫/아이스는 모두 요청 가능<br/>
                                    - 행사기간에 할인가격은 적용불가<br/>
                                    - 추가금액 지불하여 사이즈업 및 메뉴변경 가능<br/>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="floating-btn-white">
                        <a href="javascript:;" id="btnBuy" class="ui-btn ui-corner-all btn-green" style="background-color:#91cd33; color:#ffffff; text-shadow:none; border:0;">환불신청</a>
                    </div>
                </div>
            </div> <!-- //container -->
        </div>
    </div> <!-- //wrap -->

    <script type="text/javascript" src="script/extention/jquery.js"></script>
        
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