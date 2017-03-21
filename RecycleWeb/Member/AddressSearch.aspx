<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressSearch.aspx.cs" Inherits="RecycleWeb.Member.AddressSearch" %>

<!DOCTYPE html>
<html>
<head runat="server">
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
    <div class="wrap" id="wrap">            
        <!-- #header -->
        <div class="header" id="header">
            <div data-role="header" class="wow fadeIn">
                <div class="ci use-search-reset" style="width:100%">
                    <a href="#panel">
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
                                            <a href="#" id="btnSearch" class="ui-btn ui-corner-all wpc8 btn-green" style="display:inline-block !important; padding:5px 3px 3px 3px !important; margin:0; float:right;"">
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
                        <a href="#" id="btnSearchNext" class="ui-btn ui-corner-all btn-gray">다음</a>
                    </div>
                </div>
            </div>
        </div> <!-- //container -->
    </div> <!-- //wrap -->

    <script type="text/javascript" src="../script/extention/jquery.js"></script>
        
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
                    if ($('.address-list').html() == '') {
                        $('#btnSearchNext').hide();
                    } else {
                        $('#btnSearchNext').show();
                    }

                    $(document).on('click', '#btnSearch', function () {
                        $(".address-list").html("");
                        page.fn.getAddress();
                    });

                    $(document).on('click', '#btnSearchNext', function () {
                        var currentPage = parseInt($("input[name='currentPage']").val());
                        $("input[name='currentPage']").val(currentPage + 1);

                        page.fn.getAddress();
                    });
                    
                    $(document).on('keypress', '#keyword', function (e) {
                        if (e.which == 13) {
                            if ($(this).val() != "") {
                                page.fn.getAddress();
                            }
                        }
                    });
                },
                fn: {
                    getAddress: function () {
                        // AJAX 주소 검색 요청
                        $.ajax({
                            url:"http://www.juso.go.kr/addrlink/addrLinkApiJsonp.do" // 주소검색 OPEN API URL
                            , type:"post" 
                            , data:$("#form").serialize() // 요청 변수 설정
                            , dataType:"jsonp" // 크로스도메인으로 인한 jsonp 이용, 검색결과형식 JSON 
                            , crossDomain:true 
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
                            , error: function(xhr,status, error){
                                alert("에러발생"); // AJAX 호출 에러
                            }
                        });
                    },
                    makeListJson: function (item) {
                        var html = "";
                        // jquery를 이용한 JSON 결과 데이터 파싱
                        $(item.results.juso).each(function (index) {
                            html += "<ul>";
                            html += "   <li>[도로명] " + this.roadAddrPart1 + this.roadAddrPart2 + "</li>";
                            html += "   <li>[지번] " + this.jibunAddr + "</li>";
                            html += "   <li>[우편번호] " + this.zipNo + "</li>";
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