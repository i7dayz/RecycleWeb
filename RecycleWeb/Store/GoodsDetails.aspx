<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoodsDetails.aspx.cs" Inherits="RecycleWeb.Store.GoodsDetails" %>
<!-- #include file="/include/header_b.html" --> 
<link href="/script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../script/extention/jquery.js"></script>
    <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>
<style>
.container {
    background: #fff;
	padding-bottom:0;
}
body {
    height: 100%;
    background-color: #f6f6f6;
}
</style>
<script>

</script>
<header>
    <div class="su_header">
        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span><label runat="server" id="title"></label>
    </div>
</header>
<div class="container" style="">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <script type="text/javascript">
            function onError(msg) {
                errorBox(msg);
                return;
            }
            function onSuccess(msg) {
                infoBox(msg);
                return;
            }
        </script>
        <input type="hidden" runat="server" id="hdStore" />
        <input type="hidden" runat="server" id="hdGoodsId" />
        <input type="hidden" runat="server" id="hdTest" />
        <input type="hidden" runat="server" id="hdIsPostback" />
        <input type="hidden" runat="server" id="Hidden1" />
        <input type="hidden" runat="server" id="Hidden2" />
        <input type="hidden" runat="server" id="Hidden3" />
	    <div class="member_po pdt30">
            <div class="ctext"><img src="/img/cfn-cof2.png" class="img90" runat="server" id="goodsImg" /></div>
            <div class="ctext font_size20b pad20 "><p class="dashed_line"><label runat="server" id="goodsName"></label></p></div> 
        </div>
	    <table class="cen">
            <tbody>              
                <tr class="">
                    <td class="td_cen3_1"></td>
                    <td class="td_cen3_2">결제금액</td>
                    <td class="td_cen3_3"><img src="/img/p.png" class="img14_icon_l" /><label runat="server" id="price"></label></td>
                    <td class="td_cen3_4"></td>
                </tr>
                <tr class="">
                    <td class="td_cen3_1 pad_t12"></td>
                    <td class="td_cen3_2 pad_t12"><span class="color000 font_size14b pad_l0 ">교환처</span></td>
                    <td class="td_cen3_3 pad_t12"><span class="color000 font_size14b pad_l0 "><label runat="server" id="brandName"></label></span></td>
                    <td class="td_cen3_4 pad_t12"></td>
                </tr>
                <tr class="">
                    <td class="td_cen3_1"></td>
                    <td class="td_cen3_2"><span class="color000 font_size14b pad_l0 ">유효기간</span></td>
                    <td class="td_cen3_3"><span class="color000 font_size14b pad_l0 ">구입 후 <label runat="server" id="exDate"></label>일 이내</span></td>
                    <td class="td_cen3_4"></td>
            </tbody>
        </table>
	    <div class="su_txt">  
            <p class="rec_text11 pad_t12" runat="server" id="desc"></p>
            <div class="su_submit pdt30"><div class="btn_grean" style="cursor:pointer" id="btnBuy">구매하기</div></div>
        </div>
    </form>
</div>


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
                        if ($("#hdIsPostback").val() == "Y") {
                            window.history.go(-2);
                        } else {
                            window.history.back();
                        }
                    });

                    $(document).on('click', '#btnBuy', function () {
                        $('#form1').attr('action', 'GoodsDetails.aspx?store=' + $("#hdStore").val() + '&goods_id=' + $("#hdGoodsId").val());
                        $('#form1').submit();
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



