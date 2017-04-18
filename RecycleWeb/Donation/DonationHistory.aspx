<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DonationHistory.aspx.cs" Inherits="RecycleWeb.Member.DonationHistory" %>

<!-- #include file="/include/header_b.html" --> 
<style>
.point table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
}
td.td_po3_2 {
    font-weight: bold;
    color: #5e8d19;
	width:32%;
}
td.td_po3_3 {
    text-align: right;
	width:58%;color: #fff;
}

.point td {
    padding: 11px;
    /* border-top: 1px solid #e9e9e9; */
    border-bottom: 1px solid #9fdc41;
    line-height: 1.5em;
    word-break: break-all;
    background: #90cd32;
    
}
p.su_btn.po_more {
    background: #a6d75a;
	color:#5e8e18;
	font-weight:bold;
	font-size:14px;
}
.image-wrapper { 
    width:100%; text-align: center; 
    background: url('../img/character-02.png') no-repeat;
    background-size: contain;
    background-position:center
}
.image { display: block; overflow: hidden; width: 64px; height: 64px; border-radius: 50%; margin: 0 auto; }
.image > img {
    display: inline-block;
    max-width: 100%;
    min-height: 100%;
    -ms-interpolation-mode: bicubic;
}
</style>
    <input type="hidden" runat="server" id="hdProducerIdx" />
<header>
    <div class="su_header">
        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>기부 내역
    </div>
</header>
<div class="container" style="">
    <div class="member_po">
    	<p class="rtext">만료예정일 : <label runat="server" id="exDate"></label></p>
        <p class="rtext">만료예정 포인트 : <label runat="server" id="exPoint"></label></p>
        <div class="ctext">
            <div class="image-wrapper">
                <div class="image">
                    <img runat="server" id="profileImg" src="img/person64x64.png">
                </div>
            </div>
        </div>
        <p class="ctext color_b7b7b7 font_size12"><label runat="server" id="nickname"></label></p>
        <p class="ctext font_size34b "><label runat="server" id="point">0</label> <img src="/img/d-pnt-56.png" class="img20" /></p>
    </div>
	<div class="point">
    	<table>
        	<tbody class="donation-history-list"> 
                <tr class="tr_top">
                	<td class="td_po3_1"></td>
                	<td class="td_po3_2">나의 기부 내역</td>
                    <td class="td_po3_3">
                    	<p class="total" runat="server" id="totalDonatePoint">0<span class="icon_s">P</span></p>
                    </td>
                    <td class="td_po3_4"></td>
                </tr>
            </tbody>
        </table>   	
    </div>
    <%--<p class="su_btn po_more" id="btnSearchNext" style="cursor:pointer">
    	+ 더보기 
    </p>--%>
</div>

    <script type="text/javascript" src="../script/extention/jquery.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>
    <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script type="text/javascript" src="/script/drawer.min.js" charset="utf-8"></script>

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
                    donationHistoryList: function () {
                        var params = {
                            producerIdx: $("#hdProducerIdx").val()
                        };

                        Server.ajax("/producer/donationHistory", params, function (response, status, xhr) {
                            if (response.value == 0) {
                                var list = response.donationHistory;

                                for (var i = 0; i < list.length; i++) {
                                    page.fn.addDonationHistory(list[i]);
                                }
                            } else {
                                errorBox("Error Code : " + response.value);
                            }
                        }, "post", false);
                    },
                    addDonationHistory: function (item) {
                        //var donationHistory = '<ul class="donation-item" id="' + item[0] + '">'
                        //                    + '    <li class="date">기부일자..</li>'
                        //                    + '    <li class="point">' + item[3] + '</li>'
                        //                    + '    <li class="group">' + item[1] + '</li>'
                        //                    + '</ul>';

                        var t = item[5].split(/[- :]/);
                        var d = new Date(t[0], t[1] - 1, t[2], t[3], t[4], t[5]);
                        var date = new Date(d);

                        var donationHistory = '<tr class="">'
                                              + '	<td class="td_po3_1"></td>'
                                              + '	<td class="td_po3_2">' + date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + '</td>'
                                              + '    <td class="td_po3_3">'
                                              + '    	<p>' + commaSeparateNumber(item[3]) + '</p>'
                                              + '       <p>' + item[1] + '</p>'
                                              + '    </td>'
                                              + '    <td class="td_po3_4"></td>'
                                              + '</tr>';

                        $('.donation-history-list').append(donationHistory);
                    }
                }
            };

            $(document).on('ready', function () {
                page.init();
                page.fn.donationHistoryList();
            });
        })();
    </script>
   </div>

</body>
</html>
