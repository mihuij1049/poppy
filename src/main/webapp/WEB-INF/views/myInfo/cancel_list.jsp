<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../share/head_tp.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/share/cancel_list.css?ver=1" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Poppy-Poppy</title>
<!-- 플러그인 CSS 참조 -->
<link rel="stylesheet" type="text/css"
	href="../share/plugins/datepicker/datepicker.min.css">

</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 취소내역 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>취소내역
				</b>
			</h4>
		</div>
		<div class="container">
			<ul class="nav nav-tabs">
				<li class="col-xs-6 etc"><a
					href="${pageContext.request.contextPath}/myInfo/order_list.do">주문조회</a></li>
				<li class="active col-xs-6 etc"><a
					href="${pageContext.request.contextPath}/myInfo/cancel_list.do">취소내역</a></li>
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
				<button type="button" id="check" class="btn btn2">조회</button>
			</div>
			<c:choose>
				<c:when test="${output==null||fn:length(output) ==0}">
					<tr>
						<td colspan="3" align="center">조회결과가 없습니다.</td>
					</tr>
				</c:when>

				<c:otherwise>
					<c:forEach var="item" items="${output}" varStatus="status">
						<c:set var="orderno" value="${item.orderno}" />
						<c:set var="imgname" value="${item.imgname }" />
						<c:set var="imgext" value="${item.imgext }" />
						<c:set var="imgpath" value="${item.imgpath }" />
						<c:set var="imgtype" value="${item.imgtype }" />
						<%-- 상세페이지로 이동하기 위한 URL --%>
						<c:url value="/gallery_ajax/goods.do" var="viewUrl">
							<c:param name="goodsno" value="${item.goodsno}" />
						</c:url>
						<div>
							<div class="view">
								<span class="date" title="주문일자">${fn:substring(item.regdate,0,10)}</span>
								<span class="number" title="주문번호"> <a
									href="${pageContext.request.contextPath}/myInfo/order_desc.do?orderno=${item.orderno}">
										(${fn:substring(item.regdate,0,10).replace("-","")}-000${item.orderno})</a>
								</span> <a
									href="${pageContext.request.contextPath}/myInfo/order_desc.do?orderno=${item.orderno}"
									class="btn-detail"><span id="GGuc">&#62;</span>상세보기 </a>
							</div>
							<div class="prd-info">
								<div class="prd-box">
									<div class="thumbnail">
										<a href="${viewUrl}"> <img
											src="${item.imgpath}${item.imgname}.${item.imgext}"
											width="70" height="70">
										</a>
									</div>
									<div class="prd-content">
										<strong class="prd-name" title="상품명"> <a
											href="${viewUrl}"> ${item.odgname}</a>
										</strong>
										<ul class="prd-li">
											<li><span class="price" title="판매가"> <strong><fmt:formatNumber
															value="${item.odgsale}" pattern="#,###" /></strong>원
											</span> <span class="prd-count" title="수량"> <strong>${item.odgqty}</strong>개
											</span></li>
										</ul>
										<p class="option">[옵션: ${item.odgdoption}]</p>
									</div>
								</div>
								<div class="prd-foot" title="주문처리상태">
									<div class="ready">${item.odstatus}</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
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
		var length = $(".view").length;

		var days2 = days * 24 * 60 * 60 * 1000;

		var date = new Date();
		var yy = date.getFullYear();
		var mm = date.getMonth() + 1;
		var dd = date.getDate();
		if (mm < 10) {
			mm = "0" + mm;
		} else if (dd < 10) {
			dd = "0" + dd;
		}
		var today = yy + "-" + mm + "-" + dd;

		var setday = date.getTime() - days;
		date.setTime(setday);

		var s_yy = date.getFullYear();
		var s_mm = date.getMonth() + 1;
		var s_dd = date.getDate();
		if (s_mm < 10) {
			s_mm = "0" + s_mm;
		} else if (s_dd < 10) {
			s_dd = "0" + s_dd;
		}console.log("days==="+days);

		alert(s_yy + "년 " + s_mm + "월 " + s_dd + "일 " + "~" + yy + "년 "
				+ mm + "월 " + dd + "일" + "의 주문조회 결과");
		$(".view").parent().hide();
		for (var i = 0; i < length; i++) {
			var oddate = $(".date").eq(i).html();
				var date1 = new Date(today).getTime() / 1000;
				var date2 = new Date(oddate).getTime() / 1000;
				var date3 = (date1 - date2) / 60 / 60 / 24;
				
			if (days == 0 && oddate == today) {
				$(".view").eq(i).parent().show();
			} else if (days==30 && date3 <= 30) {
				$(".view").eq(i).parent().show();
			} else if (days==90 && date3 <= 90) {
				$(".view").eq(i).parent().show();
			} else if (days==180 && date3 <= 180) {
				$(".view").eq(i).parent().show();
			}					
		}
	}
	
	$(document).on("click","#check", function(e) {				
		date1 = $("#datepicker_before").val();
		date2 = $("#datepicker_after").val();
		date1_stm = new Date(date1).getTime() / 1000;
		date2_stm = new Date(date2).getTime() / 1000;
		console.log(date1);
		console.log(date2);
		console.log(date1_stm);
		console.log(date2_stm);
		$(".view").parent().hide();
		length = $(".view").length;
		for (var i = 0; i < length; i++) {
			var oddate = $(".date").eq(i).html();
			oddate = new Date(oddate).getTime() / 1000;
			console.log(oddate);
			if(oddate>=date1_stm && oddate<=date2_stm) {
				$(".view").eq(i).parent().show();
			}	
		}
	});

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