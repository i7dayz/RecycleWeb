﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditInfo.aspx.cs" Inherits="RecycleWeb.Member.EditInfo" %>
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

    <%--<script src="https://code.jquery.com/jquery-latest.js"></script>--%>
    <link rel="stylesheet" href="../css/modal.css" />
    <link href="../script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />
    <style>
#wrap{position:relative;margin:0 auto;height:100%;max-width:780px;}
  
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
</style>
</head>
<body>
<div id="body">
        <header>
            <div class="su_header" style="z-index:1">
                <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>
                회원정보입력
            </div>
        </header>
        <div class="container" style="">
	        <div class="ctext pad20 back_green">
                <%--<a href="#" class="openMask"><img src="/img/baechul/kko-prf-1.png" width="100"></a>--%>
                <div class="image-wrapper">
                    <div class="image">
                        <img runat="server" id="profileImg" src="/img/person64x64.png">
                    </div>
                </div>
            </div>
    
	        <div class="su_form">    	
                <form runat="server" id="joinForm" method="post" action="/Main.aspx" data-ajax="false">
                    <input type="hidden" id="producerIdx" runat="server" value="" />
                    <input type="hidden" id="kakaoId" runat="server" value="" />
                    <input type="hidden" id="kakaoNickname" runat="server" value="" />
                    <input type="hidden" id="kakaoEmail" runat="server" value="" />
                    <input type="hidden" id="kakaoThumbnailImage" runat="server" value="" />
                    <input type="hidden" id="kakaoProfileImage" runat="server" value="" />
                    <input type="hidden" id="accessToken" runat="server" value="" />
                    <input type="hidden" id="refreshToken" runat="server" value="" />

                    <input type="hidden" runat="server" id="address1" value="" />
                    <input type="hidden" runat="server" id="address2" value="" />
                    <input type="hidden" id="contactNumber" runat="server" value="" />

                    <div class="su_title pdt20">이름</div>
                    <div><input type="text" runat="server" id="name" name="" value="" class="su_input" readonly="readonly"></div>
        
                    <div class="su_title pdt20">닉네임</div>
                    <div><input type="text" runat="server" id="nickname" name="" value="" class="su_input" readonly="readonly"/></div>
            
                    <div class="su_title pdt20">연락처</div>
                    <div class="su_adr">
                        <div class="su_juso_left"><input type="text" runat="server" id="txtContactNumber1" name="" value="" class="su_hp1"/> - <input type="text" runat="server" id="txtContactNumber2" name="" value="" class="su_hp2" /> - <input type="text" runat="server" id="txtContactNumber3" name="" value="" class="su_hp3" /></div>
                        <div class="su_juso_right"><img src="/img/baechul/btn-num-1.png" id="btnReqToken" height="40" style="cursor:pointer" /></div>
                    </div>

                    <div id="reqTokenArea">
                        <div class="su_title pdt20 color90cd32">인증번호입력</div>
                        <div class="su_adr">
                            <div class="su_juso_left"><input type="text" name="" value="" class="su_input_juso01 b90cd32" id="txtToken" /> </div>
                            <div class="su_juso_right"><img src="/img/baechul/btn-num-2.png" id="btnReqTokenCheck" height="40" style="cursor:pointer"/></div>
                        </div>
                    </div>
            
                    <div class="su_title pdt20">기본주소</div>
                    <div class="su_adr">
                        <div class="su_juso_left8"><input type="text" name="" value="" class="su_input_juso01" runat="server" id="txtBaseAddress"/></div>
                        <div class="su_juso_right2"><img src="/img/baechul/i-sch.png" width="40" style="margin-top: -10px;cursor:pointer" id="btnSearchAddress"></div>
                    </div>
                    <div class="su_title">
                        <div class="su_juso_left">세부주소</div>
                        <div class="su_juso_right">우편번호</div>
                    </div>
                    <div class="su_adr">
                        <div class="su_juso_left"><input type="text" name="" value="" class="su_input_juso01" runat="server" id="txtDetailAddress" /> </div>
                        <div class="su_juso_right"><input type="text" name="" value="" class="su_input_juso02" runat="server" id="txtZipNo"/> </div>
                    </div>

                    <div class="su_submit pdt30"><div class="btn_grean" id="btnSave" style="cursor:pointer">저장</div></div>
                </form>
            </div>
        </div>

        <div id="modal-wrapper">
            <div id="modal-overlay"></div>
            <div id="modal-content">
                <div class="wrap" id="wrap"> 
                <header>
                    <div class="su_header" style="z-index:10000">
                        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>
                        주소검색
                    </div>
                </header>
                    <!-- //#header -->
                    <!-- #container -->
                    <div class="container" id="container" style="background-color:#fff !important">
                        <div class="colgroup">
                            <div class="content fixed" id="content">                            
                                <div class="main ui-content">
                                    <div class="fixed option-area"> 
                                        <form name="form" id="form" method="post">
                                            <input type="hidden" name="currentPage" value="1" /> <!-- 요청 변수 설정 (현재 페이지) -->
                                            <input type="hidden" name="countPerPage" value="10" /> <!-- 요청 변수 설정 (페이지당 출력 개수) -->
                                            <input type="hidden" name="resultType" value="json" /> <!-- 요청 변수 설정 (검색결과형식 설정, json) --> 
                                            <input type="hidden" name="confmKey" value="U01TX0FVVEgyMDE1MTIxODE0MTU0NTA=" />	<!-- 요청 변수 설정 (승인키) -->
                                            <input type="hidden" name="totalCount" value="0" />
                                            <input style="display:none;">   
	                                        <div class="su_form">   
                                                <%--<div>
                                                    <input type="search" id="keyword" name="keyword" class="text-field required input-guide txt-input-guide wpc90"
                                                        placeholder="도로, 건물명, 지번을 검색해보세요."
                                                        value="" />
                                                    <a href="javascript:;" id="btnSearch" class="ui-btn ui-corner-all wpc8 btn-green" style="display:inline-block !important; padding:5px 3px 3px 3px !important; margin:0; float:right;"">
                                                        <img src="../img/search.png" style="width:16px; height:16px;">
                                                    </a>
                                                </div>
                                                <span class="txt-color5">(예: 부개동 502, 국립중앙박물관, 반포대로 55)</span>--%>
                                            
                                                <div class="su_title pdt20">기본주소</div>
                                                <div class="su_adr">
                                                    <div class="su_juso_left8"><input type="text" id="keyword" name="keyword"
                                                        placeholder="도로, 건물명, 지번을 검색해보세요." value="" class="su_input_juso01" /></div>
                                                    <div class="su_juso_right2"><img src="/img/baechul/i-sch.png" width="40" style="margin-top: -10px;" id="btnSearch"></div>
                                                </div>
			                                    <p><span class="font_size12 colorccc">(예: 부개동 502, 국립중앙박물관, 반포대로 58)</span></p>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="address-list"></div>
                                <p class="su_btn" id="btnSearchNext" style="cursor:pointer">다음 검색</p>
                            </div>
                        </div>
                    </div> <!-- //container -->
                </div> <!-- //wrap -->
            </div>
        </div>
    
    <iframe src="../temp.html"  style="visibility:hidden;display:none" scrolling="no"></iframe>

    <script type="text/javascript" src="../script/extention/jquery.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>
    <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script src="../script/drawer.min.js" charset="utf-8"></script>
        
    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    $("#reqTokenArea").hide();
                    $("#modal-wrapper").hide();
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
                    }).on('click', '#btnSearchAddress', function () {
                        page.fn.resetAddressForm();
                        window.history.pushState({}, 'modal', '/modal');
                        modal.open();
                    });

                    window.onpopstate = history.onpushstate = function (e) {
                        if (window.location.href.split('/').pop().indexOf('modal') === -1) { // 마지막 segment가 cards라면 모달이 아닌 리스트인 상태이어야한다.
                            modal.close(); // 현재의 모달을 닫는다.
                        }
                    }
                    
                    $(document).on('click', '.back-btn', function () {
                        window.history.back();
                    });

                    if ($('.address-list').html() == '') {
                        $('#btnSearchNext').hide();
                    } else {
                        $('#btnSearchNext').show();
                    }

                    $(document).on('click', '#btnSearch', function () {
                        page.fn.resetAddressForm();
                        page.fn.getAddress();
                    });

                    $(document).on('click', '#btnSearchNext', function () {
                        var currentPage = parseInt($("input[name='currentPage']").val());
                        $("input[name='currentPage']").val(currentPage + 1);

                        page.fn.getAddress();
                    });

                    $(document).on('click', '#address', function () {
                        $("#txtBaseAddress").val($(this).find("#roadAddrPart1").text() + " " + $(this).find("#roadAddrPart2").text());
                        $("#address1").val($(this).find("#roadAddrPart1").text());
                        $("#address2").val($(this).find("#roadAddrPart2").text());

                        $("#txtZipNo").val($(this).find("#zipNo").text());
                        $("#txtDetailAddress").val("");
                        $("#txtDetailAddress").focus();
                        window.history.back();
                    });

                    $(document).on('keypress', '#keyword', function (e) {
                        if (e.which == 13) {
                            if ($(this).val() != "") {
                                page.fn.resetAddressForm();
                                page.fn.getAddress();
                            }
                        }
                    });

                    $(document).on('click', '#btnSave', function () {
                        var params = {
                            producerIdx: $("#producerIdx").val(),
                            producerStoreName: "",
                            producerContactNumber: $("#txtContactNumber").val(),
                            zipCode: $("#txtZipNo").val(),
                            address1: $("#address1").val(),
                            address2: $.trim($("#address2").val()),
                            detailAddress: $("#txtDetailAddress").val()
                        };

                        Server.ajax("/producer/userInfoModify", params, function (response, status, xhr) {
                            if (response.value == 0) {
                                location.href = "/Main.aspx";
                            } else {
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    });

                    $(document).on('click', '#btnReqToken', function () {
                        if ($("#txtContactNumber").val() == $("#contactNumber").val()) {
                            errorBox("변경할 휴대전화번호를 입력하세요");
                            return;
                        }
                        page.fn.getSmsToken();
                        $("#reqTokenArea").show();
                        $("#btnReqToken").attr("src", "/img/baechul/btn-num-3.png");
                    });
                    
                    $(document).on('click', '#btnReqTokenCheck', function () {
                        page.fn.chkSmsToken();
                    });
                },
                attr: {
                    smsChcked: false
                },
                fn: {
                    getSmsToken: function () {                        
                        var phoneNumber = $("#txtContactNumber").val();

                        if (phoneNumber == null || phoneNumber == "" || phoneNumber.length !== 11) {
                            errorBox("휴대전화번호를 입력하세요.");
                            return;
                        }

                        var params = {
                            phoneNumber: phoneNumber
                        };

                        Server.ajax("/producer/smsTokenCreate", params, function (response, status, xhr) {
                            if (response.value == 0) {
                                infoBox("인증번호가 발송되었습니다.");
                            } else {
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    },
                    chkSmsToken: function () {
                        var phoneNumber = $("#txtContactNumber").val();
                        var token = $("#txtToken").val();

                        if (phoneNumber == null || phoneNumber == "" || phoneNumber.length !== 11) {
                            errorBox("휴대전화번호를 입력하세요."); return;
                        }

                        if (token == null || token == "") {
                            errorBox("인증번호를 입력하세요."); return;
                        }

                        var params = {
                            phoneNumber: phoneNumber,
                            token: token
                        };

                        Server.ajax("/producer/smsTokenCheck", params, function (response, status, xhr) {
                            if (response.value == 0) {
                                infoBox("휴대전화번호 인증이 완료되었습니다.");
                                page.attr.smsChcked = true;

                                $("#txtContactNumber").attr("readonly", "readonly");
                                $("#reqTokenArea").hide();
                                $("#btnReqToken").hide();
                            } else {
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    },
                    saveInfo: function () {
                        var phoneNumber = $("#txtContactNumber").val();

                        if (phoneNumber.length != 11) {
                            errorBox("휴대전화번호를 입력하세요");
                            return;
                        }

                        if (!page.attr.smsChcked) {
                            errorBox("휴대전화번호 인증이 필요합니다.");
                            return;
                        }

                        if ($("#txtZipNo").val() == "" || $("#address1").val() == "") {
                            errorBox("주소를 입력하세요.");
                            return;
                        }

                        var params = {
                            producerIdx: $("#producerIdx").val(),
                            producerStoreName: "",
                            producerContactNumber: phoneNumber,
                            zipCode: $("#txtZipNo").val(),
                            address1: $("#address1").val(),
                            address2: $.trim($("#address2").val()),
                            detailAddress: $("#txtDetailAddress").val()
                        };

                        Server.ajax("/producer/userInfoModify", params, function (response, status, xhr) {
                            if (response.value == 0) {
                                infoBoxWithCallback("회원정보가 수정되었습니다.", page.fn.goUrl, { url: "Info.aspx" });
                            } else {
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    },
                    //특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
                    checkSearchedWord: function(obj){
	                    if(obj.length >0){
                                //특수문자 제거
                                var expText = /[%=><]/ ;
                                if(expText.test(obj) == true){
                                    alert("특수문자를 입력 할수 없습니다.") ;
                                    obj = obj.split(expText).join(""); 
                                    return false;
                                }
		
                                //특정문자열(sql예약어의 앞뒤공백포함) 제거
                                var sqlArray = new Array(
                                    //sql 예약어
                                    "OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC", "UNION",  "FETCH", "DECLARE", "TRUNCATE" 
                                );
		
                                var regex ;
                                var regex_plus ;
                                for(var i=0; i<sqlArray.length; i++){
                                    regex = new RegExp("\\s" + sqlArray[i] + "\\s", "gi");
                                    if (regex.test(obj) == true) {
                                        alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
                                        obj = obj.replace(regex, "");
                                        return false;
                                    }
			
                                    regex_plus = new RegExp( "\\+" + sqlArray[i] + "\\+","gi") ;
                                    if (regex_plus.test(obj) == true) {
                                        alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
                                        obj = obj.replace(regex_plus, "");
                                        return false;
                                    }
                                }
                            }
	                    return true ;
                    },
                    resetAddressForm() {
                        if (window.location.href.split('/').pop().indexOf('modal') === -1) {
                            $("#keyword").val("");
                        }
                        $(".address-list").html("");
                        $("input[name='currentPage']").val("1");
                        $('#btnSearchNext').hide();
                    },
                    getAddress: function () {
                        page.fn.checkSearchedWord($("#keyword").val());

                        // AJAX 주소 검색 요청
                        $.ajax({
                            url: "http://www.juso.go.kr/addrlink/addrLinkApiJsonp.do" // 주소검색 OPEN API URL
                            , type: "post"
                            , data: $("#form").serialize() // 요청 변수 설정
                            , dataType: "jsonp" // 크로스도메인으로 인한 jsonp 이용, 검색결과형식 JSON 
                            , crossDomain: true
                            , success: function (jsonStr) { // jsonStr : 주소 검색 결과 JSON 데이터	
                                var errCode = jsonStr.results.common.errorCode;
                                var errDesc = jsonStr.results.common.errorMessage;
                                if (errCode != "0") {
                                    alert(errCode + "=" + errDesc);
                                } else {
                                    if (jsonStr != null) {
                                        page.fn.makeListJson(jsonStr); // 결과 JSON 데이터 파싱 및 출력
                                        $("input[name='totalCount'").val(jsonStr.results.common.totalCount);

                                        var listCount = $(".address-list").children().length;
                                        var totalCount = $("input[name='totalCount'").val();

                                        if (listCount == totalCount) {
                                            $('#btnSearchNext').hide();
                                        } else {
                                            $('#btnSearchNext').show();
                                        }
                                    }
                                }
                            }
                            , error: function (xhr, status, error) {
                                errorBox(getErrMsg("에러발생"));
                            }
                        });
                    },
                    makeListJson: function (item) {
                        var html = "";
                        // jquery를 이용한 JSON 결과 데이터 파싱
                        $(item.results.juso).each(function (index) {
                            //html += "<ul id='address'>";
                            //html += "   <li>[도로명] <span id='roadAddrPart1'>" + this.roadAddrPart1 + "</span><span id='roadAddrPart2'>" + this.roadAddrPart2 + "</span></li>";
                            //html += "   <li>[지번] <span id='jibunAddr'>" + this.jibunAddr + "</span></li>";
                            //html += "   <li>[우편번호] <span id='zipNo'>" + this.zipNo + "</span></li>";
                            //html += "</ul>";
                            
                            html += "<div class='reser2' id='address'>";
                            html += "    <div class='pad1010'>";
                            html += "        <p class='font_size12b color000 pad_l0'>[도로명] <span id='roadAddrPart1'>" + this.roadAddrPart1 + "</span><span id='roadAddrPart2'>" + this.roadAddrPart2 + "</span></p>";
                            html += "        <p class='font_size12b color000'>[지번] <span id='jibunAddr'>" + this.jibunAddr + "</span></p>";
                            html += "        <p class='font_size12b color000'>[우편번호] <span id='zipNo'>" + this.zipNo + "</span></p>";
                            html += "    </div>";
                            html += "</div>";
                        });

                        $(".address-list").append(html);
                    },
                }
            };

            $(document).on('ready', function () {
                page.init();
            });
        })();
    </script>


</body>
</html>