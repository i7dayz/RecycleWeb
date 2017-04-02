<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="RecycleWeb.Member.Info" %>

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
</head>
<body class="all" contenteditable="false">
    <div class="wrap join" id="wrap">
        <form runat="server" method="post" action="Main.aspx">
            <input type="hidden" id="kakaoId" runat="server" value="" />
            <input type="hidden" id="kakaoNickname" runat="server" value="" />
            <input type="hidden" id="kakaoEmail" runat="server" value="" />
            <input type="hidden" id="kakaoThumbnailImage" runat="server" value="" />
            <input type="hidden" id="kakaoProfileImage" runat="server" value="" />
            <input type="hidden" id="accessToken" runat="server" value="" />
            <input type="hidden" id="refreshToken" runat="server" value="" />
            <!-- #header -->
            <div class="header" id="header" style="z-index:1;">
                <div class="colgroup fixed">
                    <div class="ci use-search-reset">
                        <a href="javascript:;" class="back-btn">
                            <em class="img-menu ci-logo"><img src="../img/back-btn.png" style="width:8px; height:12px; margin:6px;" alt=""></em>                                                    
                        </a>
                        <span>회원정보변경</span>
                    </div>
                    <div class="gnb" id="gnb" style="color:#B7B7B7">
                        <a href="javascript:;" id="btnEdit" style="color:#b7b7b7; font-weight:normal;">편집</a>
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
                                        <span class="txt-color5">연락처</span>
                                        <div class="wpc100">
                                            <input type="tel" name="txtContactNumber" maxlength="13" class="text-field required input-guide txt-input-guide wpc100" id="txtContactNumber"  runat="server"/>
                                        </div>                                 
                                    </li>
                                    <li>
                                        <span class="txt-color5">기본주소</span>
                                        <div class="wpc100">
                                            <input type="text" class="text-field required input-guide txt-input-guide wpc100" id="txtBaseAddress" runat="server"/>
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
                                                <input type="text" class="text-field required input-guide txt-input-guide wpc95" id="txtDetailAddress" runat="server"/>  
                                            </div>
                                            <div class="ui-block-b wpc25">
                                                <input type="text" class="text-field required input-guide txt-input-guide wpc100" id="txtZipNo" runat="server"/>
                                            </div>
                                        </div>
                                    </li>    
                                </ul>
                            </div>
                        </div>
                        <div style="padding:15px">
                            <a href="javascript:;" id="btnEditAddress" class="ui-btn ui-corner-all btn-gray" style="background-color:#91cd33; color:#ffffff; text-shadow:none; border:0;">수거주소록 관리</a>
                        </div>
                    </div>
                </div>
                <div class="ui-grid-a">
                    <div class="ui-block-a wpc50">
                        <span class="txt-color5" style="padding-left:15px;">로그아웃</span>    
                    </div>
                    <div class="ui-block-b wpc50" style="text-align:right; ">
                        <span class="txt-color5" style="padding-right:15px;"">회원탈퇴</span>
                    </div>
                </div>
            </div>
        </form>
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
                    $(document).on('click', '.back-btn', function () {
                        //window.history.back();
                        location.href = "/Main.aspx";
                    });

                    $(document).on('click', '#btnEdit', function () {
                        location.href = "EditInfo.aspx";
                    });

                    $(document).on('click', '#btnEditAddress', function () {
                        location.href = "AddressList.aspx";
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