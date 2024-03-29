﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCoupon.aspx.cs" Inherits="RecycleWeb.Member.MyCoupon" %>
<!-- #include file="/include/header_b.html" --> 
<link href="../script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />
<style>

</style>
    <input type="hidden" runat="server" id="hdProducerIdx" />
    <input type="hidden" runat="server" id="hdGoodsBuyIdx" value="0"/>
    <header>
        <div class="su_header">
			<span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>쿠폰함
        </div>
    </header>
    <div class="container" id="coupon-list">
        <%--<div class="reser">
    	    <div class="reser_icon reser_icon2">
        	    <img src="/img/cfn-cof.png" />
            </div>
            <div class="reser_con padt30">
        	    <div><span class="font_size12b color90cd32  pad_l0">스타벅스</span></div>
                <div> 
            	    <p class="font_size16b color000 pad_l0">카페 아메리카노 Tall</p>
                    <p class="font_size12 color_b7b7b7 pad_t12">유효기간 : 2017년 09월 22일 까지</p>
                </div>
            </div>
        </div>
        <div class="reser">
    	    <div class="reser_icon reser_icon2">
        	    <img src="/img/cfn-cof.png" />
            </div>
            <div class="reser_con padt30">
        	    <div><span class="font_size12b color90cd32  pad_l0">스타벅스</span></div>
                <div> 
            	    <p class="font_size16b color000 pad_l0">카페 아메리카노 Tall</p>
                    <p class="font_size12 color_b7b7b7 pad_t12">유효기간 : 2017년 09월 22일 까지</p>
                </div>
            </div>
        </div>
        <div class="reser">
    	    <div class="reser_icon reser_icon2">
        	    <img src="/img/cfn-cof.png" />
            </div>
            <div class="reser_con padt30">
        	    <div><span class="font_size12b color90cd32  pad_l0">스타벅스</span></div>
                <div> 
            	    <p class="font_size16b color000 pad_l0">카페 아메리카노 Tall</p>
                    <p class="font_size12 color_b7b7b7 pad_t12">유효기간 : 2017년 09월 22일 까지</p>
                </div>
            </div>
        </div>--%>
    </div>

    <iframe src="../temp.html"  style="visibility:hidden;display:none" scrolling="no"></iframe>

    <script type="text/javascript" src="../script/extention/jquery.js"></script>
    <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>
        
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
                    $(document).on("click", "div[class='reser']", function () {
                        if ($(this).attr("status") == 2) {
                            location.href = "MyCouponDetails.aspx?url=" + $(this).attr("url") + "&order_id=" + $(this).attr("order_id") + "&pin=" + $(this).attr("pin") + "&brand=" + encodeURIComponent($(this).attr("brand")) + "&exdate=" + $(this).attr("exdate");
                        }
                        else if ($(this).attr("status") == 3) {
                            infoBox("구매가 취소된 쿠폰입니다.");
                            return;
                        }
                    });
                },
                fn: {
                    couponList: function () {
                        var params = {
                            producerIdx: $("#hdProducerIdx").val(),
                            goodsBuyIdx: $("#hdGoodsBuyIdx").val()
                        };

                        Server.ajax("/producer/goodsBuyHistory", params, function (response, status, xhr) {
                            if (response.value == 0) {
                                var list = response.goodsBuyHistory;

                                for (var i = 0; i < list.length; i++) {
                                    page.fn.addCoupon(list[i]);
                                }
                            } else {
                                errorBox("Error Code : " + response.value);
                            }
                        }, "post", false);
                    },
                    addCoupon: function (item) {
                        var brand = item[5].split('|');

                        var exDate = "";
                        var status = "";
                        if (item[3] == 2) {
                            status = "구매";
                        } else if (item[3] == 3) {
                            status = "취소";
                        }

                        var coupon = '<div class="reser" url="' + item[6] + '" status="' + item[3] + '" order_id="' + item[8] + '" pin="' + item[7] + '" brand="' + item[5] + '" exdate="' + item[10] + '" style="cursor:pointer;">'
    	                           + '    <div class="reser_icon reser_icon2">'
                                   + '	      <img src="' + item[6] + '" />'
                                   + '    </div>'
                                   + '    <div class="reser_con padt20">'
                                   + '	      <div><span class="font_size12b color90cd32  pad_l0">' + brand[0] + '</span></div>'
                                   + '        <div> '
                                   + '    	      <p class="font_size16b color000 pad_l0">' + brand[1] + '</p>'
                                   + '            <p class="font_size12 color_b7b7b7 pad_t12">유효기간 : ' + item[10] + ' 까지</p>'
                                   + '            <p class="font_size12 color_b7b7b7">상태 : ' + status + '</p>'
                                   + '    </div>'
                                   + '    </div>'
                                   + '</div>';

                        $('#coupon-list').append(coupon);
                    }
                }
            };

            $(document).on('ready', function () {
                page.init();
                page.fn.couponList();
            });
        })();
    </script>
</body>
</html>