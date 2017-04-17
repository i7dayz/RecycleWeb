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
    </div> <!-- //기부 tab -->

    <script type="text/javascript" src="script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <%--<script type="text/javascript" src="script/dropdown.min.js"></script>--%>
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
                        //var donationGroup = '<li style="border-bottom: 1px solid #eeeeee;" class="ui-li-has-thumb">'
                        //                  + '    <a href="/Donation/DonationDetails.aspx?id=' + item[0] + '" style="background-color:#ffffff;" class="ui-btn" data-ajax="false">'
                        //                  + '        <img src="' + item[3] + '" class="ui-thumbnail ui-thumbnail-circular" style="width:75px;height:75px;margin:10px auto;" />'
                        //                  + '        <h2>' + item[1] + '</h2>'
                        //                  + '        <p style="white-space:normal">' + item[2] + '</p>'
                        //                  + '    </a>'
                        //                  + '</li>';
                        
                        var donationGroup = '<div class="reser">'
                                          + '    <a href="/Donation/DonationDetails.aspx?id=' + item[0] + '">'
    	                                  + '        <div class="reser_icon reser_icon2">'
        	                              + '            <img src="' + item[3] + '" />'
                                          + '        </div>'
                                          + '        <div class="reser_con">'
        	                              + '            <div><span class="font_size12b color90cd32 pad_t12 pad_l0">기부하기</span></div>'
                                          + '            <div> '
            	                          + '                <p class="font_size16b color000 pad_l0">' + item[1] + '</p>'
                                          + '                <p class="font_size12 color_b7b7b7 pad_t12">' + item[2] + '</span></p>'
                                          + '            </div>'
                                          + '        </div>'
                                          + '    </a>'
                                          + '</div>';

                        $('#donationGroupList').append(donationGroup);
                    },
                }
            };

            $(document).on('ready', function () {
                page.init();
                $('.drawer').drawer();
                page.fn.getDonationGroup();
            });

        })();
    </script>
</body>
</html>