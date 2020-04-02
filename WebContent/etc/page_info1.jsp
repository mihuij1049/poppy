<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" type="text/css" href="../share/searchtab.css" />
    <link rel="stylesheet" type="text/css" href="../share/menu.css" />
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
    .table {
        width: 96%;
        margin: auto;
        border-top: 1px solid #ffc7c1;
        margin-top: 20px;
        margin-bottom: 50px;
    }

    .table tr {
        line-height: 30px;
        border: 1px solid #ffc7c1;
    }

    .table th {
        width: 35%;
    }

    .table>tbody>tr>th,
    .table>tbody>tr>td {
        border-top: 1px solid #ffc7c1;
        line-height: 30px;
    }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <a href="../index.jsp" id="logo">
                <img src="../share/img/logojpg.jpg">
            </a>
            <a href="../pay/cart.jsp">
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
                            <a href="#" onclick="history.back(); return false;"><i class="glyphicon glyphicon-chevron-left"></i></a>회사소개
                        </b></h4>
                </div>
                <table class="table table-responsive">
                    <tbody>
                        <tr>
                            <th>상점명
                            </th>
                            <td>(주)뽀삐뽀삐
                            </td>
                        </tr>
                        <tr>
                            <th>대표이사
                            </th>
                            <td>아무개
                            </td>
                        </tr>
                        <tr>
                            <th>대표전화
                            </th>
                            <td>070-123-4567
                            </td>
                        </tr>
                        <tr>
                            <th>주소
                            </th>
                            <td>서울특별시 행복구 존버동 8282-5959<br>
                                3층 뽀삐뽀삐 / 반품주소 102호 - 인터넷물류팀
                            </td>
                        </tr>
                        <tr>
                            <th>사업자등록번호
                            </th>
                            <td>123-86-43567
                            </td>
                        </tr>
                        <tr>
                            <th>통신판매업신고
                            </th>
                            <td>제2020-서울서초-0082호
                            </td>
                        </tr>
                        <tr>
                            <th> 개인정보<br>관리책임
                            </th>
                            <td> 아무개
                            </td>
                        </tr>
                        <tr>
                            <th>호스팅제공
                            </th>
                            <td> ITPAPER corp.
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="footer">
            <!-- 하단 네비게이션 고정-->
            <!--- 소개 4인방 링크 -->
            <hr />
            <div class="etc">
                <a href="../etc/page_info1.jsp">회사소개</a>
                <a href="../etc/page_info2.jsp">이용약관</a>
                <a href="../etc/page_info3.jsp">개인정보취급방침</a>
                <a href="../etc/page_info4.jsp">이용안내</a>
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
                    <a href="../community/photo_rv.jsp">
                        <span class="glyphicon glyphicon-comment">
                            <p>커뮤니티</p>
                        </span>
                    </a>
                    <a href="../myInfo/order_list.jsp">
                        <span class="glyphicon glyphicon-list-alt">
                            <p>주문조회</p>
                        </span>
                    </a>
                    <a class="click-searchtab">
                        <span class="glyphicon glyphicon-search">
                            <p>&nbsp;검색&nbsp;</p>
                        </span>
                    </a>
                    <!-- .modal -->
                    <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <!-- .modal-dialog -->
                        <div class="modal-dialog" style="width: 96%; margin: auto;">
                            <!-- .modal-content -->
                            <div class="modal-content clearfix">
                                <!-- 제목 -->
                                <div class="modal-header">
                                    <div class="logo">
                                        <img alt="사진" src="../share/img/logojpg.jpg">
                                    </div>
                                    <!-- 닫기버튼 -->
                                    <div class="button-close">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                    </div>
                                    <div class="buttons">
                                        <button type="button" onclick="location.href='../member/agree_0.jsp'" class="btn btn1">회원가입</button>
                                        <button type="button" onclick="location.href='../member/login.jsp'" class="btn btn1">로그인</button>
                                    </div>
                                </div>
                                <!-- 내용 -->
                                <div class="modal-body">
                                    <div class="kategorie">
                                        <b>카테고리</b>
                                    </div>
                                    <div class="ka-list">
                                        <a href="#">
                                    </div>
                                    <!-- 아코디언 영역 -->
                                    <div class="panel-group clearfix" id="accordion">
                                        <!-- 항목(1) -->
                                        <div class="panel panel-default">
                                            <div class="panel-heading ">
                                                <a class="accordion-toggle clearfix" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                    <h4 class="panel-title"> 신상품
                                                    </h4>
                                                </a>
                                            </div>
                                        </div>
                                        <!-- 항목(2) -->
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                    <h4 class="panel-title"> 인기상품 </h4>
                                                </a>
                                            </div>
                                        </div>
                                        <!-- 항목(3) -->
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a class="accordion-toggle" id="accordion-toggle1" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                    <h4 class="panel-title1"> 푸드<img src="../share/img/arrow-down.png" align=right class="arrow-down1 icon-rotate1"></h4>
                                                </a>
                                            </div>
                                            <div id="collapseThree" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <a href="#">- 사료 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 간식 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 영양제 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 우유 </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 항목(4) -->
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a class="accordion-toggle" id="accordion-toggle2" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                                    <h4 class="panel-title2"> 의류<img src="../share/img/arrow-down.png" align=right class="arrow-down2 icon-rotate2">
                                                    </h4>
                                                </a>
                                            </div>
                                            <div id="collapseFour" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <a href="#">- 아우터 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 티셔츠 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 신발 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 양말 </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 항목(5) -->
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a class="accordion-toggle" id="accordion-toggle3" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                                                    <h4 class="panel-title3"> 외출용품<img src="../share/img/arrow-down.png" align=right class="arrow-down3 icon-rotate3">
                                                    </h4>
                                                </a>
                                            </div>
                                            <div id="collapseFive" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <a href="#">- 목줄/리드줄 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 자동줄 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 이동장 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 배변봉투 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 휴대용식기 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 입마개 </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 항목(6) -->
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a class="accordion-toggle" id="accordion-toggle4" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
                                                    <h4 class="panel-title4"> 대형견코너<img src="../share/img/arrow-down.png" align=right class="arrow-down4 icon-rotate4">
                                                    </h4>
                                                </a>
                                            </div>
                                            <div id="collapseSix" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <a href="#">- 사료,간식 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 목줄/리드줄 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 의류 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 장난감 </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 항목(7) -->
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a class="accordion-toggle" id="accordion-toggle5" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">
                                                    <h4 class="panel-title5"> 홈/리빙<img src="../share/img/arrow-down.png" align=right class="arrow-down5 icon-rotate5">
                                                    </h4>
                                                </a>
                                            </div>
                                            <div id="collapseSeven" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <a href="#">- 방석 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 계단 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 식기 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 하우스/울타리 </a>
                                                </div>
                                                <div class="panel-body">
                                                    <a href="#">- 매트 </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--// 아코디언 영역 -->
                                </div>
                                <!-- 하단 -->
                                <div class="modal-footer">
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                    <!-- 화면 영역 -->
                    <a data-toggle="modal" href="#myModal"><span class="glyphicon glyphicon-th-large">
                            <p>카테고리</p>
                        </span>
                    </a>
                    <!-- 화면 영역 끝 -->
                    <a href="../myInfo/myinfo.jsp">
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
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script type="text/javascript">
    /** 검색탭 영역 시작! */
    $(".click-searchtab").click(function() {
        $(".container").toggleClass("searchtab-open");
    })
    $(function() {
        $(".collapse").collapse({ toggle: false })
    });
    $(function() {
        $("#accordion-toggle1").on('click', function() {
            $(".arrow-down1").toggleClass("rotate1");
            $(".panel-title1").toggleClass("box1, box2");
        });
    });

    $(function() {
        $("#accordion-toggle2").on('click', function() {
            $(".arrow-down2").toggleClass("rotate2");
            $(".panel-title2").toggleClass("box1, box2");
        });
    });

    $(function() {
        $("#accordion-toggle3").on('click', function() {
            $(".arrow-down3").toggleClass("rotate3");
            $(".panel-title3").toggleClass("box1, box2");
        });
    });

    $(function() {
        $("#accordion-toggle4").on('click', function() {
            $(".arrow-down4").toggleClass("rotate4");
            $(".panel-title4").toggleClass("box1, box2");
        });
    });
    $(function() {
        $("#accordion-toggle5").on('click', function() {
            $(".arrow-down5").toggleClass("rotate5");
            $(".panel-title5").toggleClass("box1, box2");
        });
    });
    /** 검색탭 영역 끝! */
    </script>
</body>

</html>