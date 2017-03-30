<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditAddress.aspx.cs" Inherits="RecycleWeb.Member.EditAddress" %>

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
    <link href="../script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css">
</head>
<body class="all" contenteditable="false">
    <div class="wrap join" id="wrap">
        <form runat="server" method="post" action="AddressList.aspx">
            <input type="hidden" id="hdProducerIdx" runat="server" value="" />
            <input type="hidden" id="hdAddressIdx" runat="server" value="" />

            <input type="hidden" id="address1" value="" />
            <input type="hidden" id="address2" value="" />

            <!-- #header -->
            <div class="header" id="header" style="z-index:1;">
                <div class="colgroup fixed">
                    <div class="ci use-search-reset">
                        <a href="javascript:;" class="back-btn">
                            <em class="img-menu ci-logo"><img src="../img/back-btn.png" style="width:8px; height:12px; margin:6px;" alt=""></em>                                                    
                        </a>
                        <span>수거주소록 관리</span>
                    </div>
                </div>
            </div>
            <!-- //#header -->
            <!-- #container -->
            <div class="container" id="container" style="background-color:#fff !important">
                <div class="colgroup">
                    <div class="content fixed" id="content">
                        <div class="header" style="background-color:#90cd32;">
                            <div class="profile">
                                <div class="image-wrapper">
                                    <div class="image">
                                        <img id="profileImg" runat="server" src="">
                                    </div>
                                </div>
                                <div class="name">                      
                                    <label runat="server" id="name" style="color:#ffffff;"></label>
                                </div>
                                <div class="nickname">
                                    <label runat="server" id="nickname" style="color:#ffffff;"></label>
                                </div>
                            </div>
                        </div>
                        <div class="main ui-content">
                            <div class="fixed option-area join">
                                <ul>
                                    <li>
                                        <span class="txt-color5">기본주소</span>
                                        <div class="wpc100">
                                            <input type="text" runat="server" id="txtBaseAddress" class="text-field required input-guide txt-input-guide wpc90" />
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
                                                <input type="text" runat="server" id="txtDetailAddress" class="text-field required input-guide txt-input-guide wpc95" />  
                                            </div>
                                            <div class="ui-block-b wpc25">
                                                <input type="text" runat="server" id="txtZipNo" class="text-field required input-guide txt-input-guide wpc100" />
                                            </div>
                                        </div>
                                    </li>    
                                    <li>
                                        <span class="txt-color5">장소</span>
                                        <div class="wpc100">
                                            <input type="text" runat="server" id="txtLocation" class="text-field required input-guide txt-input-guide wpc100" />
                                        </div>                                 
                                    </li> 
                                    <li>
                                        <label class="checkbox-wrap" style="font-weight:normal;"><input type="checkbox" id="chkMain" name="chkMain" value=""><i class="check-icon-green"></i> 기본 수거주소로 등록</label>                     
                                    </li> 
                                </ul>
                            </div>
                        </div>
                        <div style="padding:15px">
                            <a href="javascript:;" id="btnSave" class="ui-btn ui-corner-all btn-green" style="background-color:#91cd33; color:#ffffff; text-shadow:none; border:0;">저장</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
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
                        if ($("#txtZipNo").val() == "" || $("#address1").val() == "" || $("#address2").val() == "") {
                            infoBox("기본주소를 검색 후 선택하세요.");
                            return;
                        }

                        if ($("#txtDetailAddress").val() == "") {
                            infoBox("세부주소를 입력하세요.");
                            $("#txtDetailAddress").focus();
                            return;
                        }

                        if ($("#txtLocation").val() == "") {
                            infoBox("장소를 입력하세요.");
                            $("#txtLocation").focus();
                            return;
                        }

                        var params = {
                            producerIdx: $("#hdProducerIdx").val(),
                            zipCode: $("#txtZipNo").val(),
                            address1: $("#address1").val(),
                            address2: $.trim($("#address2").val()),
                            detailAddress: $("#txtDetailAddress").val(),
                            ContactNumber: "",
                            isMain: $("#chkMain").is(":checked") ? "1" : "0",
                            addressInfoIdx: $("#hdAddressIdx").val(),
                            addressEtc: $("#txtLocation").val()
                        };

                        Server.ajax("/producer/addressInfoReg", params, function (response, status, xhr) {
                            if (response.value == 0) {
                                if ($("#hdAddressIdx").val() != "") {
                                    infoBox("수거주소가 수정되었습니다");
                                }
                                else {
                                    infoBox("새주소가 등록되었습니다.")
                                }
                            } else {
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    });
                },
                fn: {
                    getDetailAddress: function () {
                        var params = {
                            addressInfoIdx: $("#hdAddressIdx").val(),
                            producerIdx: $("#hdProducerIdx").val()
                        };

                        Server.ajax("/producer/addressInfoDetail", params, function (response, status, xhr) {
                            if (response.value == 0) {
                                $("#txtZipNo").val(response.addressInfoDetail.zipCode),
                                $("#address1").val(response.addressInfoDetail.address1),
                                $("#address2").val(response.addressInfoDetail.address2),
                                $("#txtBaseAddress").val(response.addressInfoDetail.address1 + " " + response.addressInfoDetail.address2),
                                $("#txtDetailAddress").val(response.addressInfoDetail.detailAddress),

                                response.addressInfoDetail.isMain == "1" ? $("#chkMain").prop("checked", true) : $("#chkMain").prop("checked", false),
                                $("#txtLocation").val(response.addressInfoDetail.addressEtc)
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
                    getSelectedAddress: function () {
                        if ($("#addressIdx").val() == null) {
                            window.history.back();
                            return;
                        }
                    }
                }
            };

            $(document).on('ready', function () {
                page.init();
                page.fn.getDetailAddress();
            });
        })();
    </script>
</body>
</html>