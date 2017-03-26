<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="RecycleWeb.Support.Event" %>

<!DOCTYPE html>
<html>
<head>
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
                            이벤트
                        </div>
                    </div>
                </div>
            </div>
            <!-- //#header -->
            <!-- #container -->
            <div class="container" id="container">
                <div class="colgroup">
                    <div class="content fixed" id="content"></div>
                </div>
            </div> <!-- //container -->
        </div>
    </div> <!-- //wrap -->
    
    <script type="text/javascript" src="../script/extention/jquery.js"></script>
    <script type="text/javascript" src="../script/extention/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
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
                    $(document).on('click', '.notice', function (id) {
                        $(this).find('.content-area').toggle(100, function () {
                            if ($(this).css('display') != 'none') {
                                $(this).parent().find('#notice_img').attr("src", $(this).parent().find('#notice_img').attr("src").replace("../img/open-g.png", "../img/close-p.png"));
                            } else {
                                $(this).parent().find('#notice_img').attr("src", $(this).parent().find('#notice_img').attr("src").replace("../img/close-p.png", "../img/open-g.png"));
                            }
                        });
                    });
                },
                fn: {
                    eventList: function () {
                        var params = {
                            pageNum: 0
                        };

                        Server.ajax("/producer/eventList", params, function (respone, status, xhr) {
                            if (respone.value == 0) {
                                var list = respone.eventList;

                                for (var i = 0; i < list.length; i++) {
                                    page.fn.addEvent(list[i]);
                                }
                            } else {
                                errorBox(getErrMsg(respone.value));
                            }
                        }, "post", false);
                    },
                    addEvent: function (item) {
                        var event = '<div class="notice" id="' + item[0] + '">'
                                     + '    <div class="title">'
                                     + '        <div class="title-image">'
                                     + '            <img src="../img/event-g.png">'
                                     + '        </div>'
                                     + '        <div class="title-text">'
                                     + '            <ul>'
                                     + '                <li class="title-main">' + "[" + item[6] + "]" + item[1] + '</li>'
                                     + '                <li class="title-date">' + item[4] + "~" + item[5] + '</li>'
                                     + '            </ul>'
                                     + '        </div>'
                                     + '        <div class="title-close">'
                                     + '            <img id="notice_img" src="../img/open-g.png">'
                                     + '        </div>'
                                     + '    </div>'
                                     + '    <div class="content-area">'
                                     + '        <img src="' + item[3] + '">'
                                     + '    </div>'
                                     + '</div>';

                        $('#content').append(event);
                    }
                }
            };

            $(document).on('ready', function () {
                page.init();
                page.fn.eventList();
            });
        })();
    </script>
</body>
</html>