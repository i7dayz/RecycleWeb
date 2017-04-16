<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Info.aspx.cs" Inherits="RecycleWeb.Member.Info" %>

<!-- #include file="/include/header_b.html" --> 

<style>
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
<script>

</script>
<form id="form1" runat="server">
<header>
    <div class="su_header">
        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>
        회원정보관리
        <span class="su_rightbtn">
            <a href="javascript:;" id="btnEdit" >편집</a>
        </span>
    </div>
</header>
    <input type="hidden" id="kakaoId" runat="server" value="" />
    <input type="hidden" id="kakaoNickname" runat="server" value="" />
    <input type="hidden" id="kakaoEmail" runat="server" value="" />
    <input type="hidden" id="kakaoThumbnailImage" runat="server" value="" />
    <input type="hidden" id="kakaoProfileImage" runat="server" value="" />
    <input type="hidden" id="accessToken" runat="server" value="" />
    <input type="hidden" id="refreshToken" runat="server" value="" />
<div class="container" style="">
	<div class="ctext pad20 back_green">
        <div class="image-wrapper">
            <div class="image">
                <img runat="server" id="profileImg" src="/img/person64x64.png">
            </div>
        </div>
        <p class="ctext color_fff font_size14 padt20">
            <label runat="server" id="name" style="color:#ffffff;"></label>
        </p>
        <p class="ctext color_fff font_size14 pad10">
            <label runat="server" id="nickname" style="color:#ffffff;"></label>
        </p>
    </div>
	<div class="su_form">    	
    	</div>
            <div class="su_title">연락처</div>
            <div><input type="text" runat="server" id="txtContactNumber1" name="" value="" class="su_hp1" readonly /> - <input type="text" runat="server" id="txtContactNumber2" name="" value="" class="su_hp2" readonly /> - <input type="text" runat="server" id="txtContactNumber3" name="" value="" class="su_hp3" readonly /></div>
            <div class="su_title pdt20">기본주소</div>
            <div class="su_adr">
                <div><input type="text" name="" value="" class="su_input" id="txtBaseAddress" runat="server" readonly></div>
            </div>
            <div class="su_title">
                <div class="su_juso_left">세부주소</div>
                <div class="su_juso_right">우편번호</div>
            </div>
            <div class="su_adr">
                <div class="su_juso_left"><input type="text" name="" value="" class="su_input_juso01" id="txtDetailAddress" runat="server" readonly /> </div>
                <div class="su_juso_right"><input type="text" name="" value="" class="su_input_juso02" id="txtZipNo" runat="server" readonly /> </div>
            </div>
            <%--<div class="su_adr pad7">
            	<input type="checkbox" name="che_su" checked="checked" id="che_su"  /> <label for="che_su"><span class="color_b7b7b7">수거 주소와 동일</span></label>
            </div>--%>
            <%--<div class="su_submit pdt30"><div class="btn_grean">기본정보 저장</div></div>--%>
            <div class="su_submit" id="btnEditAddress"><div class="btn_gray">수거 주소록 관리</div></div>

        <div class="su_title pdt30">
            <div class="font_size12 su_juso_left">
                <asp:linkbutton id="LinkButton1" name="LinkButton1" runat="server" onclick="LinkButton1_Click" onclientclick="return page.fn.confirm();">로그아웃</asp:linkbutton>
            </div>
                <div class="font_size12 su_juso_right">
                    <a class="txt-color5" style="padding-right:15px;" runat="server">회원탈퇴</a>
                </div>
            </div>
    </div>
</div>
</form>
    <script type="text/javascript" src="../script/extention/jquery.js"></script>
    <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>

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
                        //window.history.back();
                        location.href = "/Main.aspx";
                    });

                    $(document).on('click', '#btnEdit', function () {
                        location.href = "EditInfo.aspx";
                    });

                    $(document).on('click', '#btnEditAddress', function () {
                        location.href = "AddressList.aspx";
                    });
                },
                fn: {  
                    goUrl: function(urlData) {
                        location.href = urlData.url;
                    },
                    confirm: function () {
                        return false;
                    }
                }
            };

            $(document).on('ready', function () {
                page.init();
            });
        })();
    </script>
<!-- #include file="/include/footer_b.html" -->
</form>

