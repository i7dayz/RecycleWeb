<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestDetails.aspx.cs" Inherits="RecycleWeb.Collection.RequestDetails" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
<meta name="format-detection" content="telephone=no" />
<meta name="url" content="http://hrx.co.kr/Default.aspx" id="meta-url" />
<meta name="author" content="한국자원거래소" id="meta-author" />
<meta name="subject" content="리본" id="meta-title" />
<meta name="description" content="한국자원거래소, 리본, HRX, 헌옷, 휴대폰, 소형가전, 대형가전, 폐지, 병, 고철, 비철, 이삿짐, 재활용, 이사수거, 유품정리, 폐기대행" id="meta-description" />
<meta name="thumbnail" content="http://hrx.co.kr/img/reborn.jpg" id="meta-thumbnail" />
<meta property="fb:app_id" content="1563461907244524" />
<meta property="og:site_name" content="리본" />
<meta property="og:title" content="리본-쓰레기가 자원으로 재탄생하다" />
<meta property="og:type" content="website" />
<meta property="og:url" content="http://hrx.co.kr/Default.aspx" />
<meta property="og:image" content="http://hrx.co.kr/img/reborn.jpg" />
<meta property="og:locale" content="ko_KR" />
<meta property="og:description" content="한국자원거래소, 리본, HRX, 헌옷, 휴대폰, 소형가전, 대형가전, 폐지, 병, 고철, 비철, 이삿짐, 재활용, 이사수거, 유품정리, 폐기대행" />

<title>리본-쓰레기가 자원으로 재탄생하다</title>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/responsive.css">
<link rel="stylesheet" href="/css/sandbox.css" >
<link rel="stylesheet" href="/css/drawer.css" >
<link rel="stylesheet" href="/css/layout.css" >

    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="/css/modal.css" />
    <link href="/script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />

    <link href="/script/extention/air-datepicker-master/datepicker.min.css" rel="stylesheet" type="text/css">
    <style>
#wrap{position:relative;margin:0 auto;height:100%;max-width:780px;}
    </style>
    <div id="body">
        <header>
            <div class="su_header" style="z-index:1">
			    <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>수거신청
            </div>
        </header>
        <div class="container" style="">
	        <div class="su_form">
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

                <div class="su_title"><span class="color90cd32">[수거신청품목]</span></div>
                <div><input type="text" runat="server" id="txtReqProduct" name="" value="" class="su_input" readonly="readonly"/></div>
                <div class="su_title">이름</div>
                <div><input type="text" runat="server" id="txtName" name="" value="" class="su_input" readonly="readonly"/></div>
                <div class="su_title">연락처</div>
                <div><input type="text" runat="server" id="txtContactNumber1" name="" value="" class="su_hp1" readonly="readonly"/> - <input type="text" runat="server" id="txtContactNumber2" name="" value="" class="su_hp2" readonly /> - <input type="text" runat="server" id="txtContactNumber3" name="" value="" class="su_hp3" readonly /></div>
                <div class="su_title">기본주소</div>
                    <div class="su_juso_left8"><input type="text" runat="server" id="txtBaseAddress" name="" value="" class="su_input"  readonly="readonly"/></div>
                    <div class="su_juso_right2"><img src="/img/baechul/i-sch.png" width="40" style="margin-top: -10px;" id="btnChangeAddress"></div>
                <div class="su_title">
                    <div class="su_juso_left">세부주소</div>
                    <div class="su_juso_right">우편번호</div>
                </div>
                <div class="su_adr">
                    <div class="su_juso_left"><input type="text" runat="server" id="txtDetailAddress" name="" value="" class="su_input_juso01" readonly="readonly" /> </div>
                    <div class="su_juso_right"><input type="text" runat="server" id="txtZipno" name="" value="" class="su_input_juso02"  readonly="readonly" /> </div>
                </div>
                <div class="su_title">희망수거일시</div>
                <div class="su_date">
                    <input type="text" id="txtReqDate" class="su_date01" onfocus="this.blur()"/>
                    <%--<input type="radio" name="radTime" id="radTime01" value="오전 10시~오후 2시" style="margin-left:20px;" checked="checked"/><label for="radTime01" style="cursor:pointer">오전 10시~오후 2시</label>
                    <input type="radio" name="radTime" id="radTime02" value="오후 2시~오후 6시"  style="margin-left:20px;"/><label for="radTime02" style="cursor:pointer">오후 2시~오후 6시</label>--%>
                </div>
                <div style="height:30px;"></div>
                <div class="su_submit"><div class="btn_grean" id="btnRequest" style="cursor:pointer" >수거신청</div></div>
                <div class="su_submit"><div class="btn_gray" id="btnEditAddress" style="cursor:pointer">수거 주소록 관리</div></div>
            </div>
        </div>

    <div id="modal-wrapper">
        <div id="modal-overlay"></div>
        <div id="modal-content">
            <div class="wrap" id="wrap">
                <!-- #header -->
                <header>
                    <div class="su_header" style="z-index:10000">
                        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>
                        수거주소록
                    </div>
                </header>
                <!-- //#header -->
                <!-- #container -->
                <div class="container" id="container" style="background-color:#fff !important">
                    <div class="colgroup">
                        <div class="content fixed" id="content">
                            <div class="main ui-content">
                                <div class="fixed option-area join">
                                    <div id="addressList"></div>
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
                        autoClose: true
                    });
                },
                initEvent: function () {
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
                    $(document).on('click', '.back-btn', function () {
                        window.history.back();
                    });

                    $(document).on('click', '#btnRequest', function () {
                        //location.href = "RequestDone.aspx";
                        page.fn.requestPickup();
                    });

                    $(document).on('click', '#btnEditAddress', function () {
                        location.href = "../Member/AddressList.aspx";
                    });

                    $(document).on('click', 'div[name=address]', function () {
                        $("#hdAddress1").val($(this).find('div').find('p').find('#address1').text());
                        $("#hdAddress2").val($(this).find('div').find('p').find('#address2').text());
                        $("#txtBaseAddress").val($(this).find('div').find('p').find('#address1').text() + ' ' + $(this).find('div').find('p').find('#address2').text());
                        $("#txtDetailAddress").val($(this).find('div').find('p').find('#detailAddress').text());
                        $("#txtZipno").val($(this).find('div').find('p').find('#zipNo').text());
                        window.history.back();
                    });
                },
                fn: {
                    setFocus: function() {
                        $("#txtReqDate").focus();
                    },
                    requestPickup: function () {
                        if ($("#txtReqDate").val() == "") {
                            infoBoxWithCallback("수희망수거일을 선택하세요.", page.fn.setFocus, null);
                            return;
                        }

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
                            hopeCollectDate: $("#txtReqDate").val()// + ' ' + $('input[name="radTime"]:checked').val()
                        };

                        Server.ajax("/producer/produceReg", params, function (response, status, xhr) {
                            //alert(response.value);
                            if (response.value == 0) {
                                location.href = "RequestDone.aspx";
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
                        var address = "<div class='reser2' name='address' id='" + item[0] + "'>";
                        address += "    <div class='pad1010'>";
                        address += "        <p class='font_size12b color000 pad_l0'>" + item[8] + "</p>";
                        address += "        <p class='font_size12b color000'><span id='address1'>" + item[3] + "</span> <span id='address2'>" + item[4] + "</span></p>";
                        address += "        <p class='font_size12b color000'><span id='detailAddress'>" + item[5] + "</span> (<span id='zipNo'>" + item[2] + "</span>)</p>";
                        address += "    </div>";
                        address += "</div>";

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