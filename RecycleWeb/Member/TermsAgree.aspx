<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TermsAgree.aspx.cs" Inherits="RecycleWeb.Member.TermsAgree" %>

<!-- #include file="/include/header_b.html" --> 
<style>
.color_f78c96 {color:#f78c96;}
.agr_txtarea {
	width: 100%;
    height: 78px;
    border: 1px solid #ccc;
    border-radius: 3px;
}
</style>

<header>
    <div class="su_header">
        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>약관동의
    </div>
</header>
<div class="container" style="">
	<div class="su_form">   
        <form runat="server" method="post" action="Join.aspx">
            <input type="hidden" id="kakaoId" runat="server" value="" />
            <input type="hidden" id="kakaoNickname" runat="server" value="" />
            <input type="hidden" id="kakaoEmail" runat="server" value="" />
            <input type="hidden" id="kakaoThumbnailImage" runat="server" value="" />
            <input type="hidden" id="kakaoProfileImage" runat="server" value="" />
            <input type="hidden" id="accessToken" runat="server" value="" />
            <input type="hidden" id="refreshToken" runat="server" value="" />
            <div class="su_title">
            	<input type="checkbox" name="" checked="checked" />
            	<label class="color_000">전체동의</label>
            </div>
            <div class="reser">
                <div class="pad1010">
                    <p class="font_size11b color000">이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두 동의합니다.</p>
                </div>
            </div>
            
            <div class="su_title">
            	<input type="checkbox" name="" checked="checked" />
            	<label class="color_000">서비스 이용약관 <span class="font_size11b color_f78c96">(필수)</span></label>
            </div>
            <div class="reser">
                <div class="pad1010">
                    <textarea class="agr_txtarea" id="terms">
                    </textarea>
                </div>
            </div>
            
            <div class="su_title">
            	<input type="checkbox" name="" checked="checked" />
            	<label class="color_000">개인정보 수집 및 이용 <span class="font_size11b color_f78c96">(필수)</span></label>
            </div>
            <div class="reser">
                <div class="pad1010">
                    <textarea class="agr_txtarea" id="policy">
                    </textarea>
                </div>
            </div>
            
            <%--
            <div class="su_title reser">
            	<input type="checkbox" name="" checked="checked" />
            	<label class="color_000">이벤트 등 프로모션 알림 SMS 수신 <span class="font_size11b color_f78c96">(선택)</span></label>
            </div>
            
            <div class="su_title reser">
            	<input type="checkbox" name="" checked="checked" />
            	<label class="color_000">이벤트 등 프로모션 알림 메일 수신 <span class="font_size11b color_f78c96">(선택)</span></label>
            </div>
            --%>
            
            <div style="height:30px;"></div>
            <div class="harf_con">
                <div class="harf_l2">
                    <div class="btn_gray2" >동의안함</div>
                </div>
                <div class="harf_r2">
                    <div class="btn_grean2" >동의</div>
                </div>
            </div>
        </form>
	</div>
</div>

<!-- #include file="/include/footer_b.html" -->

    <script type="text/javascript" src="/script/jquery-1.9.1.min.js"></script>
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
                    $.ajax({
                        url: "../terms.txt",
                        dataType: "text",
                        success: function (data) {
                            $("#terms").text(data);
                        }
                    });

                    $.ajax({
                        url: "../policies.txt",
                        dataType: "text",
                        success: function (data) {
                            $("#policy").text(data);
                        }
                    });
                },
                initEvent: function () {
                    $(document).on('click', '.back-btn', function () {
                        window.history.back();
                    });

                    $('#btnDisAgree').click(function () {
                        window.history.back();
                    });              
                    $('#btnAgree').click(function() {
                        $("form").submit();
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