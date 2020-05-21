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
<style type="text/css">
.review {
	vertical-align: middle;
}

.cart-img {
	display: inline-block;
	width: 30%;
	height: 90px; 
	float : left;
	margin-right: 20px;
	float: left;
}

p.star-rating {
	margin: 10px 0px 0px 0px;
	color: #ff8f83;
}

.onegood {
	width: 96%;
	margin: auto;
	margin-top: 5px; 
	margin-bottom : 5px;
	padding: 20px;
	border: 1px solid #FFC7C1;
	margin-bottom: 5px;
}

.onegood2 {
	width: 96%;
	min-height:180px;
	margin: auto;
	margin-top: 5px;
	margin-bottom: 5px;
	padding: 20px;
	border: 1px solid #FFC7C1;
}

.locationbtns {
	text-align: center;
	float: right;
	margin-top: 5/px;
	margin-bottom: 10px;
}
.gotorv {
	margin-left: 10px;
	margin-right: 10px;
}
</style>
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
						<c:set var="bbsno" value="${item.bbsno }" />

						<div class="onegood2 onegood-bottom">
							<a href="#"><img src="${item.imgpath}" class="cart-img">
								<span><b class="gname">${item.gname}</b></span><br> </a>
							<div class="star">
								<c:choose>
									<c:when test="${item.rvlike=='*****' }">
										<p class="star-rating">★★★★★</p>
										<p class="bbstitle">${item.bbstitle }</p>
									</c:when>
									<c:when test="${item.rvlike=='****' }">
										<p class="star-rating">★★★★</p>
										<p class="bbstitle">${item.bbstitle }</p>
									</c:when>
									<c:when test="${item.rvlike=='***' }">
										<p class="star-rating">★★★</p>
										<p class="bbstitle">${item.bbstitle }</p>
									</c:when>
									<c:when test="${item.rvlike=='**' }">
										<p class="star-rating">★★</p>
										<p class="bbstitle">${item.bbstitle }</p>
									</c:when>
									<c:otherwise>
										<p class="star-rating">★</p>
										<p class="bbstitle">${item.bbstitle }</p>
									</c:otherwise>
								</c:choose>
								
									<div class="locationbtns">
										
										<button type="button" class="gotogood btn btn-sm" id="enter" data-goodsno="${item.goodsno}"><b>상품보러가기</b></button>
										<button type="button" class="gotorv btn btn-sm" id="enter" data-bbsno="${item.bbsno}"><b>리뷰보러가기</b></button>
									</div>


							</div>

							<br />

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
		$(function() {
			$(".gotogood").on("click", function(e) {
				let current = $(this);
				 let goodsno = current.data('goodsno');
				window.location="${pageContext.request.contextPath}/gallery_ajax/goods.do?goodsno=" + goodsno;
			});
		});
		$(function() {
			$(".gotorv").on("click", function(e) {
				let current = $(this);
				 let bbsno = current.data('bbsno');
				window.location="${pageContext.request.contextPath}/community/photo.do?bbsno=" + bbsno;
			});
		});
	</script>
</body>

</html>