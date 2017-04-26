<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TermsAgree.aspx.cs" Inherits="RecycleWeb.Member.TermsAgree" %>

<!-- #include file="/include/header_b.html" --> 
    <link href="../script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />
<style>
.color_f78c96 {color:#f78c96;}
.agr_txtarea {
	width: 100%;
    height: 78px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

input[type=checkbox], label {
    cursor:pointer;
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
            	<input type="checkbox" name="chkAll" id="chkAll" />
            	<label class="color_000" for="chkAll">전체동의</label>
            </div>
            <div class="reser">
                <div class="pad1010">
                    <p class="font_size11b color000">이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두 동의합니다.</p>
                </div>
            </div>
            
            <div class="su_title">
            	<input type="checkbox" name="chkTerms" id="chkTerms"/>
            	<label class="color_000" for="chkTerms">서비스 이용약관 <span class="font_size11b color_f78c96">(필수)</span></label>
            </div>
            <div class="reser">
                <div class="pad1010">
                    <textarea class="agr_txtarea" id="terms"></textarea>
                </div>
            </div>
            
            <div class="su_title">
            	<input type="checkbox" name="chkPolicy" id="chkPolicy"/>
            	<label class="color_000" for="chkPolicy">개인정보 수집 및 이용 <span class="font_size11b color_f78c96">(필수)</span></label>
            </div>
            <div class="reser">
                <div class="pad1010">
                    <textarea class="agr_txtarea" id="policy"></textarea>
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
                    <div class="btn_gray2" style="cursor:pointer" id="btnDisAgree" >동의안함</div>
                </div>
                <div class="harf_r2">
                    <div class="btn_grean2" style="cursor:pointer" id="btnAgree" >동의</div>
                </div>
            </div>
        </form>
	</div>
</div>

<!-- #include file="/include/footer_b.html" -->

    <iframe src="../temp.html"  style="visibility:hidden;display:none" scrolling="no"></iframe>

    <script type="text/javascript" src="/script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>
    <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
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
                        location.href = "/Default.aspx";
                    });

                    $('#btnDisAgree').click(function () {
                        location.href = "/Default.aspx";
                    });              
                    $('#btnAgree').click(function () {
                        if ($("#chkTerms").prop("checked") && $("#chkPolicy").prop("checked")) {
                            $("form").submit();
                        } else {
                            errorBox("이용약관/개인정보취급방침에 동의 후 서비스 이용이 가능합니다.");
                            return;
                        }
                    });      
                    
                    $("#chkAll").click(function () { //만약 전체 선택 체크박스가 체크된상태일경우 
                        if ($("#chkAll").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
                            $("input[type=checkbox]").prop("checked", true); // 전체선택 체크박스가 해제된 경우 
                        } else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
                            $("input[type=checkbox]").prop("checked", false);
                        }
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