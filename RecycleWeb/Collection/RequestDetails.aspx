<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestDetails.aspx.cs" Inherits="RecycleWeb.Collection.RequestDetails" %>

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
    <link href="../script/extention/air-datepicker-master/datepicker.min.css" rel="stylesheet" type="text/css">
    <link href="../script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css">
</head>
<body class="all" contenteditable="false">
    <input type="hidden" runat="server" id="hdProducerIdx" />
    <input type="hidden" runat="server" id="hdAddress1" />
    <input type="hidden" runat="server" id="hdAddress2" />
    <input type="hidden" runat="server" id="hdProduct01" />
    <input type="hidden" runat="server" id="hdProduct02" />
    <input type="hidden" runat="server" id="hdProduct03" />
    <input type="hidden" runat="server" id="hdProduct04" />
    <input type="hidden" runat="server" id="hdProduct05" />
    <input type="hidden" runat="server" id="hdProduct06" />
    <input type="hidden" runat="server" id="hdProduct07" />
    <input type="hidden" runat="server" id="hdProduct08" />
    <input type="hidden" runat="server" id="hdProduct09" />
    <input type="hidden" runat="server" id="hdProduct10" />
    <input type="hidden" runat="server" id="hdProduct11" />
    <input type="hidden" runat="server" id="hdProduct12" />

    <div class="wrap" id="wrap">            
        <div data-role="page" class="nd2-no-menu-swipe">
            <!-- #header -->
            <div class="header" id="header">
                <div data-role="header" class="wow fadeIn">
                    <div class="ci use-search-reset" style="width:100%">
                        <a href="javascript:;" class="back-btn">
                            <em class="img-menu ci-logo"><img src="../img/back-btn.png" style="width:8px; height:12px; margin:6px;" alt=""></em>                                                    
                        </a>
                        <span>
                            수거신청
                        </span>
                    </div>
                </div>
            </div>
            <!-- //#header -->
            <!-- #container -->
            <div class="container" id="container">
                <div class="colgroup">
                    <div class="content fixed" id="content">                            
                        <div class="main ui-content">
                            <form runat="server" id="pickupForm" method="post" action="RequestDone.aspx" data-ajax="false">
                                <div class="fixed option-area join">
                                    <ul>
                                        <li>
                                            <span class="txt-color8">[수거신청품목]</span>
                                            <div><input type="text" runat="server" id="txtReqProduct" class="text-field required input-guide txt-input-guide wpc100" /></div>
                                        </li>
                                        <li>
                                            <span class="txt-color5">이름</span>
                                            <div><input type="text" runat="server" id="txtName" class="text-field required input-guide txt-input-guide wpc100" title="이름을 입력하세요." /></div>
                                        </li>
                                        <li>
                                            <span class="txt-color5">연락처</span>
                                            <div class="wpc100">
                                                <input type="tel" runat="server" id="txtContactNumber" maxlength="13" class="text-field required input-guide txt-input-guide wpc100"  />
                                            </div>                                 
                                        </li>
                                        <li>
                                            <span class="txt-color5">기본주소</span>
                                            <div class="ui-grid-a">
                                                <div class="ui-block-a wpc85">
                                                    <input type="text" runat="server" id="txtBaseAddress" class="text-field required input-guide txt-input-guide wpc95" />
                                                </div>
                                                <div class="ui-block-b wpc15">
                                                    <a href="javascript:;" id="btnChangeAddress" class="ui-btn ui-corner-all wpc100 btn-green" style="display:inline-block !important; padding:5px 3px 5px 3px !important;margin:0; font-weight:normal; float:right;">
                                                        변경
                                                    </a>       
                                                </div>
                                            </div>           
                                        </li>
                                        <li>
                                            <div class="ui-grid-a">
                                                <div class="ui-block-a wpc75">
                                                    <span class="txt-color5">세부주소</span>    
                                                </div>
                                                <div class="ui-block-b wpc20">
                                                    <span class="txt-color5">우편번호</span>
                                                </div>
                                            </div>
                                        </li>    
                                        <li>
                                            <div class="ui-grid-a">
                                                <div class="ui-block-a wpc75">
                                                    <input type="text" runat="server" id="txtDetailAddress" class="text-field required input-guide txt-input-guide wpc95" />  
                                                </div>
                                                <div class="ui-block-b wpc25">
                                                    <input type="text" runat="server" id="txtZipno" class="text-field required input-guide txt-input-guide wpc100" />
                                                </div>
                                            </div>
                                        </li>   
                                        <li>
                                            <span class="txt-color5">희망수거일시</span>    
                                            <div class="wpc100">
                                                <input type="text" id="txtReqDate" class="text-field required input-guide txt-input-guide wpc100" onFocus="this.blur()">
                                            </div> 
                                        </li> 
                                    </ul>
                                </div>
                            </form>
                        </div>
                        <div class="footer" style="padding:10px;">
                            <a href="javascript:;" id="btnRequest" class="ui-btn ui-corner-all btn-green">수거신청</a>
                        </div>
                    </div>
                </div>
            </div> <!-- //container -->
        </div> <!-- //page -->
    </div> <!-- //wrap -->

    <script type="text/javascript" src="../script/extention/jquery.js"></script>
    <script type="text/javascript" src="../script/extention/air-datepicker-master/datepicker.min.js"></script>
    <script type="text/javascript" src="../script/extention/air-datepicker-master/i18n/datepicker.ko.js"></script>
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
                    // Create start date
                    var start = new Date();

                    // 08:00 AM
                    start.setHours(8);
                    start.setMinutes(0);

                    var disabledDays = [0, 6];
                    $('#txtReqDate').datepicker({
                        language: 'ko',
                        position: 'top left',
                        startDate: start,
                        minDate: start, // Now can select only dates, which goes after today
                        onRenderCell: function (date, cellType) {
                            if (cellType == 'day') {
                                var day = date.getDay(),
                                    isDisabled = disabledDays.indexOf(day) != -1;
                                return {
                                    disabled: isDisabled
                                }
                            }
                        },
                        //todayButton: new Date(),
                        timepicker: true,
                        navTitles: {
                            days: '<span>yyyy</span>년 MM'
                        },
                        minHours: 8,
                        maxHours: 20,
                        minutesStep: 30,
                    });
                },
                initEvent: function () {
                    $(document).on('click', '.back-btn', function () {
                        window.history.back();
                    });

                    $(document).on('click', '#btnRequest', function () {
                        //location.href = "RequestDone.aspx";
                        page.fn.requestPickup();
                    });
                },
                fn: {
                    requestPickup: function () {
                        // 기타/폐기서비스/유품정리, 희망수거일자 추가 예정
                        var params = {
                            producerIdx: $("#hdProducerIdx").val(),
                            zipCode: $("#txtZipno").val(),
                            address1: $("#hdAddress1").val(),
                            address2: $("#hdAddress2").val().replace(" ", ""), // 첫번째 공백 제거
                            detailAddress: $("#txtDetailAddress").val(),
                            producerContactNumber: $("#hdProducerIdx").val(),
                            product_1: $("#hdProduct01").val(),
                            product_2: $("#hdProduct02").val(),
                            product_3: $("#hdProduct03").val(),
                            product_4: $("#hdProduct04").val(),
                            product_5: $("#hdProduct05").val(),
                            product_6: $("#hdProduct06").val(),
                            product_7: $("#hdProduct07").val(),
                            product_8: $("#hdProduct08").val(),
                            product_9: $("#hdProduct09").val(),
                            product_10: $("#hdProduct10").val()
                        };

                        Server.ajax("/producer/produceReg", params, function (response, status, xhr) {
                            //infoBox(response.value);
                            if (response.value == 0) {
                                $("#pickupForm").submit();
                            } else {
                                if (response.value == 200) {
                                    errorBoxWithCallBack("진행중인 수거 건이 있으므로 배출 신청을 할 수 없습니다.", page.fn.goMain, {url:"/Main.aspx"});
                                }
                            }
                        }, "post", false);
                    },
                    goMain(urlData) {
                        location.href = urlData.url;
                    }
                }
            };

            $(document).on('ready', function () {
                page.init();
            });
        })();
    </script>
</body>
</html>