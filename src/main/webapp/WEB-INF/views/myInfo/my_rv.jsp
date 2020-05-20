<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>

<head>
<%@ include file="../share/head_tp.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/share/my_rv.css" />

</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->

		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>후기관리
				</b>
			</h4>
		</div>
		<!-- 탭 메뉴 시작 -->
		<div class="tabtab">
			<ul class="nav nav-tabs" id="mytabs">
				<li class="active"><a href="#good1" data-toggle="tab">작성
						가능한 리뷰</a></li>
				<li><a href="#good2" data-toggle="tab">내가 작성한 리뷰</a></li>
			</ul>
			<!-- 탭화면 시작 -->
			<div class="tab-content">
				<div class="tab-pane fade in active all1" id="good1">
					<div class="bar1">
						<b>작성 가능한 리뷰<span style="color: #00C6ED">
								${avRvList.size() }</span></b>
					</div>
					<c:forEach var="item" items="${avRvList }" varStatus="status">
						<%-- 출력을 위한 변수 준비 --%>
						<c:set var="gname" value="${item.gname }" />
						<c:set var="gname" value="${item.imgname }" />
						<c:set var="gname" value="${item.imgpath }" />
						<c:set var="gname" value="${item.imgext }" />
						<c:set var="regdate" value="${item.regdate }" />
						<%-- <c:set var="bbstitle" value="${item.bbstitle }" /> 이미지 불러올 예정 --%>
						<div class="onegood clearfix">
							<div class="solid-bottom clearfix">
								<a href="#"><img src="${item.imgpath}" class="cart-img">
									<div class="mybought">
										<span><b class="bar1-good">${item.gname }</b></span><br>
										<small>구매날짜: <span>${item.regdate }</span>
										</small>
									</div></a>
							</div>
							<button type="button"
								onclick="location.href='${pageContext.request.contextPath}/community/photo_wri.do?goodsno=${item.goodsno }'"
								class="btn btn1">리뷰쓰기</button>
						</div>
					</c:forEach>
				</div>


				<div class="tab-pane fade" id="good2">

					<div class="bar1">
						<b>내가 작성한 리뷰<span style="color: #00C6ED;">
								${myReview.size() }</span></b>
					</div>
					<c:forEach var="item" items="${myReview }" varStatus="status">
						<%-- 출력을 위한 변수 준비 --%>
						<c:set var="gname" value="${item.gname }" />
						<c:set var="rvlike" value="${item.rvlike }" />
						<c:set var="bbstitle" value="${item.bbstitle }" />
						<c:set var="imgname" value="${item.imgname }" />
						<c:set var="imgpath" value="${item.imgpath }" />
						<c:set var="imgext" value="${item.imgext }" />

						<div class="onegood onegood-bottom">
							<a href="#"><img src="${item.imgpath}" class="cart-img">
								
									<span><b>${item.gname}</b></span><br>
								</a>


							<div class="star">
								<c:choose>
									<c:when test="${item.rvlike=='*****' }">
										<p class="star-rating">★★★★★</p>
									</c:when>
									<c:when test="${item.rvlike=='****' }">
										<p class="star-rating">★★★★</p>
									</c:when>
									<c:when test="${item.rvlike=='***' }">
										<p class="star-rating">★★★</p>
									</c:when>
									<c:when test="${item.rvlike=='**' }">
										<p class="star-rating">★★</p>
									</c:when>
									<c:otherwise>
										<p class="star-rating">★</p>
									</c:otherwise>
								</c:choose>
							</div>

							<br />
							<div class="review" id="review">
								<span class="bbstitle">${item.bbstitle }</span>
							</div>
						</div>

					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../share/bottom_tp.jsp"%>
	<!-- Javascript -->
	<script type="text/javascript">
		$(function() {
			$("#mytabs").on("shown.bs.tab", function(e) {
				$("active").css("background", "#ff6261");
			});
		});
	</script>
</body>

</html>