<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
<%@ include file="../share/head_tp.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/share/photo_rv.css" />
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">
			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>포토리뷰
					</b>
				</h4>
			</div>
			<div class="container_1">
				<div>
					<form>
						<div class="pr_search_tab_bg">
							<div class="pr_search_tab">
								<div class="cate_ip">
									<i class="glyphicon glyphicon-th-list icon_size"></i> 카테고리선택
								</div>
								<select name="category" class="cate_select">
									<option value="">푸드</option>
									<option value="">의류</option>
									<option value="">외출용품</option>
									<option value="">대형견코너</option>
									<option value="">홈리빙</option>
								</select>
								<div>
									<div class="cate_ip">
										<i class="glyphicon glyphicon-search icon_size"></i> 리뷰검색
									</div>
									<form method="get" action="${pageContext.request.contextPath}/community/photo_rv.do">
										<input type="search" name="keyword" id="keyword" class="h_input" value="${keyword}">
										<button type="submit" class="btn" id="sc_bt">검색</button>
									</form>
									<a href="${pageContext.request.contextPath}/community/photo_wri.do"><div class="pencil"><i class="glyphicon glyphicon-pencil"></i>글쓰기</div></a>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div id="result">
				<c:set var="a" value="${keyword}" />
				<c:if test="${a == null}">
					<!-- 게시물 하나 시작 -->
					<c:forEach var="item" items="${output}" varStatus="status">
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
				</c:if>
				<c:set var="a" value="${keyword}" />
				<c:if test="${keyword != null}">					
					<!-- 게시물 하나 시작 -->
					<c:forEach var="item" items="${output}" varStatus="status">
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
				</c:if>
				</div>
				<%-- 조회결과가 없는 경우 --%>
					<c:if test="${output == null || fn:length(output) == 0}">
						조회결과가 없습니다.
					</c:if>
				</div>
				<div class="pagenumber">
				<!-- 페이지 번호 구현 -->
				<%-- 이전 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/community/photo_rv.do" var="prevPageUrl">
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
					<c:url value="/community/photo_rv.do" var="pageUrl">
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
						<c:url value="/community/photo_rv.do" var="nextPageUrl">
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
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	
	<script type="text/javascript">
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