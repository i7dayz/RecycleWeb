<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PointHistory.aspx.cs" Inherits="RecycleWeb.Member.PointHistory" %>

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
        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>포인트 내역
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
        	<tbody class="point-list"> 
                <%--
                <tr class="">
                	<td class="td_po3_1"></td>
                	<td class="td_po3_2">2016.12.16</td>
                    <td class="td_po3_3">
                    	<p>+10,200</p>
                        <p>고철 1, 헌옷 3, 비철 5, 병 2 외</p>
                    </td>
                    <td class="td_po3_4"></td>
                </tr>
                <tr class="">
                	<td class="td_po3_1"></td>
                	<td class="td_po3_2">2016.12.02</td>
                    <td class="td_po3_3">
                    	<p>+10,200</p>
                        <p>고철 1, 헌옷 3, 비철 5, 병 2 외</p>
                    </td>
                    <td class="td_po3_4"></td>
                </tr>
                <tr class="">
                	<td class="td_po3_1"></td>
                	<td class="td_po3_2">2016.11.26</td>
                    <td class="td_po3_3">
                    	<p>+10,200</p>
                        <p>고철 1, 헌옷 3, 비철 5, 병 2 외</p>
                    </td>
                    <td class="td_po3_4"></td>
                </tr>
                <tr class="">
                	<td class="td_po3_1"></td>
                	<td class="td_po3_2">2016.11.13</td>
                    <td class="td_po3_3">
                    	<p>+10,200</p>
                        <p>고철 1, 헌옷 3, 비철 5, 병 2 외</p>
                    </td>
                    <td class="td_po3_4"></td>
                </tr>
                <tr class="">
                	<td class="td_po3_1"></td>
                	<td class="td_po3_2">2016.10.17</td>
                    <td class="td_po3_3">
                    	<p>+10,200</p>
                        <p>고철 1, 헌옷 3, 비철 5, 병 2 외</p>
                    </td>
                    <td class="td_po3_4"></td>
                </tr>
                <tr class="">
                	<td class="td_po3_1"></td>
                	<td class="td_po3_2">2016.10.11</td>
                    <td class="td_po3_3">
                    	<p>+10,200</p>
                        <p>고철 1, 헌옷 3, 비철 5, 병 2 외</p>
                    </td>
                    <td class="td_po3_4"></td>
                </tr>
                --%>
            </tbody>
        </table>   	
    </div>
    <%--<p class="su_btn po_more" onclick="form_submit();">
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
                    pointHistory: function () {
                        var params = {
                            producerIdx: $("#hdProducerIdx").val(),
                            pageNum: 0
                        };

                        Server.ajax("/producer/pointHistory", params, function (respone, status, xhr) {
                            if (respone.value == 0) {
                                var list = respone.pointHistory;

                                for (var i = 0; i < list.length; i++) {
                                    page.fn.addPoint(list[i]);
                                }
                            } else {
                                errorBox("Error Code : " + respone.value);
                            }
                        }, "post", false);
                    },
                    addPoint: function (item) {
                        var type = "";
                        var pm = "";
                        switch (item[1]) {
                            case "1": 
                                type = "적립";
                                pm = "+";
                                break;
                            case "2 ": 
                                type = "사용";
                                pm = "-";
                                break;
                            case "3": 
                                type = "기부";
                                pm = "-";
                                break;
                            case "4":
                                type = "추천포인트";
                                pm = "+";
                                break;
                        }

                        var goods = "";

                        if (parseInt(item[5]) > 0)
                            goods += "폐지 " + item[5] + ", ";
                        if (parseInt(item[6]) > 0)
                            goods += "병 " + item[6] + ", ";
                        if (parseInt(item[7]) > 0)
                            goods += "캔 " + item[7] + ", ";
                        if (parseInt(item[8]) > 0)
                            goods += "고철 " + item[8] + ", ";
                        if (parseInt(item[9]) > 0)
                            goods += "비철 " + item[9] + ", ";
                        if (parseInt(item[10]) > 0)
                            goods += "헌옷 " + item[10] + ", ";
                        if (parseInt(item[11]) > 0)
                            goods += "휴대폰 " + item[11] + ", ";
                        if (parseInt(item[12]) > 0)
                            goods += "대형가전 " + item[12] + ", ";
                        if (parseInt(item[13]) > 0)
                            goods += "소형가전 " + item[13] + ", ";
                        if (parseInt(item[14]) > 0)
                            goods += "이사수거 " + item[14] + ", ";

                        goods = goods.substring(0, goods.length - 2);

                        var t = item[4].split(/[- :]/);
                        var d = new Date(t[0], t[1] - 1, t[2], t[3], t[4], t[5]);
                        var date = new Date(d);

                        //var point = '<ul class="point-item" id=' + item[0] + '>'
                        //          + '    <li class="date">' + date.getFullYear() + "." + (date.getMonth() + 1 ) + "." + date.getDate()  + '</li>'
                        //          + '    <li class="point">' + pm + item[3] + '</li>'
                        //          + '    <li class="goods">' + goods + '</li>'
                        //          + '</ul>';

                        var point = '<tr class="" id=' + item[0] + '>'
                                  + '	<td class="td_po3_1"></td>'
                                  + '	<td class="td_po3_2">' + date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + '</td>'
                                  + '    <td class="td_po3_3">'
                                  + '    	<p>' + pm + commaSeparateNumber(item[3]) + '</p>'
                                  + '       <p>' + goods + '</p>'
                                  + '    </td>'
                                  + '    <td class="td_po3_4"></td>'
                                  + '</tr>';

                        $(".point-list").append(point);
                    },
                }
            };

            $(document).on('ready', function () {
                page.init();
                $('.drawer').drawer();
                page.fn.pointHistory();
            });
        })();
    </script>
   </div>

</body>
</html>
