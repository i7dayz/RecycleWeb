<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PointHistory.aspx.cs" Inherits="RecycleWeb.Member.PointHistory" %>

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
                            포인트 내역
                        </div>
                    </div>
                </div>
            </div>
            <!-- //#header -->
            <!-- #container -->
            <div class="container" id="container">
                <!-- #main -->
                <div role="main" class="wow fadeIn" data-inset="false" data-wow-delay="0.2s">
                    <div class="colgroup">
                        <div class="content fixed" id="content">   
                            <div class="header" style="padding-top:0">
                                <div class="expire">
                                    <ul>
                                        <li>만료예정일 : 2018-12-31</li>
                                        <li>만료예정 포인트 : 8,500</li>
                                    </ul>
                                </div>
                                <div class="profile">
                                    <div class="image">
                                        <img src="../img/person64x64.png">
                                    </div>
                                    <div class="nickname">
                                        i7dayz
                                    </div>
                                    <div class="point">
                                        20,000 ⓟ
                                    </div>
                                </div>
                            </div>

                            <div class="main point-list">
                                <ul class="point-item">
                                    <li class="date">
                                        2017.04.12
                                    </li>
                                    <li class="point">
                                        +15,000
                                    </li>
                                    <li class="goods">
                                        고철1, 헌옷3, 비철3, 병2
                                    </li>
                                </ul>
                                <ul class="point-item">
                                    <li class="date">
                                        2017.04.02
                                    </li>
                                    <li class="point">
                                        +15,000
                                    </li>
                                    <li class="goods">
                                        고철1, 헌옷3, 비철3, 병2
                                    </li>
                                </ul>
                                <ul class="point-item">
                                    <li class="date">
                                        2017.03.15
                                    </li>
                                    <li class="point">
                                        +15,000
                                    </li>
                                    <li class="goods">
                                        고철1, 헌옷3, 비철3, 병2
                                    </li>
                                </ul>
                                <ul class="point-item">
                                    <li class="date">
                                        2017.2.02
                                    </li>
                                    <li class="point">
                                        +15,000
                                    </li>
                                    <li class="goods">
                                        고철1, 헌옷3, 비철3, 병2
                                    </li>
                                </ul>
                            </div>

                            <div class="footer">
                            </div>
                        </div>
                    </div>
                </div> <!-- //main -->
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