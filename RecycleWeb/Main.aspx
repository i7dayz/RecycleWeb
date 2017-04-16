<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="RecycleWeb.Main" %>

<!-- #include file="./include/header.html" --> 
    <link href="script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />
    <style>
        .image-wrapper { 
            width:100%; text-align: center; 
            background: url('../img/character-02.png') no-repeat;
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
            <p class="ctext font_size34b "><label runat="server" id="point">0</label> <img src="./img/d-pnt-56.png" class="img20" /></p>
        </div>
        <div class="slide">
        <!-- #include file="./include/main_full_slide.html" -->
        </div>
        <div class="reser">
    	    <div class="reser_icon">
        	    <img src="./img/pro_icon.jpg" runat="server" id="collectorImg"/>
            </div>
            <div class="reser_con">
                <div runat="server" id="reserved">
        	            <div><img src="./img/baechul/i-cld.png" class="img27f" /><span class="font_size14bi"> 예약현황</span></div>
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
                <p><a href="#"><img src="./img/baechul/i-ntc.png" class="img27" /></a></p>
                <p><a href="#">공지사항 / 이벤트</a></p>
            </div>
            <div class="harf_r">
        	    <span class="cic_icon2"><img src="./img/baechul/ird-icn.png" class="img40" /></span>
                <p><a href="#"><img src="./img/baechul/i-inf.png" class="img30" /></a></p>
                <p><a href="#">이용안내</a></p>
            </div>
        </div>
    </div>

    <!-- #include file="/include/footer.html" -->

    <script type="text/javascript" src="/script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/script/common.js"></script>
    <script type="text/javascript" src="/script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script type="text/javascript" src="/script/dropdown.min.js"></script>
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
                },
                fn: {
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
            });

        })();
    </script>
</body>
</html>