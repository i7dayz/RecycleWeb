<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCoupon.aspx.cs" Inherits="RecycleWeb.Member.MyCoupon" %>
<!-- #include file="/include/header_b.html" --> 
<style>

</style>
<header>
        <div class="su_header">
			<span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>쿠폰함
        </div>
    </header>
    <div class="container" id="coupon-list">
        <div class="reser">
    	    <div class="reser_icon reser_icon2">
        	    <img src="/img/cfn-cof.png" />
            </div>
            <div class="reser_con padt30">
        	    <div><span class="font_size12b color90cd32  pad_l0">스타벅스</span></div>
                <div> 
            	    <p class="font_size16b color000 pad_l0">카페 아메리카노 Tall</p>
                    <p class="font_size12 color_b7b7b7 pad_t12">유효기간 : 2017년 09월 22일 까지</span></p>
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
                    <p class="font_size12 color_b7b7b7 pad_t12">유효기간 : 2017년 09월 22일 까지</span></p>
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
                    <p class="font_size12 color_b7b7b7 pad_t12">유효기간 : 2017년 09월 22일 까지</span></p>
                </div>
            </div>
        </div>
    </div>
        
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
                        location.href = "MyCouponDetails.aspx?my_coupon_id=" + $(this).attr("id");
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