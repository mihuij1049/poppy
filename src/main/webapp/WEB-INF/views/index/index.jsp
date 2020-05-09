<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../share/head_tp.jsp"%>
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/share/index.css" />
<style type="text/css">

</style>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container_in">
			<!-- 캐러셀 영역 구성 -->
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- 현재 위치 표시 -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<!-- 내용 영역 -->
				<div class="carousel-inner">
					<!-- 항목 (1) -->
					<div class="item active">
						<img src="/upload/img/main_M.jpg" alt="슬라이더(1)">
					</div>
					<!-- 항목 (2) -->
					<div class="item">
						<img src="/upload/img/2_M.jpg" alt="슬라이더(2)">
					</div>
					<!-- 항목 (3) -->
					<div class="item">
						<img src="/upload/img/3_M.jpg" alt="슬라이더(3)">
					</div>
				</div>
				<!-- // 내용영역 구성 -->
				<!-- 이동 버튼 -->
				<a class="left carousel-control" href="#carousel-example-generic"
					data-slide="prev"> <span class="icon-prev"></span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					data-slide="next"> <span class="icon-next"></span>
				</a>
			</div>
			<!-- 캐러셀 영역 끝 -->
			<center>
				<i class="glyphicon glyphicon-thumbs-up icon_size1" id="glyp_list"></i>
				<h3 id="sale_h3">추천상품</h3>
			</center>
			<!-- 스와이퍼 플러그인 갤러리 시작!!! -->
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="gal_sug_main">
							<c:forEach var="item" items="${output}" varStatus="status" begin="0" end="2">
							<a href="${pageContext.request.contextPath }/gallery/goods_ajax.do?goodsno=1">
							<div class="gal_sug">
								<div class="gal_sug_img">
									<img src="${item.imgpath}${item.imgname}.jpg" id="img_sug">
								</div>
								<span class="sal_name">${item.gname}</span>
								<hr />
								${item.gprice}
							</div>
							</a>
							</c:forEach>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="gal_sug_main">
							<c:forEach var="item" items="${output}" varStatus="status" begin="3" end="5">
							<a href="${pageContext.request.contextPath }/gallery/goods_ajax.do">
							<div class="gal_sug">
								<div class="gal_sug_img">
									<img src="${item.imgpath}${item.imgname}.jpg" id="img_sug">
								</div>
								<span class="sal_name">${item.gname}</span>
								<hr />
								${item.gprice}
							</div>
							</a>
							</c:forEach>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="gal_sug_main">
							<c:forEach var="item" items="${output}" varStatus="status" begin="6" end="8">
							<a href="${pageContext.request.contextPath }/gallery/goods_ajax.do">
							<div class="gal_sug">
								<div class="gal_sug_img">
									<img src="${item.imgpath}${item.imgname}.jpg" id="img_sug">
								</div>
								<span class="sal_name">${item.gname}</span>
								<hr />
								${item.gprice}
							</div>
							</a>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- If we need pagination -->
				<div class="swiper-pagination"></div>
			</div>
			<!-- 스와이퍼 플러그인 갤러리 끝!!! -->
			<center>
				<button type="button" class="btn btn-inverse index_btn"
					onclick="location.href='${pageContext.request.contextPath }/gallery/gal_list.do'">베스트 상품
					더보기</button>
			</center>
			<center>
				<i class="glyphicon glyphicon-bullhorn icon_size1 t_btn"
					id="glyp_list"></i>
				<h3 id="sale_h3">TIME SALE</h3>
			</center>
			<div class="gal_best_main">
			<!-- jstl 반복문 시작 -->
				<c:forEach var="item" items="${output}" varStatus="status" end="8">
					<div class="gal_best">
					<a href="${pageContext.request.contextPath }/gallery/goods_ajax.do">
						<div class="gal_sug_img">
							<img src="${item.imgpath}${item.imgname}.jpg" id="img_sug">
						</div>
						<span class="sal_name">${item.gname}</span>
						</a>
						<hr />
						${item.gprice}<i class="glyphicon glyphicon-heart-empty icon_size1" id="glyp_gal"></i>
					</div>
				</c:forEach>
			<!-- jstl 반복문 끝 -->
				<button type="button" class="btn btn-inverse index_btn"
					onclick="location.href='${pageContext.request.contextPath }/gallery/gal_list.do'">뽀삐뽀삐 단독
					최저가 보장</button>
			</div>
			<div class="img_banner">
				<img src="/upload/img/index_banner1.jpg"> <img
					src="/upload/img/index_banner2.jpg"> <img
					src="/upload/img/index_banner3.jpg">
			</div>
				<center>
					<button type="button" class="btn btn-inverse index_btn"
						onclick="location.href='${pageContext.request.contextPath }/community/photo_rv.do'">실시간
						리뷰 더보기</button>
				</center>
			</div>
			<%@ include file="../share/bottom_tp.jsp"%>
			<!-- Javascript -->
			<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
			<script type="text/javascript">
        var mySwiper = new Swiper('.swiper-container', {

            // 현재 페이지를 나타내는 점이 생깁니다. 클릭하면 이동합니다.
            pagination: {
                el: '.swiper-pagination',
                type: 'bullets',
            },

        });

        $(".glyphicon-heart").click(function() {
            $(".glyphicon-heart").toggleClass(".glyphicon-heart-click");
        });
        
        $(function() {
            $('.pr_box button').click(function() {
                $(this).toggleClass("btn, btn-inverse");
            });
        });
        
        $(function() {
            $('i').click(function() {
                $(this).toggleClass("glyphicon-heart glyphicon-heart-empty");
            });
        });
        </script>
</body>

</html>