<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DonationDetails.aspx.cs" Inherits="RecycleWeb.Donation.DonationDetails" %>

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
        <input type="hidden" runat="server" id="hdProducerIdx" />
        <input type="hidden" runat="server" id="hdGroupIdx" />
        <div class="wrap" id="wrap">            
            <div data-role="page" class="nd2-no-menu-swipe">
                <!-- #header -->
                <div class="header" id="header">
                    <div data-role="header" class="wow fadeIn">
                        <div class="ci use-search-reset" style="width:100%">
                        <a href="javascript:;" class="back-btn">
                                <em class="img-menu ci-logo"><img src="../img/back-btn.png" style="width:8px; height:12px; margin:6px;" alt="leftmenu"></em>                          
                            </a>
                            <div>
                                세이브 더 칠드런
                            </div>
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
                                <div class="section">
                                    <h5 style="color:#91cd33; margin: 10px 0;">
                                        <label runat="server" id="lblGroupName" style="font-size:14px;"></label>
                                    </h5>
                                    <img runat="server" src="" id="imgGroup" style="width:100%; height:auto; margin-bottom: 10px;">
                                    <p>
                                        <label runat="server" id="lblGroupDesc" style="font-size:14px;"></label>
                                    </p>
                                </div>
                            </div>
                            <div class="footer" style="padding:15px;">
                                <div class="ui-grid-a" style="padding:10px 0; border-bottom: 1px solid #eeeeee;">
                                    <div class="ui-block-a" style="line-height:30px;">기부가능포인트</div>
                                    <div class="ui-block-b" style="text-align:right; line-height:30px;">
                                        <label runat="server" id="currPoint">0</label>
                                    </div>
                                </div>
                                <div class="ui-grid-a" style="padding:10px 0; border-bottom: 3px solid #91cd33; margin-bottom: 20px;">
                                    <div class="ui-block-a" style="line-height:30px;">기부포인트</div>
                                    <div class="ui-block-b" style="text-align:right;">
                                        <input type="text" id="txtDonationPoint" value="0" style="width:100%; padding:0; margin:0; border:1px solid #eeeeee !important; text-align: right;">
                                    </div>
                                </div>

                                <a href="#" id="btnDonate" class="ui-btn ui-corner-all" style="background-color:#91cd33; color:#ffffff; text-shadow:none; border:0;">기부하기</a>
                            </div>
                        </div>
                    </div> <!-- //main -->
                </div> <!-- //container -->
            </div>
        </div> <!-- //wrap -->

        <script type="text/javascript" src="../script/extention/jquery.js"></script>
        <script type="text/javascript" src="../script/extention/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
        <script type="text/javascript" src="../script/common.js"></script>
        <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
        
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
                        $(document).on('click', '#btnDonate', function () {
                            page.fn.donate();
                        });
                    },
                    fn: {
                        group: function () {
                            var params = {
                                donationGroupIdx: $("#hdGroupIdx").val()
                            }

                            Server.ajax("/producer/donationDetail", params, function (response, status, xhr) {
                                if (response.value == 0) {                                    
                                    $("#lblGroupName").text(response.donationDetail[0][1]);
                                    $("#lblGroupDesc").text(response.donationDetail[0][3]);
                                    $("#imgGroup").attr("src", response.donationDetail[0][5]);
                                } else {
                                    errorBox(getErrMsg(response.value));
                                }
                            }, "post", false);
                        },
                        donate: function () {
                            if ($("#currPoint").val() < $("#txtDonationPoint").val()) {
                                infoBox("현재 보유중인 포인트내에서 기부가능합니다.");
                                return;
                            }

                            var params = {
                                producerIdx: $("#hdProducerIdx").val(),
                                donationGroupIdx: $("#hdGroupIdx").val(),
                                donationPoint: $("#txtDonationPoint").val()
                            }

                            Server.ajax("/producer/donation", params, function (response, status, xhr) {
                                if (response.value == 0) {
                                    infoBox($("#txtDonationPoint").val() + "포인트를 기부하였습니다.");
                                } else {
                                    if (response.value == 111) {
                                        errorBox(getErrMsg(response.value));
                                    }
                                }
                            }, "post", false);
                        }
                    }
                };

                $(document).on('ready', function () {
                    page.init();
                    page.fn.group();
                });
            })();
        </script>
    </body>
</html>