<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
    <!-- 나눔고딕 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="../share/assets/css/nanumfont.css" />
    <link rel="stylesheet" type="text/css" href="../share/tmpl.css" />
    <!-- 반응형 웹을 지원하지 않을 경우 -->
    <!-- <link rel="stylesheet" href="../share/assets/css/non-responsive.css" /> -->
    <!-- IE8 이하 버전 지원 -->
    <!--[if lt IE 9]>
        <script type="text/javascript" src="../share/assets/js/html5shiv.js"></script>
        <script type="text/javascript" src="../share/assets/js/respond.min.js"></script>
        <![endif]-->
    <!-- IE10 반응형 웹 버그 보완 -->
    <!--[if gt IE 9]>
        <link rel="stylesheet" type="text/css" href="../share/assets/css/ie10.css" />
        <script type="text/javascript" src="../share/assets/js/ie10.js"></script>
        <![endif]-->
    <style type="text/css">
    .message {
        border-top: 1px solid #ff6261;
        border-bottom: 1px solid #ff6261;
        border-radius: 5px;
        background: #ff6261;
        width: 96%;
        height: 150px;
        text-align: center;
        margin: auto;
        margin-top: 20px;
        color: white;
    }

    .info {
        border: 1px solid #ffc1c7;
        width: 96%;
        margin: auto;
        margin-top: 15px;
        margin-bottom: 15px;
        padding-top: 25px;
        padding-bottom: 25px;
        padding-left: 25px;
        line-height: 35px;
        border-radius: 5px;
    }

    .message .send-msg {
        padding-top: 25px;
        line-height: 30px;
        font-size: 20px;

    }

    .info-name {
        padding-left: 30px;
        margin-bottom: 20px;
        font-size: 18px;
        letter-spacing: 2px;
    }

    .info-email {
        padding-left: 25px;
        font-size: 18px;
        letter-spacing: 1px;

    }

    .id {
        border: 1px solid #ffc1c7;
        width: 96%;
        height: 50px;
        margin: auto;
        margin-bottom: 15px;
        padding-left: 25px;
        padding-top: 10px;
        border-top: none;
    }

    .btns {
        text-align: center;
        margin-bottom: 50px;
    }

    .btn1 {
        width: 90%;
        height: 40px;

    }

    .btn1:hover {
        font-weight: bold;
        font-size: 15px;
        color: #fff;
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
            <!-- 여기에 작성 -->
            <div class="container">
                <div class="page-title clearfix">
                    <h4><b>
                            <a href="#" onclick="history.back(); return false;"><i class="glyphicon glyphicon-chevron-left"></i></a>비밀번호 찾기 완료
                        </b></h4>
                </div>
                <div class="message">
                    <p class="send-msg">임시 비밀번호가<br /><br />
                        <b>고객님이 메일로 전송되었습니다.</b></p>
                </div>
                <div class="info">
                    <b>아이디</b><span class="info-name">bbobikim</span><br>
                    <b>이메일</b><span class="info-email">abc123@naver.com</span>
                </div>
            </div>
            <div class="btns">
                <button type="button" class="btn btn1" onclick="location.href='login.html'">지금 로그인 하러 가기</button>
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
                    <p style="font-size: 18px; font-weight:bold;">070-123-4567</p>
                    <p style="font-size: 12px"> 운영시간 : 오전 10:00 - 오후 6:00<br />주말, 공휴일은 후뮤입니다.</p>
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
                    <a href="#">
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
</body>

</html>