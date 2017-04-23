<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDescription.aspx.cs" Inherits="RecycleWeb.Collection.ProductDescription" %>

<!-- #include file="/include/header_b.html" --> 
<style>

</style>
<script>

</script>
<header>
    <div class="su_header">
        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>수거가능 및 불가능 품목
    </div>
</header>
<div class="container" style="">
	<div class="su_form">    	
    	<p class="rec_text2"><span class="colorffc045">▶ </span> 헌옷</p>
        <span class="left_tlt">의류 - </span>
        <p class="rec_text2 pdl40 color53acbc">가능 : 착용이 가능한 모든 의류 (헌옷, 가죽옷, 작업복, 수영복, 양복 등)</p>
        <p class="rec_text2 pdl40 colorfe708a">불가능 : 물에 젖거나 냄새가 심한 옷, 훼손이 심각한 옷, 단체복</p>
        <span class="left_tlt">가방 - </span>
        <p class="rec_text2 pdl40 color53acbc">가능 : 핸드백, 백팩, 등산용가방 등</p>
        <p class="rec_text2 pdl40 colorfe708a">불가능 : 하드케이스로 된 가방 (여행용 캐리어, 007가방 등)</p>
        <span class="left_tlt">신발 - </span>
        <p class="rec_text2 pdl40 color53acbc">가능 : 운동화, 구두, 하이힐 등</p>
        <p class="rec_text2 pdl40 colorfe708a">불가능 : 부츠, 목욕탕 슬리퍼, 전문스포츠화 (인라인, 스키부츠)</p>
        <span class="left_tlt">이불 - </span>
        <p class="rec_text2 pdl40 color53acbc">가능 : 침대커버, 이불, 담요, 수건, 커튼, 카펫 등</p>
        <p class="rec_text2 pdl40 colorfe708a">불가능 : 솜이불, 방석, 쿠션, 매트리스, 전기장판, 절단하거나 오염된 제품</p>
        <span class="left_tlt">소품 - </span>
        <p class="rec_text2 pdl40 color53acbc">가능 : 지갑, 손수건, 스카프, 목도리, 양말, 속옷</p>
    	<p class="rec_text2"><span class="colorffc045">▶ </span> 폐지</p>
        <p class="rec_text2 pdl40 color53acbc">가능 : 각종 도서, 신문지, 이면지 등 (박스나 끈으로 묶어서 배출바랍니다.)</p>
    	<p class="rec_text2"><span class="colorffc045">▶ </span> 병</p>
        <p class="rec_text2 pdl40 color53acbc">가능 : 맥주병, 소주병, 음료수병</p>
        <p class="rec_text2 pdl40 colorfe708a">불가능 : 수입 맥주병</p>
    	<p class="rec_text2"><span class="colorffc045">▶ </span> 고철</p>
        <p class="rec_text2 pdl40 color53acbc">가능 : 자석에 붙는 모든 금속 (아령, 망치, 가스레인지 등)</p>
    	<p class="rec_text2"><span class="colorffc045">▶ </span> 비철</p>
        <p class="rec_text2 pdl40 color53acbc">가능 : 자석에 붙지 않는 금속 (전선, 냄비, 양은, 샷시, 후라이팬, 수도꼭지 등)</p>
    	<p class="rec_text2"><span class="colorffc045">▶ </span> 소형가전, 대형가전</p>
        <p class="rec_text2 pdl40">상태와 연식에 따라 매입이 불가능한 제품이 있습니다. (수거기사와 협의)</p>
    	<p class="rec_text2"><span class="colorffc045">▶ </span> 가구류/기타</p>
        <p class="rec_text2 pdl40">그 외 재활용이 가능하다고 생각되는 가구류나 제품은 기타로 신청하세요.</p>
    	<p class="rec_text2"><span class="colorffc045">▶ </span> 수거불가</p>
        <p class="rec_text2 pdl40">상태와 연식에 따라 매입이 불가능한 제품이 있습니다. (수거기사와 협의)</p>
        <p class="rec_text2 pdl40 colorfe708a">유리, 플라스틱, 스티로폼, 고무류, 비닐류, PET 등은 수거가 안됩니다.</p>
    </div>
    <div class="su_submit pdt30"><div class="btn_grean back-btn" style="cursor:pointer" class="">확인</div></div>
</div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
  <script src="../script/drawer.min.js" charset="utf-8"></script>
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
