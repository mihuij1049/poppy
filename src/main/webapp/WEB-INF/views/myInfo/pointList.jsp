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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/share/pointList.css" />
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>${pageTitle }
				</b>
			</h4>
		</div>
			<div class="plist_nota">
				<c:choose>
					<%-- 조회결과가 없는 경우 --%>
					<c:when test="${userInfo.sumUsedpoint==0 || userInfo.sumUsedpoint==null}">
					<div class="non-list" style="text-align:center; font-size:18px;">조회결과가 없습니다. </div>
					</c:when>
							<%-- 조회결과가 있는 경우 --%>
					<c:otherwise>
						<%-- 조회결과에 따른 반복처리 --%>
						<c:forEach var = "item"  items = "${output }"  varStatus="status">
						<c:set var="editdate" value="${item.editdate }"/>
						<c:set var="usedpoint" value="${item.usedpoint }"/>
				<table class="table table-responsive">
					<thead>
						<tr>
							<th id="used-date">${item.editdate }</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="td-title">적립금</td>
							<td class="td-mny">${item.usedpoint }원</td>
						</tr>
						<tr id="table-content">
							<td class="td-title">내용</td>
							<td class="td-mny">상품 구매</td>
						</tr>
					</tbody>
				</table>
				</c:forEach>
				</c:otherwise>
				</c:choose>
			</div>
			<div class=" paging">
				<ul class="pagination pagination-sm">
						<%--이전 그룹에 대한 링크 --%>
				
					<c:choose>
				<%--이전 그룹으로 이동 가능하다면? --%>
				<c:when test="${pageData.prevPage>0}">
					<%--이동할 URL 생성 --%>
					<c:url value="/pointList.do" var="prevPageUrl">
						<c:param name="page" value="${pageData.prevPage }" />
						<c:param name="pointList" value="${pointList}" />
					</c:url>
						<li class="disabled" id="disabled">
					<a href="${prevPageUrl }"><span>&laquo;</span></a>	
					</c:when>
						<c:otherwise>
							<li class="disabled" id="disabled">
			&laquo; </li>
		</c:otherwise>
			</c:choose>
				
					
					<!-- 활성화 버튼은 아래의 구조로 구성하시면 됩니다. sr-only는 스크린리더 전용입니다. -->
				
					<c:forEach var="i" begin="${pageData.startPage }"
				end="${pageData.endPage }" varStatus="status">
				<c:url value="/pointList.do" var="pageUrl">
					<c:param name="page" value="${i}" />
					<c:param name="pointList" value="${usedP}" />
				</c:url>
				<c:choose>
					<%--현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
					<c:when test="${pageData.nowPage==i}">
						<li class="active">
					<span><strong>${i}</strong> <span class="sr-only">(current)</span></span></li>
					</c:when>
				
					<c:otherwise>
						<li>
					<span><a href="${pageUrl}">${i}</a></span>
										</li>
					</c:otherwise>
</c:choose>
</c:forEach>
					
					<%-- 다음 그룹에 대한 링크 --%>
				
						<c:choose>
				<%--다음 그룹으로 이동 가능하다면? --%>
				<c:when test="${pageData.nextPage>0}">
					<%--이동할 URL 생성 --%>
					<c:url value="/pointList.do" var="nextPageUrl">
						<c:param name="page" value="${pageData.nextPage }" />
						<c:param name="pointList" value="${usedP}" />
					</c:url>	<li class="paging-right">
					<a href="${nextPageUrl }">&raquo;</a>	</li>
					</c:when>
						<c:otherwise>
							<li class="paging-right">
			&raquo;</li>
		</c:otherwise>
			</c:choose>
				
				</ul>
			</div>
			<div class=" paging">
				<ul class="pagination pagination-sm">
					<li class="disabled"><a href="#">&laquo;</a></li>
					<!-- 활성화 버튼은 아래의 구조로 구성하시면 됩니다. sr-only는 스크린리더 전용입니다. -->
					<li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
					<li class="paging-right"><a href="#">&raquo;</a></li>
				</ul>
			</div>
		</div>
		<%@ include file="../share/bottom_tp.jsp"%>

		<script src="../share/assets/js/jquery-3.2.1.min.js"></script>
		<script src="../share/assets/js/bootstrap.min.js"></script>
		<script type="text/javascript">
       /*  // Date 객체의 생성 --> 이 객체 안에는 기본적으로 현재 시각이 저장되어 있다.
        var mydate = new Date(); // 년, 월, 일, 시간, 분, 초를 리턴받기
        var yy = mydate.getFullYear();
        // 월은 0이 11월 11이 12월을 의미한다. 그러므로 1을 증가시켜준다.
        var mm = mydate.getMonth() + 1;
        var dd = mydate.getDate();

        var hh = mydate.getHours();
        var mi = mydate.getMinutes();
        var ss = mydate.getSeconds();
        var result = yy + "-" + mm + "-" + dd;
        document.getElementById("today").innerHTML = result; */
        </script>
</body>

</html>