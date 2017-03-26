<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TermsAndPolicies.aspx.cs" Inherits="RecycleWeb.Support.TermsAndPolicies" %>

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
    
    <style>
        #terms, #policy {
            width: 99%;
            height: auto !important;
            overflow-y: scroll;
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            font-size: 13px;
            padding: 5px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            margin-top: 10px;
        }
        .title {
            font-weight: bold;
        }
    </style>
</head>
<body class="all" contenteditable="false">
    <div class="wrap" id="wrap">
        <!-- #header -->
        <div class="header" id="header">
            <div class="colgroup fixed">
                <div class="ci use-search-reset">
                        <a href="javascript:;" class="back-btn">
                        <em class="img-menu ci-logo"><img src="../img/back-btn.png" style="width:8px; height:12px; margin:6px;" alt=""></em>                              
                    </a>
                    <span>약관 및 정책 </span>
                </div>
            </div>
        </div>
        <!-- //#header -->
        <!-- #container -->
        <div class="container" id="container" style="background-color:#fff !important">
            <div class="colgroup">
                <div class="content fixed" id="content">
                    <div class="main ui-content">
                        <div class="mb15">
                            <label class="title">서비스 이용약관</label>
                            <textarea id="terms" rows="12" readonly="readonly"></textarea>
                        </div>

                        <div class="mb15">
                            <label class="title">개인정보 수집 및 이용 정책</label>
                            <textarea id="policy" rows="12" readonly="readonly"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="../script/extention/jquery.js"></script>
        
    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    $.ajax({
                        url: "../terms.txt",
                        dataType: "text",
                        success: function (data) {
                            $("#terms").text(data);
                        }
                    });

                    $.ajax({
                        url: "../policies.txt",
                        dataType: "text",
                        success: function (data) {
                            $("#policy").text(data);
                        }
                    });
                },
                initEvent: function () {
                    $(document).on('click', '.back-btn', function () {
                        window.history.back();
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