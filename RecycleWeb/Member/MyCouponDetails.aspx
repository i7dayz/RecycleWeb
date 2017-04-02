﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCouponDetails.aspx.cs" Inherits="RecycleWeb.Member.MyCouponDetails" %>

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
                        <span>
                            쿠폰상세
                        </span>
                    </div>
                </div>
            </div>
            <!-- //#header -->
            <!-- #container -->
            <div class="container" id="container">
                <div class="colgroup">
                    <div class="content fixed" id="content">
                        <div class="coupon-detail">
                            <div class="background">
                                <img src="../temp/star.png">
                                <div class="coupon-use-guide">
                                    <a href="javascript:;" id="btnMyCouponGuide">사용안내</a>
                                </div>
                                
                                <div class="coupon-image">
                                    <img src="../temp/G00000008061_250.jpg">
                                </div>

                                <div class="goods-name">카페 아메리카노 Tall</div>

                                <div class="ui-grid-a brand-name">
                                    <div class="ui-block-a title">사용처</div>
                                    <div class="ui-block-b value">스타벅스</div>
                                </div>

                                <div class="ui-grid-a exdate">
                                    <div class="ui-block-a title">유효기간</div>
                                    <div class="ui-block-b value">2017-03-31</div>
                                </div>

                                <div class="coupon-barcode">
                                    <img src="../temp/EAN-13.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- //container -->
        </div>
    </div> <!-- //wrap -->

    <script type="text/javascript" src="../script/extention/jquery.js"></script>
        
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
                    $(document).on('click', '#btnMyCouponGuide', function () {
                        location.href = "MyCouponGuide.aspx";
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