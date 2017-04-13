<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Donate.aspx.cs" Inherits="RecycleWeb.Donate" %>

<!-- #include file="./include/header.html" --> 
<style>
.reser_con div {
    padding-right: 12px;
}
</style>

    <!-- 기부 탭--> 
    <div class="container" style="">        
	    <div class="description">
    	    <img src="./img/page_description/6_1top.gif" width="100%" />
        </div>
        <div class="reser">
    	    <div class="reser_icon reser_icon2">
        	    <img src="./img/cfn-cof.png" />
            </div>
            <div class="reser_con">
        	    <div><span class="font_size12b color90cd32 pad_t12 pad_l0">기부하기</span></div>
                <div> 
            	    <p class="font_size16b color000 pad_l0">사랑의 열매</p>
                    <p class="font_size12 color_b7b7b7 pad_t12">나의 기부, 가장 착한 선물입니다. 사랑의 열매는 사회복지공동모금회를 상징하는 희망아이콘입니다.</span></p>
                </div>
            </div>
        </div>
        <div class="reser">
    	    <div class="reser_icon reser_icon2">
        	    <img src="./img/cfn-cof.png" />
            </div>
            <div class="reser_con">
        	    <div><span class="font_size12b color90cd32 pad_t12 pad_l0">기부하기</span></div>
                <div> 
            	    <p class="font_size16b color000 pad_l0">사랑의 열매</p>
                    <p class="font_size12 color_b7b7b7 pad_t12">나의 기부, 가장 착한 선물입니다. 사랑의 열매는 사회복지공동모금회를 상징하는 희망아이콘입니다.</span></p>
                </div>
            </div>
        </div><div class="reser">
    	    <div class="reser_icon reser_icon2">
        	    <img src="./img/cfn-cof.png" />
            </div>
            <div class="reser_con">
        	    <div><span class="font_size12b color90cd32 pad_t12 pad_l0">기부하기</span></div>
                <div> 
            	    <p class="font_size16b color000 pad_l0">사랑의 열매</p>
                    <p class="font_size12 color_b7b7b7 pad_t12">나의 기부, 가장 착한 선물입니다. 사랑의 열매는 사회복지공동모금회를 상징하는 희망아이콘입니다.</span></p>
                </div>
            </div>
        </div>
    </div> <!-- //기부 tab -->

    <script type="text/javascript" src="script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script type="text/javascript" src="script/dropdown.min.js"></script>
    <script type="text/javascript" src="script/drawer.min.js"></script>
        
    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    $('.drawer').drawer();
                    $("#tabDonate").find("img").attr("src", "/img/top_menu/top04o.png");
                },
                initEvent: function () {
                    $(document).on('click', '#tabHome', function () {
                        location.href = "Main.aspx";
                    });
                    $(document).on('click', '#tabRequest', function () {
                        location.href = "CollectRequest.aspx";
                    });
                    $(document).on('click', '#tabStore', function () {
                        location.href = "StoreMain.aspx";
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