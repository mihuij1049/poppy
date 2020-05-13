<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
	<div class="header">
		<a href="${pageContext.request.contextPath }/index/index.do" id="logo"> <img
			src="/upload/img/logojpg.jpg">
		</a> <a href="${pageContext.request.contextPath }/pay/cart.do"> <span
			class="glyphicon glyphicon-shopping-cart" id="cart">
				<h1>장바구니</h1>
		</span> <span class="badge">
				<p id="cart-qty">11</p>
		</span>
		</a>
		<hr>
		<ul class="category">
			<a href="${pageContext.request.contextPath }/gallery/gal_list_all.do">
				<li>BEST</li>
			</a>
			<a href="${pageContext.request.contextPath }/gallery/gal_list_all.do">
				<li>NEW</li>
			</a>
			<a href="${pageContext.request.contextPath }/gallery/gal_list.do?cate1=푸드">
				<li>푸드</li>
			</a>
			<a href="${pageContext.request.contextPath }/gallery/gal_list.do?cate1=의류">
				<li>의류</li>
			</a>
			<a href="${pageContext.request.contextPath }/gallery/gal_list.do?cate1=외출용품">
				<li>외출용품</li>
			</a>
			<a href="${pageContext.request.contextPath }/gallery/gal_list.do?cate1=홈리빙">
				<li>홈리빙</li>
			</a>
			<a href="${pageContext.request.contextPath }/gallery/gal_list.do?cate1=대형견">
				<li>대형견</li>
			</a>
			<a href="${pageContext.request.contextPath }/gallery/gal_list_all.do">
				<li>타임세일</li>
			</a>
			<a href="${pageContext.request.contextPath }/gallery/gal_list_all.do">
				<li>유통임박</li>
			</a>
		</ul>
		<hr>
	</div>