<%@page import="kr.co.poppy.model.Orders"%>
<%@page import="kr.co.poppy.helper.WebHelper"%>
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
	href="${pageContext.request.contextPath}/share/order_list.css?ver=1" />
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
		<!-- 주문조회 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>주문조회
				</b>
			</h4>
		</div>
		<div class="container">
			<ul class="nav nav-tabs">
				<li class="active col-xs-6 etc"><a
					href="${pageContext.request.contextPath}/myInfo/order_list.do">주문조회</a></li>
				<li class="col-xs-6 etc"><a
					href="${pageContext.request.contextPath}/myInfo/cancel_list.do">취소내역</a></li>
			</ul>
			<div class="backg">
				<div class="container">
					<p class="col-xs-1">상태</p>
					<select class="form-control status" id="sel_odstatus">
						<option>전체 주문처리상태</option>
						<option value="0">입금전</option>
						<option value="1">배송준비중</option>
						<option value="2">배송중</option>
						<option value="3">배송완료</option>
					</select>
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
			<c:choose>
				<c:when test="${output==null||fn:length(output) ==0}">
					<tr>
						<td colspan="3" align="center">조회결과가 없습니다.</td>
					</tr>
				</c:when>

				<c:otherwise>
					<c:forEach var="item" items="${output}" varStatus="status">
						<c:set var="orderno" value="${item.orderno}" />
						<c:set var="memno" value="${item.memno}" />
						<c:set var="imgname" value="${item.imgname }" />
						<c:set var="imgext" value="${item.imgext }" />
						<c:set var="imgpath" value="${item.imgpath }" />
						<c:set var="imgtype" value="${item.imgtype }" />
						<c:set var="paytype" value="${item.paytype}" />
						<c:set var="odstatus" value="${item.odstatus}" />
						<div>
							<div class="view">
								<span class="date" title="주문일자">${fn:substring(item.regdate,0,10)}
								</span> <span class="number" title="주문번호"> <a
									href="${pageContext.request.contextPath}/myInfo/order_desc.do?orderno=${item.orderno}">
										(${fn:substring(item.regdate,0,10).replace("-","")}-000${item.orderno})</a>
								</span> <a
									href="${pageContext.request.contextPath}/myInfo/order_desc.do?orderno=${item.orderno}"
									class="btn-detail"><span id="GGuc">&#62;</span>상세보기</a>
							</div>
							<div class="prd-info">
								<div class="prd-box">
									<div class="thumbnail">
										<a href="${pageContext.request.contextPath}/gallery/goods.do">
											<img src="${item.imgpath}${item.imgname}.jpg" width="70"
											height="70">
										</a>
									</div>
									<div class="prd-content">
										<strong class="prd-name" title="상품명"> <a
											href="${pageContext.request.contextPath}/gallery/goods.do">
												${item.odgname}</a>
										</strong>
										<ul class="prd-li">
											<li><span class="price" title="판매가"> <strong>${item.odgprice}</strong>원
											</span> <span class="prd-count" title="수량"> <strong>${item.odgqty}</strong>개
											</span></li>
										</ul>
										<p class="option">[옵션: ${item.odgdoption}]</p>
										<button type="button" class="btn btn2" id="change">주문취소</button>
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
			<!-- Modal -->
			<div class="modal fade" id="myModal2">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="cart-modal">
							<div class="modal-header2">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">주문 취소</h4>
							</div>
							<div class="modal-body2">
								<p>
									<span class="delete_message"></span> 주문을 취소 하시겠습니까?
								</p>
							</div>
							<div class="modal-footer2">
								<button type="reset" class="btn btn2 change_cancel"
									data-dismiss="modal">아니오</button>
								<button type="submit" class="btn btn2 change_ok"
									data-dismiss="modal"
									onclick="location.href='${pageContext.request.contextPath}/myInfo/order_change.do?orderno=${orderno}'">예</button>
							</div>
						</div>
					</div>
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
		$(function() {
			$(document).on("click", "#change", function(e) {
				$("#myModal2").modal("show");
				var change_item = $(this).parent().parent().parent().parent();
				$(document).on("click", ".change_ok", function(e) {
					change_item.remove();
				});
			});
		});
	</script>
</body>

</html>