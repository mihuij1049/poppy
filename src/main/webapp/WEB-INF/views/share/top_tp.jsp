<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="container">
	<div class="header">
		<a href="${pageContext.request.contextPath }/index/index.do" id="logo">
			<img src="${pageContext.request.contextPath }/share/img/pplogo.jpg">
		</a> <a href="${pageContext.request.contextPath }/pay/cart.do"> <span
			class="glyphicon glyphicon-shopping-cart" id="cart">
				<h1>장바구니</h1>
		</span> <c:choose>
				<c:when test="${empty userInfo.userid}">
					<span class="badge">
						<p id="cart-qty">0</p>
					</span>
				</c:when>
				<c:otherwise>
					<span class="badge">
						<p id="cart-qty">${userInfo.cartcnt}</p>
					</span>
				</c:otherwise>
			</c:choose>
		</a>
		<hr>
		<ul class="category">
			<a
				href="${pageContext.request.contextPath }/gallery/gal_list_best.do">
				<li>BEST</li>
			</a>
			<a
				href="${pageContext.request.contextPath }/gallery/gal_list_new.do">
				<li>NEW</li>
			</a>
			<a
				href="${pageContext.request.contextPath }/gallery/gal_list.do?cate1=푸드">
				<li>푸드</li>
			</a>
			<a
				href="${pageContext.request.contextPath }/gallery/gal_list.do?cate1=의류">
				<li>의류</li>
			</a>
			<a
				href="${pageContext.request.contextPath }/gallery/gal_list.do?cate1=외출용품">
				<li>외출용품</li>
			</a>
			<a
				href="${pageContext.request.contextPath }/gallery/gal_list.do?cate1=홈리빙">
				<li>홈리빙</li>
			</a>
			<a
				href="${pageContext.request.contextPath }/gallery/gal_list.do?cate1=대형견">
				<li>대형견</li>
			</a>
			<a href="${pageContext.request.contextPath }/gallery/gal_list_all.do">
				<li>전체상품</li>
			</a>
		</ul>
		<hr>
	</div>