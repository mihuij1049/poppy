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

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>BEST
				</b>
			</h4>
		</div>
			<div class="container_1">
				<div>
					<form>
						<div class="search_tab_bg">
							<select name="category" class="cate_select">
								<option value="">정렬방식</option>
								<option value="">신상품</option>
								<option value="">상품명</option>
								<option value="">낮은가격</option>
								<option value="">높은가격</option>
								<option value="">상품후기</option>
							</select>
						</div>
					</form>
				</div>
					<!-- 게시물 하나 시작 -->
				<c:forEach var="item" items="${output1}" varStatus="status">
				<div>
					<div class="pr_box">
						
							<div class="pr_in_box">
								<a href="${pageContext.request.contextPath }/gallery/goods.do"> <img alt="사진"
									src="../share/img/gal_list_img1.jpg" class="img_size">
									<div>
										<h5>
											<b>
												${item.gname}
											</b>
										</h5>
										<hr />
										${item.gprice}원</a>
								<div id="pay">
									<i class="glyphicon glyphicon-heart-empty"></i>
								</div>
							</div>
					</div>
				</div>
				</c:forEach>
			</div>
			<!-- 페이지 번호 구현 -->
			<%-- 이전 그룹에 대한 링크 --%>
			<c:choose>
				<%-- 이전 그룹으로 이동 가능하다면? --%>
				<c:when test="${pageData.prevPage > 0 }">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/gallery/gal_list_food.do" var="prevPageUrl">
						<c:param name="page" value="${pageData.prevPage}" />
					</c:url>
					<a href="${prevPageUrl}">[이전]</a>
				</c:when>
				<c:otherwise>
					[이전]
				</c:otherwise>
			</c:choose>
			
			<%-- 페이지 번호(시작 페이지부터 끝 페이지까지 반복) --%>
			<c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
				<%-- 이동할 URL 생성 --%>
				<c:url value="/gallery/gal_list_food.do" var="pageUrl">
					<c:param name="page" value="${i}" />
				</c:url>
				<%-- 페이지 번호 출력 --%>
				<c:choose>
					<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
					<c:when test="${pageData.nowPage == i}">
						<strong>[${i}]</strong>
					</c:when>
					<%-- 나머지 페이지의 경우 링크 적용함 --%>
					<c:otherwise>
						<a href="${pageUrl}">[${i}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<%-- 다음 그룹에 대한 링크 --%>
			<c:choose>
				<%-- 다음 그룹으로 이동 가능하다면? --%>
				<c:when test="${pageData.nextPage > 0}">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/gallery/gal_list_food.do" var="nextPageUrl">
						<c:param name="page" value="${pageData.nextPage}" />
					</c:url>
					<a href="${nextPageUrl}">[다음]</a>
				</c:when>
				<c:otherwise>
					[다음]
				</c:otherwise>
			</c:choose>
			
			<div class="text-center">
				<ul class="pagination pagination-sm">
					<li class="disabled"><a href="#">&laquo;</a></li>
					<li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
		</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	<script type="text/javascript">
    $(function() {
        $('.pr_in_box i').click(function() {
            $(this).toggleClass("glyphicon-heart glyphicon-heart-empty");
        });
    });
    </script>
</body>

</html>