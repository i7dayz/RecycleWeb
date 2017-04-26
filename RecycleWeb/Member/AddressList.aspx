<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressList.aspx.cs" Inherits="RecycleWeb.Member.AddressList" %>
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

    <link href="../script/extention/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
    <link href="../script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />

<style>
    .image-wrapper { 
        width:100%; text-align: center; 
        background: url('../img/character-02.png') no-repeat;
        background-size: contain;
        background-position:center
    }
    .image { display: block; overflow: hidden; width: 64px; height: 64px; border-radius: 50%; margin: 0 auto; }
    .image > img {
        display: inline-block;
        max-width: 100%;
        min-height: 100%;
        -ms-interpolation-mode: bicubic;
    }
.wpc90{width:90% !important;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;}
.wpc10{width:10% !important;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;}

.txt-color5{color:#969696 !important;}
.checkbox-wrap { cursor: pointer; font-weight: 700; }
.checkbox-wrap .check-icon-green  { display: inline-block; width: 15px; height: 15px; background: url(../img/check_02.png) left center no-repeat; vertical-align: middle; transition-duration: .3s; background-size:15px;}
.checkbox-wrap input[type=checkbox] { display: none;}
.checkbox-wrap input[type=checkbox]:checked + .check-icon-green { background-image: url(../img/check_01.png); }

.checkbox-wrap-main { cursor: pointer; font-weight: 700; }
.checkbox-wrap-main .check-icon-green  { display: inline-block; width: 15px; height: 15px; background: url(img/check_02.png) left center no-repeat; vertical-align: middle; transition-duration: .3s; background-size:15px;}
.checkbox-wrap-main input[type=checkbox] { display: none;}
.checkbox-wrap-main input[type=checkbox]:checked + .check-icon-green { background-image: url(img/check_01.png); }
</style>
<script>

</script>
<body>
<div id="body">
<form id="form1" runat="server">
    <header>
        <div class="su_header">
            <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>
            수거주소록
        </div>
    </header>
    <input type="hidden" runat="server" id="hdProducerIdx" />
    <input type="hidden" runat="server" id="hdAddressInfoIdx" />
    <div class="container" style="">
	    <div class="ctext pad20 back_green">
            <div class="image-wrapper">
                <div class="image">
                    <img runat="server" id="profileImg" src="/img/person64x64.png">
                </div>
            </div>
            <p class="ctext color_fff font_size14 padt20">
                <label runat="server" id="name" style="color:#ffffff;"></label>
            </p>
            <p class="ctext color_fff font_size14 pad10">
                <label runat="server" id="nickname" style="color:#ffffff;"></label>
            </p>
        </div>
	    <div class="su_form"> 
            <div id="addressList" class="reser mar_t20"></div>
            <div class="su_submit pdt30"><div class="btn_grean" id="btnAddAddress" style="cursor:pointer">추가</div></div>
        </div>
    </div>
</form>
</div>
    <iframe src="../temp.html"  style="visibility:hidden;display:none" scrolling="no"></iframe>

    <script type="text/javascript" src="../script/extention/jquery.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>
    <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script type="text/javascript" src="/script/drawer.min.js" charset="utf-8"></script>

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

                    $(document).on('click', '#btnAddAddress', function () {
                        if ($("#addressList").find("div[name=address]").length < 5) {
                            location.href = "EditAddress.aspx?id=";
                        }
                        else {
                            infoBox("수거주소는 기본주소를 포함하여 5개까지 등록가능합니다.");
                        }
                    });

                    $(document).on('click', 'img[name=editAddress]', function () {
                        location.href = "EditAddress.aspx?id=" + $(this).attr('id');
                    });

                    $(document).on('click', 'img[name=deleteAddress]', function () {
                        $("#hdAddressInfoIdx").val($(this).attr('id'));
                        confirmBox("선택한 주소를 삭제하시겠습니까?", page.fn.deleteAddress);
                    });
                },
                fn: {  
                    addressList: function () {
                        var params = {
                            producerIdx: $("#hdProducerIdx").val()
                        };

                        Server.ajax("/producer/addressInfoList", params, function (respone, status, xhr) {
                            if (respone.value == 0) {
                                var list = respone.addressInfoList;

                                for (var i = 0; i < list.length; i++) {
                                    page.fn.addAddress(list[i]);
                                }
                            } else {
                                errorBox("Error Code : " + respone.value);
                            }
                        }, "post", false);
                    },
                    addAddress: function (item) {
                        var defaultAddress = "";

                        if (item[7] == "1") {
                            defaultAddress = ' <span class="bak90cd32">기본주소</span>';
                        }

                        var location = item[8] == null ? '' : item[8];
                        var address = '<div class="su_title">' + location + defaultAddress + '</div>'
                                    + '<div class="su_title">'
                                    + '    <div class="su_juso_left">'
                                    + '        <p class="font_size11 color_000">' + item[3] + ' ' + item[4] + ' </p>'
                                    + '        <p class="font_size11 color_000">' + item[5] + ' (' + item[2] + ')</p>'
                                    + '    </div>'
                                    + '    <div class="su_juso_right">'
                                    + '    	   <img src="/img/baechul/pen_icn.png" width="23" class="pl15" name="editAddress" style="cursor:pointer"  id="' + item[0] + '"/>'
                                    + '        <img src="/img/baechul/del-icn.png" width="23" class="pl15" name="deleteAddress" style="cursor:pointer" id="' + item[0] + '" />'
                                    + '    </div>'
                                    + '</div>'
                                    + '<div class="line_d p10"></div>';

                        $('#addressList').append(address);
                    },
                    deleteAddress: function () {
                        var params = {
                            producerIdx: $("#hdProducerIdx").val(),
                            addressInfoIdx: $("#hdAddressInfoIdx").val()
                        };

                        Server.ajax("/producer/addressInfoDelete", params, function (respone, status, xhr) {
                            if (respone.value == 0) {
                                location.reload();
                            } else {
                                errorBox("Error Code : " + respone.value);
                            }
                        }, "post", false);
                    },
                    goUrl: function(urlData) {
                        location.href = urlData.url;
                    }
                }
            };

            $(document).on('ready', function () {
                page.init();
                page.fn.addressList();
            });
        })();
    </script>

</body>
</html>