
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
<style type="text/css">
.product {
	margin-top: 10px;
	margin-bottom: 40px;
}

.prd-img {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

.prd-img img {
	width: 100%;
}

button {
	border: 0;
	outline: 0;
}

input {
	border: 0;
	outline: 0;
}

#my-url {
	position: absolute;
	top: 0;
	left: 0;
	width: 1px;
	height: 1px;
	margin: 0;
	padding: 0;
	border: 0;
}

.product .btn-group {
	width: 96%;
	margin-left: 2%;
	margin-top: 10px;
}

.product .btn-group button {
	width: 100px;
	height: 28px;
	font-size: 12px;
	padding: 3px;
	border-radius: 3px;
	background-color: #fff;
}

.product .btn-group .like-btn {
	border: 1px solid #ddd;
}

.product .btn-group .share-btn {
	border: 1px solid #ddd;
}

.product .btn-group .glyphicon-heart-empty {
	position: relative;
	right: 3px;
	top: 3px;
}

.product .btn-group .glyphicon-heart {
	color: #ff8f83;
	position: relative;
	right: 3px;
	top: 3px;
}

.change_border {
	border: 1px solid #ff8f83;
}

.change_color {
	color: #ff8f83;
}

.change_color2 {
	color: #ff8f83;
}

.product .btn-group .glyphicon-link {
	position: relative;
	right: 3px;
	top: 2px;
}

.prd-title {
	width: 96%;
	margin-left: 2%;
}

.prd-name {
	font-size: 15px;
	font-weight: bold;
	padding-top: 20px;
	margin-bottom: 15px;
}

.prd-price {
	margin-bottom: 15px;
}

.prd-price .price {
	font-size: 12px;
}

.prd-price div {
	display: inline;
}

.prd-delivery {
	padding-top: 10px;
	padding-bottom: 10px;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

.prd-delivery ul li:nth-child(odd) {
	width: 25%;
}

.prd-delivery ul li {
	display: inline-block;
	font-size: 12px;
}

.gdoption {
	margin-top: 15px;
	margin-bottom: 15px;
}

.gdoption .gdtitle {
	font-size: 12px;
	width: 25%;
	display: inline-block;
}

.gdoption .goods-select {
	outline: 0;
	width: 73%;
	height: 32px;
	font-size: 12px;
	color: #777;
	padding: 0px 5px;
	border: 1px solid #ff8f83;
}

.prd-total {
	padding-left: 15px;
	padding-right: 15px;
	padding-top: 10px;
	margin-bottom: 30px;
	border-top: 1px solid #000;
}

.prd-total .total-price {
	float: right;
}

.prd-action .action-btn {
	text-align: center;
	width: 100%;
}

.prd-action button {
	width: 32%;
	height: 40px;
	font-size: 12px;
	border: 1px solid #ddd;
	background-color: #fff;
}

.prd-action #action-cart {
	display: inline;
	font-size: 12px;
	background-color: #fff;
	border: 1px solid #ddd;
	margin-right: 3px;
}

.prd-action #action-like {
	margin-right: 3px;
}

.prd-action #action-orderform {
	color: #fff;
	border: 1px #ff8f83;
	background-color: #ff8f83;
}

.prd-tab {
	margin-left: 2%;
	margin-right: 2%;
}

.prd-tab li {
	width: 25%;
}

.prd-tab li a {
	margin: 0;
	padding: 8px;
	height: 36px;
	text-align: center;
	font-size: 12px;
	margin-bottom: 20px;
	color: #000;
	border: 1px solid #ddd;
	border-radius: 2px 2px 0 0;
}

.tab-content .prd-detail img {
	width: 100%;
}

.tab-content .prd-detail #prd-foot {
	padding-bottom: 50px;
}

.tab-content .prd-Info {
	border-bottom: 1px solid #ddd;
	padding-top: 20px;
	padding-bottom: 20px;
	margin-bottom: 10px
}

.tab-content .prd-Info tbody {
	font-size: 12px;
}

.prd-Info tr {
	height: 26px;
}

.prd-Info th {
	width: 25%;
}

.prd-photo .photo {
	padding-top: 10px;
}

.prd-photo h5 {
	width: 25%;
	font-size: 12px;
	padding-left: 15px;
	display: inline-block;
}

.prd-photo .star {
	float: right;
	display: inline-block;
	width: 75%;
}

.starR {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}

.starR.on {
	background-position: 0 0;
}

.prd-photo .photo-add {
	margin-top: 10px;
	height: 53px;
}

.photo-add li {
	width: 20%;
	height: 100%;
	list-style: none;
	float: right;
}

.photo-add h5 {
	font-size: 12px;
	width: 25%;
	padding-left: 15px;
	display: inline-block;
}

.photo-add .photo-files {
	float: right;
	width: 75%;
}

.clearfix:before {
	content: "";
	display: block;
	float: none;
	clear: both;
}

.photo-add img {
	width: 100%;
	image-rendering: pixelated;
}

.photo {
	margin-bottom: 10px;
}

.write {
	padding-top: 10px;
	border-top: 1px solid #ddd;
}

.write .photo-title {
	width: 100%;
	height: 32px;
	padding: 10px;
	margin-bottom: 5px;
	font-size: 14px;
	background-color: #f5f5f5;
	border: 1px solid #ffc7c1;
}

.write textarea {
	outline: 0;
	resize: none;
	width: 100%;
	height: 100px;
	padding: 10px;
	font-size: 14px;
	background-color: #f5f5f5;
	border: 1px solid #ffc7c1;
}

.photo-button {
	text-align: right;
	padding-top: 20px;
	margin-bottom: 20px;
}

.photo-button #review-submit {
	width: 70px;
	height: 34px;
	font-size: 12px;
	color: #fff;
	border: 1px solid #ff8f83;
	background-color: #ff8f83;
}

.photo-button #review-all {
	width: 90px;
	height: 34px;
	font-size: 12px;
	border: 1px solid #ddd;
	background-color: #fff;
}

.prd-review {
	border-top: 1px solid #000;
	padding-top: 10px;
}

.prd-review .list1 {
	width: 100%;
}

.prd-review .writer {
	color: #777;
	font-size: 11px;
}

.prd-review .writeDate {
	color: #777;
	font-size: 11px;
}

.prd-review .review-content {
	font-size: 12px;
	margin-top: 12px;
	margin-bottom: 12px;
}

dl {
	margin-bottom: 15px;
}

.prd-review .star {
	color: red;
	font-size: 20px;
	display: inline-block;
}

.box-left .editt {
	font-size: 11px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.box-left .txt {
	color: #777;
	font-size: 11px;
	margin-top: 12px;
}

.txt span a {
	font-size: 11px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.prd-review .list2 {
	width: 100%;
	padding-top: 10px;
	padding-bottom: 10px;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

.qna-btn {
	text-align: center;
	padding-top: 15px;
}

.qna-btn #qna-write {
	display: inline;
	width: 47%;
	height: 36px;
	font-size: 12px;
	color: #fff;
	background: #ff8f83;
	border: 1px #ff8f83;
	text-align: center;
	padding: 8px;
}

.qna-btn #qna-all {
	width: 47%;
	height: 36px;
	font-size: 12px;
	color: #000;
	background: #fff;
	border: 1px solid #ddd;
	margin-left: 2%;
}

.prd-qna .nodata {
	height: 50px;
	text-align: center;
	padding-top: 20px;
}

#navbarback {
	height: 71px;
}

.btmbar-nav {
	background: #fff;
}

#navbarback .action-btn2 {
	height: 71px;
	padding: 15px 15px;
}

#navbarback .action-btn2 button {
	width: 30%;
	height: 44px;
	font-weight: bold;
	border-radius: 3px;
}

.action-btn2 #action-cart2 {
	color: #ff8f83;
	background: #fff;
	border: 1px solid #ff8f83;
}

.action-btn2 #action-like2 {
	margin-right: 5px;
	margin-left: 5px;
	background: #fff;
	color: #ff8f83;
	border: 1px solid #ff8f83;
}

.action-btn2 #action-orderform2 {
	color: #fff;
	background: #ff8f83;
}

.information {
	display: flex;
}

.information .thumbnail {
	width: 50px;
	height: 50px;
	margin-right: 10px;
}

.information .name {
	width: auto;
	margin-bottom: 0px;
}

.product .option {
	padding-bottom: 8px;
}

.product .option .title {
	width: 30%;
	display: inline;
}

.product .option .prd-select {
	width: 70%;
	height: 30px;
	float: right;
	padding: 5px;
	border: 1px solid #ddd;
	position: relative;
	bottom: 5px;
}

.product .option .prd-select option {
	width: 70%;
}

.select-prd {
	display: none;
	background: #FFF8F4;
	border-bottom: 1px solid #ddd;
	background: #FFF8F4;
}

.select-prd .prd {
	font-size: 12px;
	margin-bottom: 0;
}

.select-prd td p {
	width: 210px;
	padding-top: 10px;
	padding-left: 20px;
}

.select-prd button {
	width: 30px;
	height: 28px;
	color: #000;
	padding: 0;
	font-size: 15px;
	text-decoration: none;
	background-color: #fff;
	border: none;
}

.select-prd button img {
	width: auto;
	height: 28px;
}

.select-prd input {
	width: 30px;
	height: 26.5px;
	text-align: center;
	font-size: 12px;
	display: inline-block;
	border: 1px solid #ddd;
	border-radius: 2px;
	vertical-align: -0.5px;
}

.select-prd .add-price {
	width: 80px;
	font-size: 12px;
	text-align: right;
}

.select-prd .cencel {
	padding: 0 10px;
}

.select-prd .cencel #prd-del {
	border: 1px solid #ff8f83;
}

.select-prd .cencel span {
	color: #ff8f83;
}

.customer_pass {
	position: fixed;
	left: 4%;
	margin-left: -20%;
	top: 35%;
	margin-top: -150px;
	display: none;
}
</style>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<form method="post"
		action="${pageContext.request.contextPath}/pay_ajax/orderform.do">
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
					<img src="${goods.imgpath}${goods.imgname}.${goods.imgext}"
						name="gImg">
				</div>
				<fieldset class="btn-group">
					<button type="button" class="like-btn" aria-label="좋아요">
						<span class="glyphicon glyphicon-heart-empty like"></span> <span
							class="like-txt">좋아요</span> <span class="like-count ct">18</span>
					</button>
					<button type="button" class="share-btn">
						<span class="glyphicon glyphicon-link"></span> <span>공유하기</span>
					</button>
					<input id="my-url" type="text" value="<%=request.getRequestURL()%>" />
				</fieldset>
				<div class="prd-title">
					<div class="prd-name" name="gname">${goods.gname}</div>
					<div class="prd-price">
						<strike class="price">${goods.gprice}</strike><b>원</b><br /> <b
							class="sale">${goods.gsale}</b><b>원</b>
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
					<div class="gdoption">
						<div class="gdtitle">상품선택</div>
						<select class="goods-select">
							<option value="active">- [필수] 옵션을 선택해 주세요. -</option>
							<option value="1">${goods.gdoption}</option>
						</select>
					</div>
					<div class="select-prd">
						<table>
							<tbody class="add-prds">
								<tr class="add-prd">
									<td>
										<p class="prd">
											<strong>${goods.gname}</strong> <br> <span>${goods.gdoption}</span>
										</p>
										<p>
											<button type="button" class="btn btnDown">
												<img src="/upload/img/마이너스.png">
											</button>
											<input type="number" value="1" min="1" max="99" name="count"
												id="count" />
											<button type="button" class="btn btnUp">
												<img src="/upload/img/플러스.png">
											</button>
										</p>
									</td>
									<td class="add-price"><span id=add-price>${goods.gsale}</span>
										<span>원</span></td>
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
					<div class="prd-total">
						<strong>총 상품금액(수량)</strong>
						<div class="total-price">
							<b id="total-price">${goods.gsale}</b> <b>원</b> <b>(</b><b
								id="price-count">1</b><b>개)</b>
						</div>
					</div>
					<div class="prd-action">
						<div class="action-btn">
							<button type="button"
								onclick="location.href='${pageContext.request.contextPath}/pay/cart.do'"
								id="action-cart">장바구니</button>
							<button type="button"
								onclick="location.href='${pageContext.request.contextPath}/myInfo/like_goods.do'"
								id="action-like">관심상품</button>
							<button type="submit"
								onclick="location.href='${pageContext.request.contextPath}/pay_ajax/orderform.do'"
								id="action-orderform">구매하기</button>
						</div>
					</div>
				</div>
			</div>
			<div class="prd-tab">
				<ul class="nav nav-tabs" id="mytab">
					<li class="active"><a href="#Tpage1" data-toggle="tab">상세정보</a></li>
					<li><a href="#Tpage2" data-toggle="tab">구매안내</a></li>
					<li><a href="#Tpage3" data-toggle="tab" id="photo_rv">상품후기(2)</a></li>
					<li><a href="#Tpage4" data-toggle="tab" id="qna_rv">Q&A(0)</a></li>
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade active in" id="Tpage1">
						<div class="prd-detail">
							<img src="/upload/img/goods_content.jpg"> <img
								src="/upload/img/goods_content2.jpg"> <img
								src="/upload/img/goods_footer.jpg" id="prd-foot">
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="Tpage2">
						<div class="prd-Info">
							<table>
								<tbody>
									<tr>
										<th><span>상품명</span></th>
										<td><span> ${goods.gname} </span></td>
									</tr>
									<tr>
										<th><span>소비자가</span></th>
										<td><span> <b>${goods.gprice}원</b>
										</span></td>
									</tr>
									<tr>
										<th><span>판매가</span></th>
										<td><span> <b>${goods.gsale}원</b>
										</span></td>
									</tr>
									<tr>
										<th><span>배송방법</span></th>
										<td><span> 택배 </span></td>
									</tr>
									<tr>
										<th><span>배송비</span></th>
										<td><span> <b>2,500원</b>(30,000원 이상 구매시 무료)
										</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="Tpage3">
						<div class="prd-photo">
							<div class="photo">
								<h5>별점</h5>
								<div class="star">
									<span class="starR on">별1</span> <span class="starR">별2</span>
									<span class="starR">별3</span> <span class="starR">별4</span> <span
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
														src="/upload/img/photo-file.PNG" border="0"
														onclick="document.all.file1.click(); document.all.file2.value=document.all.file1.value">
												</div>
											</li>
											<li>
												<div class="afile">
													<input type="file" name="file2" style="display: none;">
													<input type="text" name="file2" id="file2"
														style="display: none;"> <img
														src="/upload/img/photo-file.PNG" border="0"
														onclick="document.all.file1.click(); document.all.file2.value=document.all.file1.value">
												</div>
											</li>
											<li>
												<div class="afile">
													<input type="file" name="file2" style="display: none;">
													<input type="text" name="file2" id="file2"
														style="display: none;"> <img
														src="/upload/img/photo-file.PNG" border="0"
														onclick="document.all.file1.click(); document.all.file2.value=document.all.file1.value">
												</div>
											</li>
											<li>
												<div class="afile">
													<input type="file" name="file2" style="display: none;">
													<input type="text" name="file2" id="file2"
														style="display: none;"> <img
														src="/upload/img/photo-file.PNG" border="0"
														onclick="document.all.file1.click(); document.all.file2.value=document.all.file1.value">
												</div>
											</li>
											<li>
												<div class="afile">
													<input type="file" name="file2" style="display: none;">
													<input type="text" name="file2" id="file2"
														style="display: none;"> <img
														src="/upload/img//photo-file.PNG" border="0"
														onclick="document.all.file1.click(); document.all.file2.value=document.all.file1.value">
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="write  clearfix">
								<input type="text" class="photo-title" placeholder="제목" />
								<textarea class="photo-content" placeholder="리뷰를 남겨주세요."></textarea>
							</div>
							<div class="photo-button">
								<button type="submit" id="review-submit">리뷰 등록</button>
								<button type="button" id="review-all"
									onclick="location.href='${pageContext.request.contextPath}/community/photo_rv.jsp'">리뷰
									전체보기</button>
							</div>
							<div class="prd-review">
								<ul class="review-list" style="display: none">
									<li class="list1">
										<div class="box">
											<dl class="box-left">
												<dd class="star">${qsoutput.rvlike}</dd>
												<dd class="writer">${qsoutput.username}</dd>
												<dd class="writeDate">${qsoutput.regdate}</dd>
												<dd class="review-content"
													onclick="location.href='${pageContext.request.contextPath}/community/article.do?bbsno={{bbsno}}&bbstype={{bbstype}}'">
													${qsoutput.bbscontent}<br>
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
								<%-- 상세페이지로 이동하기 위한 URL --%>
								<c:url value="/community/article.do" var="viewUrl">
									<c:param name="bbstype" value="${item2.bbstype}" />
									<c:param name="bbsno" value="${item2.bbsno}" />
								</c:url>
							</div>
							<div class="pagenumber">
								<!-- 페이지 번호 구현 -->
								<%-- 이전 그룹에 대한 링크 --%>
								<c:choose>
									<%-- 이전 그룹으로 이동 가능하다면? --%>
									<c:when test="${pageData.prevPage > 0}">
										<%-- 이동할 URL 생성 --%>
										<c:url value="/gallery_ajax/goods.do" var="prevPageUrl">
											<c:param name="page" value="${pageData.prevPage}" />
										</c:url>
										<a href="${prevPageUrl}" class="prevok">≪</a>
									</c:when>
									<c:otherwise>
										<span class="prevno">≪</span>
									</c:otherwise>
								</c:choose>

								<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
								<c:forEach var="i" begin="${pageData.startPage}"
									end="${pageData.endPage}" varStatus="status">
									<%-- 이동할 URL 생성 --%>
									<c:url value="/gallery_ajax/goods.do" var="pageUrl">
										<c:param name="page" value="${i}" />
									</c:url>

									<%-- 페이지 번호 출력 --%>
									<c:choose>
										<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
										<c:when test="${pageData.nowPage == i}">
											<strong class="nowpage">${i}</strong>
										</c:when>
										<%-- 나머지 페이지의 경우 링크 적용함 --%>
										<c:otherwise>
											<a href="${pageUrl}" class="otherpage">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<%-- 다음 그룹에 대한 링크 --%>
								<c:choose>
									<%-- 다음 그룹으로 이동 가능하다면? --%>
									<c:when test="${pageData.nextPage > 0}">
										<%-- 이동할 URL 생성 --%>
										<c:url value="/gallery_ajax/goods.do" var="nextPageUrl">
											<c:param name="page" value="${pageData.nextPage}" />
										</c:url>
										<a href="${nextPageUrl}" class="nextok">≫</a>
									</c:when>
									<c:otherwise>
										<span class="nextno">≫</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="Tpage4">
						<div class="prd-qna">
							<div class="qna-head">
								<p class="qna-btn">
									<button type="button"
										onclick="location.href='${pageContext.request.contextPath}/community/qna_wri.do'"
										id="qna-write">상품문의하기</button>
									<button type="button"
										onclick="location.href='${pageContext.request.contextPath}/community/qna.do'"
										id="qna-all">모두보기</button>
								</p>
								<div class="qna">
									<table>
										<tbody id="qna_list">
											<c:choose>
												<%-- 조회결과가 없는 경우 --%>
												<c:when test="${qoutput == null || fn:length(qoutput) == 0}">
													<tr>
														<td colspan="9" align="center">게시물이 없습니다.</td>
													</tr>
												</c:when>
												<%-- 조회결과가 있는  경우 --%>
												<c:otherwise>
													<%-- 조회 결과에 따른 반복 처리 --%>
													<c:forEach var="item" items="${output}" varStatus="status">
														<%-- 출력을 위해 준비한 변수 --%>
														<c:set var="bbstitle" value="${item.bbstitle}" />
														<c:set var="bbscontent" value="${item.bbscontent}" />
														<c:set var="username" value="${item.username}" />
														<c:set var="qnapw" value="${item.qnapw}" />
														<c:set var="bbsno" value="${item.bbsno}" />
														<%-- 상세페이지로 이동하기 위한 URL --%>
														<c:url value="/community/article.do" var="viewUrl">
															<c:param name="bbstype" value="${item2.bbstype}" />
															<c:param name="bbsno" value="${item2.bbsno}" />
														</c:url>
														<c:choose>
															<c:when test="${!empty item2.qnapw}">
																<tr>
																	<td class="subject" id="subject"><strong>
																			<span class="glyphicon glyphicon-lock"></span> <a
																			href="${viewUrl}" class="subject" id="confirm-pw"
																			data-qnapw="${item2.qnapw}"
																			data-bbsno="${item2.bbsno}">${bbstitle}</a> <span
																			class="comment">[댓글수]</span>
																	</strong><br /> <span class="name" title="작성자">${item2.username}</span>
																		<span class="date" title="작성일">${item2.regdate}</span></td>
																</tr>
															</c:when>
															<c:otherwise>
																<tr>
																	<td class="subject"><strong> <a
																			href="${viewUrl}" class="subject">${bbstitle}</a> <span
																			class="comment">[댓글수]</span></strong><br /> <span
																		class="name" title="작성자">${item2.username}</span> <span
																		class="date" title="작성일">${item2.regdate}</span></td>
																</tr>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
									<div class="pagenumber">
										<!-- 페이지 번호 구현 -->
										<%-- 이전 그룹에 대한 링크 --%>
										<c:choose>
											<%-- 이전 그룹으로 이동 가능하다면? --%>
											<c:when test="${pageData.prevPage > 0}">
												<%-- 이동할 URL 생성 --%>
												<c:url value="/gallery_ajax/goods.do" var="prevPageUrl">
													<c:param name="page" value="${pageData.prevPage}" />
												</c:url>
												<a href="${prevPageUrl}" class="prevok">≪</a>
											</c:when>
											<c:otherwise>
												<span class="prevno">≪</span>
											</c:otherwise>
										</c:choose>

										<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
										<c:forEach var="i" begin="${pageData.startPage}"
											end="${pageData.endPage}" varStatus="status">
											<%-- 이동할 URL 생성 --%>
											<c:url value="/gallery_ajax/goods.do" var="pageUrl">
												<c:param name="page" value="${i}" />
											</c:url>

											<%-- 페이지 번호 출력 --%>
											<c:choose>
												<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
												<c:when test="${pageData.nowPage == i}">
													<strong class="nowpage">${i}</strong>
												</c:when>
												<%-- 나머지 페이지의 경우 링크 적용함 --%>
												<c:otherwise>
													<a href="${pageUrl}" class="otherpage">${i}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<%-- 다음 그룹에 대한 링크 --%>
										<c:choose>
											<%-- 다음 그룹으로 이동 가능하다면? --%>
											<c:when test="${pageData.nextPage > 0}">
												<%-- 이동할 URL 생성 --%>
												<c:url value="/gallery_ajax/goods.do" var="nextPageUrl">
													<c:param name="page" value="${pageData.nextPage}" />
												</c:url>
												<a href="${nextPageUrl}" class="nextok">≫</a>
											</c:when>
											<c:otherwise>
												<span class="nextno">≫</span>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<!-- 비밀번호 입력 모달 -->
								<div class="customer_pass" id="customer_pass">
									<b class="plz_pass">비밀번호를 입력해 주세요.</b><br> <label
										for="cs_pass" class="pass_label">비밀번호</label> <input
										type="password" name="cs_pass" class="cs_pass" id="cs_pass" /><br>

									<div class="cs_pass_2btns">
										<button type="button" class="btn btn-sm btn-ok"
											id="confirm_qnapw">확인</button>
										<button type="button"
											class="btn btn-inverse btn-sm btn-cancel"
											id="modal-cancel-btn">취소</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div id="topbt">
				<a
					style="display: scroll; position: fixed; bottom: 80px; right: 10px;"
					href="#"> <img src="/upload/img/top_btn.png">
				</a>
			</div>
			<!-- 하단 네비게이션 고정-->
			<!--- 소개 4인방 링크 -->
			<hr />
			<div class="etc">
				<a href="${pageContext.request.contextPath}/etc/page_info1.do">회사소개</a>
				<a href="${pageContext.request.contextPath}/etc/page_info2.do">이용약관</a>
				<a href="${pageContext.request.contextPath}/etc/page_info3.do">개인정보취급방침</a>
				<a href="${pageContext.request.contextPath}/etc/page_info4.do">이용안내</a>
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
					COPYRIGHT&copy; (주)뽀삐뽀삐 ALL RIGHTS RESERVED <br /> <i>DESIGN
						BY EZEN-team4</i>
				</p>
			</address>
			<div class="navbar" id="navbarback">
				<ul class="btmbar-nav clearfix navbar-fixed-bottom">
					<hr />
					<div class="prd-action2">
						<div class="action-btn2">
							<button type="button"
								onclick="location.href='${pageContext.request.contextPath }/pay/cart.do'"
								id="action-cart2">장바구니</button>
							<button type="button"
								onclick="location.href='${pageContext.request.contextPath }/myInfo/like_goods.do'"
								id="action-like2">관심상품</button>
							<button type="submit"
								onclick="location.href='${pageContext.request.contextPath}/pay_ajax/orderform.do'"
								id="action-orderform2">구매하기</button>
						</div>
					</div>
				</ul>
			</div>
		</div>
	</form>
	<script id="photo_rv_tmpl" type="text/x-handlebars-template">
        {{#each item}}
	        <ul class="review-list">
	        	<li class="list1">
			        <div class="box">
			        	<dl class="box-left">
					        <dd class="star">{{rvlike}}</dd>
					        <dd class="writer">{{username}}</dd>
					        <dd class="writeDate">{{regdate}}</dd>
					        <dd class="review-content" onclick="location.href='${pageContext.request.contextPath}/community/article.do?bbsno={{bbsno}}&bbstype={{bbstype}}'">
					    	{{bbscontent}}<br>
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
        {{/each}}
    </script>
	<script id="qna_rv_tmpl" type="text/x-handlebars-template">
        {{#each item2}}
            <tr>
			    <td class="subject"><strong> <span
				         class="glyphicon glyphicon-lock"></span> <a href="${pageContext.request.contextPath}/community/article.do?bbsno={{bbsno}}&bbstype={{bbstype}}" 
                         class="subject">{{bbstitle}}</a> <span class="comment">[{{cmtCount}}]</span>
				</strong><br /> <span class="name" title="작성자"></span> <span
				    class="date" title="작성일">{{regdate}}</span> <span>조회
						235</span></td>
			</tr>
        {{/each}}
    </script>
	<!-- Javascript -->
	<script
		src="${pageContext.request.contextPath}/share/assets/js/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/share/assets/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/share/plugins/ajax/ajax_helper.js"></script>
	<script
		src="${pageContext.request.contextPath}/share/assets/js/regex.js"></script>
	<script
		src="${pageContext.request.contextPath}/share/plugins/handlebars/handlebars-v4.0.5.js"></script>
	<!-- jQuery Ajax Form plugin CDN -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.star span').click(function() {
				$(this).parent().children('span').removeClass('on');
				$(this).addClass('on').prevAll('span').addClass('on');
				return false;
			});

			jQuery(".goods-select").change(
					function() {
						var index = $(".goods-select option").index(
								$(".goods-select option:selected"));
						if (index) {
							jQuery(".select-prd").show();
							acount = 0;

						}
					});

			var counter = 1;
			var counted = $("#count").val();
			var acount = parseInt(counted);
			var price = $(".sale").text();
			var total_price = $("#total-price").text();

			$(".btnUp").click(function(e) {
				counter++;

				$("#count").val(counter);
				$("#price-count").html(counter);
				$("#add-price").html(price * counter)
				$("#total-price").html(price * counter);
			});

			$(".btnDown").click(function(e) {
				if (counter < 2) {
					alert("최소 주문수량은 1개 입니다.");
					return;
				}
				counter--;

				$("#count").val(counter);
				$("#price-count").html(counter);
				$("#add-price").html(price * counter)
				$("#total-price").html(price * counter);
			});

			$(document).on("click", "#prd-del", function() {
				$(this).parents(".select-prd").hide();
				$("#price-count").html(counted);
				$("#total-price").html(total_price);
				$("#count").val(counted);
				$("#add-price").html(total_price);
			});
		});

		jQuery(document).ready(function() {
			jQuery('.share-btn').click(function() {
				var url = document.getElementById('my-url');
				url.select();
				document.execCommand('Copy');
				alert('URL이 복사되었습니다. \n원하는 곳에 붙여넣기(Ctrl+V)해주세요.');
			});
		})

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

		/** 포토리뷰 리스트 */
		$(function() {
			$("#photo_rv").click(
					function(e) {
						$.get("${pageContext.request.contextPath}/gallery",
								function(json) {
									var template = Handlebars.compile($(
											"#photo_rv_tmpl").html());
									var html = template(json);
									$(".prd-review").append(html);
								});
					});
		});

		/** qna 리스트 */
		$(function() {
			$("#qna_rv").click(
					function(e) {
						$.get("${pageContext.request.contextPath}/gallery",
								function(json) {
									var template = Handlebars.compile($(
											"#qna_rv_tmpl").html());
									var html = template(json);
									$("#qna_list").append(html);
								});
					});
		});

		$(function() {
			// 비밀번호 모달창 띄우기
			$("#subject").click(function(e) {
				e.preventDefault();
				$("#customer_pass").show();
			});

			$("#confirm_qnapw")
					.click(
							function(e) {
								e.preventDefault();
								var inputpw = $("#cs_pass").val();
								let current = $("#confirm-pw");
								let bbsno = current.data("bbsno");
								let qnapw = current.data("qnapw");
								console.log(qnapw);
								console.log(inputpw);
								if (qnapw == inputpw) {
									window.location = "${pageContext.request.contextPath}/community/article.do?bbstype=B&bbsno="
											+ bbsno;
								} else {
									alert("비밀번호를 확인해주세요.");
								}
							});
			$("#modal-cancel-btn").click(function() {
				$("#customer_pass").hide();
			});

		});

		$(function() {
			// #addForm에 대한 submit 이벤트롤 가로채서 Ajax 요청을 전송한다.
			$(".prd-photo")
					.ajaxForm(
							{
								// 전송 메서드 지정
								method : "POST",
								// 서버에서 200 응답을 전달한 경우 실행됨
								success : function(json) {
									console.log(json);

									// json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
									if (json.rt == "OK") {
										window.location = "${pageContext.request.contextPath}/gallery_ajax/goods.do?goodsno="
												+ json.item.goodsno;
									}
								}
							});

			$("#review-submit").click(function(e) {
				$("review-list").show();
			});
		});
	</script>
</body>

</html>