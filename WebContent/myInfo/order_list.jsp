<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Poppy-Poppy</title>
    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="../share/assets/ico/favicon.png" />
    <link rel="apple-touch-icon-precomposed" href="../share/assets/ico/apple-touch-icon-144-precomposed.png" />
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="../share/assets/css/bootstrap.min.css" />
    <!-- 플러그인 CSS 참조 -->
    <link rel="stylesheet" type="text/css" href="../share/plugins/datepicker/datepicker.min.css">
    <!-- 나눔고딕 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="../share/assets/css/nanumfont.css" />
    <link rel="stylesheet" type="text/css" href="../share/tmpl.css" />
    <!-- 반응형 웹을 지원하지 않을 경우 -->
    <!-- <link rel="stylesheet" href="assets/css/non-responsive.css" /> -->
    <!-- IE8 이하 버전 지원 -->
    <!--[if lt IE 9]>
        <script type="text/javascript" src="assets/js/html5shiv.js"></script>
        <script type="text/javascript" src="assets/js/respond.min.js"></script>
        <![endif]-->
    <!-- IE10 반응형 웹 버그 보완 -->
    <!--[if gt IE 9]>
        <link rel="stylesheet" type="text/css" href="assets/css/ie10.css" />
        <script type="text/javascript" src="assets/js/ie10.js"></script>
        <![endif]-->
    <style type="text/css">
    .header {
        z-index: 1004;
    }

    .content>.container {
        width: 96%;
        margin: auto;
        z-index: 104;
    }

    .nav-tabs>li>a {
        margin-top: 20px;
        margin-right: 0;
        font-weight: bold;

    }

    .backg {
        margin-top: 1px;
        height: 94px;
        background-color: #ffc7c1;
    }

    .dateSearch {
        padding-bottom: 10px;
        background: #ffc7c1;
    }

    .backg .container {
        padding-top: 10px;
    }

    .backg select {
        padding-left: 5px;
    }

    .backg .status {
        width: 86%;
    }

    .backg .period {
        padding-top: 10px;
    }

    .form-control {
        font-size: 12px;
    }

    .col-xs-1 {
        padding: 0;
        padding-top: 5px;
        margin: 0 1.5%;
        text-align: center;
        color: #fff;
        font-weight: bold;
    }

    .col-xs-2 {
        padding: 0;
        margin-right: 1.5%;
    }

    .col-xs-3 {
        padding: 0;
    }

    .col-xs-6 {
        padding: 0;
    }

    .period .btn {
        border: 1px solid #ff8f83;
        font-size: 12px;
        width: 16%;
        height: 30px
    }

    .btn:hover {
        background-color: #FF6261;
        border: 1px solid #FF6261;
        color: #fff;
    }

    .btn-default.active {
        background-color: #FF6261;
        color: #fff;
    }

    .dateSearch input {
        width: 22%;
        border: 1px solid #ff8f83;
        font-size: 12px;
    }

    .dateSearch button {
        margin-left: 5px;
        height: 30px;
        line-height: 3px;
    }

    /** 주문상세보기 시작 */
    .view {
        font-size: 12px;
        width: 100%;
        height: 42px;
        margin-top: 15px;
        background-color: #FF6261;
        border-left: 1px solid #FF6261;
        border-right: 1px solid #FF6261;
        text-align: left;
        padding: 10px 15px;
    }

    .view span {
        color: #fff;
        vertical-align: -2px;
    }

    .view .date {
        font-weight: bold;
    }

    .view .number a {
        color: #fff;
    }

    .view .btn-detail {
        color: #fff;
        float: right;
    }

    .view #GGuc {
        font-weight: bold;
        float: right;
    }

    /** 주문상세보기 끝 */

    /** 주문상품내역 시작 */
    .prd-info .prd-box {
        display: flex;
        padding-top: 20px;
        padding-left: 15px;
    }

    .prd-box .prd-content {
        margin-left: 10px;
    }

    .prd-content .prd-name a {
        color: #000;
    }

    .prd-content .prd-li {
        margin-top: 10px;
    }

    .prd-content li {
        list-style: none;
    }

    .prd-content .option {
        padding: 0;
    }

    .prd-info p {
        padding-top: 10px;
        padding-left: 15px;
    }

    .prd-info .prd-foot {
        font-weight: bold;
        background-color: #ffc7c1;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 15px;
        border-top: 1px solid #ffc7c1;
        border-bottom: 1px solid #ffc7c1;
    }

    hr {
        margin: 5px 0;
    }

    .ready {
        color: #fff;
        font-weight: bold;
    }

    /** 주문상품내역 끝 */
    .paging {
        text-align: center;
        margin-bottom: 50px;
    }

    .paging .disabled {
        position: relative;
        right: 10px;
    }

    .paging .paging-right {
        position: relative;
        left: 10px;
    }

    .pagination>.active>span {
        background-color: #ffc7c1;
        border-color: #ffc7c1;
    }

    .pagination>.disabled>a {
        color: #ffc7c1;
    }

    .pagination>li>a {
        color: #ffc7c1;
    }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <a href="../index.html" id="logo">
                <img src="../share/img/logojpg.jpg">
            </a>
            <a href="../pay/cart.html">
                <span class="glyphicon glyphicon-shopping-cart" id="cart">
                    <h1>장바구니</h1>
                </span>
                <span class="badge">
                    <p>11</p>
                </span>
            </a>
            <hr>
            <ul class="category">
                <a href="#">
                    <li>BEST</li>
                </a>
                <a href="#">
                    <li>NEW</li>
                </a>
                <a href="#">
                    <li>푸드</li>
                </a>
                <a href="#">
                    <li>의류</li>
                </a>
                <a href="#">
                    <li>외출용품</li>
                </a>
                <a href="#">
                    <li>홈리빙</li>
                </a>
                <a href="#">
                    <li>대형견</li>
                </a>
                <a href="#">
                    <li>타임세일</li>
                </a>
                <a href="#">
                    <li>유통임박</li>
                </a>
            </ul>
            <hr>
        </div>
        <div class="content">
            <!-- 주문조회 -->
            <div class="page-title clearfix">
                <h4><b>
                        <a href="#" onclick="history.back(); return false;"><i class="glyphicon glyphicon-chevron-left"></i></a>주문조회
                    </b></h4>
            </div>
            <div class="container">
                <ul class="nav nav-tabs">
                    <li class="active col-xs-6 etc"><a href="order_list.html">주문조회</a></li>
                    <li class="col-xs-6 etc"><a href="cancel_list.html">취소/교환/반품내역</a></li>
                </ul>
                <div class="backg">
                    <div class="container">
                        <p class="col-xs-1">상태</p>
                        <select class="form-control status">
                            <option>전체 주문처리상태</option>
                            <option>입금전</option>
                            <option>배송준비중</option>
                            <option>배송중</option>
                            <option>배송완료</option>
                            <option>취소</option>
                            <option>교환</option>
                            <option>반품</option>
                        </select>
                        <div class="period">
                            <p class="col-xs-1">기간</p>
                            <button class="btn btn-default col-xs-2" onclick="set_term(0)">오늘</button>
                            <button class="btn btn-default col-xs-2" onclick="set_term(30)">1개월</button>
                            <button class="btn btn-default col-xs-2" onclick="set_term(90)">3개월</button>
                            <button class="btn btn-default col-xs-2" onclick="set_term(180)">6개월</button>
                            <button class="btn btn-default col-xs-3" id="period_set">기간설정</button>
                        </div>
                    </div>
                </div>
                <div class="dateSearch">
                    <div class="col-xs-1"></div>
                    <input type="text" id="datepicker_before" />&nbsp;~
                    <input type="text" id="datepicker_after" />
                    <button type="button" class="btn">조회</button>
                </div>
                <div class="view">
                    <span class="date" title="주문일자">
                        2020-03-18
                    </span>
                    <span class="number" title="주문번호">
                        <a href="order_desc.html">
                            (20200318-0000195)
                        </a>
                    </span>
                    <a href="order_desc.html" class="btn-detail"><span id="GGuc">&#62;</span>상세보기</a>
                </div>
                <div class="prd-info">
                    <div class="prd-box">
                        <div class="thumbnail">
                            <a href="../gallery/goods.html">
                                <img src="../share/img/slide.jpg" width="70" height="70">
                            </a>
                        </div>
                        <div class="prd-content">
                            <strong class="prd-name" title="상품명">
                                <a href="../gallery/goods.html">펫클럽 세나개 고부해 사은품 증정</a>
                            </strong>
                            <ul class="prd-li">
                                <li>
                                    <span class="price" title="판매가">
                                        <strong>14,000</strong>원
                                    </span>
                                    <span class="prd-count" title="수량">
                                        <strong>1</strong>개
                                    </span>
                                </li>
                            </ul>
                            <p class="option">[옵션: 세나개 고부해]</p>
                        </div>
                    </div>
                    <hr>
                    <div class="prd-foot" title="주문처리상태">
                        <div class="ready">상품준비중</div>
                    </div>
                </div>
                <div class=" paging">
                    <ul class="pagination pagination-sm">
                        <li class="disabled"><a href="#">&laquo;</a></li>
                        <!-- 활성화 버튼은 아래의 구조로 구성하시면 됩니다. sr-only는 스크린리더 전용입니다. -->
                        <li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
                        <li class="paging-right"><a href="#">&raquo;</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer">
                <!-- 하단 네비게이션 고정-->
                <!--- 소개 4인방 링크 -->
                <hr />
                <div class="etc">
                    <a href="../etc/page_info1.html">회사소개</a>
                    <a href="../etc/page_info2.html">이용약관</a>
                    <a href="../etc/page_info3.html">개인정보취급방침</a>
                    <a href="../etc/page_info4.html">이용안내</a>
                </div>
                <hr />
                <div class="row">
                    <div class="col-xs-6 etc">
                        <h5><b>상담센터</b></h5>
                        <p style="font-size: 15px; font-weight:bold;">070-123-4567</p>
                        <p style="font-size: 12px"> 운영시간 : 10:00 - 18:00<br />주말, 공휴일은 후뮤입니다.</p>
                    </div>
                    <div class="col-xs-6 etc">
                        <h5><b>입금계좌안내</b></h5>
                        <br />
                        <p>하나 355-342432-23445<br>예금주 : (주)뽀삐뽀삐</p>
                    </div>
                </div>
                <address class="clearfix">
                    <p>상점명: (주)뽀삐뽀삐 대표 : 아무개
                        <br>주소 : 서울특별시 행복구 존버동 8282-5959 102호 - 물류팀<br>
                        사업자등록번호 : 123-86-43567<br>
                        통신판매업신고 : 제2020-서울서초-0082호<br>
                        개인정보관리책임 : 아무개 <br>
                        <br />
                        COPYRIGHT&copy; (주)뽀삐뽀삐 ALL RIGHTS RESERVED
                        <br />
                        <i>DESIGN BY EZEN-team4</i>
                    </p>
                </address>
                <div class="navbar" id="navbarback">
                    <ul class="btmbar-nav clearfix navbar-fixed-bottom">
                        <hr />
                        <a href="../community/photo_rv.html">
                            <span class="glyphicon glyphicon-comment">
                                <p>커뮤니티</p>
                            </span>
                        </a>
                        <a href="../myInfo/order_list.html">
                            <span class="glyphicon glyphicon-list-alt">
                                <p>주문조회</p>
                            </span>
                        </a>
                        <a href="#">
                            <span class="glyphicon glyphicon-search">
                                <p>&nbsp;검색&nbsp;</p>
                            </span>
                        </a>
                        <a href="#">
                            <span class="glyphicon glyphicon-th-large">
                                <p>카테고리</p>
                            </span>
                        </a>
                        <a href="../myinfo/myinfo.html">
                            <span class="glyphicon glyphicon-user">
                                <p>MY정보</p>
                            </span>
                        </a>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Javascript -->
        <script src="../share/assets/js/jquery-3.2.1.min.js"></script>
        <script src="../share/assets/js/bootstrap.min.js"></script>
        <!-- 플러그인 JS 참조 -->
        <script src="../share/plugins/datepicker/datepicker.min.js"></script>
        <script src="../share/plugins/datepicker/datepicker.ko-KR.js"></script>
        <!-- 사용자 정의 스크립트 -->
        <script type="text/javascript">
        function set_term(days) {
            days = days * 24 * 60 * 60 * 1000;

            var date = new Date();
            var yy = date.getFullYear();
            var mm = date.getMonth() + 1;
            var dd = date.getDate();

            var setday = date.getTime() - days;
            date.setTime(setday);

            var s_yy = date.getFullYear();
            var s_mm = date.getMonth() + 1;
            var s_dd = date.getDate();
            alert(s_yy + "년 " + s_mm + "월 " + s_dd + "일 " + "~" + yy + "년 " + mm + "월 " + dd + "일" + "의 주문조회 결과");
        }

        $(function() {
            $(".dateSearch").hide();
            $("#period_set").click(function() {
                $(".dateSearch").toggle();
            });

            $("#datepicker_before").datepicker({
                // 날짜 선택후 사동 숨김 (true/false)
                autoHide: true,
                // 날짜 형식
                format: "yyyy-mm-dd",
                // 언어
                language: "ko-KR",
                // 시작요일 (0=일요일~6=토요일)
                weekStart: 0
            });

            $("#datepicker_after").datepicker({
                // 날짜 선택후 사동 숨김 (true/false)
                autoHide: true,
                // 날짜 형식
                format: "yyyy-mm-dd",
                // 언어
                language: "ko-KR",
                // 시작요일 (0=일요일~6=토요일)
                weekStart: 0
            });
        });
        </script>
</body>

</html>