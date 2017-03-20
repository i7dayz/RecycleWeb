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
                            수거신청
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
                            <div class="fixed option-area join">
                                <ul>
                                    <li>
                                        <span class="txt-color5">이름</span>
                                        <div><input type="text" name="txtName" class="text-field required input-guide txt-input-guide wpc100" title="이름을 입력하세요." /></div>
                                    </li>
                                    <li>
                                        <span class="txt-color5">연락처</span>
                                        <div class="wpc100">
                                            <input type="tel" name="txtTel" maxlength="13" class="text-field required input-guide txt-input-guide wpc100"  />
                                        </div>                                 
                                    </li>
                                    <li>
                                        <span class="txt-color5">기본주소</span>
                                        <div class="wpc100">
                                            <input type="text" class="text-field required input-guide txt-input-guide wpc70" />
                                            <a href="#" id="btnChangeAddress" class="ui-btn ui-corner-all wpc25 btn-green" style="display:inline-block !important; padding:5px 3px 5px 3px !important;margin:0; font-weight:normal; float:right;">
                                                변경
                                            </a>
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
                                                <input type="text" class="text-field required input-guide txt-input-guide wpc95" />  
                                            </div>
                                            <div class="ui-block-b wpc25">
                                                <input type="text" class="text-field required input-guide txt-input-guide wpc100" />
                                            </div>
                                        </div>
                                    </li>   
                                    <li>
                                        <span class="txt-color5">희망수거일시</span>    
                                        <div class="wpc100">
                                            <input type="text" class="text-field required input-guide txt-input-guide wpc70" 
                                                value="2017년 3월 3일 17:00">
                                            <a href="#" id="btnChangeDate" class="ui-btn ui-corner-all wpc25 btn-green" style="display:inline-block !important; padding:5px 3px 5px 3px !important; margin:0; font-weight:normal; float:right;">
                                                변경
                                            </a>
                                        </div> 
                                    </li> 
                                </ul>
                            </div>
                        </div>
                        <div class="footer" style="padding:10px;">
                            <a href="#" id="btnRequest" class="ui-btn ui-corner-all btn-green">수거신청</a>
                        </div>
                    </div>
                </div>
            </div> <!-- //container -->
        </div> <!-- //page -->
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
                    $(document).on('click', '#btnRequest', function () {
                        location.href = "RequestDone.aspx";
                    });
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