<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="RecycleWeb.Main" %>

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

    <link href="css/layout.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/adjustment.css" rel="stylesheet" type="text/css" media="all">

    <link href="script/extention/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
    <link href="css/waves.min.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/nativedroid2.css" rel="stylesheet" />
    <link href="script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css">
</head>
<body class="all" contenteditable="false">
    <div class="wrap" id="wrap">            
        <div data-role="page" class="nd2-no-menu-swipe">
            <nd2-include data-src="LeftMenu.html"></nd2-include>
            <!-- #header -->
            <div class="header" id="header">
                <!--<div class="colgroup fixed">-->
                <div data-role="header" class="wow fadeIn">
                <!--<div class="header" id="header">-->
                    <div class="ci use-search-reset" style="width:100%">
                        <a href="#panel">
                            <em class="img-menu ci-logo"><img src="../img/menu.png" alt="leftmenu"></em>                            
                        </a>
                    <!--</div>-->
                    <!--<div class="gnb" id="gnb">-->
                        <ul data-role="nd2tabs" data-swipe="true" style="float:right">
                            <li data-tab="home" data-tab-active="true" style="padding:6px;">
                                <div style="height:24px;text-align:center;float:none;"><img src="img/home.png" style="width:24px;height:auto;line-height:1;float:none;margin-bottom:10px;"></div>
                                <p style="font-size:10px;line-height:1;clear:both;color:#b7b7b7;margin-top:3px;">HOME</p>
                            </li>
                            <li data-tab="request" style="padding:6px;">
                                <div style="height:24px;text-align:center;float:none;"><img src="img/pickup.png" style="width:24px; height:auto;line-height:1;float:none;margin-bottom:10px;"></div>
                                <p style="font-size:10px;line-height:1;clear:both;color:#b7b7b7;margin-top:3px;">수거신청</p>
                            </li>
                            <li data-tab="store" style="padding:6px;">
                                <div style="height:24px;text-align:center;float:none;"><img src="img/store.png" style="width:24px; height:auto;line-height:1;float:none;margin-bottom:10px;"></div>
                                <p style="font-size:10px;line-height:1;clear:both;color:#b7b7b7;margin-top:3px;">스토어</p>
                            </li>
                            <li data-tab="donate" style="padding:6px;">
                                <div style="height:24px;text-align:center;float:none;"><img src="img/donation.png" style="width:24px; height:auto;line-height:1;float:none;margin-bottom:10px;"></div>
                                <p style="font-size:10px;line-height:1;clear:both;color:#b7b7b7;margin-top:3px;">기부</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- //#header -->
            <!-- #container -->
            <div class="container" id="container">
                <!-- #main -->
                <div role="main" class="wow fadeIn" data-inset="false" data-wow-delay="0.2s">
                    <!-- #home tab -->
                    <div data-role="nd2tab" data-tab="home">
                        <div class="colgroup">
                            <div class="content fixed">   
                                <div class="header" style="padding-top:0">
                                    <div class="expire">
                                        <ul>
                                            <li><label style="font-size:15px">만료예정일 : </label><label runat="server" id="exDate" style="font-size:15px"></label></li>
                                            <li><label style="font-size:15px">만료예정 포인트 : </label><label runat="server" id="exPoint" style="font-size:15px"></label></li>
                                        </ul>
                                    </div>
                                    <div class="profile">
                                        <div class="image-wrapper">
                                            <div class="image">
                                                <img runat="server" id="profileImg" src="img/person64x64.png">
                                            </div>
                                        </div>
                                        <div class="nickname">
                                            <label runat="server" id="nickname"></label>
                                        </div>
                                        <div class="point">                                            
                                            <label runat="server" id="point">0</label>
                                            <img src="img/point-icn.png" />
                                        </div>
                                    </div>
                                </div>

                                <div class="main">
                                    <!-- 알림 -->
                                    <div class="alarm" style="height:400px;">
                                        <!-- banner -->
                                        <div class="banner">
                                            banner
                                        </div>
                                        <div class="section">
                                            <!-- collector info -->
                                            <div class="collector">
                                                <div>
                                                    <div runat="server" id="collectorImg" class="image"></div>
                                                    <span class="name txt-ellipsis">
                                                        <img src="img/calendar.png" style="width:20px; height:auto; float:left; margin-right:5px;"><span>예약현황</span>
                                                    </span>
                                                    <div class="subject txt-ellipsis ">
                                                        <ul>
                                                            <li>
                                                                <span runat="server" id="collectList"></span>
                                                            </li>
                                                            <li>
                                                                담당자: <span  runat="server" id="collectorName"></span> 기사님
                                                            </li>
                                                            <li>
                                                                연락처: <span runat="server" id="collectorContactNumber"></span>
                                                            </li>
                                                            <li>
                                                                희망수거일시: <span  runat="server" id="collectorHopeDate"></span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="btn-area fixed">
                                                    <ul class="">
                                                        <li>
                                                            <a href="javascript:;" class="ui-btn ui-corner-all" id="btnQuickRequest" style="background-color:#91cd33; color:#ffffff; text-shadow:none; border:0; margin: 0;">
                                                                <!--<em class="img-bul pictures"></em>-->
                                                                수거신청
                                                            </a>
                                                            <a href="javascript:;" class="ui-btn ui-corner-all" id="btnQuickRequestCancel" style="background-color:#91cd33; color:#ffffff; text-shadow:none; border:0; margin: 0;">
                                                                취소
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="information">
                                            <ul>
                                                <li id="btnNoticeEvent" style="cursor:pointer">
                                                    <img src="img/notice.png" style="width:24px; height:auto">
                                                    <p>공지사항/이벤트</p>
                                                </li>
                                                <li id="btnUsageGuide" style="cursor:pointer">
                                                    <img src="img/howto.png" style="width:24px; height:auto">
                                                    <p>이용안내</p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>                                    
                                    <!-- //알림 -->
                                    <!-- 기부랭킹 -->
                                    <div class="rank" style="height:400px;">
                                        <ul></ul>
                                    </div>
                                    <!-- //기부랭킹 -->
                                    <!-- 누적기부금 -->
                                    <div class="totalDonaPoint" style="height:400px;">

                                    </div>
                                    <!-- //누적기부금 -->
                                    <!-- 친구추천 -->
                                    <div class="invite" style="height:400px;">

                                    </div>
                                    <!-- //친구추천 -->
                                </div>

                                <div class="footer">                                        
                                    <div class="button" style="height:48px;">
                                        <ul>
                                            <li style="padding:6px; cursor:pointer" id="btnAlarm">
                                                <div style="height:24px;text-align:center;float:none;">
                                                    <img src="img/alarm.png" style="width:auto;height:24px;line-height:1;float:none;margin-bottom:10px;">
                                                </div>
                                                <p style="font-size:10px;line-height:1;clear:both;color:#b7b7b7;margin-top:3px;">알림</p>
                                            </li>
                                            <li style="padding:6px; cursor:pointer" id="btnRank">
                                                <div style="height:24px;text-align:center;float:none;">
                                                    <img src="img/rank.png" style="width:auto;height:24px;line-height:1;float:none;margin-bottom:10px;">
                                                </div>
                                                <p style="font-size:10px;line-height:1;clear:both;color:#b7b7b7;margin-top:3px;">기부랭킹</p>
                                            </li>
                                            <li style="padding:6px; cursor:pointer" id="btnTotalDonaPoint">
                                                <div style="height:24px;text-align:center;float:none;">
                                                    <img src="img/money.png" style="width:auto;height:24px;line-height:1;float:none;margin-bottom:10px;">
                                                </div>
                                                <p style="font-size:10px;line-height:1;clear:both;color:#b7b7b7;margin-top:3px;">누적기부금</p>
                                            </li>
                                            <li style="padding:6px; cursor:pointer" id="btnInvite">
                                                <div style="height:24px;text-align:center;float:none;">
                                                    <img src="img/friend.png" style="width:auto;height:24px;line-height:1;float:none;margin-bottom:10px;">
                                                </div>
                                                <p style="font-size:10px;line-height:1;clear:both;color:#b7b7b7;margin-top:3px;">친구추천</p>
                                            </li>  
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- //home tab -->

                    <!-- 수거신청 탭 -->
                    <div data-role="nd2tab" data-tab="request">                  
                        <nd2-ad data-banner="sample.banner" style="background-color:#90cd32;">
                            <ul data-role="listview" data-icon="false" style="margin:0; padding:10px; background-color:#90cd32;">
                                <li style="padding-left:40% !important; background-color:#90cd32; border:0; text-shadow:none;">
                                    <!--<a href="javascript:;" style="padding-left:50% !important;">-->
                                        <img src="img/pickup-illust.png" class="ui-thumbnail" style="max-width:30%; padding-top:15px; padding-left:20px;">
                                        <h2 style="text-align:right; color:#ffffff;">수거신청</h2>
                                        <p style="text-align:right; color:#ffffff;">20kg이상, 3000원이상 신청가능</p>
                                    <!--</a>-->
                                </li>
                            </ul>
                        </nd2-ad>
                        <div class="colgroup">
                            <div class="content fixed" style="background-color:#f6f6f6">   
                                <div class="main">
                                    <form runat="server" id="pickupForm" method="post" action="Collection/RequestDetails.aspx" data-ajax="false">
                                        <div class="section" style="margin:0 auto">
                                            <!-- title -->
                                            <div class="ui-grid-a request-title">
                                                <div class="ui-block-a">수거서비스</div>
                                                <div class="ui-block-b align-right">ⓘ 수거 가능/불가능 품목 확인</div>
                                            </div>

                                            <!-- 헌옷,휴대폰 -->
                                            <div class="ui-grid-a grids">
                                                <!-- 헌옷 -->
                                                <div class="ui-block-a cell">
                                                    <div class="row align-center">
                                                        <div class="icon-area">
                                                            <img src="img/cloth.png" style="width:22px; height:26px;">
                                                        </div>
                                                    </div>
                                                    <div class="row align-center">
                                                        헌옷
                                                    </div>
                                                    <div class="row">
                                                        <div class="ui-grid-b">
                                                            <div class="ui-block-a align-right">
                                                                <img src="img/minus.png" class="btn-minus">
                                                            </div>
                                                            <div class="ui-block-b align-center">
                                                                <input type="text" runat="server" id="txtProduct06" style="display: inline-block; width:50%; float:left; text-align:right" value="0" readonly="readonly"/>
                                                                <input type="text" style="display: inline-block; width:40%; margin-left:10%; float:left;" value="kg" readonly="readonly"/>
                                                            </div>
                                                            <div class="ui-block-c">
                                                                <img src="img/plus.png" class="btn-plus">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- //헌옷 -->

                                                <!-- 휴대폰 -->
                                                <div class="ui-block-b cell">
                                                    <div class="row align-center">
                                                        <div class="icon-area">
                                                            <img src="img/cellphone.png" style="width:16px; height:26px;">
                                                        </div>
                                                    </div>
                                                    <div class="row align-center">
                                                        휴대폰
                                                    </div>
                                                    <div class="row">
                                                        <div class="ui-grid-b">
                                                            <div class="ui-block-a align-right">
                                                                <img src="img/minus.png" class="btn-minus">
                                                            </div>
                                                            <div class="ui-block-b align-center">
                                                                <input type="text" runat="server" id="txtProduct07" style="display: inline-block; width:50%; float:left; text-align:right" value="0" readonly="readonly"/>
                                                                <input type="text" style="display: inline-block; width:40%; margin-left:10%; float:left;" value="개" readonly="readonly"/>
                                                            </div>
                                                            <div class="ui-block-c">
                                                                <img src="img/plus.png" class="btn-plus">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- //휴대폰 -->
                                            </div>
                                            <!-- //헌옷,휴대폰 -->
                                                                          
                                            <!-- 소형가전,대형가전 -->
                                            <div class="ui-grid-a grids">
                                                <!-- 소형가전 -->
                                                <div class="ui-block-a cell">
                                                    <div class="row align-center">
                                                        <div class="icon-area">
                                                            <img src="img/small.png" style="width:26px; height:18px;">
                                                        </div>
                                                    </div>
                                                    <div class="row align-center">
                                                        소형가전
                                                    </div>
                                                    <div class="row">
                                                        <div class="ui-grid-b">
                                                            <div class="ui-block-a align-right">
                                                                <img src="img/minus.png" class="btn-minus">
                                                            </div>
                                                            <div class="ui-block-b align-center">
                                                                <input type="text" runat="server" id="txtProduct09" style="display: inline-block; width:50%; float:left; text-align:right" value="0" readonly="readonly"/>
                                                                <input type="text" style="display: inline-block; width:40%; margin-left:10%; float:left;" value="개" readonly="readonly"/>
                                                            </div>
                                                            <div class="ui-block-c">
                                                                <img src="img/plus.png" class="btn-plus">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- //소형가전 -->

                                                <!-- 대형가전 -->
                                                <div class="ui-block-b cell">
                                                    <div class="row align-center">
                                                        <div class="icon-area">
                                                            <img src="img/big.png" style="width:22px; height:26px;">
                                                        </div>
                                                    </div>
                                                    <div class="row align-center">
                                                        대형가전
                                                    </div>
                                                    <div class="row">
                                                        <div class="ui-grid-b">
                                                            <div class="ui-block-a align-right">
                                                                <img src="img/minus.png" class="btn-minus">
                                                            </div>
                                                            <div class="ui-block-b align-center">
                                                                <input type="text" runat="server" id="txtProduct08" style="display: inline-block; width:50%; float:left; text-align:right" value="0" readonly="readonly"/>
                                                                <input type="text" style="display: inline-block; width:40%; margin-left:10%; float:left;" value="개" readonly="readonly"/>
                                                            </div>
                                                            <div class="ui-block-c">
                                                                <img src="img/plus.png" class="btn-plus">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- //대형가전 -->
                                            </div>                                            
                                            <!-- //소형가전,대형가전 -->
                                            
                                            <!-- 폐지,병 -->
                                            <div class="ui-grid-a grids">
                                                <!-- 폐지 -->
                                                <div class="ui-block-a cell">
                                                    <div class="row align-center">
                                                        <div class="icon-area">
                                                            <img src="img/paper.png" style="width:20px; height:26px;">
                                                        </div>
                                                    </div>
                                                    <div class="row align-center">
                                                        폐지
                                                    </div>
                                                    <div class="row">
                                                        <div class="ui-grid-b">
                                                            <div class="ui-block-a align-right">
                                                                <img src="img/minus.png" class="btn-minus">
                                                            </div>
                                                            <div class="ui-block-b align-center">
                                                                <input type="text" runat="server" id="txtProduct01" style="display: inline-block; width:50%; float:left; text-align:right" value="0" readonly="readonly"/>
                                                                <input type="text" style="display: inline-block; width:40%; margin-left:10%; float:left;" value="kg" readonly="readonly"/>
                                                            </div>
                                                            <div class="ui-block-c">
                                                                <img src="img/plus.png" class="btn-plus">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- //폐지 -->

                                                <!-- 병 -->
                                                <div class="ui-block-b cell">
                                                    <div class="row align-center">
                                                        <div class="icon-area">
                                                            <img src="img/bottle.png" style="width:14px; height:26px;">
                                                        </div>
                                                    </div>
                                                    <div class="row align-center">
                                                        병
                                                    </div>
                                                    <div class="row">
                                                        <div class="ui-grid-b">
                                                            <div class="ui-block-a align-right">
                                                                <img src="img/minus.png" class="btn-minus">
                                                            </div>
                                                            <div class="ui-block-b align-center">
                                                                <input type="text" runat="server" id="txtProduct02" style="display: inline-block; width:50%; float:left; text-align:right" value="0" readonly="readonly"/>
                                                                <input type="text" style="display: inline-block; width:40%; margin-left:10%; float:left;" value="개" readonly="readonly"/>
                                                            </div>
                                                            <div class="ui-block-c">
                                                                <img src="img/plus.png" class="btn-plus">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- //병 -->
                                            </div>
                                            <!-- //폐지,병 -->
                                            
                                            <!-- 고철,비철 -->
                                            <div class="ui-grid-a grids">
                                                <!-- 고철 -->
                                                <div class="ui-block-a cell">
                                                    <div class="row align-center">
                                                        <div class="icon-area">
                                                            <img src="img/iron.png" style="width:17px; height:26px;">
                                                        </div>
                                                    </div>
                                                    <div class="row align-center">
                                                        고철
                                                    </div>
                                                    <div class="row">
                                                        <div class="ui-grid-b">
                                                            <div class="ui-block-a align-right">
                                                                <img src="img/minus.png" class="btn-minus">
                                                            </div>
                                                            <div class="ui-block-b align-center">
                                                                <input type="text" runat="server" id="txtProduct04" style="display: inline-block; width:50%; float:left; text-align:right" value="0" readonly="readonly"/>
                                                                <input type="text" style="display: inline-block; width:40%; margin-left:10%; float:left;" value="kg" readonly="readonly"/>
                                                            </div>
                                                            <div class="ui-block-c">
                                                                <img src="img/plus.png" class="btn-plus">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- //고철 -->

                                                <!-- 비철 -->
                                                <div class="ui-block-b cell">
                                                    <div class="row align-center">
                                                        <div class="icon-area">
                                                            <img src="img/non-iron.png" style="width:26px; height:26px;">
                                                        </div>
                                                    </div>
                                                    <div class="row align-center">
                                                        비철
                                                    </div>
                                                    <div class="row">
                                                        <div class="ui-grid-b">
                                                            <div class="ui-block-a align-right">
                                                                <img src="img/minus.png" class="btn-minus">
                                                            </div>
                                                            <div class="ui-block-b align-center">
                                                                <input type="text" runat="server" id="txtProduct05" style="display: inline-block; width:50%; float:left; text-align:right" value="0" readonly="readonly"/>
                                                                <input type="text" style="display: inline-block; width:40%; margin-left:10%; float:left;" value="kg" readonly="readonly"/>
                                                            </div>
                                                            <div class="ui-block-c">
                                                                <img src="img/plus.png" class="btn-plus">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- //비철 -->
                                            </div>
                                            <!-- //고철,비철 -->
                                            
                                            <!-- 이삿짐,기타 -->
                                            <div class="ui-grid-a grids">
                                                <!-- 이삿짐 -->
                                                <div class="ui-block-a cell">
                                                    <div class="row align-center">
                                                        <div class="icon-area">
                                                            <img src="img/move.png" style="width:26px; height:26px;">
                                                        </div>
                                                    </div>
                                                    <div class="row align-center">
                                                        이삿짐
                                                    </div>
                                                    <div class="row">
                                                        <div class="ui-grid-b">
                                                            <div class="ui-block-a" style="width:25%"></div>
                                                            <div class="ui-block-b align-center chk-pickup" style="width:50%; padding:10px 0;">
                                                                <img src="img/check-c.png" style="width:14px; height: auto;"> 신청하기
                                                                <input type="checkbox" runat="server" id="chkProduct10" style="display:none" />
                                                            </div>
                                                            <div class="ui-block-c" style="width:25%"></div>
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                                <!-- //이삿짐 -->

                                                <!-- 기타 -->
                                                <div class="ui-block-b cell">
                                                    <div class="row align-center">
                                                        <div class="icon-area">
                                                            <img src="img/etc.png" style="width:22px; height:26px;">
                                                        </div>
                                                    </div>
                                                    <div class="row align-center">
                                                        기타
                                                    </div>
                                                    <div class="row">
                                                        <div class="ui-grid-b">
                                                            <div class="ui-block-a" style="width:25%"></div>
                                                            <div class="ui-block-b align-center chk-pickup" style="width:50%; padding:10px 0;">
                                                                <img src="img/check-c.png" style="width:14px; height: auto;"> 신청하기
                                                                <input type="checkbox" runat="server" id="chkEtc1" style="display:none" /> <!-- 임시 사용 -->
                                                            </div>
                                                            <div class="ui-block-c" style="width:25%"></div>
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                                <!-- //기타 -->
                                            </div>
                                            <!-- //이삿짐,기타 -->
                                            
                                            <!-- title -->
                                            <div class="ui-grid-a request-title">
                                                <div class="ui-block-a">대행서비스</div>
                                                <div class="ui-block-b align-right">ⓘ 수거 가능/불가능 품목 확인</div>
                                            </div>

                                            <!-- 폐기서비스,유품정리 -->
                                            <div class="ui-grid-a grids">
                                                <!-- 폐기서비스 -->
                                                <div class="ui-block-a cell">
                                                    <div class="row align-center">
                                                        <div class="icon-area">
                                                            <img src="img/arrangement.png" style="width:26px; height:26px;">
                                                        </div>
                                                    </div>
                                                    <div class="row align-center">
                                                        폐기서비스
                                                    </div>
                                                    <div class="row">
                                                        <div class="ui-grid-b">
                                                            <div class="ui-block-a" style="width:25%"></div>
                                                            <div class="ui-block-b align-center chk-pickup" style="width:50%; padding:10px 0;">
                                                                <img src="img/check-c.png" style="width:14px; height: auto;"> 신청하기
                                                                <input type="checkbox" runat="server" id="chkEtc2" style="display:none" />
                                                            </div>
                                                            <div class="ui-block-c" style="width:25%"></div>
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                                <!-- //폐기서비스 -->

                                                <!-- 유품정리 -->
                                                <div class="ui-block-b cell">
                                                    <div class="row align-center">
                                                        <div class="icon-area">
                                                            <img src="img/angel.png" style="width:26px; height:26px;">
                                                        </div>
                                                    </div>
                                                    <div class="row align-center">
                                                        유품정리
                                                    </div>
                                                    <div class="row">
                                                        <div class="ui-grid-b">
                                                            <div class="ui-block-a" style="width:25%"></div>
                                                            <div class="ui-block-b align-center chk-pickup" style="width:50%; padding:10px 0;">
                                                                <img src="img/check-c.png" style="width:14px; height: auto;"> 신청하기
                                                                <input type="checkbox" runat="server" id="chkEtc3" style="display:none" />
                                                            </div>
                                                            <div class="ui-block-c" style="width:25%"></div>
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                                <!-- //유품정리 -->
                                            </div>
                                            <!-- //폐기서비스,유품정리 -->
                                        </div>
                                    </form>
                                </div>

                                <div class="footer" style="padding:5px; background-color:#ffffff;">                                        
                                    <div class="button">
                                        <a href="javascript:;"  target="_self" id="btnRequest" class="ui-btn ui-corner-all btn-green">
                                            수거신청
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- //수거신청 tab -->
                            
                    <!-- 스토어 탭-->
                    <div data-role="nd2tab" data-tab="store">                        
                        <nd2-ad data-banner="sample.banner" style="background-color:#90cd32;">
                            <ul data-role="listview" data-icon="false" style="margin:0; padding:10px; background-color:#90cd32;">
                                <li style="padding-left:40% !important; background-color:#90cd32; border:0; text-shadow:none;">
                                    <!--<a href="javascript:;" style="padding-left:50% !important;">-->
                                        <img src="img/store-illust.png" class="ui-thumbnail" style="max-width:30%; padding-top:15px; padding-left:20px;">
                                        <h2 style="text-align:right; color:#ffffff;">스토어</h2>
                                        <p style="text-align:right; color:#ffffff;">적립된 포인트는 현금처럼!</p>
                                    <!--</a>-->
                                </li>
                            </ul>
                        </nd2-ad>
                        <div class="colgroup">
                            <div class="content fixed" style="background-color:#f6f6f6">   
                                <div class="main">
                                    <input type="hidden" runat="server" id="msg" />

                                    <div class="section" style="margin:0 auto">
                                        <!-- 상품권, 편의점, 카페 -->
                                        <div class="ui-grid-b grids" style="height:130px;">
                                            <div class="ui-block-a" style="height:100%; text-align:center; background-color:#ffffff; border-bottom: 1px solid #eeeeee">
                                                <a href="javascript:;" id="btnGiftCard">
                                                    <div style="height:50px; padding-top:30px;">
                                                        <img src="img/gift-card.png" style="width:25%; height:auto">
                                                    </div>
                                                    <div style="height:40px;">
                                                        <p>상품권</p>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="ui-block-b" style="height:100%; text-align:center; background-color:#ffffff; border-left:1px solid #eeeeee; border-bottom: 1px solid #eeeeee">
                                                <div style="height:50px; padding-top:30px;">
                                                    <img src="img/convenient.png" style="width:25%; height:auto">
                                                </div>
                                                <div style="height:40px;">
                                                    <p>편의점</p>
                                                </div>
                                            </div>
                                            <div class="ui-block-c" style="height:100%; text-align:center; background-color:#ffffff; border-left:1px solid #eeeeee; border-bottom: 1px solid #eeeeee">
                                                <div style="height:50px; padding-top:30px;">
                                                    <img src="img/coffee.png" style="width:20%; height:auto">
                                                </div>
                                                <div style="height:40px;">
                                                    <p>카페</p>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 베이커리, 레스토랑, 아이스크림/간식 -->
                                        <div class="ui-grid-b grids" style="height:130px;">
                                            <div class="ui-block-a" style="height:100%; text-align:center; background-color:#ffffff; border-bottom: 1px solid #eeeeee">
                                                <div style="height:50px; padding-top:30px;">
                                                    <img src="img/cake.png" style="width:25%; height:auto">
                                                </div>
                                                <div style="height:40px;">
                                                    <p>베이커리</p>
                                                </div>
                                            </div>
                                            <div class="ui-block-b" style="height:100%; text-align:center; background-color:#ffffff; border-left:1px solid #eeeeee; border-bottom: 1px solid #eeeeee">
                                                <div style="height:50px; padding-top:30px;">
                                                    <img src="img/restaurant.png" style="width:25%; height:auto">
                                                </div>
                                                <div style="height:40px;">
                                                    <p>레스토랑</p>
                                                </div>
                                            </div>
                                            <div class="ui-block-c" style="height:100%; text-align:center; background-color:#ffffff; border-left:1px solid #eeeeee; border-bottom: 1px solid #eeeeee">
                                                <div style="height:50px; padding-top:30px;">
                                                    <img src="img/icecream.png" style="width:20%; height:auto">
                                                </div>
                                                <div style="height:40px;">
                                                    <p>아이스크림/간식</p>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 영화/도서, 뷰티/악세사리 -->
                                        <div class="ui-grid-b grids" style="height:130px;">
                                            <div class="ui-block-a" style="height:100%; text-align:center; background-color:#ffffff; border-bottom: 1px solid #eeeeee">
                                                <div style="height:50px; padding-top:30px;">
                                                    <img src="img/movie.png" style="width:25%; height:auto">
                                                </div>
                                                <div style="height:40px;">
                                                    <p>영화/도서</p>
                                                </div>
                                            </div>
                                            <div class="ui-block-b" style="height:100%; text-align:center; background-color:#ffffff; border-left:1px solid #eeeeee; border-bottom: 1px solid #eeeeee">
                                                <div style="height:50px; padding-top:30px;">
                                                    <img src="img/beauty.png" style="width:25%; height:auto">
                                                </div>
                                                <div style="height:40px;">
                                                    <p>뷰티/악세사리</p>
                                                </div>
                                            </div>
                                            <div class="ui-block-c" style="height:100%; background-color:#ffffff; border-left:1px solid #eeeeee">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="footer" style="padding:15px; background-color:#ffffff;">                                        
                                    <div class="button">
                                        <a href="javascript:;" data-ajax="false" id="btnCoupon" class="ui-btn ui-corner-all" style="background-color:#91cd33; color:#ffffff; text-shadow:none; border:0">
                                            쿠폰함 바로가기
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- //스토어 tab -->

                    <!-- 기부 탭 -->
                    <div data-role="nd2tab" data-tab="donate">                            
                        <nd2-ad data-banner="sample.banner" style="background-color:#90cd32;">
                            <ul data-role="listview" data-icon="false" style="margin:0; padding:10px; background-color:#90cd32;">
                                <li style="padding-left:40% !important; background-color:#90cd32; border:0; text-shadow:none;">
                                    <!--<a href="javascript:;" style="padding-left:50% !important;">-->
                                        <img src="img/angel-illust.png" class="ui-thumbnail" style="max-width:30%; padding-top:15px; padding-left:20px;">
                                        <h2 style="text-align:right; color:#ffffff;">기부하기</h2>
                                        <p style="text-align:right; color:#ffffff;">어려운 이웃을 도와주세요!</p>
                                    <!--</a>-->
                                </li>
                            </ul>
                        </nd2-ad>
                        <ul data-role="listview" data-icon="false" style="margin:0;" id="donationGroupList"></ul>
                    </div> <!-- //기부 tab -->
                </div> <!-- //main -->
            </div> <!-- //container -->
        </div>
    </div> <!-- //wrap -->

    <script type="text/javascript" src="script/extention/jquery.js"></script>
    <script type="text/javascript" src="script/extention/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
    <script type="text/javascript" src="script/extention/waves.min.js"></script>
    <script type="text/javascript" src="script/extention/wow.min.js"></script>
    <script type="text/javascript" src="script/extention/nativedroid2.js"></script>
    <script type="text/javascript" src="script/extention/nd2settings.js"></script>
    <script type="text/javascript" src="script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="script/common.js"></script>
    <script type="text/javascript" src="script/store.js"></script>
        
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
                    $('.rank').hide();
                    $('.totalDonaPoint').hide();
                    $('.invite').hide();

                    //내 쿠폰함
                    $(document).on('click', '#btnMyCoupon', function () {
                        location.href = "/Member/MyCoupon.aspx";
                    });
                    $(document).on('click', '#btnCoupon', function () {
                        location.href = "/Member/MyCoupon.aspx";
                    });
                    
                    //추천인
                    $(document).on('click', '#btnRecommender', function () {
                        location.href = "/Member/Recommender.aspx";
                    });

                    //이벤트
                    $(document).on('click', '#btnEvent', function () {
                        location.href = "/Support/Event.aspx";
                    });

                    //회원정보변경
                    $(document).on('click', '#btnMemberInfo', function () {
                        location.href = "/Member/Info.aspx";
                    });

                    //포인트내역
                    $(document).on('click', '#btnPointHistory', function () {
                        location.href = "/Member/PointHistory.aspx"
                    });

                    //기부내역
                    $(document).on('click', '#btnDonationHistory', function () {
                        location.href = "/Donation/DonationHistory.aspx"
                    });

                    //공지사항
                    $(document).on('click', '#btnNotice', function () {
                        location.href = "/Support/Notice.aspx";
                    });

                    //이용안내
                    $(document).on('click', '#btnUsageGuide', function () {
                        location.href = "/Support/UsageGuide.aspx";
                    });

                    //자주 묻는 질문
                    $(document).on('click', '#btnFaq', function () {
                        location.href = "/Support/FAQ.aspx";
                    });

                    //1:1문의

                    //약관 및 정책
                    $(document).on('click', '#btnTermsAndPolicies', function () {
                        location.href = "/Support/TermsAndPolicies.aspx";
                    });

                    //홈탭
                    $(document).on('click', '#btnAlarm', function () {
                        $('.alarm').show();
                        $('.rank').hide();
                        $('.totalDonaPoint').hide();
                        $('.invite').hide();
                    });
                    $(document).on('click', '#btnRank', function () {
                        $('.alarm').hide();
                        $('.rank').show();
                        $('.totalDonaPoint').hide();
                        $('.invite').hide();
                    });
                    $(document).on('click', '#btnTotalDonaPoint', function () {
                        $('.alarm').hide();
                        $('.rank').hide();
                        $('.totalDonaPoint').show();
                        $('.invite').hide();
                    });
                    $(document).on('click', '#btnInvite', function () {
                        $('.alarm').hide();
                        $('.rank').hide();
                        $('.totalDonaPoint').hide();
                        $('.invite').show();
                    });
                    $(document).on('click', '#btnNoticeEvent', function () {
                        //location.href = "/Support/UsageGuide.aspx";
                    });
                    $(document).on('click', '#btnUsageGuide', function () {
                        location.href = "/Support/UsageGuide.aspx";
                    });

                    //수거요청탭
                    $(document).on('click', '.btn-minus', function () {
                        var $input = $('#' + $(this).parent().parent().find('input').first().attr('id'));
                        var currCount = $input.val();
                        $input.val(parseInt(currCount) - 1 < 0 ? 0 : parseInt(currCount) - 1);
                    });

                    $(document).on('click', '.btn-plus', function () {
                        var $input = $('#' + $(this).parent().parent().find('input').first().attr('id'));
                        var currCount = $input.val();
                        $input.val(parseInt(currCount) + 1);
                    });

                    $(document).on('click', '.chk-pickup', function () {
                        var $input = $(this).find('input');
                        $input.prop('checked', !$input.prop('checked'));

                        if ($input.prop('checked'))
                        {
                            $(this).find('img').attr('src', 'img/check-g.png');
                        }
                        else
                        {
                            $(this).find('img').attr('src', 'img/check-c.png');
                        }
                        
                    });

                    $(document).on('click', '#btnRequest', function () {
                        // 선택된 항목이 한개라도 있어야 수거 신청 가능
                        if (parseInt($("#txtProduct06").val()) > 0 || parseInt($("#txtProduct07").val()) > 0
                            || parseInt($("#txtProduct09").val()) > 0 || parseInt($("#txtProduct08").val()) > 0
                            || parseInt($("#txtProduct01").val()) > 0 || parseInt($("#txtProduct02").val()) > 0
                            || parseInt($("#txtProduct04").val()) > 0 || parseInt($("#txtProduct05").val()) > 0
                            || $("#chkProduct10").is(":checked")
                            || $("#chkEtc1").is(":checked")
                            || $("#chkEtc2").is(":checked")
                            || $("#chkEtc3").is(":checked")) {
                            // 여기서 수거신청한 금액이 얼마인지 체크

                            $("#pickupForm").submit();
                        }
                        else {
                            infoBox("선택된 수거요청항목이 없습니다.");
                            return;
                        }
                    });

                    //스토어탭
                    //상품권
                    $(document).on('click', '#btnGiftCard', function () {
                        location.href = "/Store/Goods.aspx";
                    });

                    //기부탭
                },
                fn: {
                    getDonationGroup: function () {
                        Server.ajax("/producer/donationGroupList", null, function (response, status, xhr) {
                            if (response.value == 0) {
                                var list = response.donationGroupList;

                                for (var i = 0; i < list.length; i++) {
                                    page.fn.addDonationGroup(list[i]);
                                }
                            } else {
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    },
                    addDonationGroup: function (item) {
                        var donationGroup = '<li style="border-bottom: 1px solid #eeeeee;" class="ui-li-has-thumb">'
                                          + '    <a href="/Donation/DonationDetails.aspx?id=' + item[0] + '" style="background-color:#ffffff;" class="ui-btn" data-ajax="false">'
                                          + '        <img src="' + item[3] + '" class="ui-thumbnail ui-thumbnail-circular" style="width:75px;height:75px;margin:10px auto;" />'
                                          + '        <h2>' +  item[1] + '</h2>'
                                          + '        <p style="white-space:normal">' + item[2] + '</p>'
                                          + '    </a>'
                                          + '</li>';

                        $('#donationGroupList').append(donationGroup);
                    },
                    getRank: function () {
                        Server.ajax("/producer/donationRankList", null, function (response, status, xhr) {
                            if (response.value == 0) {
                                var list = response.donationRankList;

                                for (var i = 0; i < list.length; i++) {
                                    page.fn.addRank(list[i]);
                                }
                            } else {
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    },
                    addRank: function (item) {
                        var medal = "";
                        switch (item[0]) {
                            case 1:
                                medal = '<img src="img/gold.png" style="width:16px; height:auto;">';
                                break;
                            case 2:
                                medal = '<img src="img/silver.png" style="width:16px; height:auto;">';
                                break;
                            case 3:
                                medal = '<img src="img/bronze.png" style="width:16px; height:auto;">';
                                break;
                            default:
                                medal = '<span style="color:#5e8e18">' + item[0] + '</span>';
                                break;
                        }

                        var rank = '<li class="" style="height: 40px; background-color:#91cd33; padding:5px; box-sizing: border-box;-moz-box-sizing: border-box;-webkit-box-sizing: border-box; border-top:1px solid #eeeeee">'
                                 + '    <div class="ui-grid-b">'
                                 + '        <div class="ui-block-a wpc30" style="line-height:32px; text-align:center;">' + medal + '</div>'
                                 + '        <div class="ui-block-b wpc40" style=""><img src="img/person64x64.png" style="width:26px; height:auto; vertical-align:middle"><span style="line-height:28px; margin-left: 10px; color:#ffffff">' + item[5] + '</span></div>'
                                 + '        <div class="ui-block-c wpc30" style="line-height:32px; text-align:right; padding-right:10%; color:#ffffff">' + item[1] + '</div>'
                                 + '    </div>'
                                 + '</li>';

                        $(".rank").find("ul").append(rank);
                    },
                }
            };

            $(document).on('ready', function () {
                page.init();
                page.fn.getDonationGroup();
                page.fn.getRank();
                
                //getGoodsInfoList($("#hdCid").val(), $("#hdBrandId").val(), $("#hdEnc").val());
            });
        })();
    </script>
</body>
</html>