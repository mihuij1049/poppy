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
<style>
.gal_best_main #delete-one {
	padding: 0px 10px;
	margin-left : 15px;
	border-solid: 1px;
}

.price_box button {
	width: 60px;
	height: 30px;
	padding: 0px 10px;
	border: 0px;
	font-size: 13px;
}
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
					<a href="${pageContext.request.contextPath }/gallery_ajax/goods.do?goodsno=33">
						<img src="/upload/1_M.jpg" alt="슬라이더(1)">
					</a>
					</div>
					<!-- 항목 (2) -->
					<div class="item">
					<a href="${pageContext.request.contextPath }/gallery_ajax/goods.do?goodsno=6">
						<img src="/upload/2_M.jpg" alt="슬라이더(2)">
					</a>
					</div>
					<!-- 항목 (3) -->
					<div class="item">
						<img src="/upload/3_M.jpg" alt="슬라이더(3)">
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
							<c:forEach var="item" items="${output1}" varStatus="status" begin="0" end="2">
							<a href="${pageContext.request.contextPath }/gallery_ajax/goods.do?goodsno=${item.goodsno}">
							<div class="gal_sug">
								<div class="gal_sug_img">
									<img src="${item.imgpath}${item.imgname}.jpg" id="img_sug">
								</div>
								<span class="sal_name">${item.gname}</span>
								<hr />
								<div class="price_box">
									<span id="gprice"><del>₩<fmt:formatNumber value="${item.gprice}" pattern="#,###" />원</del></span>
									<br>
									<span id="gsale"><b>₩<fmt:formatNumber value="${item.gsale}" pattern="#,###" />원</b></span>
								</div>
							</div>
							</a>
							</c:forEach>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="gal_sug_main">
							<c:forEach var="item" items="${output1}" varStatus="status" begin="3" end="5">
							<a href="${pageContext.request.contextPath }/gallery_ajax/goods.do?goodsno=${item.goodsno}">
							<div class="gal_sug">
								<div class="gal_sug_img">
									<img src="${item.imgpath}${item.imgname}.jpg" id="img_sug">
								</div>
								<span class="sal_name">${item.gname}</span>
								<hr />
								<div class="price_box">
									<span id="gprice"><del>₩<fmt:formatNumber value="${item.gprice}" pattern="#,###" /></del></span>
									<br>
									<span id="gsale"><b>₩<fmt:formatNumber value="${item.gsale}" pattern="#,###" />원</b></span>
								</div>
							</div>
							</a>
							</c:forEach>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="gal_sug_main">
							<c:forEach var="item" items="${output1}" varStatus="status" begin="6" end="8">
							<a href="${pageContext.request.contextPath }/gallery_ajax/goods.do?goodsno=${item.goodsno}">
							<div class="gal_sug">
								<div class="gal_sug_img">
									<img src="${item.imgpath}${item.imgname}.jpg" id="img_sug">
								</div>
								<span class="sal_name">${item.gname}</span>
								<hr />
								<div class="price_box">
									<span id="gprice"><del>₩<fmt:formatNumber value="${item.gprice}" pattern="#,###" />원</del></span>
									<br>
									<span id="gsale"><b>₩<fmt:formatNumber value="${item.gsale}" pattern="#,###" />원</b></span>
								</div>
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
					onclick="location.href='${pageContext.request.contextPath }/gallery/gal_list_best.do'">베스트 상품
					더보기</button>
			</center>
			<center>
				<i class="glyphicon glyphicon-bullhorn icon_size1 t_btn"
					id="glyp_list"></i>
				<h3 id="sale_h3">신상품</h3>
			</center>
			<div class="gal_best_main">
			<!-- jstl 반복문 시작 -->
				<c:forEach var="item" items="${output2}" varStatus="status" end="8">
					<div class="gal_best">
					<a href="${pageContext.request.contextPath }/gallery_ajax/goods.do?goodsno=${item.goodsno}">
						<div class="gal_sug_img">
							<img src="${item.imgpath}${item.imgname}.jpg" id="img_sug">
						</div>
						<span class="sal_name">${item.gname}</span>
						</a>
						<hr />
						<div class="price_box">
							<span id="gprice"><del>₩<fmt:formatNumber value="${item.gsale}" pattern="#,###" />원</del></span>
							<br>
							<span id="gsale"><b>₩<fmt:formatNumber value="${item.gsale}" pattern="#,###" />원</b></span>
							<%-- <button type="submit" class="btn btn-inverse insert-one" id="insert-one" data-heartno="${item.heartno}" data-goodsno="${item.goodsno}">
							like ♥
							</button> --%>
						</div>
					</div>
				</c:forEach>
			<!-- jstl 반복문 끝 -->
				<button type="button" class="btn btn-inverse index_btn"
					onclick="location.href='${pageContext.request.contextPath }/gallery/gal_list_new.do'">뽀삐뽀삐 전체상품 보러가기</button>
			</div>
			<div class="img_banner">
				<img src="/upload/index_banner1.jpg">
				<img src="/upload/index_banner2.jpg">
				<img src="/upload/index_banner3.jpg">
			</div>
			<center>
				<i class="glyphicon glyphicon-bullhorn icon_size1 t_btn"
					id="glyp_list"></i>
				<h3 id="sale_h3">실시간 리뷰</h3>
			</center>
			<div id="result">
			<!-- 게시물 하나 시작 -->
				<c:forEach var="item" items="${output3}" varStatus="status" begin="0" end="3">
				<div width="50%">
					<div class="pr_box">
						<div class="pr_in_box">
							<a href="${pageContext.request.contextPath}/community/photo.do?bbsno=${item.bbsno}"> <img alt="사진"
								src="${item.imgpath}${item.imgname}.${item.imgext}" class="img_size" />
								<div>
									<h5>
										<b>${item.bbstitle}</b>
									</h5>
									${item.userid}<br>
									<hr />
									<div class="pr_content">${item.bbscontent}</div>
								</div>
							</a>
							<button type="submit" class="btn btn-inverse insert-one" id="insert-one" data-bbsno="${item.bbsno}" data-rvheartno="${item.rvheartno}">
								<i class="glyphicon glyphicon-heart icon_size"></i> 추천
							</button>
						</div>
					</div>
				</div>			
				</c:forEach>
			<!-- 게시물 하나 끝 -->
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
		$(".gal_best_main").on("click", "#insert-one", function(e) {
	        e.preventDefault();
	  
	        let goodsno = $(this).data("goodsno");

	        $.post("${pageContext.request.contextPath}/gallery/in_item",
	              { "goodsno" : goodsno },
	                   function(json) {
	                     if(json.rt=="OK");
	                  }
	              )
	        /* $(this).css('color', 'red');
	        clicked = false; */
	     });
        var mySwiper = new Swiper('.swiper-container', {

            // 현재 페이지를 나타내는 점이 생깁니다. 클릭하면 이동합니다.
            pagination: {
                el: '.swiper-pagination',
                type: 'bullets',
            },

        });
        
        $("#result").on("click", "#insert-one", function(e) {
            e.preventDefault();
      
            if (${empty userInfo.userid}) {
            	alert("로그인 후 이용해 주세요.")
            	window.location="${pageContext.request.contextPath}/member/login.do";
            } else {
            
           	let bbsno = $(this).data("bbsno");
            $.post("${pageContext.request.contextPath}/community/in_item",
                  { "bbsno" : bbsno },
                       function(json) {
                         if(json.rt=="OK");
                      }
                  )
            }
            /* $(this).css('color', 'red');
            clicked = false; */
         });
        
        </script>
</body>

</html>