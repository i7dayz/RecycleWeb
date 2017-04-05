<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestDone.aspx.cs" Inherits="RecycleWeb.Collection.RequestDone" %>

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
                                수거신청완료
                            </div>    
                        </div>
                    </div>
                </div>
                <!-- //#header -->
                <!-- #container -->
                <div class="container" id="container">
                    <div class="colgroup">                                                           
                        <div style="background-color:#91cd33; color:#ffffff; padding:10px;">
                            수거신청이 완료되었습니다. 기사님이 연락예정입니다.
                        </div>
                        <div class="content fixed" id="content">                            
                            <div class="main ui-content">
                                <div class="fixed option-area">     
                                    <ul>
                                        <li>
                                            <div class="wpc100" style="text-align:center;">
                                                <img id="imgCollectorImg" src="../temp/cef1f56553fba92d9e95c19e5a34c09a.jpg" style="width:120px; height:auto;">
                                            </div>
                                        </li>
                                        <li>
                                            <span style="color:#91cd33">[수거요청품목]</span>
                                            <div>
                                                <input type="text" id="txtReqList" name="txtReqList" class="text-field required input-guide txt-input-guide wpc100"
                                                    value=""/>                                        
                                            </div>
                                        </li>
                                        <li>
                                            <span class="txt-color5">수거담당자</span>
                                            <div>
                                                <input type="text" id="txtCollectorName" name="txtName" class="text-field required input-guide txt-input-guide wpc100"
                                                    value="" />
                                            </div>
                                        </li>
                                        <li>
                                            <span class="txt-color5">연락처</span>
                                            <div class="wpc100">
                                                <input type="text" id="txtCollectorContactNumber" class="text-field required input-guide txt-input-guide wpc100"
                                                    value="" />
                                            </div>                                 
                                        </li>
                                        <li>
                                            <span class="txt-color5">희망수거일시</span>    
                                            <div class="wpc100">
                                                <input type="text" id="txtReqDate" class="text-field required input-guide txt-input-guide wpc100" 
                                                    value="">
                                            </div> 
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="footer" style="padding:10px">
                                <div class="ui-grid-a">
                                    <div class="ui-block-a">
                                        <a href="javascript:;" id="btnCancel" class="ui-btn ui-corner-all btn-gray" style="">취소</a>
                                    </div>
                                    <div class="ui-block-b">
                                        <a href="javascript:;" id="btnConfirm" class="ui-btn ui-corner-all btn-green" style="">확인</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- //container -->
            </div>
        </div> <!-- //wrap -->

        <script type="text/javascript" src="../script/extention/jquery.js"></script>
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
                            //window.history.back();
                            location.href = "/Main.aspx";
                        });

                        $(document).on('click', '#btnCancel', function () {

                        });

                        $(document).on('click', '#btnConfirm', function () {
                            location.href = "/Main.aspx";
                        });
                    },
                    fn: {
                        getCollectorInfo: function () {
                            var params = {
                                producerIdx: $("#hdProducerIdx").val()
                            }

                            Server.ajax("/producer/collectReserve", params, function (response, status, xhr) {
                                //infoBox(response.value);
                                if (response.value == 0) {

                                    if (response.collectReserve.product_1 != 0) {
                                        $("#txtReqList").val($("#txtReqList").val() + "폐지 " + response.collectReserve.product_1 + ", ");
                                    }
                                    if (response.collectReserve.product_2 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "병 " + response.collectReserve.product_2 + ", ");
                                    }
                                    if (response.collectReserve.product_4 != 0) {
                                        $("#txtReqList").val($("#txtReqList").val() + "고철 " + response.collectReserve.product_4 + ", ");
                                    }
                                    if (response.collectReserve.product_5 != 0) {
                                        $("#txtReqList").val($("#txtReqList").val() + "비철 " + response.collectReserve.product_5 + ", ");
                                    }
                                    if (response.collectReserve.product_6 != 0) {
                                        $("#txtReqList").val($("#txtReqList").val() + "헌옷 " + response.collectReserve.product_6 + ", ");
                                    }
                                    if (response.collectReserve.product_7 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "휴대폰 " + response.collectReserve.product_7 + ", ");
                                    }
                                    if (response.collectReserve.product_8 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "대형가전 " + response.collectReserve.product_8 + ", ");
                                    }
                                    if (response.collectReserve.product_9 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "소형가전 " + response.collectReserve.product_9 + ", ");
                                    }
                                    if (response.collectReserve.product_10 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "이사수거 " + response.collectReserve.product_10 + ", ");
                                    }
                                    if (response.collectReserve.etc_1 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "기타, ");
                                    }
                                    if (response.collectReserve.etc_2 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "폐기서비스, ");
                                    }
                                    if (response.collectReserve.etc_3 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "유품정리, ");
                                    }

                                    $("#imgCollectorImg").attr("src", response.collectReserve.collectorImageUrl);
                                    $("#txtCollectorName").val(response.collectReserve.collectorName);
                                    $("#txtCollectorContactNumber").val(response.collectReserve.collectorContactNumber);
                                    $("#txtReqDate").val(response.collectReserve.hopeCollectDate);

                                } else {
                                    errorBox(getErrMsg(response.value));
                                }
                            }, "post", false);
                        },
                        cancelRequest: function () {
                            var params = {
                                producerIdx: $("#hdProducerIdx").val()
                            }

                            Server.ajax("/producer/produceCancel", params, function (response, status, xhr) {
                                if (response.value == 0) {
                                    //infoBox(response.value);
                                    infoBoxWithCallback("수거신청이 취소되었습니다.", page.fn.goUrl, { url: "/Main.aspx" })
                                } else {
                                    errorBox(getErrMsg(response.value));
                                }
                            }, "post", false);
                        },
                        goUrl: function(urlData) {
                            location.href = urlData.url;
                        },
                    }
                };

                $(document).on('ready', function () {
                    page.init();
                    page.fn.getCollectorInfo();
                });
            })();
        </script>
    </body>
</html>