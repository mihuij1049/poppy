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

</style>
<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>
								전체상품
				</b>
			</h4>
		</div>
			<div class="container_1">
				<div>
					<div class="ppbanner">
						<img src="${pageContext.request.contextPath }/share/img/ppbanner4.jpg">
					</div>
				<!-- 게시물 영역 시작 -->
				<div id="result">
					<c:forEach var="item" items="${output}" varStatus="status">
						<div>
							<div class="pr_box">
								<div class="pr_in_box">
									<a href="${pageContext.request.contextPath }/gallery_ajax/goods.do?goodsno=${item.goodsno}">
										<img alt="사진" src="${item.imgpath}" class="img_size">
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
				<br class="clear">
			<div class="pagenumber">
				<%-- 전체상품을 조회했을 때 나타나는 페이지 번호 --%>
				<%-- 페이지 번호 구현 --%>
				<%-- 이전 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/gallery/gal_list_all.do" var="prevPageUrl">
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
					<c:url value="/gallery/gal_list_all.do" var="pageUrl">
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
						<c:url value="/gallery/gal_list_all.do" var="nextPageUrl">
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
	<br>
		
	<%@ include file="../share/bottom_tp.jsp"%>
	
	<script type="text/javascript">
	
	$("#result").on("click", "#insert-one", function(e) {
        e.preventDefault();
  
        if (${empty userInfo.userid}) {
        	alert("로그인 후 이용해 주세요.")
        	window.location="${pageContext.request.contextPath}/member/login.do";
        } else {
        
       	let goodsno = $(this).data("goodsno");
        $.post("${pageContext.request.contextPath}/gallery/in_item",
              { "goodsno" : goodsno },
                   function(json) {
                     if(json.rt=="OK");
                  }
              )
        }
        /* $(this).css('color', 'red');
        clicked = false; */
     });
	
	/* cate1 에 대한 셀렉트 */
	$(function() {
    	$(document).on('change', '#cate_select', function(e) {
    		var choice = $(this).find("option:selected").val();
        	if(!choice) {
        		return false;
        	}
        	<c:forEach var="item" items="${output}" varStatus="status" end="0">
        	location.href="../gallery/gal_list_select.do?cate1=${item.cate1}"+"&searchCondition="+choice;
        	</c:forEach>
    	});
    });
	
	/* cate2 에 대한 셀렉트 */
	$(function() {
    	$(document).on('change', '#cate_select2', function(e) {
    		var choice = $(this).find("option:selected").val();
        	if(!choice) {
        		return false;
        	}
        	<c:forEach var="item" items="${output}" varStatus="status" end="0">
        	location.href="../gallery/gal_list_select2.do?cate2=${item.cate2}"+"&searchCondition2="+choice;
        	</c:forEach>
    	});
    });
	
    </script>
</body>

</html>