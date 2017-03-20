<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recommender.aspx.cs" Inherits="RecycleWeb.Member.Recommender" %>

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
                            추천인 입력
                        </div>
                    </div>
                </div>
            </div>
            <!-- //#header -->
            <!-- #container -->
            <div class="container" id="container">
                <div class="colgroup">
                    <div class="content fixed" id="content">
                        <div class="main ui-content">
                            <div class="fixed option-area recommender">
                                <h6>추천인 입력</h6>
                                <input type="text" class="text-field wpc80" placeholder="추천인 닉네임 입력" />
                                <a href="#" id="" class="ui-btn ui-corner-all wpc15 btn-confirm" style="font-weight:normal; float:right">
                                    확인
                                </a>
                                <h6>친구초대</h6>
                                <div class="invite">
                                    <ul>
                                        <li>
                                            <img src="../img/kakao.png" style="">
                                            <p>카카오톡</p>
                                        </li>
                                        <li>
                                            <img src="../img/line.png" style="">
                                            <p>LINE</p>
                                        </li>
                                        <li>
                                            <img src="../img/sms.png" style="">
                                            <p>SMS</p>
                                        </li>
                                        <li>
                                            <img src="../img/link.png" style="">
                                            <p>링크</p>
                                        </li>
                                    </ul>
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