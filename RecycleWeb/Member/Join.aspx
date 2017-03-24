<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Join.aspx.cs" Inherits="RecycleWeb.Member.Join" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>고물상</title>
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,width=device-width">

    <link href="../css/layout.css" rel="stylesheet" type="text/css" media="all">
    <link href="../css/adjustment.css" rel="stylesheet" type="text/css" media="all">

    <link href="../script/extention/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
    
    <style>
    </style>
</head>
<body class="all" contenteditable="false">
    <div class="wrap join" id="wrap">
        <!-- #header -->
        <div class="header" id="header" style="z-index:1;">
            <div class="colgroup fixed">
                <div class="ci use-search-reset">
                    <a href="javascript:;" class="back-btn">
                        <em class="img-menu ci-logo"><img src="../img/back-btn.png" style="width:8px; height:12px; margin:6px;" alt=""></em>                                                    
                    </a>
                    <span>회원정보입력</span>
                </div>
                <div class="gnb" id="gnb">
                </div>
            </div>
        </div>
        <!-- //#header -->
        <!-- #container -->
        <div class="container" id="container" style="background-color:#fff !important">
            <div class="colgroup">
                <div class="content fixed" id="content">
                    <div class="header-join">
                        <div class="profile">
                            <div class="image">
                                <img src="../img/character-02.png" style="width:100px; height:auto;">
                            </div>
                        </div>
                    </div>
                    <div class="main ui-content">
                        <div class="fixed option-area join">
                            <ul>
                                <li>
                                    <span class="txt-color5">이름</span>
                                    <div><input type="text" name="txtName" class="text-field required input-guide txt-input-guide wpc100" title="이름을 입력하세요." /></div>
                                </li>
                                <li>
                                    <span class="txt-color5">닉네임</span>
                                    <div class="ui-grid-a">
                                            <input type="text" name="txtNickName" class="text-field required input-guide txt-input-guide wpc70" title="닉네임을 입력하세요." />
                                            <a href="javascript:;" id="btnCheckDup" class="ui-btn ui-corner-all ui-mini btn-green wpc25" style="display:inline-block !important; padding:5px 3px 5px 3px !important;margin:0; float:right;">
                                                중복확인
                                            </a>                                   
                                    </div>                                    
                                </li>
                                <li>
                                    <span class="txt-color5">연락처</span>
                                    <div class="wpc100">
                                        <input type="tel" name="txtTel" maxlength="13" class="text-field required input-guide txt-input-guide wpc70"  />
                                        <a href="javascript:;" id="btnSendAuthNum" class="ui-btn ui-corner-all ui-mini wpc25 btn-green" style="display:inline-block !important; padding:5px 3px 5px 3px !important;margin:0; float:right;">
                                            인증번호 받기
                                        </a>
                                    </div>                                 
                                </li>
                                <li>
                                    <span class="txt-color5">인증번호입력</span>
                                    <div class="wpc100">
                                        <input type="text" class="text-field required input-guide txt-input-guide wpc70" />
                                        <a href="javascript:;" id="btnConfirmAuthNum" class="ui-btn ui-corner-all ui-mini wpc25 btn-green" style="display:inline-block !important; padding:5px 3px 5px 3px !important;margin:0; float:right;">
                                            인증하기
                                        </a>
                                    </div>                                 
                                </li>
                                <li>
                                    <span class="txt-color5">기본주소</span>
                                    <div class="wpc100">
                                        <input type="text" class="text-field required input-guide txt-input-guide wpc90" id="txtBaseAddress" />
                                        <div id="btnSearchAddress" class="ui-btn ui-corner-all ui-mini wpc7 btn-green" style="display:inline-block !important; padding:5px 3px 3px 3px !important;margin:0; float:right;">
                                            <img src="../img/search.png" style="width:16px; height:16px;">
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
                                            <input type="text" class="text-field required input-guide txt-input-guide wpc95" id="txtDetailAddress" />  
                                        </div>
                                        <div class="ui-block-b wpc25">
                                            <input type="text" class="text-field required input-guide txt-input-guide wpc100" id="txtZipNo" />
                                        </div>
                                    </div>
                                </li>    
                            </ul>
                        </div>
                    </div>
                    <div style="padding:15px">
                        <a href="javascript:;" id="btnSave" class="ui-btn ui-corner-all btn-green" style="background-color:#91cd33; color:#ffffff; text-shadow:none; border:0;">기본정보 저장</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="modal-wrapper">
      <div id="modal-overlay"></div>
      <div id="modal-content">
            <div class="wrap" id="wrap">            
                <!-- #header -->
                <div class="header" id="header" style="z-index:2;">
                    <div data-role="header" class="wow fadeIn">
                        <div class="ci use-search-reset" style="width:100%">
                            <a href="javascript:;" class="back-btn">
                                <em class="img-menu ci-logo"><img src="../img/back-btn.png" style="width:8px; height:12px; margin:6px;" alt=""></em>                              
                            </a>
                            <div>
                                주소 검색
                            </div>
                        </div>
                    </div>
                </div>
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
                                        <ul>
                                            <li>
                                                <span class="txt-color5">기본주소</span>
                                                <div>
                                                    <input type="search" id="keyword" name="keyword" class="text-field required input-guide txt-input-guide wpc90"
                                                        placeholder="도로, 건물명, 지번을 검색해보세요."
                                                        value="" />
                                                    <a href="javascript:;" id="btnSearch" class="ui-btn ui-corner-all wpc8 btn-green" style="display:inline-block !important; padding:5px 3px 3px 3px !important; margin:0; float:right;"">
                                                        <img src="../img/search.png" style="width:16px; height:16px;">
                                                    </a>
                                                </div>
                                                <span class="txt-color5">(예: 부개동 502, 국립중앙박물관, 반포대로 55)</span>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                            </div>
                            <div class="address-list"></div>
                            <div class="address-paginate">
                                <a href="javascript:;" id="btnSearchNext" class="ui-btn ui-corner-all btn-gray">다음</a>
                            </div>
                        </div>
                    </div>
                </div> <!-- //container -->
            </div> <!-- //wrap -->
        </div>
    </div>

    <script type="text/javascript" src="../script/extention/jquery.js"></script>
        
    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
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

                    $("#btnSave").click(function() {
                        location.href = "../Main.aspx";
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
                        $("#txtZipNo").val($(this).find("#zipNo").text());
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
                },
                fn: {                    
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
                                alert("에러발생"); // AJAX 호출 에러
                            }
                        });
                    },
                    makeListJson: function (item) {
                        var html = "";
                        // jquery를 이용한 JSON 결과 데이터 파싱
                        $(item.results.juso).each(function (index) {
                            html += "<ul id='address'>";
                            html += "   <li>[도로명] <span id='roadAddrPart1'>" + this.roadAddrPart1 + "</span><span id='roadAddrPart2'>" + this.roadAddrPart2 + "</span></li>";
                            html += "   <li>[지번] <span id='jibunAddr'>" + this.jibunAddr + "</span></li>";
                            html += "   <li>[우편번호] <span id='zipNo'>" + this.zipNo + "</span></li>";
                            html += "</ul>";
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