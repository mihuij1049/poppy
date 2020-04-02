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
.rotate1 {
	-webkit-transform: rotate(180deg);
}

.icon-rotate1 {
	-webkit-transition-duration: 1s;
}

.col-xs-6 {
	padding: 0;
	margin-top: 20px;
}

.content .container {
	width: 96%;
	margin: auto;
}

.panel-heading a {
	padding: 10px 8px;
	display: block;
	text-decoration: none;
}

.panel-heading {
	padding: 0;
}

.panel-title {
	border-left: 1px solid #FF6261;
	border-right: 1px solid #FF6261;
	background-color: #FF6261;
	height: 42px;
	color: #fff;
	font-weight: bold;
	font-size: 14px;
}

.panel-header {
	padding: 10px 8px;
	font-size: 16px;
	background: #ffc7c1;
	color: #fff;
	font-size: 14px;
	font-weight: bold;
}

.panel-body {
	padding: 0;
	border: 1px solid #ffc7c1;
}

.panel.panel-default {
	border-bottom: none;
	margin: 0;
}

.mygoods {
	padding-top: 20px;
}

.mygoods:hover {
	cursor: pointer;
}

.chkbox {
	float: left;
	padding-left: 10px;
}

.cart-size {
	width: 17px;
	height: 17px;
}

#all_check {
	width: 66.64px;
	height: 24px;
}

.mygoods a {
	display: block;
	float: left;
	margin: 5px;
	height: auto;
	padding-left: 5px;
}

.word a {
	padding: 0;
	margin: 0;
	color: #000;
	float: left;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	width: 62%;
}

.word>b {
	overflow: hidden;
	text-overflow: ellipsis;
}

.btn {
	border-color: #ff8f83;
}

.word-btn {
	padding-left: 120px;
}

.cart-img {
	width: 80px;
	border: 1px solid #ffc7c1;
}

.summ {
	text-align: right;
	padding-bottom: 10px;
}

.word span {
	border: 1px solid #FFD9FA;
	background-color: #FFD9FA;
}

.count {
	padding: 0;
	border: none;
}

.count-label {
	width: 20%;
	height: 28px;
	vertical-align: -0.5px;
}

.word-btn #change {
	vertical-align: -0.5px;
	height: 28px;
}

.word-btn #change2 {
	vertical-align: -0.5px;
	height: 28px;
}

.summ {
	text-align: left;
	padding-bottom: 10px;
}

.right-btn {
	float: right;
	position: relative;
	bottom: 8px;
}

.btn:hover {
	background-color: #FF6261;
	color: #fff;
}

.selectbtn {
	border-bottom: 1px solid #ffc7c1;
	width: auto;
	padding: 16px 30px;
}

.cart-move {
	padding: 16px 30px;
}

.table {
	margin: auto;
	margin-bottom: 15px;
}

.table thead {
	border-left: 1px solid #FF6261;
	border-right: 1px solid #FF6261;
	background-color: #FF6261;
	color: #fff;
	font-weight: bold;
}

.table-header {
	border-left: 1px solid #ff6261;
}

.table-header2 {
	border-right: 1px solid #ff6261;
}

tr {
	border: 1px solid #ffc7c1;
}

td {
	border-bottom: 1px solid #ffc7c1;
}

.td-mny {
	text-align: right;
}

.pay {
	margin: auto;
}

.pay .btn {
	padding: 10px 15px;
	width: 49%;
	margin-bottom: 50px;
}

.pay a {
	text-decoration: none;
}

button {
	background: #fff;
	border: 1px solid #777;
}

#myModal {
	padding-top: 50%;
}

.modal-footer .btn {
	width: 65px;
	height: 34px;
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
							class="glyphicon glyphicon-chevron-left"></i></a>장바구니
					</b>
				</h4>
			</div>
			<div class="container">
				<!-- 탭 버튼 구성 -->
				<ul class="nav nav-tabs" id="mytab">
					<li class="active col-xs-6 etc"><a href="#page1"
						data-toggle="tab">국내배송상품</a></li>
					<li class="col-xs-6 etc"><a href="#page2" data-toggle="tab">해외배송상품</a></li>
				</ul>
				<!-- 탭 페이지 구성 -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active fade in" id="page1">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="accordion-toggle" data-toggle="collapse"
										data-parent="#accordion" href="#collapseOne">장바구니 상품 <img
										src="../share/img/arrow-down.png" align=right
										class="arrow-down1 icon-rotate1"></a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in">
								<div class="panel-header clearfix">일반상품 (n)</div>
								<div class="panel-body">
									<div class="mycart">
										<div class="mygoods clearfix">
											<span class="chkbox"><input type="checkbox"
												class="cart cart-size"></span> <a
												href=" ../gallery/goods.html"> <img
												src="../share/img/4_M.jpg" class="cart-img"></a>
											<div class="word">
												<b><a href="../gallery/goods.html">펫클럽 데이스포 케어츄르
														15kg*4개입/츄르간식</a></b><br> <small>배송:2500원[조건]/기본배송</small><br>
												<small><span>적</span>40원</small><br> <b>3,500원</b> <br>
												<br>
												<div class="word-btn">
													<button class="count" id="minus">
														<img src="../share/img/마이너스.png">
													</button>
													<input type="number" class="count-label" value="1"
														id="count-label">
													<button class="count" id="plus">
														<img src="../share/img/플러스.png">
													</button>
													<button type="button" id="change">변경</button>
												</div>
											</div>
										</div>
										<div class="selectbtn">
											<div class=summ>
												<b class="summ">합계:</b> <b class="summ" id="price"></b> <b
													class="summ">원</b>
											</div>
											<button type="button" id="delete">삭제</button>
											<button type="button" id="like">관심상품</button>
											<button type="button" class="btn right-btn"
												onclick="location.href='orderform.html'">주문하기</button>
										</div>
									</div>
									<div class="panel-header clearfix">[기본배송]</div>
									<div class="selectbtn">
										<button type="button" id="all-check">전체선택</button>
										<button type="button" id="select-delete">선택삭제</button>
									</div>
									<div class="cart-move">
										<button type="button" class="btn" id="cart-move">해외장바구니로
											이동</button>
									</div>
								</div>
							</div>
						</div>
						<table class="table table-responsive">
							<thead>
								<tr>
									<td class="table-header">결제예정금액</td>
									<td class="table-header2 td-mny"><span id="table-sum">
									</span>원</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="td-title">총 상품금액</td>
									<td class="td-mny"><span id="table-price"> </span>원</td>
								</tr>
								<tr>
									<td class="td-title">총 배송비</td>
									<td class="td-mny"><span id="table-delivery"> </span>원</td>
								</tr>
							</tbody>
						</table>
						<div class="pay">
							<button class="btn btn-inverse"
								onclick="location.href='orderform.html'">선택상품주문</button>
							<button class="btn" onclick="location.href='orderform.html'">
								전체상품주문</button>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="page2">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="accordion-toggle" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo">장바구니 상품 <img
										src="../share/img/arrow-down.png" align=right
										class="arrow-down1 icon-rotate1"></a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse in">
								<div class="panel-header clearfix">일반상품 (n)</div>
								<div class="panel-body">
									<div class="mycart">
										<div class="mygoods clearfix">
											<span class="chkbox"><input type="checkbox"
												class="cart2 cart-size"></span> <a href="#"><img
												src="../share/img/4_M.jpg" class="cart-img"></a>
											<div class="word">
												<b><a href="../gallery/goods.html">펫클럽 데이스포 케어츄르
														15kg*4개입/츄르간식</a></b><br> <small>배송:2500원[조건]/기본배송</small><br>
												<small><span>적</span>40원</small><br> <b>3,500원</b> <br>
												<br>
												<div class="word-btn">
													<button class="count" id="minus2">
														<img src="../share/img/마이너스.png">
													</button>
													<input type="number" class="count-label" value="1"
														id="count-label2">
													<button class="count" id="plus2">
														<img src="../share/img/플러스.png">
													</button>
													<button type="button" id="change2">변경</button>
												</div>
											</div>
										</div>
										<div class="selectbtn">
											<div class=summ>
												<b class="summ">합계:</b> <b class="summ" id="price2"></b> <b
													class="summ">원</b>
											</div>
											<button type="button" id="delete2">삭제</button>
											<button type="button" id="like2">관심상품</button>
											<button type="button" class="btn right-btn"
												onclick="location.href='orderform.html'">주문하기</button>
										</div>
									</div>
									<div class="panel-header clearfix">[기본배송]</div>
									<div class="selectbtn">
										<button type="button" id="all-check2">전체선택</button>
										<button type="button" id="select-delete2">선택삭제</button>
									</div>
									<div class="cart-move">
										<button type="button" class="btn" id="cart-move2">국내장바구니로
											이동</button>
									</div>
								</div>
							</div>
						</div>
						<table class="table table-responsive">
							<thead>
								<tr>
									<td class="table-header">결제예정금액</td>
									<td class="table-header2 td-mny"><span id="table-sum2">
									</span>원</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="td-title">총 상품금액</td>
									<td class="td-mny"><span id="table-price2"> </span>원</td>
								</tr>
								<tr>
									<td class="td-title">총 배송비</td>
									<td class="td-mny"><span id="table-delivery2"> </span>원</td>
								</tr>
							</tbody>
						</table>
						<div class="pay">
							<button class="btn btn-inverse"
								onclick="location.href='orderform.html'">선택상품주문</button>
							<button class="btn" onclick="location.href='orderform.html'">
								전체상품주문</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">상품 삭제</h4>
					</div>
					<div class="modal-body">
						<p>선택하신 상품을 정말 삭제하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn" data-dismiss="modal">예</button>
						<button type="button" class="btn" data-dismiss="modal">아니오</button>
					</div>
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
		$(function() {
			$(".panel-heading").on('click', function() {
				$(".arrow-down1").toggleClass("rotate1");
			});

			$("#all-check").click(function() {
				var choice = $(".cart").prop("checked");
				if (!choice) {
					$(".cart").prop("checked", true);
				} else {
					$(".cart").prop("checked", false);
				}
			});

			$("#all-check2").click(function() {
				var choice2 = $(".cart2").prop("checked");
				if (!choice2) {
					$(".cart2").prop("checked", true);
				} else {
					$(".cart2").prop("checked", false);
				}
			});

			var counter = 1;
			var counter2 = 1;
			var price = 3500;
			var delivery = 2500;

			$("#price").html(counter * price);
			$("#table-price").html(counter * price);
			$("#table-sum").html((counter * price) + delivery);
			$("#table-delivery").html(delivery);
			$("#price2").html(counter2 * price);
			$("#table-price2").html(counter2 * price);
			$("#table-sum2").html((counter2 * price) + delivery);
			$("#table-delivery2").html(delivery);

			$("#plus").click(function(e) {
				counter++;
				if (counter * price >= 30000) {
					delivery = 0;
				}
				$("#count-label").val(counter);
				$("#price").html(counter * price);
				$("#table-price").html(counter * price);
				$("#table-sum").html((counter * price) + delivery);
				$("#table-delivery").html(delivery);
			});
			$("#plus2").click(function(e) {
				counter2++;
				if (counter2 * price >= 30000) {
					delivery = 0;
				}
				$("#count-label2").val(counter2);
				$("#price2").html(counter2 * price);
				$("#table-price2").html(counter2 * price);
				$("#table-sum2").html((counter2 * price) + delivery);
				$("#table-delivery2").html(delivery);
			});

			$("#minus").click(function(e) {
				if (counter < 2) {
					alert("구매수량은 1미만으로 불가합니다.");
					return;
				}
				counter--;
				if (counter * price >= 30000) {
					delivery = 0;
				}
				if (counter * price < 30000) {
					delivery = 2500;
				}
				$("#count-label").val(counter);
				$("#price").html(counter * price);
				$("#table-price").html(counter * price);
				$("#table-sum").html((counter * price) + delivery);
				$("#table-delivery").html(delivery);
			});
			$("#minus2").click(function(e) {
				if (counter2 < 2) {
					alert("구매수량은 1미만으로 불가합니다.");
					return;
				}
				counter2--;
				if (counter2 * price >= 30000) {
					delivery = 0;
				}
				if (counter2 * price < 30000) {
					delivery = 2500;
				}
				$("#count-label2").val(counter2);
				$("#price2").html(counter2 * price);
				$("#table-price2").html(counter2 * price);
				$("#table-sum2").html((counter2 * price) + delivery);
				$("#table-delivery2").html(delivery);
			});

			$("#change").click(function(e) {
				counter = $("#count-label").val();
				$("#count-label").val(counter);
				if (counter * price >= 30000) {
					delivery = 0;
				}
				if (counter * price < 30000) {
					delivery = 2500;
				}
				$("#price").html(counter * price);
				$("#table-price").html(counter * price);
				$("#table-sum").html((counter * price) + delivery);
				$("#table-delivery").html(delivery);
			});
			$("#change2").click(function(e) {
				counter2 = $("#count-label2").val();
				$("#count-label2").val(counter2);
				if (counter2 * price >= 30000) {
					delivery = 0;
				}
				if (counter2 * price < 30000) {
					delivery = 2500;
				}
				$("#price2").html(counter2 * price);
				$("#table-price2").html(counter2 * price);
				$("#table-sum2").html((counter2 * price) + delivery);
				$("#table-delivery2").html(delivery);
			});

			$("#delete").click(function(e) {
				$("#myModal").modal("show");
			});

			$("#select-delete").click(function(e) {
				$("#myModal").modal("show");
			});

			$("#delete2").click(function(e) {
				$("#myModal").modal("show");
			});

			$("#select-delete2").click(function(e) {
				$("#myModal").modal("show");
			});

			$("#like").click(function(e) {
				alert("해당상품이 관심상품으로 등록되었습니다.")
			})

			$("#like2").click(function(e) {
				alert("해당상품이 관심상품으로 등록되었습니다.")
			})

			$("#cart-move").click(function(e) {
				alert("해외장바구니로 해당 상품이 이동 되었습니다.");
			});

			$("#cart-move2").click(function(e) {
				alert("국내장바구니로 해당 상품이 이동 되었습니다.");
			});
		});
	</script>
</body>

</html>