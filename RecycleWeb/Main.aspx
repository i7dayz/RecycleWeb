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
                                            <li>만료예정일 : 2018-12-31</li>
                                            <li>만료예정 포인트 : 8,500</li>
                                        </ul>
                                    </div>
                                    <div class="profile">
                                        <div class="image">
                                            <img src="img/person64x64.png">
                                        </div>
                                        <div class="nickname">
                                            i7dayz
                                        </div>
                                        <div class="point">
                                            20,000 ⓟ
                                        </div>
                                    </div>
                                </div>

                                <div class="main">
                                    <!-- banner -->
                                    <div class="banner">
                                        banner
                                    </div>
                                    <div class="section">
                                        <!-- collector info -->
                                        <div class="collector">
                                            <div>
                                                <span class="image">
                                                    <img src="img/profile.png" style="width:60px; height:auto;">
                                                </span>
                                                <span class="name txt-ellipsis">
                                                    <img src="img/calendar.png" style="width:20px; height:auto; float:left; margin-right:5px;"><span>예약현황</span></span>
                                                <span class="subject txt-ellipsis ">수거신청내역이 없습니다.</span>
                                            </div>
                                            <div class="btn-area fixed">
                                                <ul class="">
                                                    <li>
                                                        <a href="" class="ui-btn ui-corner-all" style="background-color:#91cd33; color:#ffffff; text-shadow:none; border:0; margin: 0;">
                                                            <!--<em class="img-bul pictures"></em>-->
                                                            수거신청
                                                        </a>
                                                        <!--
                                                        <a href="" class="ui-btn ui-corner-all">
                                                            취소/변경
                                                        </a>
                                                        -->
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="footer">

                                    <div class="information">
                                        <ul>
                                            <li>
                                                <img src="img/notice.png" style="width:24px; height:auto">
                                                <p>공지사항/이벤트</p>
                                            </li>
                                            <li>
                                                <img src="img/howto.png" style="width:24px; height:auto">
                                                <p>이용안내</p>
                                            </li>
                                        </ul>
                                    </div>
                                        
                                    <div class="button" style="height:48px;">
                                        <ul>
                                            <li style="padding:6px;">
                                                <div style="height:24px;text-align:center;float:none;">
                                                    <img src="img/alarm.png" style="width:auto;height:24px;line-height:1;float:none;margin-bottom:10px;">
                                                </div>
                                                <p style="font-size:10px;line-height:1;clear:both;color:#b7b7b7;margin-top:3px;">알림</p>
                                            </li>
                                            <li style="padding:6px;">
                                                <div style="height:24px;text-align:center;float:none;">
                                                    <img src="img/rank.png" style="width:auto;height:24px;line-height:1;float:none;margin-bottom:10px;">
                                                </div>
                                                <p style="font-size:10px;line-height:1;clear:both;color:#b7b7b7;margin-top:3px;">기부랭킹</p>
                                            </li>
                                            <li style="padding:6px;">
                                                <div style="height:24px;text-align:center;float:none;">
                                                    <img src="img/money.png" style="width:auto;height:24px;line-height:1;float:none;margin-bottom:10px;">
                                                </div>
                                                <p style="font-size:10px;line-height:1;clear:both;color:#b7b7b7;margin-top:3px;">누적기부금</p>
                                            </li>
                                            <li style="padding:6px;">
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
                                    <!--<a href="#" style="padding-left:50% !important;">-->
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
                                                            0 kg
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
                                                            0 개
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
                                                            0 개
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
                                                            0 개
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
                                                            0 kg
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
                                                            0 개
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
                                                            0 kg
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
                                                            0 kg
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
                                                        <div class="ui-block-b align-center" style="width:50%">
                                                            <img src="img/check_02.png" style="width:14px; height: auto"> 신청하기
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
                                                        <div class="ui-block-b align-center" style="width:50%">
                                                            <img src="img/check_01.png" style="width:14px; height: auto"> 신청
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
                                                        <div class="ui-block-b align-center" style="width:50%">
                                                            <img src="img/check_02.png" style="width:14px; height: auto"> 신청하기
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
                                                        <div class="ui-block-b align-center" style="width:50%">
                                                            <img src="img/check_02.png" style="width:14px; height: auto"> 신청하기
                                                        </div>
                                                        <div class="ui-block-c" style="width:25%"></div>
                                                    </div>                                                        
                                                </div>
                                            </div>
                                            <!-- //유품정리 -->
                                        </div>
                                        <!-- //폐기서비스,유품정리 -->
                                    </div>
                                </div>

                                <div class="footer" style="padding:5px; background-color:#ffffff;">                                        
                                    <div class="button">
                                        <a href="pickup_detail.html" data-ajax="false" id="btnRequest" class="ui-btn ui-corner-all" style="background-color:#91cd33; color:#ffffff; text-shadow:none; border:0;">
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
                                    <!--<a href="#" style="padding-left:50% !important;">-->
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
                                    <div class="section" style="margin:0 auto">
                                        <!-- 상품권, 편의점, 카페 -->
                                        <div class="ui-grid-b grids" style="height:130px;">
                                            <div class="ui-block-a" style="height:100%; text-align:center; background-color:#ffffff; border-bottom: 1px solid #eeeeee">
                                                <a href="store.html">
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

                                <div class="footer" style="padding:5px; background-color:#ffffff;">                                        
                                    <div class="button">
                                        <a href="pickup_detail.html" data-ajax="false" id="btnRequest" class="ui-btn ui-corner-all" style="background-color:#91cd33; color:#ffffff; text-shadow:none; border:0">
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
                                    <!--<a href="#" style="padding-left:50% !important;">-->
                                        <img src="img/angel-illust.png" class="ui-thumbnail" style="max-width:30%; padding-top:15px; padding-left:20px;">
                                        <h2 style="text-align:right; color:#ffffff;">기부하기</h2>
                                        <p style="text-align:right; color:#ffffff;">어려운 이웃을 도와주세요!</p>
                                    <!--</a>-->
                                </li>
                            </ul>
                        </nd2-ad>
                        <ul data-role="listview" data-icon="false" style="margin:0;">
                            <li style="border-bottom: 1px solid #eeeeee;">
                                <a href="donation_detail.html" style="background-color:#ffffff;">
                                    <img src="//lorempixel.com/150/150/people/6/" class="ui-thumbnail ui-thumbnail-circular" />
                                    <h2>사랑의 열매</h2>
                                    <p style="white-space:normal">나의 기부, 가장 착한 선물입니다. 사랑의 열매는 사회복지공동모금회를 상징하는 희망아이콘입니다.</p>
                                </a>
                            </li>
                            <li style="border-bottom: 1px solid #eeeeee;">
                                <a href="donation_detail.html" style="background-color:#ffffff;">
                                    <img src="//lorempixel.com/150/150/people/5/" class="ui-thumbnail ui-thumbnail-circular" />
                                    <h2>어린이 재단</h2>
                                    <p style="white-space:normal">68년 역사, 국내 최대 아동복지 전문기관입니다.<br/>아이들에게 밝은 내일을 선물해주세요.</p>
                                </a>
                            </li>
                            <li style="border-bottom: 1px solid #eeeeee;">
                                <a href="donation_detail.html" style="background-color:#ffffff;">
                                    <img src="//lorempixel.com/150/150/people/7/" class="ui-thumbnail ui-thumbnail-circular" />
                                    <h2>유니셰프</h2>
                                    <p style="white-space:normal">어린이를 돕는 일, 지금 시작하세요!<br/>여러분의 사랑이 어린이의 작은 생명을 구합니다.</p>
                                </a>
                            </li>
                            <li style="border-bottom: 1px solid #eeeeee;">
                                <a href="donation_detail.html" style="background-color:#ffffff;">
                                    <img src="//lorempixel.com/150/150/people/7/" class="ui-thumbnail ui-thumbnail-circular" />
                                    <h2>홀트아동복지회</h2>
                                    <p style="white-space:normal">사랑받은 아이들이 세상을 웃게합니다.<br/>오늘부터 당신의 사랑을 보여주세요.</p>
                                </a>
                            </li>
                        </ul>
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
                    //내쿠폰함
                    $(document).on('click', '#btnMyCoupon', function () {
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

                    //공지사항
                    $(document).on('click', '#btnNotice', function () {
                        location.href = "/Support/Notice.aspx";
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