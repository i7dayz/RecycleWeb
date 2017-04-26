<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCouponDetails.aspx.cs" Inherits="RecycleWeb.Member.MyCouponDetails" %>

<!-- #include file="/include/header_b.html" --> 
<style>
    body {
        height: 100%;
        background-color: #90cd32;
    }
</style>
<input type="hidden" runat="server" id="hdPin" value="" />
<header>
        <div class="su_header">
			<span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>쿠폰상세
        </div>
    </header>
<div class="container coupon" >
    <%--<div class="coupon_pr">
    	<img src="/img/baechul/pic-stb.png" width="80" />
    </div>--%>
    <div class="pad_t90">
        <p class="ctext"><img src="/img/cfn-cof2.png" class="img90" runat="server" id="goodsImg"></p>
        <p class="ctext font_size16b pad10 "><label class="" runat="server" id="goodsName"></label></p> 
    </div>
    <table class="cen240">
        <tbody>              
            <tr class="">
                <td class="td_cen_l pad_t12"><span class="color000 font_size14b pad_l0 ">교환처</span></td>
                <td class="td_cen_r pad_t12"><label class="color000 font_size14b pad_l0 " runat="server" id="branchName"></label></td>
            </tr>
            <tr class="">
                <td class="td_cen_l"><span class="color000 font_size14b pad_l0 ">유효기간</span></td>
                <td class="td_cen_r"><label class="color000 font_size14b pad_l0 " runat="server" id="exDate"></label></td>
        	</tr>
            <tr class="">
                <td class="td_cen_l"><span class="color000 font_size14b pad_l0 ">쿠폰상태</span></td>
                <td class="td_cen_r"><label class="color000 font_size14b pad_l0 " runat="server" id="useStatus"></label></td>
        	</tr>
        </tbody>
    </table>
    <div class="ctext padt30">
        <div id="barcode" style="margin:0 auto;"></div>   
    </div>
    
</div>

    <iframe src="../temp.html"  style="visibility:hidden;display:none" scrolling="no"></iframe>

    <script type="text/javascript" src="../script/extention/jquery.js"></script>
    <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>
    <script type="text/javascript" src="../script/jquery-barcode.min.js"></script>
        
    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    $("#barcode").barcode($("#hdPin").val(), "code128", { barWidth: 2, barHeight: 70 });
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