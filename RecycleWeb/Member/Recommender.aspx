﻿    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recommender.aspx.cs" Inherits="RecycleWeb.Member.Recommender" %>

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
        	<div class="reco_sns" style="width:33.3%"><a id="kakao-link-btn" href="javascript:sendKakaoLink()"><img src="/img/baechul/frd-kko.png" class="img60" /><p>카카오톡</p></a></div>
            <div class="reco_sns" style="width:33.3%"><a id="sms-btn" href="javascript:infoBox('문자공유는 스마트폰에서만 가능합니다.');"><img src="/img/baechul/frd-sms.png" class="img60" /><p>SMS</p></a></div>
            <%--<div class="reco_sns"><a href="#"><img src="/img/baechul/frd-lin.png" class="img60" /><p>LINE</p></a></div>--%>
            <div class="reco_sns" style="width:33.3%"><a id="copy-btn" href="javascript:copyClipboard();"><img src="/img/baechul/frd-lnk.png" class="img60" /><p>링크</p></a></div>
        </div>
        <input type="text" runat="server" id="urlLinkText" value="http://hrx.co.kr" style="border: 1px; background-color: #fff; color: #fff; opacity: 0; filter: alpha(opacity=0); /* For IE8 and earlier */ "/>
    </div>
</div>

    <script type="text/javascript" src="../script/extention/jquery.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>
    <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

    <script>
        //<![CDATA[
        // // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('5fbf9e293f3ee6416b6b387bdfcaafb3');
        // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
        function copyClipboard() {
            document.querySelector('#urlLinkText').select();
            copied = document.execCommand("copy");

            if (copied) {
                infoBox("공유 주소가 복사되었습니다.")
            } else {
                errorBox("공유 주소 복사에 실패하였습니다.");
            }
            return false;
        }

        function sendKakaoLink() {
            var device = check_device(); 
            if (device === '') {
                infoBox("카카오톡 공유하기 기능 스마트폰에서만 가능합니다.");
                return;
            }

            Kakao.Link.sendDefault({
                objectType: 'feed',
                content: {
                    title: '디저트 사진',
                    description: '아메리카노, 빵, 케익',
                    imageUrl: 'http://mud-kage.kakao.co.kr/dn/NTmhS/btqfEUdFAUf/FjKzkZsnoeE4o19klTOVI1/openlink_640x640s.jpg',
                    link: {
                        mobileWebUrl: 'https://dev.kakao.com'
                    }
                },
                social: {
                    likeCount: 10,
                    commentCount: 20,
                    sharedCount: 30
                },
                buttons: [{
                    title: '웹으로 이동',
                    link: {
                        mobileWebUrl: 'https://dev.kakao.com'
                    }
                }, {
                    title: '앱으로 이동',
                    link: {
                        mobileWebUrl: 'https://dev.kakao.com'
                    }
                }]
            });
        }
        //]]>

        function check_device() {
            var mobileKeyWords = new Array('iPhone', 'iPad', 'iPod', 'Android');
            var device_name = '';
            for (var word in mobileKeyWords) {
                if (navigator.userAgent.match(mobileKeyWords[word]) != null) {
                    device_name = mobileKeyWords[word];
                    break;
                }
            }
            return device_name
        }

        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    var device = check_device();

                    if (device === 'iPhone') {
                        $("#sms-btn").attr("href", "sms:&body=문자전송");
                    } else if (device === 'Android') {
                        $("#sms-btn").attr("href", "sms:?body=문자전송");
                    }
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