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
										<a
											href="${pageContext.request.contextPath }/gallery_ajax/goods.do?goodsno=${item.goodsno}">
											<img src="${item.imgpath}${item.imgname}.${item.imgext}"
											class="cart-img">
										</a>
										<div class="word">
											<b>${item.gname}</b><br> <small><span
												class="price1"><fmt:formatNumber
														value="${item.gprice }" pattern="#,###" />원</span></small><br> <b><fmt:formatNumber
													value="${item.gsale}" pattern="#,###" /></b>
										</div>
									</div>
									<div class="btns">
										<button type="button" class="btn btn-inverse btn-delete-item"
											id="delete-list-item" data-goodsno="${item.goodsno}">삭제</button>
										
										<button type="button" class="btn btn1 btn-order-item"
											id="order" >주문하기</button>
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
		// 쿠키 값 가져오기 메서드 정의
		var getCookie = function(name) {
			var value = document.cookie.match('(^|;) ?' + name
					+ '=([^;]*)(;|$)');
			return value? value[2] : null;
		}
		// replaceAll prototype 선언
		String.prototype.replaceAll = function(org, dest) {
			return this.split(org).join(dest);
		}
		// 쿠키 값 저장하기 메서드 정의
		function setCookie(name, value, exp) {
			var date = new Date();
			date.setTime(date.getTime() + exp*24*60*60*1000);
			document.cookie = name + '=' +  value + ';expires=' + date.toUTCString() + ';path=/';
		}	
	
		/** 주문하기 */
		$("#recent-item-group")
				.on(
						"click",
						".btn-order-item",
						function(e) {
							var goodsno = $(this).prev().data("goodsno");
							console.log(goodsno);
							location.href = "${pageContext.request.contextPath}/gallery_ajax/goods.do?goodsno="+goodsno;
						});
		/** 최근 본 상품에서 삭제 */
		$("#recent-item-group").on("click", ".btn-delete-item", function(e) {

			var goodsno = $(this).data("goodsno");
			var c = getCookie("recentItem");
			c = unescape(c);
			var c1 = c.indexOf(goodsno);
			if (c1!=0) { 
			c = c.replaceAll(","+goodsno, "");
			} else {
				c = c.replaceAll(goodsno+",", "");
			}
			c = escape(c);
			setCookie("recentItem", c, 1);
			$(this).parent().parent().parent().remove();
		});
	</script>
</body>

</html>