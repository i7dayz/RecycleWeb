<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestDone.aspx.cs" Inherits="RecycleWeb.Collection.RequestDone" %>

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
                                수거신청완료
                            </div>    
                        </div>
                    </div>
                </div>
                <!-- //#header -->
                <!-- #container -->
                <div class="container" id="container">
                    <div class="colgroup">                                                           
                        <div style="background-color:#91cd33; color:#ffffff; padding:10px;">
                            수거신청이 완료되었습니다. 기사님이 연락예정입니다.
                        </div>
                        <div class="content fixed" id="content">                            
                            <div class="main ui-content">
                                <div class="fixed option-area">     
                                    <ul>
                                        <li>
                                            <div class="wpc100" style="text-align:center;">
                                                <img src="../temp/cef1f56553fba92d9e95c19e5a34c09a.jpg" style="width:120px; height:auto;">
                                            </div>
                                        </li>
                                        <li>
                                            <span style="color:#91cd33">[수거요청품목]</span>
                                            <div>
                                                <input type="text" name="txtReqList" class="text-field required input-guide txt-input-guide wpc100"
                                                    value="고철 1, 헌옷 3, 비철 5, 병 2"/>                                        
                                            </div>
                                        </li>
                                        <li>
                                            <span class="txt-color5">수거담당자</span>
                                            <div>
                                                <input type="text" name="txtName" class="text-field required input-guide txt-input-guide wpc100"
                                                    value="손혁기 기사님" />
                                            </div>
                                        </li>
                                        <li>
                                            <span class="txt-color5">연락처</span>
                                            <div class="wpc100">
                                                <input type="text" class="text-field required input-guide txt-input-guide wpc100"
                                                    value="010-1111-2222" />
                                            </div>                                 
                                        </li>
                                        <li>
                                            <span class="txt-color5">희망수거일시</span>    
                                            <div class="wpc100">
                                                <input type="text" class="text-field required input-guide txt-input-guide wpc100" 
                                                    value="2017년 3월 3일 화요일 17:00">
                                            </div> 
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="footer" style="padding:10px">
                                <div class="ui-grid-a">
                                    <div class="ui-block-a">
                                        <a href="#" id="btnCancel" class="ui-btn ui-corner-all btn-gray" style="">취소</a>
                                    </div>
                                    <div class="ui-block-b">
                                        <a href="#" id="btnConfirm" class="ui-btn ui-corner-all btn-green" style="">확인</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- //container -->
            </div>
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