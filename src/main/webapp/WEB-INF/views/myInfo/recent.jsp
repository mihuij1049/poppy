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
											<b>${item.gname}</b><br> <small><span class="price1">${item.gprice }원</span></small><br>
											<b>${item.gsale}</b>
										</div>
									</div>
									<div class="btns">
										<button type="button" class="btn btn-inverse btn-delete-item"
											id="delete-list-item">삭제</button>
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
	<!-- Handlebars 를 이용한 HTML 템플릿 구성 -->
	<!-- <script id="goods_item_tmpl" type="text/x-handlebars-template"> -->
		<!-- {{#each goods}}
			<li class="recent-item-list">
				<div class="mycart">
					<div class="mygoods clearfix">
						<a href="#"><img src="{{url}}" class="cart-img"></a>
						<div class="word">
							<b>{{name}}</b><br> <small><span
								class="price1">7,000원</span></small><br> <b>{{price}}</b>
						</div>
					</div>
					<div class="btns">
						<button type="button" class="btn btn-inverse btn-delete-item"
							id="delete-list-item">삭제</button>
						<button type="button" class="btn btn-inverse in-cart"
							id="put-cart">장바구니담기</button>
						<button type="button" class="btn btn1 btn-order-item" id="order">주문하기</button>
					</div>
				</div>
			</li>
		{{/each}} -->
	<!-- </script> -->
	<script type="text/javascript">
		/* $(function() {
			function get_list() {
				$.get("../share/plugins/goods_list.json", function(req) {
					// 미리 준비한 HTML틀을 읽어온다.
					var template = Handlebars.compile($("#goods_item_tmpl")
							.html());
					// Ajax 를 통해서 읽어온 JSON 을 템플릿에 병합한다.
					var html = template(req);
					// #search_goods_list 에 읽어온 내용을 추가한다.
					$("#recent-item-group").append(html);
				});
			} // 검색 결과를 템플릿을 이용해서 화면에 나타낼 함수 정의
			get_list();
		}); */

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