<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsageGuide.aspx.cs" Inherits="RecycleWeb.Support.UsageGuide" %>

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
                        <a href="javascript:;" class="back-btn">
                            <em class="img-menu ci-logo"><img src="../img/back-btn.png" style="width:8px; height:12px; margin:6px;" alt=""></em>                           
                        </a>
                        <div>
                            이용안내
                        </div>
                    </div>
                </div>
            </div>
            <!-- //#header -->
            <!-- #container -->
            <div class="container" id="container">
                <div class="colgroup">
                    <div class="content fixed" id="content">
                        <div class="information">
                            <div class="title">
                                <div class="title-text">
                                    <ul>
                                        <li class="title-main">Q. 이용안내</li>
                                        <li class="title-date">2017-02-01 18:00</li>
                                    </ul>
                                </div>
                                <div class="title-close">
                                    <img src="../img/close-p.png">
                                </div>
                            </div>
                            <div class="content-area">
                                <p>A. 이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내이용안내</p>
                            </div>
                        </div>
                        <div class="information">
                            <div class="title">
                                <div class="title-text">
                                    <ul>
                                        <li class="title-main">Q. 이용안내</li>
                                        <li class="title-date">2017-02-01 18:00</li>
                                    </ul>
                                </div>
                                <div class="title-close">
                                    <img src="../img/open-g.png">
                                </div>
                            </div>
                        </div>
                        <div class="information">
                            <div class="title">
                                <div class="title-text">
                                    <ul>
                                        <li class="title-main">Q. 이용안내</li>
                                        <li class="title-date">2017-02-01 18:00</li>
                                    </ul>
                                </div>
                                <div class="title-close">
                                    <img src="../img/open-g.png">
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