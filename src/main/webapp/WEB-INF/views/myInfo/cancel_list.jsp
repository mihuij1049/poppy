<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../share/head_tp.jsp"%>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Poppy-Poppy</title>
<!-- 플러그인 CSS 참조 -->
<link rel="stylesheet" type="text/css"
	href="../share/plugins/datepicker/datepicker.min.css">
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
	height: 54px;
	background-color: #ffc7c1;
}

.dateSearch {
	padding-bottom: 10px;
	background: #ffc7c1;
}

.backg .container {
	padding-top: 10px;
}

.backg .period {
	padding-top: 3px;
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

.period .btn2 {
	border: 1px solid #ff8f83;
	font-size: 12px;
	width: 16%;
	height: 30px
}

.btn2:hover {
	background-color: #FF6261;
	color: #fff;
}

.btn-default.active {
	background-color: #FF6261;
	border: 1px solid #FF6261;
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
	width: 100%;
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
	display: inline;
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

#cancel {
	float: right;
	position: relative;
	bottom: 10px;
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
	background-color: #777;
	border-color: #777;
}

.pagination>li>a {
	color: #777;
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
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 취소/교환/반품내역 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>취소/교환/반품내역
				</b>
			</h4>
		</div>
		<div class="container">
			<ul class="nav nav-tabs">
				<li class="col-xs-6 etc"><a
					href="${pageContext.request.contextPath}/myInfo/order_list.do">주문조회</a></li>
				<li class="active col-xs-6 etc"><a
					href="${pageContext.request.contextPath}/myInfo/cancel_list.do">취소/교환/반품내역</a></li>
			</ul>
			<div class="backg fade in">
				<div class="container">
					<div class="period">
						<p class="col-xs-1">기간</p>
						<button class="btn btn2 btn-default col-xs-2"
							onclick="set_term(0)">오늘</button>
						<button class="btn btn2 btn-default col-xs-2"
							onclick="set_term(30)">1개월</button>
						<button class="btn btn2 btn-default col-xs-2"
							onclick="set_term(90)">3개월</button>
						<button class="btn btn2 btn-default col-xs-2"
							onclick="set_term(180)">6개월</button>
						<button class="btn btn2 btn-default col-xs-3" id="period_set">기간설정</button>
					</div>
				</div>
			</div>
			<div class="dateSearch">
				<div class="col-xs-1"></div>
				<input type="text" id="datepicker_before" />&nbsp;~ <input
					type="text" id="datepicker_after" />
				<button type="button" class="btn btn2">조회</button>
			</div>
			<div class="view">
				<span class="date" title="주문일자"> 2020-03-18 </span> <span
					class="number" title="주문번호"> <a
					href="${pageContext.request.contextPath}/myInfo/order_desc.do">
						(20200318-0000195) </a>
				</span> <a href="${pageContext.request.contextPath}/myInfo/order_desc.do"
					class="btn-detail"><span id="GGuc">&#62;</span>상세보기</a>
			</div>
			<div class="prd-info">
				<div class="prd-box">
					<div class="thumbnail">
						<a href="..${pageContext.request.contextPath}/gallery/goods.do">
							<img src="../share/img/slide.jpg" width="70" height="70">
						</a>
					</div>
					<div class="prd-content">
						<strong class="prd-name" title="상품명"> <a
							href="${pageContext.request.contextPath}/gallery/goods.do">펫클럽
								세나개 고부해 사은품 증정</a>
						</strong>
						<ul class="prd-li">
							<li><span class="price" title="판매가"> <strong>14,000</strong>원
							</span> <span class="prd-count" title="수량"> <strong>1</strong>개
							</span></li>
						</ul>
						<p class="option">[옵션: 세나개 고부해]</p>
						<button type="button" class="btn btn2" id="cancel">주문취소</button>
					</div>
				</div>
				<div class="prd-foot" title="주문처리상태">
					<div class="ready">취소완료</div>
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
	</div>
	<!-- Javascript -->
	<%@ include file="../share/bottom_tp.jsp"%>
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
			alert(s_yy + "년 " + s_mm + "월 " + s_dd + "일 " + "~" + yy + "년 "
					+ mm + "월 " + dd + "일" + "의 주문조회 결과");
		}

		$(function() {
			$(".dateSearch").hide();
			$("#period_set").click(function() {
				$(".dateSearch").toggle();
			});

			$("#datepicker_before").datepicker({
				// 날짜 선택후 사동 숨김 (true/false)
				autoHide : true,
				// 날짜 형식
				format : "yyyy-mm-dd",
				// 언어
				language : "ko-KR",
				// 시작요일 (0=일요일~6=토요일)
				weekStart : 0
			});

			$("#datepicker_after").datepicker({
				// 날짜 선택후 사동 숨김 (true/false)
				autoHide : true,
				// 날짜 형식
				format : "yyyy-mm-dd",
				// 언어
				language : "ko-KR",
				// 시작요일 (0=일요일~6=토요일)
				weekStart : 0
			});
		});
	</script>
</body>

</html>