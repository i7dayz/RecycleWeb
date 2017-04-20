<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TermsAndPolicies.aspx.cs" Inherits="RecycleWeb.Support.TermsAndPolicies" %>

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
        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>서비스 이용약관 및 개인정보 취급 방침
    </div>
</header>
<div class="container" style="">
	<div class="su_form">   
            
            <div class="su_title">
            	<%--<input type="checkbox" name="" checked="checked" />--%>
            	<label class="color_000">서비스 이용약관 <span class="font_size11b color_f78c96"></span></label>
            </div>
            <div class="reser">
                <div class="pad1010">
                    <textarea class="" id="terms" rows="15" readonly style="width:100%; border-radius:3px;">
                    </textarea>
                </div>
            </div>
            
            <div class="su_title">
            	<%--<input type="checkbox" name="" checked="checked" />--%>
            	<label class="color_000">개인정보 취급 방침<span class="font_size11b color_f78c96"></span></label>
            </div>
            <div class="reser">
                <div class="pad1010">
                    <textarea class="" id="policy" rows="15" readonly style="width:100%; border-radius:3px;">
                    </textarea>
                </div>
            </div>
	</div>
</div>

<!-- #include file="/include/footer_b.html" -->

    <script type="text/javascript" src="/script/jquery-1.9.1.min.js"></script>
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
                        url: "/terms.txt",
                        dataType: "text",
                        success: function (data) {
                            $("#terms").text(data);
                        }
                    });

                    $.ajax({
                        url: "/policies.txt",
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