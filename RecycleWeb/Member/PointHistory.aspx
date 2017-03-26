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

                            <div class="main point-list"></div>

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
                    pointHistory: function () {
                        var params = {
                            producerIdx: $("#hdProducerIdx").val(),
                            pageNum: 0
                        };

                        Server.ajax("/producer/pointHistory", params, function (respone, status, xhr) {
                            if (respone.value == 0) {
                                var list = respone.pointHistory;

                                for (var i = 0; i < list.length; i++) {
                                    page.fn.addPoint(list[i]);
                                }
                            } else {
                                errorBox("Error Code : " + respone.value);
                            }
                        }, "post", false);
                    },
                    addPoint: function (item) {
                        var type = "";
                        var pm = "";
                        switch (item[1]) {
                            case "1": 
                                type = "적립";
                                pm = "+";
                                break;
                            case "2 ": 
                                type = "사용";
                                pm = "-";
                                break;
                            case "3": 
                                type = "기부";
                                pm = "-";
                                break;
                            case "4":
                                type = "추천포인트";
                                pm = "+";
                                break;
                        }

                        var goods = "";

                        if (parseInt(item[5]) > 0)
                            goods += "폐지 " + item[5] + ", ";
                        if (parseInt(item[6]) > 0)
                            goods += "병 " + item[6] + ", ";
                        if (parseInt(item[7]) > 0)
                            goods += "캔 " + item[7] + ", ";
                        if (parseInt(item[8]) > 0)
                            goods += "고철 " + item[8] + ", ";
                        if (parseInt(item[9]) > 0)
                            goods += "비철 " + item[9] + ", ";
                        if (parseInt(item[10]) > 0)
                            goods += "헌옷 " + item[10] + ", ";
                        if (parseInt(item[11]) > 0)
                            goods += "휴대폰 " + item[11] + ", ";
                        if (parseInt(item[12]) > 0)
                            goods += "대형가전 " + item[12] + ", ";
                        if (parseInt(item[13]) > 0)
                            goods += "소형가전 " + item[13] + ", ";
                        if (parseInt(item[14]) > 0)
                            goods += "이사수거 " + item[14] + ", ";

                        var date = new Date(item[4]);

                        var point = '<ul class="point-item" id=' + item[0] + '>'
                                  + '    <li class="date">' + date.getFullYear() + "." + (date.getMonth() + 1 ) + "." + date.getDate()  + '</li>'
                                  + '    <li class="point">' + pm + item[3] + '</li>'
                                  + '    <li class="goods">' + goods + '</li>'
                                  + '</ul>';

                        $(".point-list").append(point);
                    },
                }
            };

            $(document).on('ready', function () {
                page.init();
                page.fn.pointHistory();
            });
        })();
    </script>
</body>
</html>