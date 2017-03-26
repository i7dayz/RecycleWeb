var storeUrl = "https://wapi.gift-n.net";

function getStoreErrMsg(errCode) {
    var msg = "";

    switch (errCode) {
        case "P001":
            msg = "파라미터 오류";
            break;
        case "P002":
            msg = "핸드폰 번호가 올바르지 않습니다. ";
            break;
        case "P003":
            msg = "허용 가능 개수를 초과하였습니다. ";
            break;
        case "P101":
            msg = "이미 존재하는 거래번호입니다. ";
            break;
        case "P102":
            msg = "존재하지 않는 거래번호입니다. ";
            break;
        case "P103":
            msg = "존재하지 않는 사용처 거래번호입니다. ";
            break;
        case "P201":
            msg = "지원하지 않는 기능입니다. ";
            break;
        case "P301":
            msg = "재전송 횟수를 초과하였습니다. ";
            break;
        case "A001":
            msg = "가맹점 인증 오류입니다. ";
            break;
        case "A101":
            msg = "사용 가능한 상품이 아닙니다 ";
            break;
        case "E101":
            msg = "EPIN 가져오기 실패 ";
            break;
        case "E102":
            msg = "EPIN 취소 실패 ";
            break;
        case "E103":
            msg = "EPIN 상태 조회 실패 ";
            break;
        case "E201":
            msg = "이미 사용된 EPIN 입니다. ";
            break;
        case "E301":
            msg = "EPIN 승인 실패 ";
            break;
        case "E302":
            msg = "EPIN 사용 실패 ";
            break;
        case "E304":
            msg = "EPIN 취소 실패(이미 취소 된 거래 건) ";
            break;
        case "E305":
            msg = "EPIN 취소 실패(취소 할 거래 건이 없음) ";
            break;
        case "E311":
            msg = "EPIN 생성실패 ";
            break;
        case "E312":
            msg = "EPIN 생성실패 ";
            break;
        case "E401":
            msg = "EPIN 가져오기 실패(공급처) ";
            break;
        case "S001":
            msg = "시스템 오류 ";
            break;
        case "S002":
            msg = "등록되지 않은 IP입니다 ";
            break; 
    }

    return msg;
}

// 모바일쿠폰 핀번호 발권
function getEpin(cid, goods_id, enc, co_tid, mdn, reserved) {
    var params = {
        cid: cid, // 사용처 아이디
        goods_id: goods_id, // 상품 아이디
        enc: enc, // 사용처 인증키, 사용처 아이디, 사용처 거래번호
        count: "1",
        co_tid: co_tid, // 사용처 거래번호
        mdn: mdn, // 선택, 전화번호
        reserved: reserved // 선택, 임의사용
    }

    Server.ajax("/GetEpin", params, function (response, status, xhr) {
        if (response.rstCode == 0) {
            // 성공
            // "rstCode":"0", 
            // "rstMsg":"", 
            // "epin":"405868134802", 
            // "exdate":"2014-12-31", 
            // "order_id":"BU4S12R1604001", 
            // "reserved":"" 
        } else {
            // 실패
            // "rstCode":"A101", 
            // "rstMsg":"사용가능한 상품이 아닙니다.", 
            // "epin":"", 
            // "exdate":"", 
            // "order_id":"", 
            // "reserved":"" 
            errorBox("[" + response.rstCode + "] " + response.rstMsg);
        }
    }, "get", false);
}

// 모바일쿠폰 핀번호 취소
function cancelEpin(cid, enc, order_id) {
    var params = {
        cid: cid, // 사용처 아이디
        enc: enc, // 사용처 인증키, 사용처 아이디, 기프트엔 거래번호
        order_id: order_id, // 기프트엔 거래번호
    }

    Server.ajax("/CancelEpin", params, function (response, status, xhr) {
        if (response.rstCode == 0) {
            // 성공
            // "rstCode":"0", 
            // "rstMsg":""
        } else {
            // 실패
            // "rstCode":"E102:P002", 
            // "rstMsg":"EPin 취소 실패 : 존재하지 않는 거래번호입니다."
            errorBox("[" + response.rstCode + "] " + response.rstMsg);
        }
    }, "get", false);
}

// 모바일쿠폰 핀상태 조회
function statusEpin(cid, enc, order_id) {
    var params = {
        cid: cid, // 사용처 아이디
        enc: enc, // 사용처 인증키, 사용처 아이디, 기프트엔 거래번호
        order_id: order_id, // 기프트엔 거래번호
    }

    Server.ajax("/StatusEpin", params, function (response, status, xhr) {
        if (response.rstCode == 0) {
            // 성공
            // "rstCode":"0", 
            // "rstMsg":"", 
            // "use":"N", Y사용 N미사용 C취소
            // "use_date":"", 
            // "branchname":"" 
        } else {
            // 실패
            // "rstCode":"E103 : P002", 
            // "rstMsg":"EPin 상태 조회 실패 : 존재하지 않는 거래번호입니다.", 
            // "use":"", 
            // "use_date":"", 
            // "branchname":"" 
            errorBox("[" + response.rstCode + "] " + response.rstMsg);
        }
    }, "get", false);
}

// 모바일쿠폰 상품목록
function getGoodsInfoList(cid, brand_id, enc) {
    var params = {
        cid: cid, // 사용처 아이디
        brand_id: brand_id, // 브랜드 코드
        enc: enc, // 사용처 인증키, 사용처 아이디, 브랜드 코드
    }

    Server.ajax("/getGoodsInfoList", params, function (response, status, xhr) {
        if (response.rstCode == 0) {
            // 성공
            // [
            // { 
            //     "GOODS_ID": "0000000582", 
            //     "GOODS_NAME": "[GS25] 모바일상품권 1만원", 
            //     "BRAND_NAME": "GS25상품권", 
            //     "PRICE": "10000", 
            //     "IMG_URL": "http://image.gift-n.net/goods/0000000582_1.jpg", 
            //     "STATUS": "Y" 
            // },  
            // { 
            //     "GOODS_ID": "0000000583", 
            //     "GOODS_NAME": "[GS25] 모바일상품권 2만원", 
            //     "BRAND_NAME": "GS25상품권", 
            //     "PRICE": "20000", 
            //     "IMG_URL": "http://image.gift-n.net/goods/0000000583_1.jpg", 
            //     "STATUS": "Y" 
            // }
            // ]
        } else {
            // 실패
            // "STATUS":"E" 
            errorBox("[" + response.rstCode + "] " + response.rstMsg);
        }
    }, "get", false);
}

// 모바일쿠폰 상품정보
function getGoodsInfo(cid, goods_id, enc) {
    var params = {
        cid: cid, // 사용처 아이디
        goods_id: goods_id, // 상품 코드
        enc: enc, // 사용처 인증키, 사용처 아이디, 상품코드
    }

    Server.ajax("/getGoodsInfo", params, function (response, status, xhr) {
        if (response.rstCode == 0) {
            // 성공
            // "GOODS_ID":"", // 상품 코드 
            // "GOODS_NAME":"", // 상품명
            // "BRAND_ID":"", // 브랜드 코드
            // "BRAND_NAME":"", // 브랜드명
            // "PRICE ":"", // 시장가
            // "SPRICE ":"", // 납품가
            // "IMG_URL ":"", // 상품이미지URL
            // "EXDATE ":"", // 만료일자 Format) 00 or 0000-00-00 
            // "GOODS_MEMO ":"", // 상품 주의사항 : 상품 주의사항 값이 있는 경우는 브랜드 주의사항 미사용
            // "BRAND_NAME":"", // 브랜드 주의사항 : 상품 주의사항 값이 없는 경우는 브랜드 주의사항 사용 
            // "STATUS":"" // Y : 사용가능, N : 사용불가, E : 미 존재 상품, I : IP제한, C : 인증실패 
        } else {
            // 실패
            // "STATUS":"E" 
            errorBox("[" + response.rstCode + "] " + response.rstMsg);
        }
    }, "get", false);
}

// 모바일쿠폰 브랜드 이미지
function getBrandImage(cid, brand_id) {
    var params = {
        cid: cid, // 사용처 아이디
        brand_id: brand_id, // 브랜드 코드
    }

    Server.ajax("/getBrandImage", params, function (response, status, xhr) {
        if (response.rstCode == 0) {
            // 성공
            // "BRAND_NAME":"GS칼텍스", 
            // "IMG_URL ":"http://image.gift-n.net/brand/80.jpg", 
            // "STATUS":"Y" // Y : 사용가능, N : 사용불가, E : 미 존재 브랜드, I : IP제한 
        } else {
            // 실패
            // "STATUS":"E" 
            errorBox("[" + response.rstCode + "] " + response.rstMsg);
        }
    }, "get", false);
}

// 모바일쿠폰 거래번호 조회
function statusEpinByTid(cid, enc, co_tid) {
    var params = {
        cid: cid, // 사용처 아이디
        enc: enc, // 사용처 인증키 + 사용처 아이디 + 사용처 거래번호 
        co_tid: co_tid, // 사용처 거래번호
    }

    Server.ajax("/StatusEpinByTid", params, function (response, status, xhr) {
        if (response.rstCode == 0) {
            // 성공
            // "rstCode":"0", 
            // "rstMsg":"", 
            // "order_id":"BU4S12R1604001" // 기프트엔 거래번호
        } else {
            // 실패
            // "rstCode":"P103", 
            // "rstMsg":"거래번호 조회 실패 : 존재하지 않는 사용처 거래번호 입니다.", 
            // "order_id":"" 
            errorBox("[" + response.rstCode + "] " + response.rstMsg);
        }
    }, "get", false);
}

