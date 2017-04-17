<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CollectRequest.aspx.cs" Inherits="RecycleWeb.CollectRequest" %>

<!-- #include file="./include/header.html" --> 
    <link href="script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />

    <!-- 수거신청 탭 -->        
    <div class="container" style="">
        <form runat="server" id="pickupForm" method="post" action="Collection/RequestDetails.aspx" data-ajax="false">
            <input type="hidden" runat="server" id="hdProduce_1_price" />
            <input type="hidden" runat="server" id="hdProduce_2_price" />
            <input type="hidden" runat="server" id="hdProduce_3_price" />
            <input type="hidden" runat="server" id="hdProduce_4_price" />
            <input type="hidden" runat="server" id="hdProduce_5_price" />
            <input type="hidden" runat="server" id="hdProduce_6_price" />
            <input type="hidden" runat="server" id="hdProduce_7_price" />
            <input type="hidden" runat="server" id="hdProduce_8_price" />
            <input type="hidden" runat="server" id="hdProduce_9_price" />
            <input type="hidden" runat="server" id="hdProduce_10_price" />
            <input type="hidden" runat="server" id="hdProduceIdx" />
            <input type="hidden" runat="server" id="hdProducerIdx" />   

	        <div class="description">
    	        <img src="./img/page_description/4_1top.gif" width="100%" />
            </div>
            <div class="text_title">
                <span class="font_size14b">수거서비스</span>
                <span class="font_size10_bbb"><a href="Collection/ProductDescription.aspx">ⓘ 수거가능/불가능 품목 확인</a></span>
            </div>
            <div class="harf_con2">
    	        <div class="harf_l">
                    <p><a href="#"><img src="./img/sugeo/su_icon/pck_01.png" class="img65"></a></p>
                    <p class="su_name">헌옷</p>
                    <p class="su_pm"><span class="kg_m"><img src="/img/minus.png" /></span><input type="text" class="kg" runat="server" id="txtProduct06" style="width:30px; height:21px; text-align:right; border:0" value="0" readonly><span class="kg">kg</span><span class="kg_p"><img src="/img/plus.png" /></span></p>
                </div>
                <div class="harf_r">
                    <p><a href="#"><img src="./img/sugeo/su_icon/pck_02.png" class="img65"></a></p>
                    <p class="su_name">휴대폰</p>
                    <p class="su_pm"><span class="kg_m"><img src="/img/minus.png" /></span><input type="text" class="kg" runat="server" id="txtProduct07" style="width:30px; height:21px; text-align:right; border:0" value="0" readonly><span class="kg">개</span><span class="kg_p"><img src="/img/plus.png" /></span></p>
                </div>
            </div>
            <div class="line_d"></div>
            <div class="harf_con2">
    	        <div class="harf_l">
                    <p><a href="#"><img src="./img/sugeo/su_icon/pck_03.png" class="img65"></a></p>
                    <p class="su_name">소형가전</p>
                    <p class="su_pm"><span class="kg_m"><img src="/img/minus.png" /></span><input type="text" class="kg" runat="server" id="txtProduct09" style="width:30px; height:21px; text-align:right; border:0" value="0" readonly><span class="kg">개</span><span class="kg_p"><img src="/img/plus.png" /></span></p>
                </div>
                <div class="harf_r">
                    <p><a href="#"><img src="./img/sugeo/su_icon/pck_04.png" class="img65"></a></p>
                    <p class="su_name">대형가전</p>
                    <p class="su_pm"><span class="kg_m"><img src="/img/minus.png" /></span><input type="text" class="kg" runat="server" id="txtProduct08" style="width:30px; height:21px; text-align:right; border:0" value="0" readonly><span class="kg">개</span><span class="kg_p"><img src="/img/plus.png" /></span></p>
                </div>
            </div>
            <div class="line_d"></div>
            <div class="harf_con2">
    	        <div class="harf_l">
                    <p><a href="#"><img src="./img/sugeo/su_icon/pck_05.png" class="img65"></a></p>
                    <p class="su_name">폐지</p>
                    <p class="su_pm"><span class="kg_m"><img src="/img/minus.png" /></span><input type="text" class="kg" runat="server" id="txtProduct01" style="width:30px; height:21px; text-align:right; border:0" value="0" readonly><span class="kg">kg</span><span class="kg_p"><img src="/img/plus.png" /></span></p>
                </div>
                <div class="harf_r">
                    <p><a href="#"><img src="./img/sugeo/su_icon/pck_06.png" class="img65"></a></p>
                    <p class="su_name">병</p>
                    <p class="su_pm"><span class="kg_m"><img src="/img/minus.png" /></span><input type="text" class="kg" runat="server" id="txtProduct02" style="width:30px; height:21px; text-align:right; border:0" value="0" readonly><span class="kg">개</span><span class="kg_p"><img src="/img/plus.png" /></span></p>
                </div>
            </div>
            <div class="line_d"></div>
            <div class="harf_con2">
    	        <div class="harf_l">
                    <p><a href="#"><img src="./img/sugeo/su_icon/pck_07.png" class="img65"></a></p>
                    <p class="su_name">고철</p>
                    <p class="su_pm"><span class="kg_m"><img src="/img/minus.png" /></span><input type="text" class="kg" runat="server" id="txtProduct04" style="width:30px; height:21px; text-align:right; border:0" value="0" readonly><span class="kg">kg</span><span class="kg_p"><img src="/img/plus.png" /></span></p>
                </div>
                <div class="harf_r">
                    <p><a href="#"><img src="./img/sugeo/su_icon/pck_08.png" class="img65"></a></p>
                    <p class="su_name">비철</p>
                    <p class="su_pm"><span class="kg_m"><img src="/img/minus.png" /></span><input type="text" class="kg" runat="server" id="txtProduct05" style="width:30px; height:21px; text-align:right; border:0" value="0" readonly><span class="kg">kg</span><span class="kg_p"><img src="/img/plus.png" /></span></p>
                </div>
            </div>
            <div class="line_d"></div>
            <div class="harf_con2">
    	        <div class="harf_l">
                    <p><a href="#"><img src="./img/sugeo/su_icon/pck_09.png" class="img65"></a></p>
                    <p class="su_name">이삿짐</p>
                    <p class="su_onoff">
                        <img src="./img/baechul/pck-usl.png" height="20px" />
                        <input type="checkbox" runat="server" id="chkProduct10" style="display:none" />
                    </p>
                </div>
                <div class="harf_r">
                    <p><a href="#"><img src="./img/sugeo/su_icon/pck_10.png" class="img65"></a></p>
                    <p class="su_name">기타</p>
                    <p class="su_onoff">
                        <img src="./img/baechul/pck-usl.png" height="20px" />
                        <input type="checkbox" runat="server" id="chkEtc1" style="display:none" />
                    </p>
                </div>
            </div>
            <p class="text_title">
    	        <span class="font_size14b">대행서비스</span>
                <span class="font_size10_bbb"><a href="Collection/ProductDescription.aspx">ⓘ 수거가능/불가능 품목 확인</a></span>
            </p>
            <div class="harf_con2">
    	        <div class="harf_l">
                    <p><a href="#"><img src="./img/sugeo/su_icon/pck_big01.png" class="img65"></a></p>
                    <p class="su_name">폐기대행</p>
                    <p class="su_onoff">
                        <img src="./img/baechul/pck-usl.png" height="20px" />
                        <input type="checkbox" runat="server" id="chkEtc2" style="display:none" />
                    </p>
                </div>
                <div class="harf_r">
                    <p><a href="#"><img src="./img/sugeo/su_icon/pck_big02.png" class="img65"></a></p>
                    <p class="su_name">유품정리</p>
                    <p class="su_onoff">
                        <img src="./img/baechul/pck-usl.png" height="20px" />
                        <input type="checkbox" runat="server" id="chkEtc3" style="display:none" />
                    </p>
                </div>
            </div>
            <div runat="server" id="not_reserved">
                <p class="su_btn">
    	            수거하기
                </p>
            </div>
            <div runat="server" id="reserved">
                <p class="su_btn">
    	            수거취소
                </p>
            </div>
        </form>
    </div> <!-- //수거신청 tab -->
        
    <script type="text/javascript" src="script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="script/common.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <%--<script type="text/javascript" src="script/dropdown.min.js"></script>--%>
    <script type="text/javascript" src="script/drawer.min.js"></script>
    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    $("#tabRequest").find("img").attr("src", "/img/top_menu/top02o.png");
                },
                initEvent: function () {
                    $(document).on('click', '#tabHome', function () {
                        location.href = "Main.aspx";
                    });
                    $(document).on('click', '#tabStore', function () {
                        location.href = "StoreMain.aspx";
                    });
                    $(document).on('click', '#tabDonate', function () {
                        location.href = "Donate.aspx";
                    });

                    $(document).on('click', '.kg_m', function () {
                        var $input = $($(this).parent().find('input[class=kg]'));
                        var currCount = $input.val();
                        $input.val(parseInt(currCount) - 1 < 0 ? 0 : parseInt(currCount) - 1);
                    });

                    $(document).on('click', '.kg_p', function () {
                        var $input = $($(this).parent().find('input[class=kg]'));
                        var currCount = $input.val();
                        $input.val(parseInt(currCount) + 1);
                    });
                    
                    $(document).on('click', '.su_onoff', function () {
                        var $input = $(this).find('input');
                        $input.prop('checked', !$input.prop('checked'));

                        if ($input.prop('checked')) {
                            $(this).find('img').attr('src', 'img/baechul/pck-slt.png');
                        }
                        else {
                            $(this).find('img').attr('src', 'img/baechul/pck-usl.png');
                        }

                    });

                    $(document).on('click', '#not_reserved', function () {
                        // 선택된 항목이 한개라도 있어야 수거 신청 가능
                        if (parseInt($("#txtProduct06").val()) > 0 || parseInt($("#txtProduct07").val()) > 0
                            || parseInt($("#txtProduct09").val()) > 0 || parseInt($("#txtProduct08").val()) > 0
                            || parseInt($("#txtProduct01").val()) > 0 || parseInt($("#txtProduct02").val()) > 0
                            || parseInt($("#txtProduct04").val()) > 0 || parseInt($("#txtProduct05").val()) > 0
                            || $("#chkProduct10").is(":checked")
                            || $("#chkEtc1").is(":checked")
                            || $("#chkEtc2").is(":checked")
                            || $("#chkEtc3").is(":checked")) {

                            // 여기서 수거신청 금액 확인
                            if (!page.fn.checkPrice()) {
                                infoBox("수거신청은 총 요청 금액이 3,000원 이상이거나 수거대상이 20kg이상일 경우 가능합니다. (단 이삿짐, 기타, 폐기서비스, 유품정리의 경우 단일건 가능)");
                                return;
                            }
                            //return;
                            $("#pickupForm").submit();
                        }
                        else {
                            infoBox("선택된 수거요청항목이 없습니다.");
                            return;
                        }
                    });

                    $(document).on('click', '#reserved', function () {
                        confirmBox("수거예약을 취소하시겠습니까?", page.fn.cancelRequest);
                    });
                },
                fn: {
                    cancelRequest: function () {
                        var params = {
                            produceIdx: $("#hdProduceIdx").val(),
                            producerIdx: $("#hdProducerIdx").val()
                        }

                        Server.ajax("/producer/produceCancel", params, function (response, status, xhr) {
                            if (response.value == 0) {
                                infoBoxWithCallback("수거예약이 취소되었습니다.", page.fn.goUrl, { url: "/CollectRequest.aspx" })
                            } else {
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    },
                    goUrl: function (urlData) {
                        location.href = urlData.url;
                    },
                    checkPrice: function () {
                        var totalPrice = 0;
                        var totalCount = 0;
                        var canRequest = false;

                        if (parseInt($("#txtProduct06").val()) > 0) {
                            totalPrice = totalPrice + (parseInt($("#txtProduct06").val()) * parseInt($("#hdProduce_6_price").val()));
                            totalCount = totalCount + parseInt($("#txtProduct06").val());
                        }
                        if (parseInt($("#txtProduct07").val()) > 0) {
                            totalPrice = totalPrice + (parseInt($("#txtProduct07").val()) * parseInt($("#hdProduce_7_price").val()));
                            totalCount = totalCount + parseInt($("#txtProduct07").val());
                        }

                        if (parseInt($("#txtProduct09").val()) > 0) {
                            totalPrice = totalPrice + (parseInt($("#txtProduct09").val()) * parseInt($("#hdProduce_9_price").val()));
                            totalCount = totalCount + parseInt($("#txtProduct09").val());
                        }
                        if (parseInt($("#txtProduct08").val()) > 0) {
                            totalPrice = totalPrice + (parseInt($("#txtProduct08").val()) * parseInt($("#hdProduce_8_price").val()));
                            totalCount = totalCount + parseInt($("#txtProduct08").val());
                        }

                        if (parseInt($("#txtProduct01").val()) > 0) {
                            totalPrice = totalPrice + (parseInt($("#txtProduct01").val()) * parseInt($("#hdProduce_1_price").val()));
                            totalCount = totalCount + parseInt($("#txtProduct01").val());
                        }
                        if (parseInt($("#txtProduct02").val()) > 0) {
                            totalPrice = totalPrice + (parseInt($("#txtProduct02").val()) * parseInt($("#hdProduce_2_price").val()));
                            totalCount = totalCount + parseInt($("#txtProduct02").val());
                        }

                        if (parseInt($("#txtProduct04").val()) > 0) {
                            totalPrice = totalPrice + (parseInt($("#txtProduct04").val()) * parseInt($("#hdProduce_4_price").val()));
                            totalCount = totalCount + parseInt($("#txtProduct04").val());
                        }
                        if (parseInt($("#txtProduct05").val()) > 0) {
                            totalPrice = totalPrice + (parseInt($("#txtProduct05").val()) * parseInt($("#hdProduce_5_price").val()));
                            totalCount = totalCount + parseInt($("#txtProduct05").val());
                        }

                        if (totalPrice >= 3000 || totalCount >= 20) {
                            canRequest = true;
                        }

                        if (!canRequest) {
                            if ($("#chkProduct10").is(":checked")
                                || $("#chkEtc1").is(":checked")
                                || $("#chkEtc2").is(":checked")
                                || $("#chkEtc3").is(":checked")) {
                                canRequest = true;
                            }
                        }

                        return canRequest;
                    }
                }
            };

            $(document).on('ready', function () {
                page.init();
                $('.drawer').drawer();
            });

        })();
    </script>
</body>
</html>