<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsageGuide.aspx.cs" Inherits="RecycleWeb.Support.UsageGuide" %>

<!-- #include file="/include/header_b.html" --> 
<style>

</style>
<script>
$(function() {
    $(".closer_btn").on("click", function() {
        $(this).closest(".con_inner").slideToggle();
    });
});

function faq_open(el)
{
    var $con = $(el).closest("li").find(".con_inner");

    if($con.is(":visible")) {
        $con.slideUp();
    } else {
        $("#faq_con .con_inner:visible").css("display", "none");

        $con.slideDown(
            function() {
                // 이미지 리사이즈
                //$con.viewimageresize2();
            }
        );
    }

    return false;
}
</script>
<header>
    <div class="su_header">
        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>이용안내
    </div>
</header>
<div class="container" style="">
	<div id="faq_wrap" class="faq_1">
        <section id="faq_con">
        <h2>자주하시는 질문 목록</h2>
        <ol>
             <li>                
                <a href="#none" onclick="return faq_open(this);" class="faq_q_use"> 
                   <p class="font_size14b pad_l0">추천인 이벤트<span class="icon_s12">N</span></p>
                </a>                
                <div class="con_inner faq_a" style="display: none;">
                    <p class="faq_aa">고객님이 추천한 회원에게 고객님이 판매하신 재활용품 가격의 1%만큼 리본에서 적립해 드립니다.</p>                   
                </div>
            </li>
             <li>
               <a href="#none" onclick="return faq_open(this);" class="faq_q_use"> 
                    <p class="font_size14b pad_l0">대한민국 SW기업 경쟁력 대상 우...<span class="icon_s12">N</span></p>
                </a>  
                <div class="con_inner faq_a" style="display: none;">
                    <p class="faq_aa">test</p>                    
                </div>
            </li>
        </ol>
    </section>
    </div>
</div>

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