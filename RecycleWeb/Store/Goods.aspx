<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Goods.aspx.cs" Inherits="RecycleWeb.Store.Goods" %>

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
    <link href="../css/nativedroid2.css" rel="stylesheet" />
    
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
                        <span style="font-weight: normal;">
                            카페, 베이커리
                        </span>
                    </div>
                </div>
            </div>
            <!-- //#header -->
            <!-- #container -->
            <div class="container" id="container">
                <!-- #main -->
                <div role="main" class="wow fadeIn" data-inset="false" data-wow-delay="0.2s">
                    <div class="content fixed" id="content">   
                        <div class="main">
                            <ul class="brand-list">
                                <li style="width:24.7%; height:100px; float:left; text-align: center;">
                                    <div style="height:50px; padding-top:20px">
                                        <img src="../temp/hollys.jpg" style="width: 50%">
                                    </div>
                                    <p>할리스</p>
                                </li>
                                <li style="width:24.7%; height:100px; float:left; text-align: center;">
                                    <div style="height:50px; padding-top:20px">
                                        <img src="../temp/hollys.jpg" style="width: 50%">
                                    </div>
                                    <p>스무디킹</p>
                                </li>
                                <li style="width:24.7%; height:100px; float:left; text-align: center;">
                                    <div style="height:50px; padding-top:20px">
                                        <img src="../temp/hollys.jpg" style="width: 50%">
                                    </div>
                                    <p>뚜레쥬르</p>
                                </li>
                                <li style="width:24.7%; height:100px; float:left; text-align: center;">
                                    <div style="height:50px; padding-top:20px">
                                        <img src="../temp/hollys.jpg" style="width: 50%">
                                    </div>
                                    <p>투썸플레이스</p>
                                </li>
                                <li style="width:24.7%; height:100px; float:left; text-align: center;">
                                    <div style="height:50px; padding-top:20px">
                                        <img src="../temp/hollys.jpg" style="width: 50%">
                                    </div>
                                    <p>할리스</p>
                                </li>
                                <li style="width:24.7%; height:100px; float:left; text-align: center;">
                                    <div style="height:50px; padding-top:20px">
                                        <img src="../temp/hollys.jpg" style="width: 50%">
                                    </div>
                                    <p>스무디킹</p>
                                </li>
                                <li style="width:24.7%; height:100px; float:left; text-align: center;">
                                    <div style="height:50px; padding-top:20px">
                                        <img src="../temp/hollys.jpg" style="width: 50%">
                                    </div>
                                    <p>뚜레쥬르</p>
                                </li>
                                <li style="width:24.7%; height:100px; float:left; text-align: center;">
                                    <div style="height:50px; padding-top:20px">
                                        <img src="../temp/hollys.jpg" style="width: 50%">
                                    </div>
                                    <p>투썸플레이스</p>
                                </li>
                            </ul>
                            <div class="show-all-brand">
                                <div style="text-align:center;">
                                    <p> 
                                        <img src="../img/open.png" style="width:16px; margin-top:4px;"> 전체보기
                                    </p>
                                </div>
                            </div>
                            <div class="selected-brand">
                                할리스
                            </div>
                            <div class="goods-list">
                                <ul data-role="listview" data-icon="false">
                                    <li>
                                        <a href="javascript:;" name="goods" id="g1000">
                                            <img src="../temp/img_mobile.png" class="ui-thumbnail" />
                                            <h6>문화상품권</h6>
                                            <h2>모바일 문화상품권 10,000원권</h2>
                                            <span class="btn-point">10,000ⓟ</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;" name="goods" id="g1001">
                                            <img src="../temp/img_mobile.png" class="ui-thumbnail"/>
                                            <h6>문화상품권</h6>
                                            <h2>모바일 문화상품권 5,000원권</h2>
                                            <span class="btn-point">5,000ⓟ</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;" name="goods" id="g1002">
                                            <img src="../temp/777.jpg" class="ui-thumbnail"/>
                                            <h6>문화상품권</h6>
                                            <h2>온라인 문화상품권 10,000원권</h2>
                                            <span class="btn-point">10,000ⓟ</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;" name="goods" id="g1003">
                                            <img src="../temp/777.jpg" class="ui-thumbnail"/>
                                            <h6>문화상품권</h6>
                                            <h2>온라인 문화상품권 5,000원권</h2>
                                            <span class="btn-point">5,000ⓟ</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div> <!-- //main -->
            </div> <!-- //container -->
        </div>
    </div> <!-- //wrap -->

    <script type="text/javascript" src="../script/extention/jquery.js"></script>
    <script type="text/javascript" src="../script/extention/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
        
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
                    $(document).on("click", "a[name='goods']", function () {
                        location.href = "GoodsDetails.aspx?goods_id=" + $(this).attr("id");
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