<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DonationDetails.aspx.cs" Inherits="RecycleWeb.Donation.DonationDetails" %>

<!-- #include file="/include/header_b.html" --> 
        <link href="../script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css">
<style>

</style>
<header>
        <div class="su_header">
			<span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>세이브 더 칠드런
        </div>
    </header>
<div class="container" style="">
	<div class="su_form"> 
        <input type="hidden" runat="server" id="hdProducerIdx" />
        <input type="hidden" runat="server" id="hdGroupIdx" />
    	<div class="su_title"><label class="color90cd32" id="lblGroupName"></label></div>
    	<div class="ctext pad20"><img src="" id="imgGroup" width="100%"></div>
		<div class="su_title color000" id="lblGroupDesc"></div>
        <div class="su_title padt20">기부 가능 포인트</div>
        <div><input type="text" runat="server" id="currPoint" class="su_input alig_r" readonly /></div>
        <div class="su_title color000">기부 포인트</div>
        <div><input type="text" id="txtDonationPoint"  name="" value="0" class="su_input b90cd32 alig_r" /></div>
        <div style="height:30px;"></div>
        <div class="su_submit pdt30" id="btnDonate"><div class="btn_grean"><a href="javascript:;">기부하기</a></div></div>
    </div>
</div>

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
                            window.history.back();
                        });
                        $(document).on('click', '#btnDonate', function () {
                            page.fn.donate();
                        });
                    },
                    fn: {
                        group: function () {
                            var params = {
                                donationGroupIdx: $("#hdGroupIdx").val()
                            }

                            Server.ajax("/producer/donationDetail", params, function (response, status, xhr) {
                                if (response.value == 0) {                                    
                                    $("#lblGroupName").text(response.donationDetail[0][1]);
                                    $("#lblGroupDesc").text(response.donationDetail[0][3]);
                                    $("#imgGroup").attr("src", "http://hrx.co.kr/img/dnt_1out/" + response.donationDetail[0][5]);
                                } else {
                                    errorBox(getErrMsg(response.value));
                                }
                            }, "post", false);
                        },
                        donate: function () {
                            var currPoint = parseInt($("#currPoint").val().replace(/,/g, ""));
                            var donationPoint = parseInt($("#txtDonationPoint").val().replace(/,/g, ""));

                            if (isNaN(donationPoint) || donationPoint <= 0) {
                                infoBox("기부하실 포인트를 입력하세요.");
                                return;
                            }

                            if (!isNumeric(donationPoint)) {
                                infoBox("포인트는 숫자형식으로만 입력가능합니다.");
                                return;
                            }

                            if (currPoint < donationPoint) {
                                infoBox("현재 보유중인 포인트내에서 기부가능합니다.");
                                return;
                            }

                            var params = {
                                producerIdx: $("#hdProducerIdx").val(),
                                donationGroupIdx: $("#hdGroupIdx").val(),
                                donationPoint: $("#txtDonationPoint").val()
                            }

                            Server.ajax("/producer/donation", params, function (response, status, xhr) {
                                if (response.value == 0) {
                                    infoBoxWithCallback(commaSeparateNumber(donationPoint) + "포인트를 기부하였습니다.", page.fn.goUrl, { url: "/Donate.aspx" });
                                } else {
                                    if (response.value == 111) {
                                        errorBox(getErrMsg(response.value));
                                    }
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
                    page.fn.group();
                });
            })();
        </script>
    </body>
</html>