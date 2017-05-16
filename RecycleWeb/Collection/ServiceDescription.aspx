<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceDescription.aspx.cs" Inherits="RecycleWeb.Collection.ServiceDescription" %>

<!-- #include file="/include/header_b.html" --> 
<style>

</style>
<script>

</script>
<header>
    <div class="su_header">
        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>유상 서비스 금액 안내
    </div>
</header>
<div class="container" style="">
	<div class="su_form">    	
    	<p class="rec_text2"><span class="colorffc045">▶ </span> 처리대행 안내</p>
        <p class="rec_text2 color53acbc">
            '리본'에서 저렴한 가격의 처리대행 서비스를 제공합니다.<br />
            물건의 부피나 무게 등과 상관없이, 서비스 기사의 시간당 인건비만 받고 정리, 처리, 폐기해 드립니다. 인건비는 <span class="colorfe708a">49,500원/시간</span>이며, 작업 용이성 및 엘리베이터 유무 등에 따라 추가 비용이 발생합니다.<br />
            (폐기물 스티커 비용은 별도입니다.)
        </p>
    	<p class="rec_text2"><span class="colorffc045">▶ </span> 유품정리 안내</p>
        <p class="rec_text2 color53acbc">
            '리본'의 유품정리 서비스는 고인의 유품 정리뿐만 아니라, 생활하시던 공간의 청소 및 소독(선택사항)까지 해드립니다. 기본 가격은 <span class="colorfe708a">1톤 차량 기준 30만원</span>이며, 작업의 난이도와 작업시간 등에 따라 추가금액이 발생합니다.
        </p>
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
