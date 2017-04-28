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
        <div id="donationGroupList"></div>
    </div> <!-- //기부 tab -->

    <iframe src="/temp.html"  style="visibility:hidden;display:none" scrolling="no"></iframe>

    <script type="text/javascript" src="script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script type="text/javascript" src="script/dropdown.min.js"></script>
    <script type="text/javascript" src="script/drawer.min.js"></script>
    <script type="text/javascript" src="script/common.js"></script>
        
    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
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
                    getDonationGroup: function () {
                        Server.ajax("/producer/donationGroupList", null, function (response, status, xhr) {
                            if (response.value == 0) {
                                var list = response.donationGroupList;

                                for (var i = 0; i < list.length; i++) {
                                    page.fn.addDonationGroup(list[i]);
                                }
                            } else {
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    },
                    addDonationGroup: function (item) {                        
                        var donationGroup = '<a href="/Donation/DonationDetails.aspx?id=' + item[0] + '">'
                                          + '    <div class="reser">'
    	                                  + '        <div class="reser_icon reser_icon2">'
        	                              + '            <img src="http://hrx.co.kr/img/dnt_1out/' + item[3] + '" />'
                                          + '        </div>'
                                          + '        <div class="reser_con">'
        	                              + '            <div><span class="font_size12b color90cd32 pad_t12 pad_l0">기부하기</span></div>'
                                          + '            <div> '
            	                          + '                <p class="font_size16b color000 pad_l0">' + item[1] + '</p>'
                                          + '                <p class="font_size12 color_b7b7b7 pad_t12">' + item[2] + '</span></p>'
                                          + '            </div>'
                                          + '        </div>'
                                          + '    </div>'
                                          + '</a>';

                        $('#donationGroupList').append(donationGroup);
                    },
                }
            };

            $(document).on('ready', function () {
                page.init();
                $('.drawer').drawer({
                    iscroll: {
                        mouseWheel: true,
                        preventDefault: false
                    },
                    showOverlay: true
                });
                page.fn.getDonationGroup();
            });

        })();
    </script>
</body>
</html>