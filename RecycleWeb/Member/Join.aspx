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
    <div class="wrap" id="wrap">
        <!-- #header -->
        <div class="header" id="header">
            <div class="colgroup fixed">
                <div class="ci use-search-reset">
                    <a href="#leftmenu" class="">
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
                                            <a href="#" id="btnCheckDup" class="ui-btn ui-corner-all ui-mini btn-green wpc25" style="display:inline-block !important; padding:5px 3px 5px 3px !important;margin:0; float:right;">
                                                중복확인
                                            </a>                                   
                                    </div>                                    
                                </li>
                                <li>
                                    <span class="txt-color5">연락처</span>
                                    <div class="wpc100">
                                        <input type="tel" name="txtTel" maxlength="13" class="text-field required input-guide txt-input-guide wpc70"  />
                                        <a href="#" id="btnSendAuthNum" class="ui-btn ui-corner-all ui-mini wpc25 btn-green" style="display:inline-block !important; padding:5px 3px 5px 3px !important;margin:0; float:right;">
                                            인증번호 받기
                                        </a>
                                    </div>                                 
                                </li>
                                <li>
                                    <span class="txt-color5">인증번호입력</span>
                                    <div class="wpc100">
                                        <input type="text" class="text-field required input-guide txt-input-guide wpc70" />
                                        <a href="#" id="btnConfirmAuthNum" class="ui-btn ui-corner-all ui-mini wpc25 btn-green" style="display:inline-block !important; padding:5px 3px 5px 3px !important;margin:0; float:right;">
                                            인증하기
                                        </a>
                                    </div>                                 
                                </li>
                                <li>
                                    <span class="txt-color5">기본주소</span>
                                    <div class="wpc100">
                                        <input type="text" class="text-field required input-guide txt-input-guide wpc90" />
                                        <a href="#" id="btnSearchAddress" class="ui-btn ui-corner-all ui-mini wpc7 btn-green" style="display:inline-block !important; padding:5px 3px 3px 3px !important;margin:0; float:right;">
                                            <img src="../img/search.png" style="width:16px; height:16px;">
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
                            </ul>
                        </div>
                    </div>
                    <div style="padding:15px">
                        <a href="#" id="btnSave" class="ui-btn ui-corner-all btn-green" style="background-color:#91cd33; color:#ffffff; text-shadow:none; border:0;">기본정보 저장</a>
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
                },
                initEvent: function () {        
                    $("#btnSave").click(function() {
                        location.href = "../Main.aspx";
                    });
                    $("#btnSearchAddress").click(function () {
                        location.href = "AddressSearch.aspx";
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