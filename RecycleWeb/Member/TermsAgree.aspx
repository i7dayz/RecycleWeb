<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TermsAgree.aspx.cs" Inherits="RecycleWeb.Member.TermsAgree" %>

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
        #terms, #policy {
            width: 99%;
            height: auto !important;
            overflow-y: scroll;
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            margin-top: 15px;
            font-size: 13px;
            padding: 5px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
    </style>
</head>
<body class="all" contenteditable="false">
    <div class="wrap" id="wrap">
        <!-- #header -->
        <div class="header" id="header">
            <div class="colgroup fixed">
                <div class="ci use-search-reset">
                    <a href="#leftmenu" class="">
                        <em class="img-menu ci-logo"><img src="../img/back-btn.png" style="width:8px; height:12px; margin:6px;" alt=""></em>                            
                    </a>
                    <span>이용약관</span>
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
                    <div class="main ui-content">
                        <div class="ui-grid-solo">
                            <div class="bb-1 pb10 mb15">
                                <label class="checkbox-wrap"><input type="checkbox" id="allAgree" name="allAgree" value=""><i class="check-icon-green"></i> 전체동의</label>
                                <div class="ml15">이용약관(필수), 개인정보 수집 및 이용 정책(필수), 프로모션 안내 SMS/메일 수신(선택)에 모두 동의합니다.</div>
                            </div>

                            <div class="mb15">
                                <label class="checkbox-wrap"><input type="checkbox" id="termsAgree" name="termsAgree" value=""><i class="check-icon-green"></i> 서비스 이용약관 <span class="color_red">(필수)</span></label>
                                <textarea id="terms" rows="8" readonly="readonly"></textarea>
                            </div>

                            <div class="mb15">
                                <label class="checkbox-wrap"><input type="checkbox" id="policyAgree" name="policyAgree" value=""><i class="check-icon-green"></i> 개인정보 수집 및 이용 정책 <span class="color_red">(필수)</span></label>
                                <textarea id="policy" rows="8" readonly="readonly"></textarea>
                            </div>
                                
                            <div class="bb-1 pb10 mb15">
                                <label class="checkbox-wrap"><input type="checkbox" id="smsAgree" name="smsAgree" value=""><i class="check-icon-green"></i> 이벤트 등 프로모션 알림 SMS 수신 <span class="color_red">(선택)</span></label>
                            </div>

                            <div class="bb-1 pb10">
                                <label class="checkbox-wrap"><input type="checkbox" id="emailAgree" name="emailAgree" value=""><i class="check-icon-green"></i> 이벤트 등 프로모션 알림 메일 수신 <span class="color_red">(선택)</span></label>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="ui-grid-a">
                            <div class="ui-block-a">
                                <a href="#" id="btnDisAgree" class="ui-btn ui-corner-all btn-gray" style="margin-left:10px;margin-right:5px">동의안함</a>
                            </div>
                            <div class="ui-block-b">
                                <a href="#" id="btnAgree" class="ui-btn ui-corner-all btn-green" style="margin-left:5px;margin-right:10px">동의함</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                    $.ajax({
                        url: "../terms.txt",
                        dataType: "text",
                        success: function (data) {
                            $("#terms").text(data);
                        }
                    });

                    $.ajax({
                        url: "../policies.txt",
                        dataType: "text",
                        success: function (data) {
                            $("#policy").text(data);
                        }
                    });
                },
                initEvent: function () {        
                    $('#btnDisAgree').click(function() {
                        //location.href = "terms_agree.html";
                    });               
                    $('#btnAgree').click(function() {
                        location.href = "Join.aspx";
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