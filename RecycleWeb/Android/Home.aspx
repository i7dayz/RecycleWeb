<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RecycleWeb.Android.Home" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="url" content="http://hrx.co.kr/Default.aspx" id="meta-url" />
    <meta name="author" content="한국자원거래소" id="meta-author" />
    <meta name="subject" content="리본" id="meta-title" />
    <meta name="description" content="한국자원거래소, 리본, HRX, 헌옷, 휴대폰, 소형가전, 대형가전, 폐지, 병, 고철, 비철, 이삿짐, 재활용, 이사수거, 유품정리, 폐기대행" id="meta-description" />
    <meta name="thumbnail" content="http://hrx.co.kr/img/reborn.jpg" id="meta-thumbnail" />
    <meta property="fb:app_id" content="1563461907244524" />
    <meta property="og:site_name" content="리본" />
    <meta property="og:title" content="리본-쓰레기가 자원으로 재탄생하다" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="http://hrx.co.kr/Default.aspx" />
    <meta property="og:image" content="http://hrx.co.kr/img/reborn.jpg" />
    <meta property="og:locale" content="ko_KR" />
    <meta property="og:description" content="한국자원거래소, 리본, HRX, 헌옷, 휴대폰, 소형가전, 대형가전, 폐지, 병, 고철, 비철, 이삿짐, 재활용, 이사수거, 유품정리, 폐기대행" />

    <title>리본-쓰레기가 자원으로 재탄생하다</title>

    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/responsive.css" />
    <link rel="stylesheet" href="../css/sandbox.css" />
    <link rel="stylesheet" href="../css/drawer.css" />
    <link href="../script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
        .image-wrapper { 
            width:100%; text-align: center; 
            background: url('./img/character-02.png') no-repeat;
            background-size: contain;
            background-position:center
        }
        .image { display: block; overflow: hidden; width: 64px; height: 64px; border-radius: 50%; margin: 0 auto; }
        .image > img {
            display: inline-block;
            max-width: 100%;
            min-height: 100%;
            -ms-interpolation-mode: bicubic;
        }
        .foot_back01 {
            background-color: #fff !important;
        }
        .foot_back02 {
            height: 100% !important;
            background-color: #f6f6f6 !important;
        }
    </style>
</head>
<body class="drawer drawer--left drawer--sidebar">
    <input type="hidden" runat="server" id="hdProduceIdx" />
    <input type="hidden" runat="server" id="hdProducerIdx" />    
    <input type="hidden" runat="server" id="hdRank" />    
    <input type="hidden" runat="server" id="hdTotalDonationPoint" />    

    <!-- 검은색 장막 -->
    <div id="mask"></div>
    <!-- 장막 끝 -->
    <div id="body">
        <header class="drawer-navbar drawer-navbar--fixed" role="banner">
            <div class="drawer-container">
                <div class="drawer-navbar-header">
                     <div id="top_menu">
                         <ul id="top_menu_ul">
                           <li class="top_menu_li" style="z-index:999">
                                <a href="javascript:;" target="_self" class="gnb_1da" id="tabHome">
                                    <img src="/img/top_menu/top01.png" onmouseover="this.src='/img/top_menu/top01o.png'" onmouseout="this.src='/img/top_menu/top01.png'" border="0" title="">
                                </a>
                            </li>
                            <li class="top_menu_li" style="z-index:999">
                                <a href="javascript:;" target="_self" class="gnb_1da" id="tabRequest">                	
                                    <img src="/img/top_menu/top02.png" onmouseover="this.src='/img/top_menu/top02o.png'" onmouseout="this.src='/img/top_menu/top02.png'" border="0" title="">
                                </a>
                            </li>
                            <li class="top_menu_li" style="z-index:999">
                                <a href="javascript:;" target="_self" class="gnb_1da" id="tabStore">                	
                                    <img src="/img/top_menu/top03.png" onmouseover="this.src='/img/top_menu/top03o.png'" onmouseout="this.src='/img/top_menu/top03.png'" border="0" title="">
                                </a>
                            </li>
                            <li class="top_menu_li" style="z-index:999">
                                <a href="javascript:;" target="_self" class="gnb_1da" id="tabDonate">                	
                                    <img src="/img/top_menu/top04.png" onmouseover="this.src='/img/top_menu/top04o.png'" onmouseout="this.src='/img/top_menu/top04.png'" border="0" title="">
                                </a>
                            </li>
                        </ul>
                    </div>
                    <button type="button" class="drawer-toggle drawer-hamburger">
                        <span class="sr-only">toggle navigation</span>
                        <span class="drawer-hamburger-icon"></span>
                    </button>
                </div>
        
                <nav class="drawer-nav" role="navigation">
                    <ul class="drawer-menu">
                        <li><a class="drawer-brand drawer-menu-item"><img src="/img/left_menu_icon01.png" width="25px" style="padding: 0 11px;"> HOME</a></li>
                    
                        <li>
                    	    <a href="/Member/MyCoupon.aspx"><img src="../img/baechul/ba_quick01.png" height="40px" style=""> </a><img src="../img/baechul/ba_quick_line.png" width="1px" height="40px"/>
                            <a href="/Member/Recommender.aspx"><img src="../img/baechul/ba_quick02.png" height="40px" style=""> </a><img src="../img/baechul/ba_quick_line.png" width="1px" height="40px"/>
                            <a href="/Support/Event.aspx"><img src="../img/baechul/ba_quick03.png" height="40px" style=""> </a>
                        </li>
                        <li class="drawer-dropdown open">
                            <a class="drawer-brand drawer-menu-item" data-target="#" href="#" data-toggle="dropdown" role="button" aria-expanded="true">
                                <img src="../img/left_menu_icon02.png" width="25px" style="padding: 0 11px;"> 회원정보 <!--<span class="drawer-caret"></span>-->
                            </a>
                            <ul class="drawer-dropdown-menu">
                                <li><a class="drawer-dropdown-menu-item" href="/Member/Info.aspx">회원 정보 변경</a></li>
                                <li><a class="drawer-dropdown-menu-item" href="/Member/PointHistory.aspx">포인트 내역</a></li>
                                <li><a class="drawer-dropdown-menu-item" href="/Donation/DonationHistory.aspx">기부 내역</a></li>
                            </ul>
                        </li>
                        <li class="drawer-dropdown open">
                            <a class="drawer-brand drawer-menu-item" data-target="#" href="#" data-toggle="dropdown" role="button" aria-expanded="true">
                                <img src="../img/left_menu_icon03.png" width="25px" style="padding: 0 11px;"> 고객센터 <!--<span class="drawer-caret"></span>-->
                            </a>
                            <ul class="drawer-dropdown-menu">
                                <li><a class="drawer-dropdown-menu-item" href="../Support/Notice.aspx">공지사항</a></li>
                                <li><a class="drawer-dropdown-menu-item" href="../Support/UsageGuide.aspx">이용안내</a></li>
                        	    <li><a class="drawer-dropdown-menu-item" href="../Support/FAQ.aspx">자주 묻는 질문</a></li>
                                <li><a class="drawer-dropdown-menu-item" href="http://plus.kakao.com/home/@리본고객센터" target="_blank">1:1 문의</a></li>
                                <li><a class="drawer-dropdown-menu-item" href="../Support/TermsAndPolicies.aspx">약관 및 정책</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
        
        <div class="container" style="">
	        <div class="member_po">
    	        <p class="rtext">만료예정일 : <label runat="server" id="exDate"></label></p>
                <p class="rtext">만료예정 포인트 : <label runat="server" id="exPoint"></label></p>
                <p class="ctext">
                    <div class="image-wrapper">
                        <div class="image">
                            <img runat="server" id="profileImg" src="../img/person64x64.png">
                        </div>
                    </div>
                </p>
                <p class="ctext color_b7b7b7 font_size12 pdt10"><label runat="server" id="nickname"></label></p>
                <p class="ctext font_size34b "><label runat="server" id="point">0</label> <img src="../img/d-pnt-56.png" class="img20" /></p>
            </div>
            <div class="slide">
            <!-- #include file="../include/main_full_slide.html" -->
            </div>

            <div class="reser">
    	        <div class="reser_icon">
        	        <img src="../img/pro_icon.jpg" runat="server" id="collectorImg"/>
                </div>
                <div class="reser_con">
        	        <div><img src="../img/baechul/i-cld.png" class="img27f" /><span class="font_size14bi"> 예약현황</span></div>
                    <div runat="server" id="reserved">
                            <div class="font_size12 color_b7b7b7"> 
            	                <p><span runat="server" id="collectList"></span></p>
            	                <p>담당자 : <span  runat="server" id="collectorName"></span> 기사님</p>
                                <p>연락처 : <span runat="server" id="collectorContactNumber"></span></p>
                                <p>희망수거일시 : <span  runat="server" id="collectorHopeDate"></span></p>
                            </div>
                            <a href="javascript:;" runat="server" id="btnQuickRequestCancel"><span class="btn_grean">취소</span></a>
                    </div>
                    <div runat="server" id="notReserved">
                        <div style="height:40px;padding-top:30px; text-align:center;">수거신청내역이 없습니다.</div>
                        <a href="javascript:;" runat="server" id="btnQuickRequest"><span class="btn_grean">수거신청</span></a>
                    </div>
                </div>
            </div>
            <div class="harf_con">
    	        <div class="harf_l" id="btnNoticeEvent" style="cursor:pointer">
        	        <span class="cic_icon">12</span>
                    <p><a href="javascript:;"><img src="../img/baechul/i-ntc.png" class="img30" /></a></p>
                    <%--<p><a href="#">공지사항 / 이벤트</a></p>--%>
                    <p><a href="javascript:;" style="font-weight:bold">공지사항</a></p>
                </div>
                <div class="harf_r" id="btnSimpleUsageGuide" style="cursor:pointer">
        	        <span class="cic_icon2"><img src="../img/baechul/ird-icn.png" class="img40" /></span>
                    <p><a href="javascript:;"><img src="../img/baechul/i-inf.png" class="img30" /></a></p>
                    <p><a href="javascript:;" style="font-weight:bold">이용안내</a></p>
                </div>
            </div>
            <div class="harf_con" style="text-align:center; padding:15px 0;">
                <p>한국자원거래소 Ι 대표:김재현 Ι 서울용산녹사평대로40가길2-10</p>
                <p>고객센터:1644-9317 I cs@hrx.co.kr I fax:080-8097-9317</p>
                <p>736-87-00212 Ι 제22017-서울용산-0149호</p>
            </div>

	        <div class="ranking" id="ranking">
    	        <table>
        	        <tbody></tbody>
                </table>   	
            </div>

	        <div class="ranking" id="totalDonationAmount">
    	        <table>
        	        <tbody></tbody>
                </table>   	
            </div>

	        <div class="recommend" id="recommend">
		        <p class="rec_text">추천인 입력</p> 
                <div class="float_l">
                    <div class="reco_l">
                        <input type="text" name="" placeholder="추천인 닉네임 입력" value="" id="txtRecommenderNickname"/>
                    </div>	
                    <div class="reco_r">
                    <img src="../img/baechul/btn-cnf.png" height="40" id="btnSave" style="cursor:pointer;"/>
                    </div>	
                </div>
        
                <p class="rec_text">친구초대</p> 
                <div class="rec_sns_con">
        	        <div class="reco_sns" style="width:33.3%"><a id="kakao-link-btn" href="javascript:sendKakaoLink()"><img src="../img/baechul/frd-kko.png" class="img60" /><p>카카오톡</p></a></div>
                    <div class="reco_sns" style="width:33.3%"><a id="sms-btn" href="javascript:infoBox('문자공유는 스마트폰에서만 가능합니다.');"><img src="../img/baechul/frd-sms.png" class="img60" /><p>SMS</p></a></div>
                    <%--<div class="reco_sns"><a href="#"><img src="/img/baechul/frd-lin.png" class="img60" /><p>LINE</p></a></div>--%>
                    <div class="reco_sns" style="width:33.3%"><a id="copy-btn" href="javascript:;"><img src="../img/baechul/frd-lnk.png" class="img60" /><p>링크</p></a></div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- #include file="/include/footer.html" -->

    <script type="text/javascript" src="../script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>
    <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script type="text/javascript" src="../script/drawer.min.js"></script>
    <script type="text/javascript" src="../script/clipboard.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js" type="text/javascript"></script>

    <script>
        //<![CDATA[
        // // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('8316ff1b5d02ffcacf9a4ab2fbeb344d');
        // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
        function sendKakaoLink() {
            var device = check_device();
            if (device === '') {
                infoBox("카카오톡으로 공유하기는 스마트폰에서만 가능합니다.");
                return;
            }

            Kakao.Link.sendCustom({
                templateId: 3619,
                templateArgs: {
                    'title': '',
                    'description': "신개념 재활용품 방문수거 앱 출시! 지금 '리본 수거'를 검색하시고, 추가 적립금과 리뷰 이벤트 등 다양한 혜택을 누리세요~~♡♡ (추천인:" + $('#nickname').text() + ")"
                }
            });
        }
        //]]>

        function check_device() {
            var mobileKeyWords = new Array('iPhone', 'iPad', 'iPod', 'Android');
            var device_name = '';
            for (var word in mobileKeyWords) {
                if (navigator.userAgent.match(mobileKeyWords[word]) != null) {
                    device_name = mobileKeyWords[word];
                    break;
                }
            }
            return device_name
        }

        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    $("#tabHome").find("img").attr("src", "../img/top_menu/top01o.png");

                    $("#ranking").hide();
                    $("#totalDonationAmount").hide();
                    $("#recommend").hide();

                    var device = check_device();

                    if (device === 'iPhone') {
                        $("#sms-btn").attr("href", "sms:&body=신개념 재활용품 방문수거 앱 출시! 지금 '리본 수거'를 검색하시고, 추가 적립금과 리뷰 이벤트 등 다양한 혜택을 누리세요~~♡♡ (추천인:" + $('#nickname').text() + ")");
                    } else if (device === 'Android') {
                        $("#sms-btn").attr("href", "sms:?body=신개념 재활용품 방문수거 앱 출시! 지금 '리본 수거'를 검색하시고, 추가 적립금과 리뷰 이벤트 등 다양한 혜택을 누리세요~~♡♡ (추천인:" + $('#nickname').text() + ")");
                    }

                    var clipboard = new Clipboard('#copy-btn', {
                        text: function () {
                            return 'http://hrx.co.kr/Default.aspx';
                        }
                    });

                    clipboard.on('success', function (e) {
                        infoBox("공유주소가 복사되었습니다.");
                    });
                },
                initEvent: function () {
                    $(document).on('click', '#tabRequest', function () {
                        location.href = "CollectRequest.aspx";
                    });
                    $(document).on('click', '#tabStore', function () {
                        location.href = "StoreMain.aspx";
                    });
                    $(document).on('click', '#tabDonate', function () {
                        location.href = "Donate.aspx";
                    });

                    $(document).on('click', '#btnQuickRequest', function () {
                        location.href = "CollectRequest.aspx";
                    });

                    $(document).on('click', '#btnQuickRequestCancel', function () {
                        confirmBox("수거예약을 취소하시겠습니까?", page.fn.cancelRequest);
                    });

                    $(document).on('click', '#btnFooter01', function () {
                        $('.slide').show();
                        $(".reser").show();
                        $(".harf_con").show();
                        $("#ranking").hide();
                        $("#totalDonationAmount").hide();
                        $("#recommend").hide();

                        $(".drawer--sidebar").addClass("foot_back01");
                        $(".drawer--sidebar").removeClass("foot_back02");

                        $("#btnFooter01").find("img").attr("src", "../img/foot_menu/foot01o.png");
                        $("#btnFooter02").find("img").attr("src", "../img/foot_menu/foot02.png");
                        $("#btnFooter03").find("img").attr("src", "../img/foot_menu/foot03.png");
                        $("#btnFooter04").find("img").attr("src", "../img/foot_menu/foot04.png");
                    });
                    $(document).on('click', '#btnFooter02', function () {
                        $('.slide').hide();
                        $(".reser").hide();
                        $(".harf_con").hide();
                        $("#ranking").show();
                        $("#totalDonationAmount").hide();
                        $("#recommend").hide();

                        $(".drawer--sidebar").addClass("foot_back01");
                        $(".drawer--sidebar").removeClass("foot_back02");

                        $("#btnFooter01").find("img").attr("src", "../img/foot_menu/foot01.png");
                        $("#btnFooter02").find("img").attr("src", "../img/foot_menu/foot02o.png");
                        $("#btnFooter03").find("img").attr("src", "../img/foot_menu/foot03.png");
                        $("#btnFooter04").find("img").attr("src", "../img/foot_menu/foot04.png");
                    });
                    $(document).on('click', '#btnFooter03', function () {
                        $('.slide').hide();
                        $(".reser").hide();
                        $(".harf_con").hide();
                        $("#ranking").hide();
                        $("#totalDonationAmount").show();
                        $("#recommend").hide();

                        $(".drawer--sidebar").addClass("foot_back01");
                        $(".drawer--sidebar").removeClass("foot_back02");

                        $("#btnFooter01").find("img").attr("src", "../img/foot_menu/foot01.png");
                        $("#btnFooter02").find("img").attr("src", "../img/foot_menu/foot02.png");
                        $("#btnFooter03").find("img").attr("src", "../img/foot_menu/foot03o.png");
                        $("#btnFooter04").find("img").attr("src", "../img/foot_menu/foot04.png");
                    });
                    $(document).on('click', '#btnFooter04', function () {
                        $('.slide').hide();
                        $(".reser").hide();
                        $(".harf_con").hide();
                        $("#ranking").hide();
                        $("#totalDonationAmount").hide();
                        $("#recommend").show();

                        $(".drawer--sidebar").removeClass("foot_back01");
                        $(".drawer--sidebar").addClass("foot_back02");

                        $("#btnFooter01").find("img").attr("src", "../img/foot_menu/foot01.png");
                        $("#btnFooter02").find("img").attr("src", "../img/foot_menu/foot02.png");
                        $("#btnFooter03").find("img").attr("src", "../img/foot_menu/foot03.png");
                        $("#btnFooter04").find("img").attr("src", "../img/foot_menu/foot04o.png");
                    });
                    $(document).on('click', '#btnSave', function () {
                        if ($("#txtRecommenderNickname").val() == "") {
                            errorBox("추천인 닉네임을 입력하세요.");
                            return;
                        }

                        page.fn.saveRecommender();
                    });
                    $(document).on('click', '#btnSave', function () {
                        if ($("#txtRecommenderNickname").val() == "") {
                            $("#txtRecommenderNickname").focus();
                            errorBox("추천인 닉네임을 입력하세요.");
                            return;
                        }

                        page.fn.saveRecommender();
                    });
                    $(document).on('click', '#btnNoticeEvent', function () {
                        location.href = "/Support/Notice.aspx";
                    });
                    $(document).on('click', '#btnSimpleUsageGuide', function () {
                        location.href = "/Support/SimpleUsageGuide.aspx";
                    });
                },
                fn: {
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
                                medal = '<img src="../img/gold.png" style="width:16px; height:auto;">';
                                break;
                            case 2:
                                medal = '<img src="../img/silver.png" style="width:16px; height:auto;">';
                                break;
                            case 3:
                                medal = '<img src="../img/bronze.png" style="width:16px; height:auto;">';
                                break;
                            default:
                                medal = item[0];
                                break;
                        }

                        var profileImg = "";
                        if (item[3] == "") {
                            profileImg = '<img src="../img/baechul/kko-prf-2.png" class="img23"/>';
                        } else {
                            profileImg = '<img src="' + item[3] + '" class="img23"/>';
                        }

                        var rank = '<tr class="">'
                                 + '	<td class="td_rang01">' + medal + '</td>'
                                 + '	<td class="td_rang02">' + profileImg + ' ' +item[5] + '</td>'
                                 + '    <td class="td_rang03">' + commaSeparateNumber(item[1]) + '</td>'
                                 + '</tr>';

                        $("#ranking").find("table").find("tbody").append(rank);
                    },
                    getDonationAmount: function () {
                        Server.ajax("/producer/donationAmount", null, function (response, status, xhr) {
                            if (response.value == 0) {
                                var totalDonationAmount = '<tr class="tr_top">'
                                                        + '	<td class="td_rang3_1"></td>'
                                                        + '	<td class="td_rang3_2">전체 누적 기부 금액</td>'
                                                        + '    <td class="td_rang3_3"><span class="font_color5e8d19">TODAY : ' + commaSeparateNumber(response.donationAmount[0][0]) + '</span>'
                                                        + '    	<p class="total">' + commaSeparateNumber(response.donationAmount[0][1]) + '<img src="../img/p.png" class="img20_icon" /></p>'
                                                        + '    </td>'
                                                        + '    <td class="td_rang3_4"></td>'
                                                        + '</tr>';

                                $("#totalDonationAmount").find("table").find("tbody").append(totalDonationAmount);
                            } else {
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    },
                    saveRecommender: function () {
                        var params = {
                            producerIdx: $("#hdProducerIdx").val(),
                            recommenderNickname: $("#txtRecommenderNickname").val(),
                        }

                        Server.ajax("/producer/recommenderRegist", params, function (response, status, xhr) {
                            if (response.value == 0) {
                                infoBox($("#txtRecommenderNickname").val() + "님을 추천인으로 등록하셨습니다.");
                            } else {
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    },
                    cancelRequest: function () {
                        var params = {
                            produceIdx: $("#hdProduceIdx").val(),
                            producerIdx: $("#hdProducerIdx").val()
                        }

                        Server.ajax("/producer/produceCancel", params, function (response, status, xhr) {
                            if (response.value == 0) {
                                infoBoxWithCallback("수거예약이 취소되었습니다.", page.fn.goUrl, { url: "/Main.aspx" })
                            } else {
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    },
                    goUrl: function (urlData) {
                        location.href = urlData.url;
                    },
                }
            };

            $(document).on('ready', function () {
                page.init();
                $('.drawer').drawer({
                    iscroll: {
                        mouseWheel: true,
                        preventDefault: false
                    },
                    showOverlay: true
                });
                page.fn.getRank();
                page.fn.getDonationAmount();

                $("#btnFooter01").find("img").attr("src", "../img/foot_menu/foot01o.png");
            });

        })();
    </script>
</body>
</html>
