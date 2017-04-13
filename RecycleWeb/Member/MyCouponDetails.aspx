<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCouponDetails.aspx.cs" Inherits="RecycleWeb.Member.MyCouponDetails" %>

<!-- #include file="/include/header_b.html" --> 
<style>

</style>
<header>
        <div class="su_header">
			<span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>쿠폰상세
        </div>
    </header>
<div class="container coupon" >
    <div class="coupon_pr">
    	<img src="/img/baechul/pic-stb.png" width="80" />
    </div>
    <div class="pad10">
        <p class="ctext"><img src="/img/cfn-cof2.png" class="img90"></p>
        <p class="ctext font_size16b pad10 "><span class="">카페 아메리카노 Tall</span></p> 
    </div>
    <table class="cen240">
        <tbody>              
            <tr class="">
                <td class="td_cen_l pad_t12"><span class="color000 font_size14b pad_l0 ">사용처</span></td>
                <td class="td_cen_r pad_t12"><span class="color000 font_size14b pad_l0 ">스타벅스</span></td>
            </tr>
            <tr class="">
                <td class="td_cen_l"><span class="color000 font_size14b pad_l0 ">유효기간</span></td>
                <td class="td_cen_r"><span class="color000 font_size14b pad_l0 ">2017-09-22</span></td>
        	</tr>
        </tbody>
    </table>
    <div class="ctext padt30">
    	<img src="./img/baechul/pic-bcd.png" width="120">
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
                    $(document).on('click', '#btnMyCouponGuide', function () {
                        location.href = "MyCouponGuide.aspx";
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