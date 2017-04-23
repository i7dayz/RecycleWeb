<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="RecycleWeb.Support.Event" %>

<!-- #include file="/include/header_b.html" --> 
    <link href="/script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />
<style>

</style>
<script>
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
        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>이벤트
    </div>
</header>
<div class="container" style="">
    <input type="hidden" runat="server" id="hdId" />
	<div id="faq_wrap" class="faq_1">
        <section id="faq_con">
        <h2>자주하시는 질문 목록</h2>
        <ol id="eventList">
             <%--<li>                
                <a href="#none" onclick="return faq_open(this);" class="faq_q"> 
                    <p class="font_size14b pad_l0">추천인 이벤트<span class="icon_s12">N</span></p>
                    <p class="font_size11 color_b7b7b7">2017-02-18 16:00</p>
                </a>                
                <div class="con_inner faq_a" style="display: none;">
                    <p><img src="./img/slide/1.png" width="100%"/></p>
                    <p>고객님이 추천한 회원에게 고객님이 판매하신 재활용품 가격의 1%만큼 리본에서 적립해 드립니다.</p>    
                    <p>고객님이 추천한 회원에게 고객님이 판매하신 재활용품 가격의 1%만큼 리본에서 적립해 드립니다.</p>                
                </div>
            </li>
             <li>
               <a href="#none" onclick="return faq_open(this);" class="faq_q"> 
                    <p class="font_size14b pad_l0">대한민국 SW기업 경쟁력 대상 우...<span class="icon_s12">N</span></p>
                    <p class="font_size11 color_b7b7b7">2017-02-18 16:00</p>
                </a>  
                <div class="con_inner faq_a" style="display: none;">
                    <p>test</p>                    
                </div>
            </li>--%>
        </ol>
    </section>
    </div>
</div>
    
    <script type="text/javascript" src="../script/extention/jquery.js"></script>
    <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
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
                    $(".closer_btn").on("click", function () {
                        $(this).closest(".con_inner").slideToggle();
                    });
                    $(document).on('click', '.back-btn', function () {
                        window.history.back();
                    });
                },
                fn: {
                    eventList: function () {
                        var params = {
                            pageNum: 0
                        };

                        Server.ajax("/producer/eventList", params, function (respone, status, xhr) {
                            if (respone.value == 0) {
                                var list = respone.eventList;

                                for (var i = 0; i < list.length; i++) {
                                    page.fn.addEvent(list[i]);
                                }
                            } else {
                                errorBox(getErrMsg(respone.value));
                            }
                        }, "post", false);
                    },
                    addEvent: function (item) {
                        var isDev = false;
                        var fileName = "";
                        if (isDev) {
                            switch (item[0]) {
                                case 163:
                                    fileName = "/event01.txt";
                                    break;
                                case 164:
                                    fileName = "/event02.txt";
                                    break;
                                case 165:
                                    fileName = "/event03.txt";
                                    break;
                            }
                        }
                        else {
                            switch (item[0]) {
                                case 1:
                                    fileName = "/event01.txt";
                                    break;
                                case 2:
                                    fileName = "/event02.txt";
                                    break;
                                case 3:
                                    fileName = "/event03.txt";
                                    break;
                            }
                        }

                        var status = item[6] === 1 ? '진행중' : '종료';

                        var img = item[3] != '' ? '<img src="' + item[3] + '" style="width:100%">' : '';

                        var event = '<li id="e_' + item[0] + '">'
                                  + '    <a href="#none" onclick="return faq_open(this);" class="faq_q">'
                                  + '        <p class="font_size14b pad_l0">[' + status + '] ' + item[1] + '<span class="icon_s12">N</span></p>'
                                  + '        <p class="font_size11 color_b7b7b7">' + item[4] + "~" + item[5] + '</p>'
                                  + '    </a>'
                                  + '    <div class="con_inner faq_a" style="display: none;">'
                                  + '        <p>' + img + '</p>'
                                  + '        <p id="event' + item[0] + '"></p>';
                                  + '    </div>'
                                  + '</li>';

                                  $('#eventList').append(event);

                        if (fileName != "") {
                            $.ajax({
                                url: fileName,
                                dataType: "text",
                                success: function (data) {
                                    $("#event" + item[0]).html(data);
                                }
                            });
                        }
                    }
                }
            };

            $(document).on('ready', function () {
                page.init();
                page.fn.eventList();

                if ($('#hdId').val != '') {
                    $('#e_' + $('#hdId').val()).find('div').css('display', 'block');
                    var offset = $('#e_' + $('#hdId').val()).offset();
                    $('html, body').animate({ scrollTop: offset.top }, 400);
                }
            });
        })();
    </script>
</body>
</html>