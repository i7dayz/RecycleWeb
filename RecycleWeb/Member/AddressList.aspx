<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressList.aspx.cs" Inherits="RecycleWeb.Member.AddressList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
<meta property="og:type" content="website">
<meta property="og:url" content=""> 
<meta property="og:title" content="한국자원"> 
<meta property="og:image" content=""> 
<meta property="og:description" content="한국자원">

<meta name="title" content="한국자원">
<meta name="subject" content="한국자원">
<meta name="author" content="ck">
<meta name="keywords" content="한국자원">
<meta name="description" content="한국자원">
<meta name="twitter:card" content="summary_large_image">
<meta property="og:title" content="한국자원">
<meta property="og:site_name" content="">
<meta property="og:author" content="">
<meta property="og:type" content="">
<meta property="og:description" content="">
<meta property="og:url" content="">

<title>한국자원</title>

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
            <span class="su_rightbtn">
                <a href="javascript:;" id="btnAddAddress" >추가</a>
            </span>
        </div>
    </header>
    <input type="hidden" runat="server" id="hdProducerIdx" />
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
	    <%--<div class="su_form">--%> 
            <div id="addressList" class="reser mar_t20"></div>
        <%--</div>--%>
    </div>
</form>
</div>
    <script type="text/javascript" src="../script/extention/jquery.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>
    <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script type="text/javascript" src="/script/dropdown.min.js"></script>
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

                    $(document).on('click', 'div[name=address]', function () {
                        location.href = "EditAddress.aspx?id=" + $(this).attr('id');
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
                        var checkbox = "";

                        if (item[7] == "1")
                            checkbox = '<label class="checkbox-wrap"><input type="checkbox" checked onclick="return false" ><i class="check-icon-green"></i></label>';

                        //var address = '<li class="font_size12b color000 pad_l0" name="address" id="' + item[0] + '" style="cursor:pointer">'
                        //            + '    <span class="txt-color5">' + item[8] + '</span>'
                        //            + '    <div class="ui-grid-a">'
                        //            + '        <div class="ui-block-a wpc90">'
                        //            + '            ' + item[3] + ' ' + item[4] + ' '
                        //            + '            ' + item[5] + ' (' + item[2] + ')'
                        //            + '        </div>'
                        //            + '        <div class="ui-block-b wpc10" style="text-align:center">'
                        //            + '            ' + checkbox
                        //            + '        </div>'
                        //            + '    </div>'
                        //            + '</li>';
                        var location = item[8] == null ? '' : item[8];
                        var address = '<div id="' + item[0] + '" name="address" class="pad1010" style="cursor:pointer; border-bottom: 1px solid #e4e4e4">'
                                    + '    <span class="txt-color5 font_size12b color000 pad_l0">' + location + '</span>'
                                    + '    <div class="ui-grid-a font_size12b color000 pad_l0">'
                                    + '        <div class="ui-block-a wpc90">'
                                    + '            <p>' + item[3] + ' ' + item[4] + ' </p>'
                                    + '            <p>' + item[5] + ' (' + item[2] + ')</p>'
                                    + '        </div>'
                                    + '        <div class="ui-block-b wpc10 font_size12b color000 pad_l0" style="text-align:right">'
                                    + '            ' + checkbox
                                    + '        </div>    '
                                    + '    </div>'
                                    + '</div>';

                        $('#addressList').append(address);
                    },
                    goUrl: function(urlData) {
                        location.href = urlData.url;
                    }
                }
            };

            $(document).on('ready', function () {
                page.init();
                page.fn.addressList();
                $('.drawer').drawer();
            });
        })();
    </script>

</body>
</html>