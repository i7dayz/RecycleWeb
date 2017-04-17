<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoodsDetails.aspx.cs" Inherits="RecycleWeb.Store.GoodsDetails" %>
<!-- #include file="/include/header_b.html" --> 
<style>
.container {
    background: #fff;
	padding-bottom:0;
}
body {
    height: 100%;
    background-color: #f6f6f6;
}
</style>
<script>

</script>
<header>
    <div class="su_header">
        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span><label runat="server" id="title"></label>
    </div>
</header>
<div class="container" style="">
    <input type="hidden" runat="server" id="hdGoodsId" />
    <input type="hidden" runat="server" id="test" />
	<div class="member_po pdt30">
        <p class="ctext"><img src="/img/cfn-cof2.png" class="img90" runat="server" id="goodsImg" /></p>
        <p class="ctext font_size20b pad20 "><span class="dashed_line"><label runat="server" id="goodsName"></label></span></p> 
    </div>
	<table class="cen">
        <tbody>              
            <tr class="">
                <td class="td_cen3_1"></td>
                <td class="td_cen3_2">결제금액</td>
                <td class="td_cen3_3"><img src="/img/p.png" class="img14_icon_l" /><label runat="server" id="price"></label></td>
                <td class="td_cen3_4"></td>
            </tr>
            <tr class="">
                <td class="td_cen3_1 pad_t12"></td>
                <td class="td_cen3_2 pad_t12"><span class="color000 font_size14b pad_l0 ">교환처</span></td>
                <td class="td_cen3_3 pad_t12"><span class="color000 font_size14b pad_l0 "><label runat="server" id="brandName"></label></span></td>
                <td class="td_cen3_4 pad_t12"></td>
            </tr>
            <tr class="">
                <td class="td_cen3_1"></td>
                <td class="td_cen3_2"><span class="color000 font_size14b pad_l0 ">유효기간</span></td>
                <td class="td_cen3_3"><span class="color000 font_size14b pad_l0 ">구입 후 <label runat="server" id="exDate"></label>일 이내</span></td>
                <td class="td_cen3_4"></td>
        </tbody>
    </table>
	<div class="su_txt">  
        <p class="rec_text11 pad_t12" runat="server" id="desc"></p>
    	<%--<p class="rec_text2">상세설명</p>
        <p class="rec_text11 pad_t12">[상품설명]</p>
        <p class="rec_text11">스타벅스의 깔끔한 맛을 자랑하는 커피로,  스타벅스 파트너들이 가장 좋아하는 커피입니다</p>
        <p class="rec_text11 pad_t12">[상품설명]</p>
        <p class="rec_text11">스타벅스의 깔끔한 맛을 자랑하는 커피로,  스타벅스 파트너들이 가장 좋아하는 커피입니다</p>
        --%>
        <div class="su_submit pdt30"><div class="btn_grean">구매하기</div></div>
    </div>
    
</div>
    <script type="text/javascript" src="../script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script type="text/javascript" src="../script/drawer.min.js"></script>
    <script type="text/javascript" src="../script/store.js"></script>

    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    $('.drawer').drawer();
                },
                initEvent: function () {
                    $(document).on('click', '.back-btn', function () {
                        window.history.back();
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



