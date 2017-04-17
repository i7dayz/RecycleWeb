<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="RecycleWeb.Main" %>

<!-- #include file="./include/header.html" --> 
    <link href="script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />
    <style>
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
    <!-- #home tab -->          
    <input type="hidden" runat="server" id="hdProduceIdx" />
    <input type="hidden" runat="server" id="hdProducerIdx" />    
    <div class="container" style="">
	    <div class="member_po">
    	    <p class="rtext">만료예정일 : <label runat="server" id="exDate"></label></p>
            <p class="rtext">만료예정 포인트 : <label runat="server" id="exPoint"></label></p>
            <p class="ctext">
                <div class="image-wrapper">
                    <div class="image">
                        <img runat="server" id="profileImg" src="img/person64x64.png">
                    </div>
                </div>
            </p>
            <p class="ctext color_b7b7b7 font_size12"><label runat="server" id="nickname"></label></p>
            <p class="ctext font_size34b "><label runat="server" id="point">0</label> <img src="/img/d-pnt-56.png" class="img20" /></p>
        </div>
        <div class="slide">
        <!-- #include file="./include/main_full_slide.html" -->
        </div>

        <div class="reser">
    	    <div class="reser_icon">
        	    <img src="/img/pro_icon.jpg" runat="server" id="collectorImg"/>
            </div>
            <div class="reser_con">
                <div runat="server" id="reserved">
        	            <div><img src="/img/baechul/i-cld.png" class="img27f" /><span class="font_size14bi"> 예약현황</span></div>
                        <div class="font_size12 color_b7b7b7"> 
            	            <p><span runat="server" id="collectList"></span></p>
            	            <p>담당자 : <span  runat="server" id="collectorName"></span> 기사님</p>
                            <p>연락처 : <span runat="server" id="collectorContactNumber"></span></p>
                            <p>희망수거일시 : <span  runat="server" id="collectorHopeDate"></span></p>
                        </div>
                        <a href="javascript:;" runat="server" id="btnQuickRequestCancel"><span class="btn_grean">취소</span></a>
                </div>
                <div runat="server" id="notReserved">
                    <span>수거신청내역이 없습니다.</span>
                    <a href="javascript:;" runat="server" id="btnQuickRequest"><span class="btn_grean">수거신청</span></a>
                </div>
            </div>
        </div>
        <div class="harf_con">
    	    <div class="harf_l">
        	    <span class="cic_icon">12</span>
                <p><a href="#"><img src="/img/baechul/i-ntc.png" class="img27" /></a></p>
                <p><a href="#">공지사항 / 이벤트</a></p>
            </div>
            <div class="harf_r" id="btnSimpleUsageGuide" style="cursor:pointer">
        	    <span class="cic_icon2"><img src="/img/baechul/ird-icn.png" class="img40" /></span>
                <p><a href="#"><img src="/img/baechul/i-inf.png" class="img30" /></a></p>
                <p><a href="#">이용안내</a></p>
            </div>
        </div>

	    <div class="ranking" id="ranking">
    	    <table>
        	    <tbody>
                    <%--<tr class="">
                	    <td class="td_rang01"><img src="/img/baechul/rnk-g.png" width="20" /></td>
                	    <td class="td_rang02"><a href="#"><img src="/img/baechul/kko-prf-2.png" class="img23"/>happysoyle</a></td>
                        <td class="td_rang03">10,000,000</td>
                    </tr>
                    <tr class="">
                	    <td class="td_rang01"><img src="/img/baechul/rnk-s.png" width="20" /></td>
                	    <td class="td_rang02"><a href="#"><img src="/img/baechul/kko-prf-2.png" class="img23"/> happysdoyle</a></td>
                        <td class="td_rang03">8,000,000</td>
                    </tr>
                    <tr class="">
                	    <td class="td_rang01"><img src="/img/baechul/rnk-b.png" width="20" /></td>
                	    <td class="td_rang02"><a href="#"><img src="/img/baechul/kko-prf-2.png" class="img23"/> happssysoyle</a></td>
                        <td class="td_rang03">6,000,000</td>
                    </tr>
                    <tr class="">
                	    <td class="td_rang01">4</td>
                	    <td class="td_rang02"><a href="#"><img src="/img/baechul/kko-prf-2.png" class="img23"/> happysle</a></td>
                        <td class="td_rang03">500,000</td>
                    </tr>
                    <tr class="sel">
                	    <td class="td_rang01">56</td>
                	    <td class="td_rang02"><a href="#"><img src="/img/baechul/kko-prf-2.png" class="img23"/> happe</a></td>
                        <td class="td_rang03">300,000</td>
                    </tr>
                    <tr class="">
                	    <td class="td_rang01">57</td>
                	    <td class="td_rang02"><a href="#"><img src="/img/baechul/kko-prf-2.png" class="img23"/> happe</a></td>
                        <td class="td_rang03">300,000</td>
                    </tr>--%>
                </tbody>
            </table>   	
        </div>

	    <div class="ranking" id="totalDonationAmount">
    	    <table>
        	    <tbody>               
                    <%--<tr class="tr_top">
                	    <td class="td_rang3_1"></td>
                	    <td class="td_rang3_2">전체 누적 기부 금액</td>
                        <td class="td_rang3_3"><span class="font_color5e8d19">TODAY : 10,800</span>
                    	    <p class="total">779,000<img src="/img/p.png" class="img20_icon" /></p>
                        </td>
                        <td class="td_rang3_4"></td>
                    </tr>--%>
                
                    <%--<tr class="">
                	    <td class="td_rang3_1"></td>
                	    <td class="td_rang3_2">2016.12.16</td>
                        <td class="td_rang3_3">10,200</td>
                        <td class="td_rang3_4"></td>
                    </tr>
                    <tr class="">
                	    <td class="td_rang3_1"></td>
                	    <td class="td_rang3_2">2016.12.02</td>
                        <td class="td_rang3_3">20,200</td>
                        <td class="td_rang3_4"></td>
                    </tr>
                    <tr class="">
                	    <td class="td_rang3_1"></td>
                	    <td class="td_rang3_2">2016.11.26</td>
                        <td class="td_rang3_3">16,400</td>
                        <td class="td_rang3_4"></td>
                    </tr>
                    <tr class="">
                	    <td class="td_rang3_1"></td>
                	    <td class="td_rang3_2">2016.11.13</td>
                        <td class="td_rang3_3">44,900</td>
                        <td class="td_rang3_4"></td>
                    </tr>
                    <tr class="">
                	    <td class="td_rang3_1"></td>
                	    <td class="td_rang3_2">2016.10.17</td>
                        <td class="td_rang3_3">10,200</td>
                        <td class="td_rang3_4"></td>
                    </tr>
                    <tr class="">
                	    <td class="td_rang3_1"></td>
                	    <td class="td_rang3_2">2016.10.11</td>
                        <td class="td_rang3_3">10,200</td>
                        <td class="td_rang3_4"></td>
                    </tr>--%>
                </tbody>
            </table>   	
        </div>

	    <div class="recommend" id="recommend">
		    <p class="rec_text">추천인 입력</p> 
            <div class="float_l">
                <div class="reco_l">
                    <input type="text" name="" placeholder="추천인 닉네임 입력" value="" id="txtRecommenderNickname"/>
                </div>	
                <div class="reco_r">
                    <img src="/img/baechul/btn-cnf.png" height="40" id="btnSave"/>
                </div>	
            </div>
        
            <p class="rec_text">친구초대</p> 
            <div class="rec_sns_con">
        	    <div class="reco_sns"><a href="#"><img src="/img/baechul/frd-kko.png" class="img60" /><p>카카오톡</p></a></div>
                <div class="reco_sns"><a href="#"><img src="/img/baechul/frd-sms.png" class="img60" /><p>SMS</p></a></div>
                <div class="reco_sns"><a href="#"><img src="/img/baechul/frd-lin.png" class="img60" /><p>LINE</p></a></div>
                <div class="reco_sns"><a href="#"><img src="/img/baechul/frd-lnk.png" class="img60" /><p>링크</p></a></div>
            </div>
        </div>
    </div>

    <!-- #include file="/include/footer.html" -->

    <script type="text/javascript" src="/script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/script/common.js"></script>
    <script type="text/javascript" src="/script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <%--<script type="text/javascript" src="/script/dropdown.min.js"></script>--%>
    <script type="text/javascript" src="/script/drawer.min.js"></script>
        
    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    $('.drawer').drawer();
                    $("#tabHome").find("img").attr("src", "/img/top_menu/top01o.png");

                    $("#ranking").hide();
                    $("#totalDonationAmount").hide();
                    $("#recommend").hide();
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
                                medal = '<img src="img/gold.png" style="width:16px; height:auto;">';
                                break;
                            case 2:
                                medal = '<img src="img/silver.png" style="width:16px; height:auto;">';
                                break;
                            case 3:
                                medal = '<img src="img/bronze.png" style="width:16px; height:auto;">';
                                break;
                            default:
                                medal = item[0];
                                break;
                        }

                        var profileImg = "";
                        if (item[3] == "") {
                            profileImg = '<img src="/img/baechul/kko-prf-2.png" class="img23"/>';
                        } else {
                            profileImg = '<img src="' + item[3] + '" class="img23"/>';
                        }

                        var rank = '<tr class="">'
                                 + '	<td class="td_rang01">' + medal + '</td>'
                                 + '	<td class="td_rang02"><a href="#">' + profileImg + ' ' +item[5] + '</a></td>'
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
                                                        + '    	<p class="total">' + commaSeparateNumber(response.donationAmount[0][1]) + '<img src="./img/p.png" class="img20_icon" /></p>'
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
                $('.drawer').drawer();
                page.fn.getRank();
                page.fn.getDonationAmount();
            });

        })();
    </script>
</body>
</html>