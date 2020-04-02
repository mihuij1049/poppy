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
    <style type="text/css">
    /** 아코디언 클릭이벤트시 화살표 transform 회전 */
    .rotate1 {
        -webkit-transform: rotate(180deg);

    }

    .icon-rotate1 {
        -webkit-transition-duration: 0.5s;
    }

    .rotate2 {
        -webkit-transform: rotate(180deg);

    }

    .icon-rotate2 {
        -webkit-transition-duration: 0.5s;
    }

    .rotate3 {
        -webkit-transform: rotate(180deg);

    }

    .icon-rotate3 {
        -webkit-transition-duration: 0.5s;
    }

    .rotate4 {
        -webkit-transform: rotate(180deg);

    }

    .icon-rotate4 {
        -webkit-transition-duration: 0.5s;
    }

    .rotate5 {
        -webkit-transform: rotate(180deg);

    }

    .icon-rotate5 {
        -webkit-transition-duration: 0.5s;
    }

    .rotate6 {
        -webkit-transform: rotate(180deg);

    }

    .icon-rotate6 {
        -webkit-transition-duration: 0.5s;
    }

    #accordion {
        width: 96%;
        margin: auto;
        margin-top: 20px;
        margin-bottom: 50px;
    }

    #accordion .panel-heading {
        padding: 0px;
    }

    .order-info {
        width: 100%;
        line-height: 20px;
    }

    .info-title {
        width: 30%;
        font-weight: bold;
    }

    .info-desc1 {
        width: 70%;
    }

    .info-desc2 {
        width: 70%;
        text-align: right;
    }

    .prd-img {
        width: 30%;
    }

    .prd {
        width: 70%;
    }

    .prd-foot {
        text-align: right;
    }

    .refund-title {
        background-color: #ffc7c1;
        font-size: 16px;
        padding: 7px 7px;
    }

    .info-title1 {
        width: 75%;
        padding-top: 5px;
        padding-left: 50px;
        line-height: 30px;
    }

    .info-title2 {
        width: 25%;
        padding-top: 5px;
        text-align: center;
        line-height: 30px;
    }

    .goods-info {
        width: 75%;
    }

    p.prd-name {
        margin: 5px 0px;
        font-weight: bold;

    }

    .goods-qty {
        font-size: 20px;
        text-align: center;
        width: 25%;
        margin-top: 15px;
    }

    .refund-date {
        width: 70%;
        text-align: center;
        margin-bottom: 5px;
    }

    .refund-price {
        width: 70%;
        text-align: center;
        margin-bottom: 5px;
    }

    .price-pre {
        width: 70%;
        text-align: center;
    }

    .panel-heading a {
        display: block;
        text-decoration: none;
        width: 100%;
        padding: 10px 15px;
    }

    .panel-order {
        padding: 15px;
    }

    /** 아코디언 클릭이벤트시 화살표 transform 회전 끝 */
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
                            <a href="#" onclick="history.back(); return false;"><i class="glyphicon glyphicon-chevron-left"></i></a>주문내역 상세조회
                        </b></h4>
                </div>
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default panel-desc">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <b>주문정보</b>
                                    <img src="../share/img/arrow-down.png" align=right class="arrow-down1 icon-rotate1">
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body panel-order">
                                <div class="order-info clearfix">
                                    <div class="info-title pull-left">주문번호</div>
                                    <div class="info-desc1 order-num pull-left">20200318-0000195</div>
                                    <div class="info-title pull-left">주문일자</div>
                                    <div class="info-desc1 order-date pull-left">2020-03-18 21:07:17</div>
                                    <div class="info-title pull-left">주문고객</div>
                                    <div class="info-desc1 order-name pull-left">조대철</div>
                                    <div class="info-title pull-left">주문처리상태</div>
                                    <div class="info-desc1 order-state pull-left">취소</div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end panelOne -->
                    <div class="panel panel-default panel-desc">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                    <b>주문상품 (총 1개/ 0원)</b>
                                    <img src="../share/img/arrow-down.png" align=right class="arrow-down2 icon-rotate2">
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body panel-order">
                                <div class="prd-info clearfix">
                                    <div class="prd-img pull-left">
                                        <a href="#">
                                            <img src="../share/img/slide.jpg" width="80" height="80">
                                        </a>
                                    </div>
                                    <div class="prd pull-left">
                                        <div id="prd-title">
                                            <strong class="prd-name" title="상품명">
                                                <a href="#">펫클럽 벨버드 토일렛/애견토일렛/강아지화장실/패드</a>
                                            </strong>
                                        </div>
                                        <div class="prd-li">
                                            <div>
                                                <span class="prd-price" title="판매가">
                                                    <b id="prd-price-total">6,900</b>원
                                                </span>
                                                <span class="prd-count" title="수량">
                                                    <strong>1</strong>개
                                                </span>
                                                <br>
                                                <span class="prd-deli">
                                                    <span>[조건]/기본배송</span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="prd-foot" title="합계">
                                        <span id="prd-total">합계</span>
                                        &nbsp;
                                        <b id="prd-price-total">
                                            6,900
                                        </b>원
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end panelTwo -->
                    <div class="panel panel-default panel-desc">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                                    <b>결제 정보</b>
                                    <img src="../share/img/arrow-down.png" align=right class="arrow-down3 icon-rotate3">
                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body panel-order">
                                <div class="order-info">
                                    <div class="info-title pull-left">결제수단</div>
                                    <div class="info-desc2 payment-method pull-left">신용카드</div>
                                    <div class="info-title pull-left pull-left">총 결제금액</div>
                                    <div class="info-desc2 price-all pull-left">5,400원</div>
                                    <div class="info-title pull-left">총 주문금액</div>
                                    <div class="info-desc2 price-order pull-left">0원</div>
                                    <div class="info-title pull-left">총 할인금액</div>
                                    <div class="info-desc2 price-disc pull-left">0원</div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end panelThree -->
                    <div class="panel panel-default panel-desc">
                        <div class="panel-heading" role="tab" id="headingFour">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
                                    <b>최종 결제 정보</b>
                                    <img src="../share/img/arrow-down.png" align=right class="arrow-down4 icon-rotate4">
                                </a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                            <div class="panel-body panel-order">
                                <div class="order-info clearfix">
                                    <div class="info-title pull-left">총 결제금액</div>
                                    <div class="info-desc2 price-all pull-left">0원</div>
                                    <div class="info-title pull-left">상품구매금액</div>
                                    <div class="info-desc2 price-good pull-left">0원</div>
                                    <div class="info-title pull-left">배송비</div>
                                    <div class="info-desc2 price-delivery pull-left">0원</div>
                                    <div class="info-title pull-left">결제예정금액</div>
                                    <div class="info-desc2 pull-left">0원</div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end panelFour -->
                    <div class="panel panel-default panel-desc">
                        <div class="panel-heading" role="tab" id="headingFive">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
                                    <b>배송지 정보</b>
                                    <img src="../share/img/arrow-down.png" align=right class="arrow-down5 icon-rotate5">
                                </a>
                            </h4>
                        </div>
                        <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                            <div class="panel-body panel-order">
                                <div class="order-info clearfix">
                                    <div class="info-title pull-left">받는사람</div>
                                    <div class="info-desc1 price-all pull-left">조대철</div>
                                    <div class="info-title pull-left">우편번호</div>
                                    <div class="info-desc1 price-good pull-left">05218</div>
                                    <div class="info-title pull-left">주소</div>
                                    <div class="info-desc1 price-delivery pull-left">서울특별시 행복구 존버동 8282-5959 이젠아파트 3층 302호</div>
                                    <div class="info-title pull-left">일반전화</div>
                                    <div class="info-desc1 pull-left">02-777-5959</div>
                                    <div class="info-title pull-left">휴대전화</div>
                                    <div class="info-desc1 pull-left">010-8282-2-5959</div>
                                    <div class="info-title pull-left">배송메시지</div>
                                    <div class="info-desc1 pull-left">부재시 경비실로!</div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end panelFive -->
                    <div class="panel panel-default panel-desc">
                        <div class="panel-heading" role="tab" id="headingSix">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="true" aria-controls="collapseSix">
                                    <b>환불 정보</b>
                                    <img src="../share/img/arrow-down.png" align=right class="arrow-down6 icon-rotate6">
                                </a>
                            </h4>
                        </div>
                        <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
                            <div class="panel-body panel-order">
                                <div class="order-info clreafix">
                                    <div class="refund-title" colspan="2">취소 상품</div>
                                    <div class="info-title1 pull-left">상품정보</div>
                                    <div class="info-title2 pull-left">수량</div>
                                    <div class="goods-info pull-left">
                                        <p class="prd-name">펫클럽 알파독 칼슘 덴탈껌간식/강아지간식/치석제거</p>
                                        <p class="prd-option">[옵션: 알파독칼슘밀크덴탈껌]</p>
                                    </div>
                                    <div class="goods-qty pull-left">1</div>
                                    <div class="info-title pull-left">&nbsp;환불일자<br>(처리상태)</div>
                                    <div class="refund-date pull-left">2020-03-19 10:26:35<br><b>(환불완료)</b></div>
                                    <div class="info-title pull-left">&nbsp;환불금액</div>
                                    <div class="refund-price pull-left">상품금액 2,900+2,500(배송비) = 합계 : <b class="price-all">5,400원</b></div>
                                    <div class="info-title pull-left">&nbsp;환불수단</div>
                                    <div class="price-pre pull-left">신용카드</div>
                                    </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </div> <!-- end panelSix -->
                    </div>
                </div> <!-- end container -->
            </div> <!-- end content -->
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
                                            <button type="button" onclick="location.href='../member/agree_0.html'" class="btn btn1">회원가입</button>
                                            <button type="button" onclick="location.href='../member/login.html'" class="btn btn1">로그인</button>
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
        <script type="text/javascript">
        /** 검색탭 영역 시작! */
        $(function() {
            $(".collapse").collapse({ toggle: false })
        });

        $(".click-searchtab").click(function() {
            $(".container").toggleClass("searchtab-open");
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
        $(function() {
            $("#headingOne").on('click', function() {
                $(".arrow-down1").toggleClass("rotate1");

            });
        });

        $(function() {
            $("#headingTwo").on('click', function() {
                $(".arrow-down2").toggleClass("rotate2");

            });
        });

        $(function() {
            $("#headingThree").on('click', function() {
                $(".arrow-down3").toggleClass("rotate3");

            });
        });

        $(function() {
            $("#headingFour").on('click', function() {
                $(".arrow-down4").toggleClass("rotate4");

            });
        });
        $(function() {
            $("#headingFive").on('click', function() {
                $(".arrow-down5").toggleClass("rotate5");

            });
        });
        $(function() {
            $("#headingSix").on('click', function() {
                $(".arrow-down6").toggleClass("rotate6");

            });
        });
        /** 검색탭 영역 끝! */
        </script>
</body>

</html>