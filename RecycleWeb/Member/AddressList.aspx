<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressList.aspx.cs" Inherits="RecycleWeb.Member.AddressList" %>


<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>고물상</title>
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,width=device-width">

    <link href="../css/layout.css" rel="stylesheet" type="text/css" media="all">
    <link href="../css/adjustment.css" rel="stylesheet" type="text/css" media="all">

    <link href="../script/extention/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
    <link href="../script/extention/jquery.modal-master/css/jquery.modal.css" rel="stylesheet" type="text/css">
</head>
<body class="all" contenteditable="false">
    <input type="hidden" runat="server" id="hdProducerIdx" />
    <div class="wrap join" id="wrap">
        <!-- #header -->
        <div class="header" id="header" style="z-index:1;">
            <div class="colgroup fixed">
                <div class="ci use-search-reset">
                    <a href="javascript:;" class="back-btn">
                        <em class="img-menu ci-logo"><img src="../img/back-btn.png" style="width:8px; height:12px; margin:6px;" alt=""></em>                                                    
                    </a>
                    <span>수거주소록</span>
                </div>
            </div>
        </div>
        <!-- //#header -->
        <!-- #container -->
        <div class="container" id="container" style="background-color:#fff !important">
            <div class="colgroup">
                <div class="content fixed" id="content">
                    <div class="header" style="background-color:#90cd32;">
                        <div class="profile">
                            <div class="image-wrapper">
                                <div class="image">
                                    <img id="profileImg" runat="server" src="">
                                </div>
                            </div>
                            <div class="name">                      
                                <label runat="server" id="name" style="color:#ffffff;"></label>
                            </div>
                            <div class="nickname">
                                <label runat="server" id="nickname" style="color:#ffffff;"></label>
                            </div>
                        </div>
                    </div>
                    <div class="main ui-content">
                        <div class="fixed option-area join">
                            <ul id="addressList"></ul>
                        </div>
                    </div>
                    <div style="padding:15px">
                        <a href="javascript:;" id="btnAddAddress" class="ui-btn ui-corner-all btn-green">추가</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
                        window.history.back();
                    });

                    $(document).on('click', '#btnAddAddress', function () {
                        location.href = "EditAddress.aspx?id=";
                    });

                    $(document).on('click', 'li[name=address]', function () {
                        location.href = "EditAddress.aspx?id=" + $(this).attr('id');
                    });
                },
                fn: {
                    addressList: function () {
                        var params = {
                            producerIdx: $("#hdProducerIdx").val()
                        };

                        Server.ajax("/producer/addressInfoList", params, function (respone, status, xhr) {
                            if (respone.value == 0) {
                                var list = respone.addressInfoList;

                                for (var i = 0; i < list.length; i++) {
                                    page.fn.addAddress(list[i]);
                                }
                            } else {
                                errorBox("Error Code : " + respone.value);
                            }
                        }, "post", false);
                    },
                    addAddress: function (item) {
                        var checkbox = "";

                        if (item[7] == "1")
                            checkbox = '<label class="checkbox-wrap"><input type="checkbox" checked onclick="return false" ><i class="check-icon-green"></i></label>';

                        var address = '<li class="bb-1 pb10" name="address" id="' + item[0] + '" style="cursor:pointer">'
                                    + '    <span class="txt-color5">' + item[8] + '</span>'
                                    + '    <div class="ui-grid-a">'
                                    + '        <div class="ui-block-a wpc90">'
                                    + '            ' + item[3] + ' ' + item[4] + ' '
                                    + '            ' + item[5] + ' (' + item[2] + ')'
                                    + '        </div>'
                                    + '        <div class="ui-block-b wpc10" style="text-align:center">'
                                    + '            ' + checkbox
                                    + '        </div>'
                                    + '    </div>'
                                    + '</li>';

                        $('#addressList').append(address);
                    }
                }
            };

            $(document).on('ready', function () {
                page.init();
                page.fn.addressList();
            });
        })();
    </script>
</body>
</html>