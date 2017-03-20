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
        <div data-role="page" class="nd2-no-menu-swipe">
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
            <div class="container" id="container">
                <div class="colgroup">
                    <div class="content fixed" id="content">                            
                        <div class="main ui-content">
                            <div class="fixed option-area">                                                                    
                                <ul>
                                    <li>
                                        <span class="txt-color5">기본주소</span>
                                        <div>
                                            <input type="text" name="txtName" class="text-field required input-guide txt-input-guide wpc90"
                                                placeholder="도로, 건물명, 지번을 검색해보세요."
                                                value="" />
                                            <a href="#" id="btnSearch" class="ui-btn ui-corner-all wpc8 btn-green" style="display:inline-block !important; padding:5px 3px 3px 3px !important; margin:0; float:right;"">
                                                <img src="../img/search.png" style="width:16px; height:16px;">
                                            </a>
                                        </div>
                                        <span class="txt-color5">(예: 부개동 502, 국립중앙박물관, 반포대로 55)</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="address-list">
                            <ul>
                                <li>[도로명] 서울특별시 동작구 상도로87 (상도동)</li>
                                <li>[지번] 서울특별시 동작구 상도동 320-13 상도3치안센터</li>
                                <li>[우편번호] 06953</li>
                            </ul>
                                
                            <ul>
                                <li>[도로명] 서울특별시 동작구 상도로87 (상도동)</li>
                                <li>[지번] 서울특별시 동작구 상도동 320-13 상도3치안센터</li>
                                <li>[우편번호] 06953</li>
                            </ul>
                                
                            <ul>
                                <li>[도로명] 서울특별시 동작구 상도로87 (상도동)</li>
                                <li>[지번] 서울특별시 동작구 상도동 320-13 상도3치안센터</li>
                                <li>[우편번호] 06953</li>
                            </ul>
                                
                            <ul>
                                <li>[도로명] 서울특별시 동작구 상도로87 (상도동)</li>
                                <li>[지번] 서울특별시 동작구 상도동 320-13 상도3치안센터</li>
                                <li>[우편번호] 06953</li>
                            </ul>
                                
                            <ul>
                                <li>[도로명] 서울특별시 동작구 상도로87 (상도동)</li>
                                <li>[지번] 서울특별시 동작구 상도동 320-13 상도3치안센터</li>
                                <li>[우편번호] 06953</li>
                            </ul>
                                
                            <ul>
                                <li>[도로명] 서울특별시 동작구 상도로87 (상도동)</li>
                                <li>[지번] 서울특별시 동작구 상도동 320-13 상도3치안센터</li>
                                <li>[우편번호] 06953</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div> <!-- //container -->
        </div>
    </div> <!-- //wrap -->

    <script type="text/javascript" src="script/extention/jquery.js"></script>
        
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
                },
                fn: {
                }
            };

            $(document).on('ready', function () {
                page.init();
            });
        })();
    </script>
</body>
</html>