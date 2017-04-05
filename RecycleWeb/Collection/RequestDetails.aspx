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
    <input type="hidden" runat="server" id="hdAddress1" value="0" />
    <input type="hidden" runat="server" id="hdAddress2" value="0" />
    <input type="hidden" runat="server" id="hdProduct01" value="0" />
    <input type="hidden" runat="server" id="hdProduct02" value="0" />
    <input type="hidden" runat="server" id="hdProduct03" value="0" />
    <input type="hidden" runat="server" id="hdProduct04" value="0" />
    <input type="hidden" runat="server" id="hdProduct05" value="0" />
    <input type="hidden" runat="server" id="hdProduct06" value="0" />
    <input type="hidden" runat="server" id="hdProduct07" value="0" />
    <input type="hidden" runat="server" id="hdProduct08" value="0" />
    <input type="hidden" runat="server" id="hdProduct09" value="0" />
    <input type="hidden" runat="server" id="hdProduct10" value="0" />
    <input type="hidden" runat="server" id="hdEtc1" value="0" />
    <input type="hidden" runat="server" id="hdEtc2" value="0" />
    <input type="hidden" runat="server" id="hdEtc3" value="0" />

    <div class="wrap" id="wrap">            
        <div data-role="page" class="nd2-no-menu-swipe">
            <!-- #header -->
            <div class="header" id="header" style="z-index:1;">
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
    
    <div id="modal-wrapper">
        <div id="modal-overlay"></div>
        <div id="modal-content">
            <div class="wrap join" id="wrap">
                <!-- #header -->
                <div class="header" id="header" style="z-index:2;">
                    <div class="colgroup fixed">
                        <div class="ci use-search-reset">
                            <a href="javascript:;" class="back-btn">
                                <em class="img-menu ci-logo"><img src="../img/back-btn.png" style="width:8px; height:12px; margin:6px;" alt=""></em>                                                    
                            </a>
                            <span>수거주소록</span>
                        </div>
                    </div>
                </div>
                <!-- //#header -->
                <!-- #container -->
                <div class="container" id="container" style="background-color:#fff !important">
                    <div class="colgroup">
                        <div class="content fixed" id="content">
                            <div class="main ui-content">
                                <div class="fixed option-area join">
                                    <ul id="addressList"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
                    $("#modal-wrapper").hide();

                    var modal = {
                        open: function () {
                            $('#modal-wrapper').show();
                        },
                        close: function () {
                            $('#modal-wrapper').hide();
                        }
                    };


                    $(document).on('click', '#modal-overlay', function () {
                        window.history.back();
                    }).on('click', '#btnChangeAddress', function () {
                        window.history.pushState({}, 'modal', '/modal');
                        modal.open();
                        page.fn.addressList();
                    });

                    window.onpopstate = history.onpushstate = function (e) {
                        if (window.location.href.split('/').pop().indexOf('modal') === -1) { // 마지막 segment가 cards라면 모달이 아닌 리스트인 상태이어야한다.
                            modal.close(); // 현재의 모달을 닫는다.
                        }
                    }

                    // Create start date
                    var start = new Date();

                    // 08:00 AM
                    //start.setHours(8);
                    //start.setMinutes(0);

                    //var disabledDays = [0, 6];
                    $('#txtReqDate').datepicker({
                        language: 'ko',
                        position: 'top left',
                        //startDate: start,
                        minDate: start, // Now can select only dates, which goes after today
                        //onRenderCell: function (date, cellType) {
                        //    if (cellType == 'day') {
                        //        var day = date.getDay(),
                        //            isDisabled = disabledDays.indexOf(day) != -1;
                        //        return {
                        //            disabled: isDisabled
                        //        }
                        //    }
                        //},
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

                    $(document).on('click', 'li[name=address]', function () {
                        $("#hdAddress1").val($(this).find('div').find('div').find('#address1').text());
                        $("#hdAddress2").val($(this).find('div').find('div').find('#address2').text());
                        $("#txtBaseAddress").val($(this).find('div').find('div').find('#address1').text() + ' ' + $(this).find('div').find('div').find('#address2').text());
                        $("#txtDetailAddress").val($(this).find('div').find('div').find('#detailAddress').text());
                        $("#txtZipno").val($(this).find('div').find('div').find('#zipNo').text());
                        window.history.back();
                    });
                },
                fn: {
                    requestPickup: function () {
                        var params = {
                            producerIdx: $("#hdProducerIdx").val(),
                            zipCode: $("#txtZipno").val(),
                            address1: $("#hdAddress1").val(),
                            address2: $.trim($("#hdAddress2").val()),
                            detailAddress: $("#txtDetailAddress").val(),
                            producerContactNumber: $("#txtContactNumber").val(),
                            product_1: $("#hdProduct01").val(),
                            product_2: $("#hdProduct02").val(),
                            product_3: $("#hdProduct03").val(),
                            product_4: $("#hdProduct04").val(),
                            product_5: $("#hdProduct05").val(),
                            product_6: $("#hdProduct06").val(),
                            product_7: $("#hdProduct07").val(),
                            product_8: $("#hdProduct08").val(),
                            product_9: $("#hdProduct09").val(),
                            product_10: $("#hdProduct10").val(), // 이삿짐
                            etc_1: $("#hdEtc1").val(), // 기타
                            etc_2: $("#hdEtc2").val(), // 폐기서비스
                            etc_3: $("#hdEtc3").val(), // 유품정리
                            companyCode: 0,
                            hopeCollectDate: $("#txtReqDate").val()
                        };

                        Server.ajax("/producer/produceReg", params, function (response, status, xhr) {
                            //alert(response.value);
                            if (response.value == 0) {
                                $("#pickupForm").submit();
                            } else {
                                //if (response.value == 200) {
                                //    errorBoxWithCallback("진행중인 수거 건이 있으므로 배출 신청을 할 수 없습니다.", page.fn.goUrl, { url: "/Main.aspx" });
                                //} 
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    },
                    goUrl: function(urlData) {
                        location.href = urlData.url;
                    },
                    addressList: function () {
                        $('#addressList').html('');

                        var params = {
                            producerIdx: $("#hdProducerIdx").val()
                        };

                        Server.ajax("/producer/addressInfoList", params, function (response, status, xhr) {
                            if (response.value == 0) {
                                var list = response.addressInfoList;

                                for (var i = 0; i < list.length; i++) {
                                    page.fn.addAddress(list[i]);
                                }
                            } else {
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    },
                    addAddress: function (item) {
                        var address = '<li class="bb-1 pb10" name="address" id="' + item[0] + '" style="cursor:pointer">'
                                    + '    <span class="txt-color5">' + '장소구분' + '</span>'
                                    + '    <div class="ui-grid-a">'
                                    + '        <div class="ui-block-a wpc90">'
                                    + '            <span id="address1">' + item[3] + '</span> <span id="address2">' + item[4] + '</span> '
                                    + '            <span id="detailAddress">' + item[5] + '</span> (<span id="zipNo">' + item[2] + '</span>)'
                                    + '        </div>'
                                    + '    </div>'
                                    + '</li>';

                        $('#addressList').append(address);
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