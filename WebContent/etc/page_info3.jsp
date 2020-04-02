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
    .agree {
        border: 1px solid #ffc7c1;
        width: 96%;
        margin: auto;
        margin-top: 20px;
        margin-bottom: 50px;
        font-size: 12px;
        padding: 15px 8px;
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
                            <a href="#" onclick="history.back(); return false;"><i class="glyphicon glyphicon-chevron-left"></i></a>개인정보취급방침
                        </b></h4>
                </div>
                <div class="agree">
                    <p>** 본 양식은 쇼핑몰 운영에 도움을 드리고자 샘플로 제공되는 서식으로 쇼핑몰 운영형태에 따른 수정이 필요합니다. 쇼핑몰에 적용하시기 전, 쇼핑몰 운영 사항 등을 확인하시고 적절한 내용을 반영하여 사용하시기 바랍니다. **</p>
                    <p>(주)○○○은 (이하 "회사"는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.<br>회사는 개인정보처리방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
                    <p>■ 수집하는 개인정보 항목 및 수집방법<br>가. 수집하는 개인정보의 항목<br>o&nbsp;회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br>- 회원가입시 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보<br>- 서비스 신청시 : 주소, 결제 정보</p>
                    <p>o&nbsp;서비스 이용 과정이나 사업 처리 과정에서 서비스이용기록, 접속로그, 쿠키, 접속 IP, 결제 기록, 불량이용 기록이 생성되어 수집될 수 있습니다. </p>
                    <p>나. 수집방법<br>- 홈페이지, 서면양식, 게시판, 이메일, 이벤트 응모, 배송요청, 전화, 팩스, 생성 정보 수집 툴을 통한 수집</p>
                    <p>■ 개인정보의 수집 및 이용목적<br>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>o&nbsp;서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<br>콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스<br>o&nbsp;회원 관리<br>회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달<br>o&nbsp;마케팅 및 광고에 활용<br>이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계</p>
                    <p>■ 개인정보의 보유 및 이용기간<br>원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</p>
                    <p>가. 회사 내부방침에 의한 정보보유 사유<br>&nbsp;회원이 탈퇴한 경우에도 불량회원의 부정한 이용의 재발을 방지, 분쟁해결 및 수사기관의 요청에 따른 협조를 위하여, 이용계약 해지일로부터 oo년간 회원의 정보를 보유할 수 있습니다. </p>
                    <p>나. 관련 법령에 의한 정보 보유 사유 <br>전자상거래등에서의소비자보호에관한법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.<br>o&nbsp;계약 또는 청약철회 등에 관한 기록<br>-보존이유 : 전자상거래등에서의소비자보호에관한법률<br>-보존기간 : 5년<br>o&nbsp;대금 결제 및 재화 등의 공급에 관한 기록<br>-보존이유: 전자상거래등에서의소비자보호에관한법률<br>-보존기간 : 5년 <br>o&nbsp;소비자 불만 또는 분쟁처리에 관한 기록<br>-보존이유 : 전자상거래등에서의소비자보호에관한법률<br>-보존기간 : 3년 <br>o&nbsp;로그 기록 <br>-보존이유: 통신비밀보호법<br>-보존기간 : 3개월</p>
                    <p>■ 개인정보의 파기절차 및 방법<br>회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.<br>o&nbsp;파기절차<br>회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.<br>별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.<br>o&nbsp;파기방법<br>전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</p>
                    <p>■ 개인정보 제공<br>회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.<br>o&nbsp;이용자들이 사전에 동의한 경우<br>o&nbsp;법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</p>
                    <p>■ 수집한 개인정보의 위탁<br>회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다.<br>o&nbsp;위탁 대상자 : [택배사 이름]<br>o&nbsp;위탁업무 내용 : [택배사 위탁 내용]</p>
                    <p>o&nbsp;위탁 대상자 : [PG사 이름]<br>o&nbsp;위탁업무 내용 : [PG사 위탁 내용]</p>
                    <p>o&nbsp;위탁 대상자 : <a href="/protected/supply/list.jsp" target="_blank" onclick="javascript:window.open(this.href, &quot;&quot;, &quot;width=550, height=650, scrollbars=no, resizable=yes&quot;); return false;">공급업체 목록보기</a><br>o&nbsp;위탁업무 내용 : [위탁업무 내용]</p>
                    <p><br>■ 이용자 및 법정대리인의 권리와 그 행사방법<br>o&nbsp;이용자는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.<br>o&nbsp;이용자들의 개인정보 조회,수정을 위해서는 "개인정보변경"(또는 "회원정보수정" 등)을 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.<br>o&nbsp;혹은 개인정보보호책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.<br>o&nbsp;귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.<br>o&nbsp;회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 "회사가 수집하는 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</p>
                    <p>■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항<br>회사는 귀하의 정보를 수시로 저장하고 찾아내는 "쿠키(cookie)" 등을 운용합니다. 쿠키란 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다.<br>회사은(는) 다음과 같은 목적을 위해 쿠키를 사용합니다.<br>o&nbsp;쿠키 등 사용 목적<br>1.&nbsp;회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공<br>2.&nbsp;귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.<br>o&nbsp;쿠키 설정 거부 방법<br>1.&nbsp;쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.<br>2.&nbsp;설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 &gt; 인터넷 옵션 &gt; 개인정보<br>3.&nbsp;단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.</p>
                    <p>■ 개인정보에 관한 민원서비스<br>회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보보호책임자를 지정하고 있습니다.<br>o&nbsp;개인정보보호담당자 <br>성명 : OOO<br>소속 : OOO<br>전화번호 : OO-OOO-OOOO<br>이메일 : </p>
                    <p>o&nbsp;개인정보보호책임자 <br>성명 : OOO<br>소속 : OOO<br>전화번호 : OO-OOO-OOOO<br>이메일 : </p>
                    <p>o&nbsp;귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보보호책임자 혹은 담당부서로 신고하실 수 있습니다.<br>o&nbsp;회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.<br>o&nbsp;기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br>개인정보침해신고센터 (privacy.kisa.or.kr / 국번 없이 118)<br>개인정보분쟁조정위원회 (kopico.go.kr / 1833-6972)<br>대검찰청 사이버수사과 (spo.go.kr / 지역번호+1301)<br>경찰청 사이버안전국 (cyberbureau.police.go.kr / 국번없이 182)<br></p>
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