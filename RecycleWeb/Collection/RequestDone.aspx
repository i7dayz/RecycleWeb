<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestDone.aspx.cs" Inherits="RecycleWeb.Collection.RequestDone" %>


<!-- #include file="/include/header_b.html" --> 
    <link href="../script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css" />

    <!-- 수거신청 탭 -->        
        <input type="hidden" runat="server" id="hdProduceIdx" />
        <input type="hidden" runat="server" id="hdProducerIdx" />   
        <input type="hidden" runat="server" id="hdProducerName" /> 
        <header>
                <div class="su_header">
			        <span class="su_leftbtn back-btn"><img src="/img/baechul/back-btn.png" width="13" /></span>수거신청
                </div>
            </header>
        <div class="container" style="">
	        <p class="su_wan">수거신청이 완료되었습니다. 기사님이 방문 전에 연락드리겠습니다.</p>
	        <div class="su_form">    	
    	        <div class="ctext pad20">
                    <img src="/img/baechul/kko-prf-1.png" width="100" id="imgCollectorImg" runat="server">
    	        </div>
                <div class="su_title"><span class="color90cd32">[수거신청품목]</span></div>
                <div><input type="text" runat="server" id="txtReqList" name="" value="" class="su_input" readonly/></div>
                <div class="su_title">수거 담당자</div>
                <div><input type="text" runat="server" id="txtCollectorName" name="" value="" class="su_input" readonly /></div>
                <div class="su_title">연락처</div>
                <div><input type="text" runat="server" id="txtCollectorContactNumber" name="" value="" class="su_input" readonly /></div>
                <div class="su_title">희망수거일시</div>
                <div><input type="text" runat="server" id="txtReqDate" name="" value="" class="su_input" readonly /></div>
                <div style="height:30px;"></div>
                <div class="harf_con">
                    <div class="harf_l2">
                        <div class="btn_gray2" id="btnCancel" style="cursor:pointer" >취소</div>
                    </div>
                    <div class="harf_r2">
                        <div class="btn_grean2" id="btnConfirm" style="cursor:pointer" >확인</div>
                    </div>
                </div>
            </div>
        </div>        

    <iframe src="../temp.html"  style="visibility:hidden;display:none" scrolling="no"></iframe>

        <script type="text/javascript" src="../script/extention/jquery.js"></script>
        <script type="text/javascript" src="../script/common.js"></script>
        <script type="text/javascript" src="../script/extention/jquery.modal-master/js/jquery.modal.js"></script>
        
        <script>
            (function () {
                // push 관련 변수
                var push_title = ''; // 푸시제목
                var push_content = ''; // 푸시 내용  
                var push_target = '2'; // 푸시 타겟 설정 1: 전체,  2: 특정대상자 
                var push_url = ''; // 푸시 이동  URL
                var push_id = ''; // 푸시id (푸시 수신 대상자)
                var img_url = '';// image url 이미지 push사용시, 이미지 권장비율 = 가로:세로 2:1비율 최소 - 512x256p  보통 - 1024x512px 최대 - 2048x1024px

                if (push_url.length == 0) {
                    var data_param = {};
                } else {
                    var data_param = {
                        'custom_url': push_url
                    };  // data_param 은 url값 등을 jswon 데이터로 전송
                }

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

                        $(document).on('click', '#btnCancel', function () {
                            confirmBox("수거예약을 취소하시겠습니까?", page.fn.cancelRequest);
                        });

                        $(document).on('click', '#btnConfirm', function () {
                            location.href = "/Main.aspx";
                        });
                    },
                    fn: {
                        getCollectorInfo: function () {
                            var params = {
                                producerIdx: $("#hdProducerIdx").val()
                            }

                            Server.ajax("/producer/collectReserve", params, function (response, status, xhr) {
                                //infoBox(response.value);
                                if (response.value == 0) {

                                    if (response.collectReserve.product_1 != 0) {
                                        $("#txtReqList").val($("#txtReqList").val() + "폐지 " + response.collectReserve.product_1 + ", ");
                                    }
                                    if (response.collectReserve.product_2 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "병 " + response.collectReserve.product_2 + ", ");
                                    }
                                    if (response.collectReserve.product_4 != 0) {
                                        $("#txtReqList").val($("#txtReqList").val() + "고철 " + response.collectReserve.product_4 + ", ");
                                    }
                                    if (response.collectReserve.product_5 != 0) {
                                        $("#txtReqList").val($("#txtReqList").val() + "비철 " + response.collectReserve.product_5 + ", ");
                                    }
                                    if (response.collectReserve.product_6 != 0) {
                                        $("#txtReqList").val($("#txtReqList").val() + "헌옷 " + response.collectReserve.product_6 + ", ");
                                    }
                                    if (response.collectReserve.product_7 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "휴대폰 " + response.collectReserve.product_7 + ", ");
                                    }
                                    if (response.collectReserve.product_8 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "대형가전 " + response.collectReserve.product_8 + ", ");
                                    }
                                    if (response.collectReserve.product_9 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "소형가전 " + response.collectReserve.product_9 + ", ");
                                    }
                                    if (response.collectReserve.product_10 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "이사수거 " + response.collectReserve.product_10 + ", ");
                                    }
                                    if (response.collectReserve.etc_1 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "가구류/기타, ");
                                    }
                                    if (response.collectReserve.etc_2 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "폐기서비스, ");
                                    }
                                    if (response.collectReserve.etc_3 != "0") {
                                        $("#txtReqList").val($("#txtReqList").val() + "유품정리, ");
                                    }

                                    $("#txtReqList").val($("#txtReqList").val().substring(0, $("#txtReqList").val().length - 2));
                                    $("#hdProduceIdx").val(response.collectReserve.product_3);
                                    $("#imgCollectorImg").attr("src", "http://hrx.co.kr/img/collector_profile/" + response.collectReserve.collectorImageUrl);
                                    $("#txtCollectorName").val(response.collectReserve.collectorName);
                                    $("#txtCollectorContactNumber").val(response.collectReserve.collectorContactNumber);
                                    $("#txtReqDate").val(response.collectReserve.hopeCollectDate);

                                } else {
                                    errorBox(getErrMsg(response.value));
                                }
                            }, "post", false);
                        },
                        cancelRequest: function () {
                            var params = {
                                produceIdx: $("#hdProduceIdx").val(),
                                producerIdx: $("#hdProducerIdx").val()
                            }

                            Server.ajax("/producer/produceCancel", params, function (response, status, xhr) {
                                if (response.value == 0) {
                                    push_id = '';
                                    push_id = response.produceCancel.deviceInfo;
                                    push_title = '리본 - 재활용품 방문수거';
                                    push_content = $("#hdProducerName").val() + '님의 수거요청이 취소되었습니다.';

                                    if (push_id != '') {
                                        var player_id_array = new Array();
                                        player_id_array.push(push_id);   // 특정사용자 배열변수에 추가.                
                                        var push_target_all = '';
                                        page.fn.Push_Send(data_param, push_target_all, player_id_array, img_url, push_title, push_content); // 푸시 전송함수
                                    }

                                    //infoBox(response.value);
                                    infoBoxWithCallback("수거신청이 취소되었습니다.", page.fn.goUrl, { url: "/Main.aspx" })
                                } else {
                                    errorBox(getErrMsg(response.value));
                                }
                            }, "post", false);
                        },
                        goUrl: function(urlData) {
                            location.href = urlData.url;
                        },
                        Push_Send: function (data_param, push_target_all, player_id_array, img_url, push_title, push_content) {
                            // push
                            var app_id = "8a4ff0cf-cbd4-4f17-be51-a4c877f1796a";  //고정값 일반사용자 id 입니다. 
                            //var app_id = "aa8b3ae8-80a6-44eb-af22-a91a09cf2215";  //고정값 업체용 id 입니다. 
                            var restapi_key = "MDFmZDUxMmItNmEzYS00YTgxLWE1ODMtZGJkZWU1MWJjZDc4";  //고정값 일반사용자 key 입니다.
                            //var restapi_key = "Y2MyOTJmZWUtOThlMi00MWZlLWIzYzQtYTVjNTI5ODg4NmM1";  //고정값 업체용 key 입니다.
                            var big_picture = "";
                            if (img_url.length > 5) {
                                big_picture = img_url; // 이미지푸시값 있을 경우
                            }

                            $.ajax({
                                url: 'https://onesignal.com/api/v1/notifications',
                                type: 'POST',
                                dataType: "json",

                                data: {
                                    "app_id": app_id,
                                    //"included_segments": push_target_all,   //전체사용자에게 푸시발송, *iclude_segments or include_player_ids 둘중 하나만 사용가능.
                                    "include_player_ids": player_id_array,
                                    "headings": { "en": push_title },   //푸시 타이틀
                                    "contents": { "en": push_content },   //푸시 내용                  
                                    "data": data_param,
                                    "large_icon": "icon_96", //표시 icon   
                                    "small_icon": "icon_48",  //상태바 표시 icon  
                                    "big_picture": big_picture,   //안드로이드 푸시 이미지
                                    "ios_attachments": { "id1": big_picture }   //iOS 푸시 이미지
                                },
                                beforeSend: function (xhr) {
                                    xhr.setRequestHeader("Authorization", "Basic " + restapi_key);
                                },
                                success: function (response) {
                                    //alert('푸시가 발송되었습니다.');
                                    console.log(JSON.stringify(response));
                                },
                                error: function (xhr) {
                                    alert('오류가 발생했습니다.\n\nerror : ' + JSON.stringify(xhr));

                                }
                            });
                        }
                    }
                };

                $(document).on('ready', function () {
                    page.init();
                    page.fn.getCollectorInfo();
                });
            })();
        </script>
    </body>
</html>