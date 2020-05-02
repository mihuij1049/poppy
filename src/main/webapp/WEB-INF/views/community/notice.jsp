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
.notice {
	margin-top: 20px;
}

.table span {
	font-size: 11px;
}

.table td {
	height: 70px;
}

.table .subject {
	vertical-align: middle;
}
.table .td .subject {

}

.row {
	margin-bottom: 50px;
}

.searchmenu {
	padding-bottom: 15px;
	margin:auto;
	text-align: center;
}



/** 비밀번호 입력 모달 */
.customer_pass {
	margin: auto;
	width: 90%;
	padding: 20px 0px;
	z-index: 1;
	border: 1px solid #ffc7c1;
	border-radius: 5px;
	background: #ffc7c1;
	text-align: center;
}

.pass_label {
	padding-top: 15px;
	padding-bottom: 15px;
}

/** 키워드 메뉴 */
.selectmenu {
	width: 70px;
	height: 27px;
	margin-left: 15px;
}

/** 검색 input */
.keyword {
	width: 170px;
	border: 1px solid;
	color: #777;
	margin-left: 5px;
}

/** 검색버튼 */
.btn-search {
	margin-left: 13px;
}

.subject {
	text-decoration: none;
	color: #777;
}

.subject:hover {
	text-decoration: none;
	color: #777;
}

.nowpage {
	border: 1px solid #ffc7c1;
	background: #ffc7c1;
	padding: 6px 10px;
	color: #ff6261;
}

.otherpage {
	border: 1px solid #ffc7c1;
	background: #ffc7c1;
	padding: 6px 10px;
	color: white;
}

.otherpage:hover {
	text-decoration: none;
	color: #333;
}

.pagenumber {
	text-align: center;
	margin-bottom: 20px;
	margin-top: 50px;
}

.prevok {
	border: 1px solid #ffc7c1;
	padding: 6px 10px;
	color: #ff6261;
	text-decoration: none;
}

.prevno {
	border: 1px solid #ffc7c1;
	padding: 6px 10px;
	color: #ffc7c1;
	text-decoration: none;
}

.nextok {
	border: 1px solid #ffc7c1;
	padding: 6px 10px;
	color: #ff6261;
	text-decoration: none;
}

.nextno {
	border: 1px solid #ffc7c1;
	padding: 6px 10px;
	color: #ffc7c1;
	text-decoration: none;
}
</style>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a> 공지사항
				</b>
			</h4>
		</div>
		<div class="notice">
			<table class="table">
				<tbody>
					<c:choose>
						<%-- 조회결과가 없는 경우 --%>
						<c:when test="${output == null || fn:length(output) == 0}">
							<tr>
								<td colspan="9" align="center">조회결과가 없습니다.</td>
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
								<c:set var="userid" value="${item.userid}" />

								<%-- 검색어가 있다면? --%>
								<c:if test="${keyword != ''}">
									<%-- 검색어에 <mark> 태그를 적용하여 형광팬 효과 준비 --%>
									<c:set var="mark" value="<mark>${keyword}</mark>" />
									<%-- 출력을 위해 준비한 변수에서 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
									<c:set var="bbstitle"
										value="${fn:replace(bbstitle, keyword, mark)}" />
									<c:set var="bbscontent"
										value="${fn:replace(bbscontent, keyword, mark)}" />
									<c:set var="username"
										value="${fn:replace(username, keyword, mark)}" />
									<c:set var="userid"
										value="${fn:replace(userid, keyword, mark)}" />
								</c:if>
								
								<%-- 상세페이지로 이동하기 위한 URL --%>
								<c:url value="/community/article.do" var="viewUrl">
									<c:param name="bbstype" value="${item.bbstype}" />
									<c:param name="bbsno" value="${item.bbsno}" />
								</c:url>
								<tr>
									<td class="subject" style="cursor: pointer;"><strong>
											<a href="${viewUrl}" class="subject">${bbstitle}</a> <span
											class="comment">[50]</span>
									</strong><br /> <span class="name" title="작성자">${item.username}</span>
										<span class="date" title="작성일">${item.regdate}</span> <span>조회
											235</span></td>
								</tr>
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
						<c:url value="/community/notice.do" var="prevPageUrl">
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
					<c:url value="/community/notice.do" var="pageUrl">
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
						<c:url value="/community/notice.do" var="nextPageUrl">
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
		<div class="row">
			<div class="searchmenu">
				<form method="get"
					action="${pageContext.request.contextPath}/community/qna.do">
					<select id="array2" class="selectmenu">
						<option value="bbstitle">제목</option>
						<option value="bbscontent">내용</option>
						<option value="username">이름</option>
						<option value="userid">아이디</option>
					</select> <label for="keyword"></label> <input type="search" name="keyword"
						id="keyword" class="keyword" value="${keyword}">
					<button type="submit" class="btn btn-sm btn-search">검색</button>
				</form>
			</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
</body>

</html>