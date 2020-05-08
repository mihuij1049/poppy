<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Poppy-Poppy</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../share/assets/ico/favicon.png" />
<link rel="apple-touch-icon-precomposed"
	href="../share/assets/ico/apple-touch-icon-144-precomposed.png" />
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="../share/assets/css/bootstrap.min.css" />
<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css"
	href="../share/assets/css/nanumfont.css" />
<link rel="stylesheet" type="text/css" href="../share/tmpl.css" />
<style type="text/css">
.plist_nota {
	margin-top: 20px;
}

.table {
	width: 95%;
	border: 1px solid #ffc7c1;
	margin: auto;
}

.table thead {
	border-left: 1px solid #ffc7c1;
	border-right: 1px solid #ffc7c1;
	background-color: #ffc7c1;
	color: #fff;
}

.table>thead>tr>th {
	border: 0px;
}

.td-mny {
	text-align: right;
}

#table-content {
	padding-top: 15px;
}

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
	padding-top: 6px;
	padding-bottom: 6px;
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
			<a href="../index.jsp" id="logo"> <img
				src="../share/img/logojpg.jpg">
			</a> <a href="../pay/cart.jsp"> <span
				class="glyphicon glyphicon-shopping-cart" id="cart">
					<h1>장바구니</h1>
			</span> <span class="badge">
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
		</div><div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>미가용 적립내역
				</b>
			</h4>
		</div>
				<div class="pointList">
					<table class="table table-responsive">
						<thead>
							<tr>
								<th id="today"></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td-title">미가용 적립금</td>
								<td class="td-mny">3,000원</td>
							</tr>
							<tr id="table-content">
								<td class="td-title">내용</td>
								<td class="td-mny">적립금</td>
							</tr>
						</tbody>
					</table>
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
					<a href="../etc/page_info1.jsp">회사소개</a> <a
						href="../etc/page_info2.jsp">이용약관</a> <a
						href="../etc/page_info3.jsp">개인정보취급방침</a> <a
						href="../etc/page_info4.jsp">이용안내</a>
				</div>
				<hr />
				<div class="row">
					<div class="col-xs-6 etc">
						<h5>
							<b>상담센터</b>
						</h5>
						<p style="font-size: 15px; font-weight: bold;">070-123-4567</p>
						<p style="font-size: 12px">
							운영시간 : 10:00 - 18:00<br />주말, 공휴일은 후뮤입니다.
						</p>
					</div>
					<div class="col-xs-6 etc">
						<h5>
							<b>입금계좌안내</b>
						</h5>
						<br />
						<p>
							하나 355-342432-23445<br>예금주 : (주)뽀삐뽀삐
						</p>
					</div>
				</div>
				<address class="clearfix">
					<p>
						상점명: (주)뽀삐뽀삐 대표 : 아무개 <br>주소 : 서울특별시 행복구 존버동 8282-5959 102호 -
						물류팀<br> 사업자등록번호 : 123-86-43567<br> 통신판매업신고 :
						제2020-서울서초-0082호<br> 개인정보관리책임 : 아무개 <br> <br />
						COPYRIGHT&copy; (주)뽀삐뽀삐 ALL RIGHTS RESERVED <br /> <i>DESIGN
							BY EZEN-team4</i>
					</p>
				</address>
				<div class="navbar" id="navbarback">
					<ul class="btmbar-nav clearfix navbar-fixed-bottom">
						<hr />
						<a href="../community/photo_rv.jsp"> <span
							class="glyphicon glyphicon-comment">
								<p>커뮤니티</p>
						</span>
						</a>
						<a href="../myInfo/order_list.jsp"> <span
							class="glyphicon glyphicon-list-alt">
								<p>주문조회</p>
						</span>
						</a>
						<a href="#"> <span class="glyphicon glyphicon-search">
								<p>&nbsp;검색&nbsp;</p>
						</span>
						</a>
						<a href="#"> <span class="glyphicon glyphicon-th-large">
								<p>카테고리</p>
						</span>
						</a>
						<a href="../myinfo/myinfo.jsp"> <span
							class="glyphicon glyphicon-user">
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
        // Date 객체의 생성 --> 이 객체 안에는 기본적으로 현재 시각이 저장되어 있다.
        var mydate = new Date(); // 년, 월, 일, 시간, 분, 초를 리턴받기
        var yy = mydate.getFullYear();
        // 월은 0이 11월 11이 12월을 의미한다. 그러므로 1을 증가시켜준다.
        var mm = mydate.getMonth() + 1;
        var dd = mydate.getDate();

        var hh = mydate.getHours();
        var mi = mydate.getMinutes();
        var ss = mydate.getSeconds();
        var result = yy + "-" + mm + "-" + dd;
        document.getElementById("today").innerHTML = result;
        </script>
</body>

</html>