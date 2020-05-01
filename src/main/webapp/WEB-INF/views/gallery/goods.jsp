<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Poppy-Poppy</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/share/assets/ico/favicon.png" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/share/assets/ico/apple-touch-icon-144-precomposed.png" />
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/share/assets/css/bootstrap.min.css" />
<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/share/assets/css/nanumfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/share/tmpl.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/share/goods.css" />
<!-- 반응형 웹을 지원하지 않을 경우 -->
<!-- <link rel="stylesheet" href="assets/css/non-responsive.css" /> -->
<!-- IE8 이하 버전 지원 -->
<!--[if lt IE 9]>
        <script type="text/javascript" src="assets/js/html5shiv.js"></script>
        <script type="text/javascript" src="assets/js/respond.min.js"></script>
    <![endif]-->
<!-- IE10 반응형 웹 버그 보완 -->
<!--[if gt IE 9]>
        <link rel="stylesheet" type="text/css" href="assets/css/ie10.css" />
        <script type="text/javascript" src="assets/js/ie10.js"></script>
    <![endif]-->
<%@ include file="../share/head_tp.jsp"%>
<style type="text/css">
</style>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>상품상세정보
				</b>
			</h4>
		</div>
		<div class="product">
			<div class="prd-img">
				<img src="../share/img/goods_header.jpg">
			</div>
			<fieldset class="btn-group">
				<button type="button" class="like-btn" aria-label="좋아요">
					<span class="glyphicon glyphicon-heart-empty like"></span> <span
						class="like-txt">좋아요</span> <span class="like-count ct">11</span>
				</button>
				<button type="button" class="share-btn" aria-label="공유하기">
					<span class="glyphicon glyphicon-link"></span> <span>공유하기</span>
				</button>
				<input id="my-url" type="text"
					value="<?php echo esc_url($_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'])?>"
					style="display: none;">
			</fieldset>
			<div class="prd-title">
				<div class="prd-name">대용량노즈워크용 간식/벨버드 순삭져키 1kg 강아지져키</div>
				<div class="prd-price">
					<div class="price">19900</div>
					원
				</div>
				<div class="prd-delivery">
					<ul>
						<li>배송방법</li>
						<li>택배</li>
					</ul>
					<ul>
						<li>배송비</li>
						<li><strong>2,500원</strong>(30,000원 이상 구매시 무료)</li>
					</ul>
				</div>
				<div class="prd-option">
					<table>
						<tbody>
							<tr class="quantity">
								<th>수량</th>
								<td>
									<button type="button" class="btn btnDown">
										<img src="../share/img/마이너스.png">
									</button> <input type="number" value="1" min="1" max="99" name="count"
									id="count" />
									<button type="button" class="btn btnUp">
										<img src="../share/img/플러스.png">
									</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="collapse">
					<!-- 게시글 하나 단위 -->
					<div class='collapse-item'>
						<!-- 게시글 제목영역 -->
						<h2 class='collapse-title'>
							<a href="#content1"> <span>추가구성상품</span> <img
								src="../share/img/arrow-down.png" align=right
								class="arrow-down icon-rotate">
							</a>
						</h2>
						<!-- 게시글 내용영역 -->
						<div id="content1" class="content">
							<ul class="product">
								<li style="list-style: none;">
									<div class="information">
										<div class="thumbnail">
											<a href="../gallery/goods.jsp"> <img
												src="../share/img/goods_header.jpg">
											</a>
										</div>
										<div calss="con">
											<p class="name">펫클럽 벨버드비쉬케어포덴탈 바르는치약 70g/위생</p>
											<p class="sel-price">6,000원</p>
										</div>
									</div>
									<div class="option">
										<div class="title">상품선택</div>
										<select class="prd-select">
											<option class="active">- [필수] 상품 선택 -</option>
											<option class="prd-select-1">펫클럽 벨버드비쉬케어포덴탈 바르는치약
												70g/위생</option>
										</select>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="select-prd">
						<table>
							<tbody class="add-prds">
								<tr class="add-prd">
									<td>
										<p class="prd">
											<strong>펫클럽 벨버드비쉬케어포덴탈 바르는치약 70g/위생</strong> <br> <span>펫클럽
												벨버드비쉬케어포덴탈 바르는치약 70g/위생</span>
										</p>
										<p>
											<button type="button" class="btn btnDown2">
												<img src="../share/img/마이너스.png">
											</button>
											<input type="number" value="0" min="1" max="99" name="count2"
												id="count2" />
											<button type="button" class="btn btnUp2">
												<img src="../share/img/플러스.png">
											</button>
										</p>
									</td>
									<td class="add-price"><span id=add-price>6000</span> <span>원</span></td>
									<td class="cencel">
										<div class="cencel-btn">
											<button type="button" class="btn" id="prd-del">
												<span class="glyphicon glyphicon-remove"></span>
											</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="prd-total">
					<strong>총 상품금액(수량)</strong>
					<div class="total-price">
						<b id="total-price">19900</b> <b>원</b> <b>(</b><b id="price-count">1</b><b>개)</b>
					</div>
				</div>
				<div class="prd-action">
					<div class="action-btn">
						<button type="button" onclick="location.href='${pageContext.request.contextPath }/pay/cart.do'"
							id="action-cart">장바구니</button>
						<button type="button"
							onclick="location.href='${pageContext.request.contextPath }/myInfo/like_goods.do'"
							id="action-like">관심상품</button>
						<button type="button"
							onclick="location.href='${pageContext.request.contextPath }/pay/orderform_ajax.do'"
							id="action-orderform">구매하기</button>
					</div>
				</div>
			</div>
		</div>
		<div class="prd-tab">
			<ul class="nav nav-tabs" id="mytab">
				<li class="active"><a href="#page1" data-toggle="tab">상세정보</a></li>
				<li><a href="#page2" data-toggle="tab">구매안내</a></li>
				<li><a href="#page3" data-toggle="tab">상품후기(2)</a></li>
				<li><a href="#page4" data-toggle="tab">Q&A(0)</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane fade active in" id="page1">
					<div class="prd-detail">
						<img src="../share/img/goods_content.jpg"> <img
							src="../share/img/goods_content2.jpg"> <img
							src="../share/img/goods_footer.jpg" id="prd-foot">
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="page2">
					<div class="prd-Info">
						<table>
							<tbody>
								<tr>
									<th><span>상품명</span></th>
									<td><sapn> 대용량노즈워크용 간식/벨버드 순삭져키 1kg 강아지져키 </sapn></td>
								</tr>
								<tr>
									<th><span>소비자가</span></th>
									<td><sapn> <b>19,900원</b> </sapn></td>
								</tr>
								<tr>
									<th><span>판매가</span></th>
									<td><sapn> <b>19,900원</b> </sapn></td>
								</tr>
								<tr>
									<th><span>배송방법</span></th>
									<td><sapn> 택배 </sapn></td>
								</tr>
								<tr>
									<th><span>배송비</span></th>
									<td><sapn> <b>2,500원</b>(30,000원 이상 구매시 무료) </sapn></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="page3">
					<div class="prd-photo">
						<div class="photo">
							<h5>별점</h5>
							<div class="star">
								<span class="starR on">별1</span> <span class="starR">별2</span> <span
									class="starR">별3</span> <span class="starR">별4</span> <span
									class="starR">별5</span>
							</div>
							<div class="photo-add">
								<h5>사진첨부</h5>
								<div class="photo-files">
									<ul>
										<li>
											<div class="afile">
												<input type="file" name="file1" style="display: none;">
												<input type="text" name="file2" id="file2"
													style="display: none;"> <img
													src="../share/img/photo-file.PNG" border="0"
													onclick="document.all.file1.click(); document.all.file2.value=document.all.file1.value">
											</div>
										</li>
										<li>
											<div class="afile">
												<input type="file" name="file2" style="display: none;">
												<input type="text" name="file2" id="file2"
													style="display: none;"> <img
													src="../share/img/photo-file.PNG" border="0"
													onclick="document.all.file1.click(); document.all.file2.value=document.all.file1.value">
											</div>
										</li>
										<li>
											<div class="afile">
												<input type="file" name="file2" style="display: none;">
												<input type="text" name="file2" id="file2"
													style="display: none;"> <img
													src="../share/img/photo-file.PNG" border="0"
													onclick="document.all.file1.click(); document.all.file2.value=document.all.file1.value">
											</div>
										</li>
										<li>
											<div class="afile">
												<input type="file" name="file2" style="display: none;">
												<input type="text" name="file2" id="file2"
													style="display: none;"> <img
													src="../share/img/photo-file.PNG" border="0"
													onclick="document.all.file1.click(); document.all.file2.value=document.all.file1.value">
											</div>
										</li>
										<li>
											<div class="afile">
												<input type="file" name="file2" style="display: none;">
												<input type="text" name="file2" id="file2"
													style="display: none;"> <img
													src="../share/img/photo-file.PNG" border="0"
													onclick="document.all.file1.click(); document.all.file2.value=document.all.file1.value">
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="write  clearfix">
							<textarea placeholder="리뷰를 남겨주세요."></textarea>
						</div>
						<div class="photo-button">
							<button type="button" id="review-submit">리뷰 등록</button>
							<button type="button" id="review-all"
								onclick="location.href='../community/photo_rv.jsp'">리뷰
								전체보기</button>
						</div>
						<div class="prd-review">
							<ul class="review-list">
								<li class="list1">
									<div class="box">
										<dl class="box-left">
											<dd class="star"></dd>
											<dd class="writer">조**</dd>
											<dd class="writeDate">2020/03/31</dd>
											<dd class="review-content">
												대용량 간식 찾고있었는데 너무 좋아요<br> 크기도 적당해서잘먹네요 <br>많이 파세요많이
												파세요많이 파세요많이 파세요많이 파세요<br>
											</dd>
											<dd class="edit">
												<a href="#" class="editt">수정</a>
											</dd>
											<dd class="txt">
												<span> 리뷰가 도움이 되었나요? <a href="#">추천</a> <span
													class="voteCount"> 3 </span>
												</span>
											</dd>
										</dl>
									</div>
								</li>
								<li class="list2">
									<div class="box">
										<dl class="box-left">
											<dd class="star"></dd>
											<dd class="writer">(주)펫클럽</dd>
											<dd class="writeDate">2020/03/31</dd>
											<dd class="review-content">
												구매해주셔서 정말 감사합니다~!<br> 리뉴얼 한만큼 더 열심히 더 좋은 상품으로 보답하겠습니다.<br>
												오늘 하루 행복한 하루되세요~!<br> 리뷰 정말 감사합니다!
											</dd>
											<dd class="edit">
												<a href="#" class="editt">수정</a>
											</dd>
											<dd class="txt">
												<span> 리뷰가 도움이 되었나요? <a href="#">추천</a> <span
													class="voteCount"> 3 </span>
												</span>
											</dd>
										</dl>
									</div>
								</li>
							</ul>
						</div>
						<div class="paging">
							<ul class="pagination pagination-sm">
								<li class="disabled"><a href="#">&laquo;</a></li>
								<!-- 활성화 버튼은 아래의 구조로 구성하시면 됩니다. sr-only는 스크린리더 전용입니다. -->
								<li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
								<li class="paging-right"><a href="#">&raquo;</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="page4">
					<div class="prd-qna">
						<div class="qna-head">
							<p class="qna-btn">
								<button type="button"
									onclick="location.href='../community/qna_wri.jsp'"
									id="qna-write">상품문의하기</button>
								<button type="button"
									onclick="location.href='../community/qna.jsp'" id="qna-all">모두보기</button>
							</p>
							<p class="nodata">게시물이 없습니다</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<!-- 하단 네비게이션 고정-->
		<!--- 소개 4인방 링크 -->
		<hr />
		<div class="etc">
			<a href="etc/page_info1.html">회사소개</a> <a href="etc/page_info2.html">이용약관</a>
			<a href="etc/page_info3.html">개인정보취급방침</a> <a
				href="etc/page_info4.html">이용안내</a>
		</div>
		<hr />
		<div class="row">
			<div class="col-xs-6 etc">
				<h5>
					<b>상담센터</b>
				</h5>
				<p style="font-size: 15px; font-weight: bold;">070-123-4567</p>
				<p style="font-size: 12px">
					운영시간 : 10:00 - 18:00<br />주말, 공휴일은 후뮤입니다.
				</p>
			</div>
			<div class="col-xs-6 etc">
				<h5>
					<b>입금계좌안내</b>
				</h5>
				<br />
				<p>
					하나 355-342432-23445<br>예금주 : (주)뽀삐뽀삐
				</p>
			</div>
		</div>
		<address class="clearfix">
			<p>
				상점명: (주)뽀삐뽀삐 대표 : 아무개 <br>주소 : 서울특별시 행복구 존버동 8282-5959 102호 -
				물류팀<br> 사업자등록번호 : 123-86-43567<br> 통신판매업신고 :
				제2020-서울서초-0082호<br> 개인정보관리책임 : 아무개 <br> <br />
				COPYRIGHT&copy; (주)뽀삐뽀삐 ALL RIGHTS RESERVED <br /> <i>DESIGN BY
					EZEN-team4</i>
			</p>
		</address>
		<div class="navbar" id="navbarback">
			<ul class="btmbar-nav clearfix navbar-fixed-bottom">
				<hr />
				<div class="prd-action2">
					<div class="action-btn2">
						<button type="button" onclick="location.href='${pageContext.request.contextPath }/pay/cart.do'"
							id="action-cart2">장바구니</button>
						<button type="button"
							onclick="location.href='${pageContext.request.contextPath }/myInfo/like_goods.do'"
							id="action-like2">관심상품</button>
						<button type="button"
							onclick="location.href='${pageContext.request.contextPath}/pay/orderform.do'"
							id="action-orderform2">구매하기</button>
					</div>
				</div>
			</ul>
		</div>
	</div>
	</div>
	<!-- Javascript -->
	<script src="../share/assets/js/jquery-3.2.1.min.js"></script>
	<script src="../share/assets/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	<script src="../share/plugins/ajax/ajax_helper.js"></script>
	<script src="../share/assets/js/regex.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.star span').click(function() {
				$(this).parent().children('span').removeClass('on');
				$(this).addClass('on').prevAll('span').addClass('on');
				return false;
			});

			var counter = 1;
			var counted = $("#count2").val();
			var acount = parseInt(counted);
			var price = $(".price").text();
			var add_price = $("#add-price").text();
			var price_count = $("#price-count").html(counter + acount);
			var total_price = $("#total-price").html(
					(counter * price) + (acount * add_price));

			$(".btnUp").click(
					function(e) {
						counter++;

						$("#count").val(counter);
						$("#price-count").html(counter + acount);
						$("#total-price").html(
								(counter * price) + (acount * add_price));
					});

			$(".btnUp2").click(
					function(e) {
						acount++;

						$("#count2").val(acount);
						$("#price-count").html(counter + acount);
						$("#add-price").html(acount * add_price);
						$("#total-price").html(
								(counter * price) + (acount * add_price));
					});

			$(".btnDown").click(
					function(e) {
						if (counter < 2) {
							alert("최소 주문수량은 1개 입니다.");
							return;
						}
						counter--;

						$("#count").val(counter);
						$("#price-count").html(counter + acount);
						$("#total-price").html(
								(counter * price) + (acount * add_price));
					});

			$(".btnDown2").click(
					function(e) {
						if (acount < 2) {
							alert("최소 주문수량은 1개 입니다.");
							return;
						}
						acount--;

						$("#count2").val(acount);
						$("#add-price").html(acount * add_price);
						$("#price-count").html(counter + acount);
						$("#total-price").html(
								(counter * price) + (acount * add_price));
					});

			jQuery('.prd-select').change(
					function() {
						var index = $(".prd-select option").index(
								$(".prd-select option:selected"));
						if (index) {
							jQuery('.select-prd').show();
							acount = 0;

						}
					});

			$(document).on("click", "#prd-del", function() {
				$(this).parents(".select-prd").hide();
				$("#price-count").html(counter);
				$("#total-price").html(counter * price);
				$("#count2").val(counted);
				$("#add-price").html(add_price);
			});
		});

		jQuery(document).ready(function() {
			jQuery('.share-btn').click(function() {
				var url = document.getElementById('my-url');

				url.select();
				document.execCommand('Copy');
				alert('URL이 복사되었습니다. \n원하는 곳에 붙여넣기(Ctrl+V)해주세요.');
			});
		});

		$(function() {
			$('.like-btn').click(
					function() {
						$(this).toggleClass("like-btn change_border");
						$('.like').toggleClass(
								"glyphicon-heart-empty glyphicon-heart");
						$('.like-txt').toggleClass("change_color");
						$('.ct').toggleClass("like-count change_color2");
					});

			var count = $(".change_color2").text();
			$(".like-btn").click(function(e) {
				count++;
				$(".change_color2").html(count);
			});

			var count = $(".like-count").text();
			$(".like-btn").click(function(e) {
				count--;
				$(".like-count").html(count);
			});
		});
		$(function() {
			$(".collapse-title a").click(function(e) {
				e.preventDefault();

				var target = $(this).attr('href');
				$(target).slideToggle(100);

			});

			$(".collapse-title a").on('click', function() {
				$(".arrow-down").toggleClass("rotate");
			});
		});	
	</script>
</body>

</html>