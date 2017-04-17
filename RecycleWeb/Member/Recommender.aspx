<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recommender.aspx.cs" Inherits="RecycleWeb.Member.Recommender" %>

<!-- #include file="/include/header_b.html" --> 
    <link href="/script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />
<style>

</style>
<header>
    <div class="su_header">
        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>추천인 입력
    </div>
</header>
<div class="container" style="">
    <input type="hidden" runat="server" id="hdProducerIdx" />
	<div class="recommend_cu">
		<p class="rec_text">추천인 입력</p> 
        <div>
            <div class="reco_l">
                <input type="text" name="" id="txtRecommenderNickname" placeholder="추천인 닉네임 입력" value="" />
            </div>	
            <div class="reco_r">
                <img src="/img/baechul/btn-cnf.png" height="40" id="btnSave"/>
            </div>	
        </div>
        
        <p class="rec_text">친구초대</p> 
        <div class="rec_sns_con">
        	<div class="reco_sns"><a href="#"><img src="/img/baechul/frd-kko.png" class="img60" /><p>카카오톡</p></a></div>
            <div class="reco_sns"><a href="#"><img src="/img/baechul/frd-sms.png" class="img60" /><p>SMS</p></a></div>
            <div class="reco_sns"><a href="#"><img src="/img/baechul/frd-lin.png" class="img60" /><p>LINE</p></a></div>
            <div class="reco_sns"><a href="#"><img src="/img/baechul/frd-lnk.png" class="img60" /><p>링크</p></a></div>
        </div>
    </div>
</div>

    <script type="text/javascript" src="../script/extention/jquery.js"></script>
        <script type="text/javascript" src="../script/common.js"></script>
        <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>

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
                    $(document).on('click', '#btnSave', function () {
                        if ($("#txtRecommenderNickname").val() == "") {
                            $("#txtRecommenderNickname").focus();
                            errorBox("추천인 닉네임을 입력하세요.");
                            return;
                        }

                        page.fn.saveRecommender();
                    });
                },
                fn: {
                    saveRecommender: function () {
                        var params = {
                            producerIdx: $("#hdProducerIdx").val(),
                            recommenderNickname: $("#txtRecommenderNickname").val(),
                        }

                        Server.ajax("/producer/recommenderRegist", params, function (response, status, xhr) {
                            //alert(response.value);
                            if (response.value == 0) {
                                infoBox($("#txtRecommenderNickname").val() + "님을 추천인으로 등록하셨습니다.");
                            } else {
                                errorBox(getErrMsg(response.value));
                            }
                        }, "post", false);
                    }
                }
            };

            $(document).on('ready', function () {
                page.init();
            });
        })();
    </script>
</body>
</html>