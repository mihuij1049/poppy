<%@page import="java.text.DecimalFormat"%>
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
	href="${pageContext.request.contextPath}/share/cart.css?ver=1" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Poppy-Poppy</title>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
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
			<div class="panel-title6">장바구니 상품</div>
			<div class="panel-header2">
				일반상품 (<span class="cart-count"></span>)
			</div>
			<div class="panel-body2">
				<c:choose>
					<%--조회결과가 없는 경우 --%>
					<c:when test="${output==null||fn:length(output) ==0}">
						<tr>
							<td colspan="3" align="center">조회결과가 없습니다.</td>
						</tr>
					</c:when>
					<%--조회결과가 있는 경우 --%>
					<c:otherwise>
						<%--조회결과에 따른 반복처리 --%>
						<c:forEach var="item" items="${output }" varStatus="status">
							<%--출력을 위해 준비한 학과 이름과 위치 --%>
							<c:set var="cartno" value="${item.cartno}" />
							<c:set var="imgname" value="${item.imgname }" />
							<c:set var="imgext" value="${item.imgext }" />
							<c:set var="imgpath" value="${item.imgpath }" />
							<c:set var="imgtype" value="${item.imgtype }" />
							<c:set var="gname" value="${item.gname }" />
							<c:set var="deliprice" value="${item.deliprice }" />
							<c:set var="gprice" value="${item.gprice }" />
							<c:set var="gsale" value="${item.gsale }" />
							<c:set var="cartqty" value="${item.cartqty }" />
							<c:set var="goodsno" value="${item.goodsno }" />
							<%-- 상세페이지로 이동하기 위한 URL --%>
							<c:url value="/gallery_ajax/goods.do" var="viewUrl">
								<c:param name="goodsno" value="${item.goodsno}" />
							</c:url>
							<div class="cart-box clear">
								<div class="list-item">
									<div class="word">
										<input type="checkbox" name="cart_check"
											class="cart cart-size"> <a href="${viewUrl}"> <img
											src="${item.imgpath}${item.imgname}.jpg" class="cart-img" />
										</a>

										<p>
											<a href="${viewUrl}"><b class="name">${item.gname}</b></a>
										</p>
										<span>배송:${item.deliprice}원[조건]/기본배송</span><br> <small><span
											class="point-icon">적</span>&nbsp;<span class="point">${fn:substring(item.gsale*0.02, 0, fn:indexOf(item.gsale*0.02,"."))}</span>원</small>
										<b>
											<p class="item_price">${item.gsale}원</p>
										</b> </br></br>
									</div>
									<div class="word-btn">
										<button class="count minus">
											<img src="../share/img/마이너스.png">
										</button>
										<input type="number" class="count-label" value="1"
											id="count-label">
										<button class="count plus">
											<img src="../share/img/플러스.png">
										</button>
										<button class="change">변경</button>
									</div>
									<div class="word-botm">
										<p>
											<b>합계: <span class="price"><fmt:formatNumber
														value="${item.gsale}" pattern="#,###" /></span>원
											</b>
										</p>
										<button type="button" class="delete"
											data-cartno="${item.cartno}">삭제</button>
										<button type="button">관심상품</button>
										<button type="button" class="btn btn2"
											onclick="location.href='${pageContext.request.contextPath}/pay/orderform.do'">주문하기</button>
									</div>
								</div>
							</div>
							<div class="panel-header2 clearfix">[기본배송]</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="list-group" id="list"></div>
			<div class="selectbtn">
				<button type="button" class="all-check">전체선택</button>
				<button type="button" class="select_delete">선택삭제</button>
			</div>
			<table class="table table-responsive">
				<thead>
					<tr>
						<td class="table-header">결제예정금액</td>
						<td class="table-header2 td-mny"><span id="table_sum">
						</span>원</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="td-title">총 상품금액</td>
						<td class="td-mny"><span id="table_price"> </span>원</td>
					</tr>
					<tr>
						<td class="td-title">총 배송비</td>
						<td class="td-mny"><span id="table_delivery"> </span>원</td>
					</tr>
				</tbody>
			</table>
			<div class="pay">
				<button class="btn btn2 btn-inverse"
					onclick="location.href='${pageContext.request.contextPath}/pay/orderform.do'">선택상품주문</button>
				<button class="btn btn2"
					onclick="location.href='${pageContext.request.contextPath}/pay/orderform.do'">
					전체상품주문</button>
			</div>
		</div>
	</div>

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
						<h4 class="modal-title">상품 삭제</h4>
					</div>
					<div class="modal-body2">
						<p>
							<span class="delete_message"></span> 상품을 정말 삭제하시겠습니까?
						</p>
					</div>
					<div class="modal-footer2">
						<button type="button" class="btn btn2 delete_cancel"
							data-dismiss="modal">아니오</button>
						<button type="button" class="btn btn2 delete_ok"
							data-dismiss="modal">예</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Javascript -->
	<%@ include file="../share/bottom_tp.jsp"%>

	<!-- 사용자 정의 스크립트 -->
	<script type="text/javascript">
		$(function() {
			// 결제 예정 금액, 2는 천 단위 마다 (,) 추가적용
			var table_sum = 0;
			var table_sum2 = 0;
			// 총 상품금액
			var table_price = 0;
			var table_price2 = 0;
			// 총 배송비
			var table_delivery = 2500;
			var table_delivery2 = 2500;
			// 각 상품 금액
			var item_price = 0;
			var item_price2 = 0;
			// 각 상품 합계 금액
			var sum_price = 0;
			var sum_price2 = 0;
			// 각 상품 적립금 (상품금액/100)
			var point = 0;
			// 각 상품 최종 가격 (한개의 금액 * 구매수량)
			var result = 0;
			var result2 = 0;
			// 각 상품의 합계 누적
			var sum = 0;
			var sum2 = 0;

			var length = $(".cart-box").length;
			$(".cart-count").html(length);

			for (var i = 0; i < length; i++) {
				sum_price += parseInt($(".price").eq(i).html().replace(/,/gi,
						""));
			}

			$("#table_price").html(sum_price);
			if (sum_price >= 30000) {
				table_delivery = 0;
				$("#table_delivery").html(table_delivery);
			}

			// 로딩시 초기 하단 테이블 금액 표시
			for (var i = 0; i < length; i++) {
				item_price = $(".item_price").eq(i).html();
				item_price2 = item_price.toString().replace(
						/\B(?=(\d{3})+(?!\d))/g, ",");
				$(".item_price").html(item_price2);
				table_price += parseInt($(".price").eq(i).html().replace(/,/gi,
						""));
				if (i == length - 1) {
					table_sum = table_price + table_delivery;
					table_sum2 = table_sum.toString().replace(
							/\B(?=(\d{3})+(?!\d))/g, ",");
					$("#table_sum").html(table_sum2);
					table_price2 = table_price.toString().replace(
							/\B(?=(\d{3})+(?!\d))/g, ",");
					$("#table_price").html(table_price2);
					table_delivery2 = table_delivery.toString().replace(
							/\B(?=(\d{3})+(?!\d))/g, ",");
					$("#table_delivery").html(table_delivery2);
				}
			}

			// 수량 플러스 버튼 클릭시 금액 조정
			$(document).on(
					"click",
					".plus",
					function(e) {
						var value = $(this).prev().val();
						value++;
						$(this).prev().val(value);
						sum_price = $(this).parent().next().children()
								.children().children();
						item_price = $(this).parent().prev().children("b")
								.children().html().replace(/,/gi, "").replace(
										"원", "");
						result = item_price * value;
						result2 = result.toString().replace(
								/\B(?=(\d{3})+(?!\d))/g, ",");
						$(sum_price).html(result2);

						point = $(this).parent().prev().children("small")
								.children().next();

						$(point).html(
								(result * 0.02).toString().replace(
										/\B(?=(\d{3})+(?!\d))/g, ","));

						// 장바구니에 담긴 상품 수 많큼 반복 하여 상품가격 테이블에 값을 출력
						length = $(".cart-box").length;
						for (var i = 0; i < length; i++) {
							sum += parseInt($(".price").eq(i).html().replace(
									/,/gi, ""));
						}
						sum2 = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g,
								",");
						$("#table_price").html(sum2);
						if (sum >= 30000) {
							table_delivery = 0;
							$("#table_delivery").html(table_delivery);
						}
						table_sum = sum + table_delivery;
						table_sum2 = table_sum.toString().replace(
								/\B(?=(\d{3})+(?!\d))/g, ",");

						$("#table_sum").html(table_sum2);
						sum = 0;
					});

			$(document).on(
					"click",
					".minus",
					function(e) {
						var value = $(this).next().val();
						if (value == 1) {
							alert("구매수량은 1미만으로 불가능합니다.");
							return;
						}
						value--;
						$(this).next().val(value);
						sum_price = $(this).parent().next().children()
								.children().children();
						item_price = $(this).parent().prev().children("b")
								.children().html().replace(/,/gi, "").replace(
										"원", "");
						result = item_price * value;
						result2 = result.toString().replace(
								/\B(?=(\d{3})+(?!\d))/g, ",");
						$(sum_price).html(result2);

						point = $(this).parent().prev().children("small")
								.children().next();

						$(point).html(
								(result * 0.02).toString().replace(
										/\B(?=(\d{3})+(?!\d))/g, ","));

						// 장바구니에 담긴 상품 수 많큼 반복 하여 상품가격 테이블에 값을 출력
						length = $(".cart-box").length;
						for (var i = 0; i < length; i++) {
							sum += parseInt($(".price").eq(i).html().replace(
									/,/gi, ""));
						}
						sum2 = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g,
								",");
						$("#table_price").html(sum2);
						if (sum < 30000) {
							table_delivery = 2500;
							table_delivery2 = table_delivery.toString()
									.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
							$("#table_delivery").html(table_delivery2);
						}
						table_sum = sum + table_delivery;
						table_sum2 = table_sum.toString().replace(
								/\B(?=(\d{3})+(?!\d))/g, ",");

						$("#table_sum").html(table_sum2);
						sum = 0;
					});

			$(document).on(
					"click",
					".change",
					function(e) {
						value = $(this).prev().prev().val();
						$(this).prev().prev().val(value);
						sum_price = $(this).parent().next().children()
								.children().children();
						item_price = $(this).parent().prev().children("b")
								.children().html().replace(/,/gi, "").replace(
										"원", "");
						result = item_price * value;
						result2 = result.toString().replace(
								/\B(?=(\d{3})+(?!\d))/g, ",");
						$(sum_price).html(result2);

						point = $(this).parent().prev().children("small")
								.children().next();

						$(point).html(
								(result * 0.02).toString().replace(
										/\B(?=(\d{3})+(?!\d))/g, ","));

						// 장바구니에 담긴 상품 수 많큼 반복 하여 상품가격 테이블에 값을 출력
						length = $(".cart-box").length;
						for (var i = 0; i < length; i++) {
							sum += parseInt($(".price").eq(i).html().replace(
									/,/gi, ""));
						}
						sum2 = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g,
								",");
						console.log(sum);
						$("#table_price").html(sum2);
						if (sum >= 30000) {
							console.log(sum);
							table_delivery = 0;
							$("#table_delivery").html(table_delivery);
						} else {
							table_delivery = 2500;
							table_delivery2 = table_delivery.toString()
									.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
							$("#table_delivery").html(table_delivery2);
						}
						table_sum = sum + table_delivery;
						table_sum2 = table_sum.toString().replace(
								/\B(?=(\d{3})+(?!\d))/g, ",");

						$("#table_sum").html(table_sum2);
						sum = 0;
					});

			$(document).on("click", ".all-check", function(e) {
				var choice = $(".cart").prop("checked");
				if (!choice) {
					$(".cart").prop("checked", true);
				} else {
					$(".cart").prop("checked", false);
				}
			});

			$(document).on("click", ".all-check2", function(e) {
				var choice = $(".cart").prop("checked");
				if (!choice) {
					$(".cart2").prop("checked", true);
				} else {
					$(".cart2").prop("checked", false);
				}
			});

			$(document)
					.on(
							"click",
							".delete",
							function(e) {
								let current = $(this); // 이벤트가 발생한 객체 자신 #delete-one
								let cartno = current.data('cartno');

								$("#myModal2").modal("show");
								$(".delete_message").html("해당");
								var delete_item = $(this).parent().parent()
										.parent();
								$(document)
										.on(
												"click",
												".delete_ok",
												function(e) {

													location.href = '${pageContext.request.contextPath}/pay/cart_delete.do?cartno='
															+ cartno;
													delete_item.remove();

													var length = $(".cart-box").length;
													for (var i = 0; i < length; i++) {
														sum_price += parseInt($(
																".price").eq(i)
																.html());
													}
													$("#table_price").html(
															sum_price);
													if (sum_price < 30000) {
														table_delivery = 2500;
														$("#table_delivery")
																.html(
																		table_delivery);
													}
													$("#table_sum")
															.html(
																	sum_price
																			+ table_delivery);
													sum_price = 0;
												});
							});

			$(document)
					.on(
							"click",
							".select_delete",
							function(e) {
								$("#myModal2").modal("show");
								$(".delete_message").html("선택하신");
								var ss = "실행";
								console.log(ss);
								$(document)
										.on(
												"click",
												".delete_ok",
												function(e) {
													var length = $(".cart-box").length;
													for (var i = 0; i < length; i++) {
														if ($(".cart-size").eq(
																i).prop(
																"checked") == true) {
															$(".cart-size").eq(
																	i).parent()
																	.parent()
																	.parent()
																	.remove();
															i--;
															length--;
															$(".cart-count")
																	.html(
																			length);
														}
													}
													for (var i = 0; i < length; i++) {
														sum_price += parseInt($(
																".price").eq(i)
																.html());
													}
													$("#table_price").html(
															sum_price);
													if (sum_price < 30000) {
														table_delivery = 2500;
														$("#table_delivery")
																.html(
																		table_delivery);
													}
													$("#table_sum")
															.html(
																	sum_price
																			+ table_delivery);
													sum_price = 0;
												});
							});

			$("#like").click(function(e) {
				alert("해당상품이 관심상품으로 등록되었습니다.")
			})

			$("#like2").click(function(e) {
				alert("해당상품이 관심상품으로 등록되었습니다.")
			})
		});
	</script>
</body>

</html>