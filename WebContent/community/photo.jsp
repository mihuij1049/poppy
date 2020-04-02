<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
p {
	margin: 0;
}

.content .container {
	margin-top: 20px;
	margin-bottom: 50px;
	width: 96%;
	border: 1px solid #ffc7c1;
	padding: 10px;
}

.big-image {
	border: 1px solid #ffc7c1;
	width: 100%;
}

.info-box {
	padding: 10px 0;
	font-size: 11px;
	border-bottom: 1px solid #ddd;
}

.info-box a {
	color: #333;
}

.info-content {
	display: inline;
	padding-left: 5px;
}

.small-image {
	border: 1px solid #ffc7c1;
	width: 20%;
	float: left;
}

.info-content p {
	display: inline;
	padding-left: 5px;
}

.star {
	padding-top: 5px;
}

.writer {
	padding-top: 10px;
}

.rv-title {
	padding: 10px 0;
	border-bottom: 1px solid #ddd;
}

.rv-content {
	padding: 10px 0;
}

.date {
	color: #aaa;
	font-size: 12px;
	padding-bottom: 10px;
}

.recommend {
	padding: 5px;
	border: 1px dashed #ddd;
	margin-bottom: 30px;
}

.recommend p {
	display: inline;
	padding-right: 10px;
}

.btn:hover {
	background-color: #FF6261;
	color: #fff;
}

.rv-footer {
	padding: 15px 0;
	height: 50px;
	text-align: center;
	color: #fff;
	background: #ffc7c1;
}

.clear:after {
	content: '';
	display: block;
	float: none;
	clear: both;
}
</style>
</head>

<body>
	<div class="container">
		<div class="header">
			<a href="../index.html" id="logo"> <img
				src="../share/img/logojpg.jpg">
			</a> <a href="../pay/cart.html"> <span
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
		</div>
		<div class="content">
			<!-- 여기에 작성 -->
			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>포토리뷰
					</b>
				</h4>
			</div>
			<div class="container">
				<img src="../share/img/img1.jpg" alt="리뷰사진" class="big-image">
				<div class="info-box">
					<a href="../gallery/goods.html"><img src="../share/img/4_M.jpg"
						class="small-image"></a>
					<div class="info-content clear">
						<a href="../gallery/goods.html">펫클럽 데이스포 케어츄르 15gX4개입/고양이츄르간식</a><br>
						<div class="star">
							<p>★★★★★</p>
							<p>(5.0)</p>
							<br>
						</div>
						<div class="writer">
							<p>김****</p>
						</div>
					</div>
				</div>
				<div class="rv-title">
					<p>이 리뷰에 대해 n명의 고객님께서 추천해 주셨습니다.</p>
				</div>
				<div class="rv-content">
					<p class="date">20.01.31</p>
					<p>리뷰내용~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~</p>
				</div>
				<div class="recommend">
					<p>이 리뷰가 도움이 되셨다면 눌러주세요</p>
					<button class="btn">추천</button>
				</div>
				<div class="rv-footer">
					<p>관리자에게만 댓글작성 권한이 있습니다.</p>
				</div>
			</div>
		</div>
		<div class="footer">
			<!-- 하단 네비게이션 고정-->
			<!--- 소개 4인방 링크 -->
			<hr />
			<div class="etc">
				<a href="../etc/page_info1.html">회사소개</a> <a
					href="../etc/page_info2.html">이용약관</a> <a
					href="../etc/page_info3.html">개인정보취급방침</a> <a
					href="../etc/page_info4.html">이용안내</a>
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
					<a href="../community/photo_rv.html"> <span
						class="glyphicon glyphicon-comment">
							<p>커뮤니티</p>
					</span>
					</a>
					<a href="../myInfo/order_list.html"> <span
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
					<a href="../myinfo/myinfo.html"> <span
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
		
	</script>
</body>

</html>