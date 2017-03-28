// ********************************************************
// ************************ prototype ************************
// ********************************************************

var serverUrl = "http://geno47.cafe24.com:8080";

String.prototype.format = function () {
    var str = this;

    for (var i = 0; i < arguments.length; i++) {
        var regExp = new RegExp('\\{' + i + '\\}', 'gm');

        if (arguments[i] == null) {
            str = str.replace(regExp, '');
        } else {
            str = str.replace(regExp, arguments[i]);
        }
    }

    return str;
};

String.prototype.lPad = function (totalLength, padStr) {
    var str = this;

    while (str.length < totalLength) {
        str = padStr + str;
    }

    return str;
};

String.prototype.rPad = function (totalLength, padStr) {
    var str = this;

    while (str.length < totalLength) {
        str = str + padStr;
    }

    return str;
};

Number.prototype.lPad = function (totalLength, padStr) {
    return this.toString().lPad(totalLength, padStr);
};

Number.prototype.rPad = function (totalLength, padStr) {
    return this.toString().rPad(totalLength, padStr);
};

Date.prototype.format = function (f) {
    if (!this.valueOf()) return " ";

    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;

    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function ($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return d.getFullYear() % 1000;
            case "MM": return (d.getMonth() + 1).lPad(2, '0');
            case "dd": return d.getDate().lPad(2, '0');
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().lPad(2, '0');
            case "hh": return ((h = d.getHours() % 12) ? h : 12).lPad(2, '0');
            case "mm": return d.getMinutes().lPad(2, '0');
            case "ss": return d.getSeconds().lPad(2, '0');
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};





// ********************************************************
// ************************ 클래스 ************************
// ********************************************************

var Server = function () {
    return {
        defaultUrl: function () {
            return serverUrl;
        },
        ajax: function (_url, _params, _func, _type, _async) {
            if (_url == undefined || _func == undefined) {
                return;
            }

            if ($.isEmptyObject(_params)) {
                _params = null;
            } else {
                _params = JSON.stringify(_params)
            }

            if (_type == undefined || _type == null) {
                _type = "post";
            }

            if (_async == undefined || _async == null) {
                _async = true;
            }

            $.ajax({
                url: this.defaultUrl() + _url,
                data: _params,
                type: _type,
                async: _async,
                crossDomain: true,
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                timeout: 10000,
                beforeSend: function (xhr, settings) {
                    if (_async == true) {
                        $.mobile.loading("show");
                    }
                },
                complete: function (xhr, status) {
                    if (_async == true) {
                        $.mobile.loading("hide");
                    }
                },
            }).done(_func).fail(function (xhr, status, error) {
                alert(JSON.stringify(xhr));
                if (xhr.status == 0) {
                    //navigator.notification.alert("서버가 응답이 없습니다.\r\n네트워크 연결이 되었는지 확인하시고 계속 발생시 관리자에게 문의 하시기 바랍니다.", null, '알림', '확인');
                    errorBox("서버가 응답이 없습니다.\r\n네트워크 연결이 되었는지 확인하시고 계속 발생시 관리자에게 문의 하시기 바랍니다.");
                } else if (xhr.status == 500) {
                    //navigator.notification.alert("서버에 오류가 발생 하였습니다.\r\n관리자에게 문의 하시기 바랍니다.", null, '알림', '확인');
                    errorBox("서버에 오류가 발생 하였습니다.\r\n관리자에게 문의 하시기 바랍니다.");
                } else {
                    //navigator.notification.alert(error, null, '알림', '확인');
                    errorBox(error);
                }
            });
        },
    };
}();

//var Dialog = function () {
//    var _PopupLoader = function () {
//        var _source = '';
//        _source += '<div data-role="popup" data-dismissible="false" class="HRX-dialog">';
//        _source += '    <div data-role="header">';
//        _source += '        <h1>{{title}}</h1>';
//        _source += '    </div>';
//        _source += '    <div role="main" class="ui-content">';
//        _source += '        {{#> partial}}{{/partial}}';
//        _source += '    </div>';
//        _source += '    <div class="HRX-footer HRX-text-right">';
//        _source += '        {{#buttonLabels}}';
//        _source += '            <a href="#" id="button_{{@key}}" class="ui-btn ui-btn-inline" data-rel="back">{{this}}</a>';
//        _source += '        {{/buttonLabels}}';
//        _source += '    </div>';
//        _source += '</div>';

//        var _options = {
//            title: undefined,
//            content: undefined,
//            buttonLabels: [],
//            callback: undefined
//        };

//        var _template = Handlebars.compile(_source);

//        var _popup;

//        function initComponent() {
//            $.mobile.activePage.find(".ui-popup").each(function (idx, item) {
//                $(this).popup("close");
//            });

//            Handlebars.registerPartial('partial', _options.content);

//            _popup = $(_template(_options));
//            _popup.children('[data-role="header"]').toolbar();
//            _popup.find(".ui-content input").textinput();
//            _popup.find('[data-role="listview"]').listview();
//            _popup.appendTo($.mobile.activePage).popup();
//        };

//        function initEvent() {
//            _popup.on({
//                popupbeforeposition: function () {
//                    var width = $(window).width();

//                    $(this).css({ "width": width * 0.9, "max-width": 600 });
//                    $(this).find(".ui-content").css("max-height", width);
//                },
//                popupafterclose: function () {
//                    $(this).remove();
//                },
//            });

//            if (typeof (_options.callback) == "function") {
//                _popup.find(".HRX-footer .ui-btn").each(function (idx, item) {
//                    $(this).on("click", function (e) {
//                        _options.callback.call(this, idx)
//                    });
//                })
//            }
//        }

//        return {
//            onLoad: function (options) {
//                _options = options;

//                initComponent();
//                initEvent();

//                setTimeout(function () {
//                    _popup.popup("open");
//                }, 100);
//            }
//        };
//    }();

//    return {
//        Alert: function (message, callback) {
//            var options = {
//                title: "안내",
//                content: "<pre>{0}</pre>".format(message),
//                buttonLabels: ["닫기"],
//                callback: callback
//            };

//            setTimeout(function () {
//                _PopupLoader.onLoad(options)
//            }, 100);
//        },
//        Confirm: function (message, callback) {
//            var options = {
//                title: "안내",
//                content: "<pre>{0}</pre>".format(message),
//                buttonLabels: ["아니요", "예"],
//                callback: callback
//            };

//            setTimeout(function () {
//                _PopupLoader.onLoad(options)
//            }, 100);
//        },
//        Custom: function (title, content, buttonLabels, callback) {
//            var options = {
//                title: title,
//                content: content,
//                buttonLabels: buttonLabels,
//                callback: callback
//            };

//            setTimeout(function () {
//                _PopupLoader.onLoad(options)
//            }, 100);
//        }
//    }
//}();

function fillSelect(url, params, async, selector, firstItems, selectedValue) {
    selector.empty();

    if (firstItems != null && firstItems != undefined) {
        for (var i = 0; i < firstItems.length; i) {
            if (selectedValue == firstItems[i]) {
                selector.append('<option value="{0}" selected="selected">{1}</option>'.format(firstItems[i], firstItems[i + 1]));
            } else {
                selector.append('<option value="{0}">{1}</option>'.format(firstItems[i], firstItems[i + 1]));
            }

            i = i + 2;
        }
    }

    selector.selectmenu("refresh");

    Server.ajax(url, params, function (respone, status, xhr) {
        if (respone.d == '' || respone.d == undefined) {
            return;
        }

        for (var i = 0 in respone.d) {
            var data = respone.d[i];
            if (selectedValue == data.Code) {
                selector.append('<option value="{0}" selected="selected">{1}</option>'.format(data.Code, data.Value));
            } else {
                selector.append('<option value="{0}">{1}</option>'.format(data.Code, data.Value));
            }
        }

        selector.selectmenu("refresh");
    }, "post", async);
}





// ********************************************************
// ************************ 함수 ************************
// ********************************************************

function isLoading() {
    return $("html").hasClass("ui-loading");
};

function initEvent($page) {
    $page.find(".ui-content").scroll(function () {
        var $this = $(this);

        if (isLoading() == false && $this.scrollTop() > 0 && $this[0].scrollHeight - $this.scrollTop() - 10 < $this.outerHeight()) {
            $this.trigger("scrollBottom");
        }
    });
}

function contentAutoHeight($page) {
    var $header = $page.find(".ui-header");
    var $footer = $page.find(".ui-footer");
    var $content = $page.find(".ui-content");

    var bodyHeight = $("body").height();
    var headerHeight = $header.outerHeight() == null ? 0 : $header.outerHeight();
    var footerHeight = $footer.outerHeight() == null ? 0 : $footer.outerHeight();

    $page.find(".ui-content").outerHeight(bodyHeight - headerHeight - footerHeight);
}

function getUrlParameter() {
    var ret = {};

    var index = location.href.indexOf("?");

    if (index > -1) {
        var params = location.href.substring(index + 1).split("&");

        for (var i = 0 in params) {
            var param = params[i].split("=");
            ret[param[0]] = decodeURI(param[1]);
        }

    }

    return ret;
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}




// ********************************************************
// ************************ 초기화 ************************
// ********************************************************

//Handlebars.registerHelper('ifExpr', function (v1, operator, v2, options) {
//    switch (operator) {
//        case '==':
//            return (v1 == v2) ? options.fn(this) : options.inverse(this);
//        case '!=':
//            return (v1 != v2) ? options.fn(this) : options.inverse(this);
//        case '<':
//            return (v1 < v2) ? options.fn(this) : options.inverse(this);
//        case '<=':
//            return (v1 <= v2) ? options.fn(this) : options.inverse(this);
//        case '>':
//            return (v1 > v2) ? options.fn(this) : options.inverse(this);
//        case '>=':
//            return (v1 >= v2) ? options.fn(this) : options.inverse(this);
//        case '&&':
//            return (v1 && v2) ? options.fn(this) : options.inverse(this);
//        case '||':
//            return (v1 || v2) ? options.fn(this) : options.inverse(this);
//        default:
//            return options.inverse(this);
//    }
//});

//$.mobile.loader.prototype.defaultHtml = '' +
//    '<div style="width:100%;height:100%;left:0;top:0;margin:0;background:rgba(0, 0, 0, 0.3);">' +
//    '   <div class="ui-loader ui-corner-all ui-body-a ui-loader-default">' +
//    '       <span class="ui-icon ui-icon-loading"></span>' +
//    '   </div>' +
//    '</div>';

function alertBox(txt, callbackMethod, jsonData){
    modal({
        type: 'alert',
        title: '알림',
        text: txt,
        callback: function(result){
            if(callbackMethod){
                callbackMethod(jsonData);
            }
        }
    });
}
 
function alertBoxFocus(txt, obj){
    modal({
        type: 'alert',
        title: '알림',
        text: txt,
        callback: function(result){
            obj.focus();
        }
    });
}
 
    
function confirmBox(txt, callbackMethod, jsonData){
    modal({
        type: 'confirm',
        title: '알림',
        text: txt,
        callback: function(result) {
            if(result){
                callbackMethod(jsonData);
            }
        }
    });
}
 
function promptBox(txt, callbackMethod, jsonData){
    modal({
        type: 'prompt',
        title: 'Prompt',
        text: txt,
        callback: function(result) {
            if(result){
                callbackMethod(jsonData);
            }
        }
    });
}
 
function successBox(txt){
    modal({
        type: 'success',
        title: 'Success',
        text: txt
    });
}
 
function warningBox(txt){
    modal({
        type: 'warning',
        title: 'Warning',
        text: txt,
        center: false
    });
}
 
function infoBox(txt){
    modal({
        type: 'info',
        title: 'Info',
        text: txt,
        //autoclose: true
    });
}

function infoBoxWithCallback(txt, callbackMethod, jsonData) {
    modal({
        type: 'info',
        title: 'Info',
        text: txt,
        //autoclose: true,
        callback: function (result) {
            if (result) {
                callbackMethod(jsonData);
            }
        }
    });
}

function errorBox(txt){
    modal({
        type: 'error',
        title: 'Error',
        text: txt
    });
}

function errorBoxWithCallback(txt, callbackMethod, jsonData) {
    modal({
        type: 'error',
        title: 'Error',
        text: txt,
        callback: function (result) {
            if (result) {
                callbackMethod(jsonData);
            }
        }
    });
}
 
function invertedBox(txt){
    modal({
        type: 'inverted',
        title: 'Inverted',
        text: txt
    });
}
 
function primaryBox(txt){
    modal({
        type: 'primary',
        title: 'Primary',
        text: txt
    });
}

function getErrMsg(errCode) {
    var msg = "";

    switch (errCode) {
        case "0":
            msg = "처리가 정상적으로 완료되었습니다.";
            break;
        case "1":
            msg = "이미 가입된 아이디입니다.";
            break;
        case "2":
            msg = "잘못된 추천인 코드를 입력하셨습니다.";
            break;
        case "3":
            msg = "이미 존재하는 닉네임입니다.";
            break;
        case "11":
            msg = "가입되지 않은 아이디입니다.";
            break;
        case "12":
            msg = "탈퇴한 회원입니다.";
            break;
        case "21":
            msg = "이미 가입된 아이디입니다.";
            break;
        case "22":
            msg = "가입 신청 중인 아이디입니다.";
            break;
        case "31":
            msg = "비밀번호가 일치하지 않습니다.";
            break;
        case "41":
            msg = "이미 가입된 아이디입니다.";
            break;
        case "51":
            msg = "잘못된 아이디입니다.";
            break;
        case "52":
            msg = "비밀번호가 일치하지 않습니다.";
            break;
        case "61":
            msg = "비밀번호가 일치하지 않습니다.";
            break;
        case "71":
            msg = "이미 가입된 아이디입니다.";
            break;
        case "72":
            msg = "일일 친구 초대 제한 수 초과하였습니다.";
            break;
        case "73":
            msg = "친구 초대 쿨타임 제한중입니다.";
            break;
        case "81":
            msg = "중복 회수되었습니다.";
            break;
        case "82":
            msg = "수거자 포인트가 부족합니다.";
            break;
        case "91":
            msg = "가입 미승인 아이디입니다.";
            break;
        case "92":
            msg = "탈퇴된 아이디입니다.";
            break;
        case "93":
            msg = "가입 불가 아이디입니다.";
            break;
        case "94":
            msg = "비밀번호가 일치하지 않습니다.";
            break;
        case "101":
            msg = "잘못된 배출 정보입니다.";
            break;
        case "111":
            msg = "포인트가 부족합니다.";
            break;
        case "121":
            msg = "포인트가 부족합니다.";
            break;
        case "131":
            msg = "정상 가입된 아이디가 아닙니다.";
            break;
        case "132":
            msg = "비밀번호가 일치하지 않습니다.";
            break;
        case "141":
            msg = "최대 등록 배송지 초과하였습니다.";
            break;
        case "151":
            msg = "등록되지 않은 주소입니다.";
            break;
        case "161":
            msg = "잘못된 추천인 닉네임을 입력하셨습니다.";
            break;
        case "162":
            msg = "이미 추천인을 등록한 계정입니다.";
            break;
        case "163":
            msg = "자기 자신을 추천할 수 없습니다.";
            break;
        case "200":
            msg = "이미 배출 신청 중입니다.";
            break;
        case "9999":
            msg = "기타 오류가 발생하였습니다.<br/>관리자에게 문의하세요.";
            break;
    }

    return msg;
}