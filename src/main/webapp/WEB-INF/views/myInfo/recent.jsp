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
	href="${pageContext.request.contextPath}/share/recent.css" />

<script src="../share/plugins/handlebars/handlebars-v4.0.5.js"></script>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">

			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>최근 본 상품
					</b>
				</h4>
			</div>
			<c:choose>
				<c:when test="${cookie.recentItem == null }">
					<div class="non-list">최근 본 상품이 없습니다. 어서 둘러보세요!</div>
				</c:when>
				<c:otherwise>
					<!-- 최근본 상품 목록 시작 -->
						<ul class="recent" id="recent-item-group">
						<c:forEach var="item" items="${output}" varStatus="status">
							<li class="recent-item-list">
								<div class="mycart">
									<div class="mygoods clearfix">
										<a href="${pageContext.request.contextPath }/gallery_ajax/goods.do?goodsno=${item.goodsno}">
										<img src="${item.imgpath}${item.imgname}.${item.imgext}" class="cart-img"></a>
										<div class="word">
											<b>${item.gname}</b><br> <small><span class="price1"><fmt:formatNumber
										value="${item.gprice }"
										pattern="#,###" />원</span></small><br>
											<b><fmt:formatNumber
										value="${item.gsale}"
										pattern="#,###" /></b>
										</div>
									</div>
									<div class="btns">
										<button type="button" class="btn btn-inverse btn-delete-item"
											id="delete-list-item" data-goodsno="${item.goodsno}">삭제</button>
										<button type="button" class="btn btn-inverse in-cart"
											id="put-cart">장바구니담기</button>
										<button type="button" class="btn btn1 btn-order-item"
											id="order">주문하기</button>
									</div>
								</div>
							</li>
							</c:forEach>
						</ul>				
				</c:otherwise>
			</c:choose>
		</div>

	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	<script type="text/javascript">
	
		/** 주문하기 */
		$("#recent-item-group")
				.on(
						"click",
						".btn-order-item",
						function(e) {
							location.href = "${pageContext.request.contextPath}/pay/orderform.do";
						});
		/** 최근 본 상품에서 삭제 */
		$("#recent-item-group").on("click", ".btn-delete-item", function(e) {
			$(this).parent().parent().parent().remove();
			var goodsno = $(this).data("goodsno");
			console.log(goodsno);
			var c = document.cookie;
			console.log(c);
			c.indexOf(goodsno);
			console.log(c.indexOf(goodsno));
			
		});
		/** 장바구니 담기 */
		var count = $("#cart-qty").text();
		var put_cart = count;
		$("#cart-qty").text(put_cart);
		$("#recent-item-group").on("click", "#put-cart", function(e) {
			put_cart++;
			if (put_cart == Number(count) + 1) {
				$("#cart-qty").text(put_cart);
				alert("해당 상품을 장바구니에 담았습니다.");
			} else {
				alert("이미 해당 상품을 장바구니에 담았습니다.");
			}
		});
	</script>
</body>

</html>