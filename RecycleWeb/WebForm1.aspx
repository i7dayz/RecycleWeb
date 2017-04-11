﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="RecycleWeb.WebForm1" %>


<!-- #include file="./include/header.html" --> 

    <!-- 수거신청 탭 -->
    <div class="container" style="">
        수거신청
    </div> <!-- //수거신청 tab -->
        
    <script type="text/javascript" src="script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script type="text/javascript" src="script/dropdown.min.js"></script>
    <script type="text/javascript" src="script/drawer.min.js"></script>

    <script>
        (function () {
            var page = {
                init: function () {
                    this.initComponent();
                    this.initEvent();
                },
                initComponent: function () {
                    $('.drawer').drawer();
                },
                initEvent: function () {
                    $(document).on('click', '#tabHome', function () {
                        location.href = "Main.aspx";
                    });
                    $(document).on('click', '#tabRequest', function () {
                        location.href = "WebForm1.aspx";
                    });
                    $(document).on('click', '#tabStore', function () {
                        location.href = "WebForm2.aspx";
                    });
                    $(document).on('click', '#tabDonate', function () {
                        location.href = "WebForm3.aspx";
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