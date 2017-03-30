<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DonationHistory.aspx.cs" Inherits="RecycleWeb.Member.DonationHistory" %>

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
    <link href="../script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css">
</head>
<body class="all" contenteditable="false">
    <input type="hidden" runat="server" id="hdProducerIdx" />
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
                            기부 내역
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
                                        <li><label>만료예정일 : </label><label runat="server" id="exDate"></label></li>
                                        <li><label>만료예정 포인트 : </label><label runat="server" id="exPoint"></label></li>
                                    </ul>
                                </div>
                                <div class="profile">
                                    <div class="image-wrapper">
                                        <div class="image">
                                            <img runat="server" id="profileImg" src="../img/person64x64.png">
                                        </div>
                                    </div>
                                    <div class="nickname">
                                        <label runat="server" id="nickname"></label>
                                    </div>
                                    <div class="point">                                            
                                        <label runat="server" id="point">0</label>
                                        <img src="../img/point-icn.png" />
                                    </div>
                                </div>
                            </div>

                            <div class="main donation-list">
                                <ul class="my-donation">
                                    <li class="title">나의 기부 내역</li>
                                    <li class="point" style="">
                                        <span runat="server" id="totalDonatePoint" style="font-size:24px; font-weight:bold; display:inline; vertical-align:middle">0
                                        <img src="../img/point-icn.png" style="width:26px; height:26px; display:inline;vertical-align:middle" /></span>
                                    </li>
                                </ul>
                                <div class="donation-history-list"></div>
                                <%--<ul class="donation-item">
                                    <li class="date">
                                        2017.04.02
                                    </li>
                                    <li class="point">
                                        -15,000
                                    </li>
                                    <li class="group">
                                        사랑의 열매
                                    </li>
                                </ul>
                                <ul class="donation-item">
                                    <li class="date">
                                        2017.04.02
                                    </li>
                                    <li class="point">
                                        -15,000
                                    </li>
                                    <li class="group">
                                        사랑의 열매
                                    </li>
                                </ul>
                                <ul class="donation-item">
                                    <li class="date">
                                        2017.04.02
                                    </li>
                                    <li class="point">
                                        -15,000
                                    </li>
                                    <li class="group">
                                        사랑의 열매
                                    </li>
                                </ul>
                                <ul class="donation-item">
                                    <li class="date">
                                        2017.04.02
                                    </li>
                                    <li class="point">
                                        -15,000
                                    </li>
                                    <li class="group">
                                        사랑의 열매
                                    </li>
                                </ul>
                                <ul class="donation-item">
                                    <li class="date">
                                        2017.04.02
                                    </li>
                                    <li class="point">
                                        -15,000
                                    </li>
                                    <li class="group">
                                        사랑의 열매
                                    </li>
                                </ul>--%>
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
    <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>
        
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
                    donationHistoryList: function () {
                        var params = {
                            producerIdx: $("#hdProducerIdx").val()
                        };

                        Server.ajax("/producer/donationHistory", params, function (response, status, xhr) {
                            if (response.value == 0) {
                                var list = response.donationHistory;

                                for (var i = 0; i < list.length; i++) {
                                    page.fn.addDonationHistory(list[i]);
                                }
                            } else {
                                errorBox("Error Code : " + response.value);
                            }
                        }, "post", false);
                    },
                    addDonationHistory: function (item) {
                        var donationHistory = '<ul class="donation-item" id="' + item[0] + '">'
                                            + '    <li class="date">기부일자..</li>'
                                            + '    <li class="point">' + item[3] + '</li>'
                                            + '    <li class="group">' + item[1] + '</li>'
                                            + '</ul>';

                        $('.donation-history-list').append(donationHistory);
                    }
                }
            };

            $(document).on('ready', function () {
                page.init();
                page.fn.donationHistoryList();
            });
        })();
    </script>
</body>
</html>