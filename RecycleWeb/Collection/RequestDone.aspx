<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestDone.aspx.cs" Inherits="RecycleWeb.Collection.RequestDone" %>


<!-- #include file="/include/header_b.html" --> 
    <link href="../script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />

    <!-- 수거신청 탭 -->        
        <input type="hidden" runat="server" id="hdProduceIdx" />
        <input type="hidden" runat="server" id="hdProducerIdx" />   
        <header>
                <div class="su_header">
			        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>수거신청
                </div>
            </header>
        <div class="container" style="">
	        <p class="su_wan">수거신청이 완료되었습니다. 기사님이 방문 전에 연락드리겠습니다.</p>
	        <div class="su_form">    	
    	        <div class="ctext pad20">
                    <img src="/img/baechul/kko-prf-1.png" width="100" id="imgCollectorImg" runat="server">
    	        </div>
                <div class="su_title"><span class="color90cd32">[수거신청품목]</span></div>
                <div><input type="text" runat="server" id="txtReqList" name="" value="" class="su_input" readonly/></div>
                <div class="su_title">수거 담당자</div>
                <div><input type="text" runat="server" id="txtCollectorName" name="" value="" class="su_input" readonly /></div>
                <div class="su_title">연락처</div>
                <div><input type="text" runat="server" id="txtCollectorContactNumber" name="" value="" class="su_input" readonly /></div>
                <div class="su_title">희망수거일시</div>
                <div><input type="text" runat="server" id="txtReqDate" name="" value="" class="su_input" readonly /></div>
                <div style="height:30px;"></div>
                <div class="harf_con">
                    <div class="harf_l2">
                        <div class="btn_gray2" id="btnCancel" style="cursor:pointer" >취소</div>
                    </div>
                    <div class="harf_r2">
                        <div class="btn_grean2" id="btnConfirm" style="cursor:pointer" >확인</div>
                    </div>
                </div>
            </div>
        </div>        

    <iframe src="../temp.html"  style="visibility:hidden;display:none" scrolling="no"></iframe>

        <script type="text/javascript" src="../script/extention/jquery.js"></script>
        <script type="text/javascript" src="../script/common.js"></script>
        <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
        
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

                        $(document).on('click', '#btnCancel', function () {
                            page.fn.cancelRequest();
                        });

                        $(document).on('click', '#btnConfirm', function () {
                            location.href = "/Main.aspx";
                        });
                    },
                    fn: {
                        getCollectorInfo: function () {
                            var params = {
                                producerIdx: $("#hdProducerIdx").val()
                            }

                            Server.ajax("/producer/collectReserve", params, function (response, status, xhr) {
                                //infoBox(response.value);
                                if (response.value == 0) {

                                    if (response.collectReserve.product_1 != 0) {
                                        $("#txtReqList").val($("#txtReqList").val() + "폐지 " + response.collectReserve.product_1 + ", ");
                                    }
                                    if (response.collectReserve.product_2 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "병 " + response.collectReserve.product_2 + ", ");
                                    }
                                    if (response.collectReserve.product_4 != 0) {
                                        $("#txtReqList").val($("#txtReqList").val() + "고철 " + response.collectReserve.product_4 + ", ");
                                    }
                                    if (response.collectReserve.product_5 != 0) {
                                        $("#txtReqList").val($("#txtReqList").val() + "비철 " + response.collectReserve.product_5 + ", ");
                                    }
                                    if (response.collectReserve.product_6 != 0) {
                                        $("#txtReqList").val($("#txtReqList").val() + "헌옷 " + response.collectReserve.product_6 + ", ");
                                    }
                                    if (response.collectReserve.product_7 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "휴대폰 " + response.collectReserve.product_7 + ", ");
                                    }
                                    if (response.collectReserve.product_8 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "대형가전 " + response.collectReserve.product_8 + ", ");
                                    }
                                    if (response.collectReserve.product_9 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "소형가전 " + response.collectReserve.product_9 + ", ");
                                    }
                                    if (response.collectReserve.product_10 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "이사수거 " + response.collectReserve.product_10 + ", ");
                                    }
                                    if (response.collectReserve.etc_1 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "가구류/기타, ");
                                    }
                                    if (response.collectReserve.etc_2 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "폐기서비스, ");
                                    }
                                    if (response.collectReserve.etc_3 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "유품정리, ");
                                    }

                                    $("#txtReqList").val($("#txtReqList").val().substring(0, $("#txtReqList").val().length - 2));
                                    $("#hdProduceIdx").val(response.collectReserve.product_3);
                                    $("#imgCollectorImg").attr("src", "http://hrx.co.kr/img/collector_profile/" + response.collectReserve.collectorImageUrl);
                                    $("#txtCollectorName").val(response.collectReserve.collectorName);
                                    $("#txtCollectorContactNumber").val(response.collectReserve.collectorContactNumber);
                                    $("#txtReqDate").val(response.collectReserve.hopeCollectDate);

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
                                    //infoBox(response.value);
                                    infoBoxWithCallback("수거신청이 취소되었습니다.", page.fn.goUrl, { url: "/Main.aspx" })
                                } else {
                                    errorBox(getErrMsg(response.value));
                                }
                            }, "post", false);
                        },
                        goUrl: function(urlData) {
                            location.href = urlData.url;
                        },
                    }
                };

                $(document).on('ready', function () {
                    page.init();
                    page.fn.getCollectorInfo();
                });
            })();
        </script>
    </body>
</html>