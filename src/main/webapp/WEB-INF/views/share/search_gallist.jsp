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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/share/gal_list.css" />
</head>
<style>
.pr_in_box button {
	float: right;
	width: 50px;
	height: 45px;
	padding: 0px 10px;
	border: 0px;
	font-size: 13px;
}
</style>
<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>
						검색결과
				</b>
			</h4>
		</div>
			<div class="container_1">
			<c:choose>
				<%-- 조회결과 있으면 --%>
				<c:when test="${output == null || fn:length(output) == 0 }">
					조회결과가 없습니다.
				</c:when>
				<c:otherwise>
				<%-- 게시물 영역 시작 --%>
				<div id="result">
					<c:forEach var="item" items="${output}" varStatus="status">
						<div>
							<div class="pr_box">
								<div class="pr_in_box">
									<a href="${pageContext.request.contextPath }/gallery_ajax/goods.do?goodsno=${item.goodsno}">
										<img alt="사진" src="${item.imgpath}${item.imgname}.jpg" class="img_size">
											<h5>
												<div class="gnameblock">
													<b>${item.gname}</b>
												</div>
											</h5>
										<hr />
									</a>
									<div class="price_box">
										<span id="gprice"><del>₩${item.gprice}원</del></span>
										<button type="submit" class="btn btn-inverse insert-one" id="insert-one" data-heartno="${item.heartno}" data-goodsno="${item.goodsno}">
										like
										♥
										</button>
										<br>
										<span id="gsale"><b>₩${item.gsale}원</b></span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="pagenumber">
				<!-- 페이지 번호 구현 -->
				<%-- 이전 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/gallery/gal_list_search.do" var="prevPageUrl">
							<c:param name="page" value="${pageData.prevPage}" />
							<c:param name="keyword" value="${keyword}" />
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
					<c:url value="/gallery/gal_list_search.do" var="pageUrl">
						<c:param name="page" value="${i}" />
						<c:param name="keyword" value="${keyword}" />
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
						<c:url value="/gallery/gal_list_search.do" var="nextPageUrl">
							<c:param name="page" value="${pageData.nextPage}" />
							<c:param name="keyword" value="${keyword}" />
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
	<%@ include file="../share/bottom_tp.jsp"%>
</body>
</html>