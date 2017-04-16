<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Goods.aspx.cs" Inherits="RecycleWeb.Store.Goods" %>
<!-- #include file="/include/header_b.html" --> 
<style>

</style>
<script>
function form_submit() {
}
</script>
<header>
    <div class="su_header">
        <span class="su_leftbtn"><img src="/img/baechul/back-btn.png" width="13" /></span>카페
    </div>
</header>
<div class="container" style="">
    <input type="hidden" runat="server" id="hdMsg" />
    <div class="four_con" runat="server" id="brandList">
    	<%--<div class="four_01">
            <p><a href="#"><img src="/img/sugeo/su_icon3/icon1.jpg" class="img65"></a></p>
            <p class="su_name">스무디킹</p>
        </div>
        <div class="four_02">
            <p><a href="#"><img src="/img/sugeo/su_icon3/icon2.jpg" class="img65"></a></p>
            <p class="su_name">투썸플레이스</p>
        </div>
        <div class="four_03">
            <p><a href="#"><img src="/img/sugeo/su_icon3/icon3.jpg" class="img65"></a></p>
            <p class="su_name">할리스커피</p>
        </div>
        <div class="four_04">
            <p><a href="#"><img src="/img/sugeo/su_icon3/icon4.jpg" class="img65"></a></p>
            <p class="su_name">뚜레쥬르</p>
        </div>
        <div class="line_d"></div>--%>
    </div>
    <div id="list_onoff" class="list_view">더보기<!--img src="./img/baechul/btn-vie1.png"  /--></div>
    <div class="text_title pad7">
        <span class="font_size14b" runat="server" id="brandName"></span>
    </div>
    <div id="goodsList" runat="server"></div>
    <%--<div class="reser">
    	<div class="reser_icon reser_icon2">
        	<img src="./img/cfn-cof.png" />
        </div>
        <div class="reser_con">
        	<div><span class="font_size14bi color_b7b7b7"> 문화상품권</span></div>
            <div> 
            	<p class="font_size14bi color_000">모바일 문화상품권 10,000원권</p>
                <div class="total2 color_fff">10,000p</span></div>
            </div>
        </div>
    </div>
    <div class="reser">
    	<div class="reser_icon reser_icon2">
        	<img src="./img/cfn-cof.png" />
        </div>
        <div class="reser_con">
        	<div><span class="font_size14bi color_b7b7b7"> 문화상품권</span></div>
            <div> 
            	<p class="font_size14bi color_000">모바일 문화상품권 10,000원권</p>
                <div class="total2 color_fff">10,000p</span></div>
            </div>
        </div>
    </div>
    <div class="reser">
    	<div class="reser_icon reser_icon2">
        	<img src="./img/cfn-cof.png" />
        </div>
        <div class="reser_con">
        	<div><span class="font_size14bi color_b7b7b7"> 문화상품권</span></div>
            <div> 
            	<p class="font_size14bi color_000">모바일 문화상품권 10,000원권</p>
                <div class="total2 color_fff">10,000p</span></div>
            </div>
        </div>
    </div>--%>
    <div class="su_submit pdt30"><div class="btn_grean"><a href="#">쿠폰함 바로가기</a></div></div>
</div>
