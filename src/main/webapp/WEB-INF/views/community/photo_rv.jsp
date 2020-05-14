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
										<i class="glyphicon glyphicon-search icon_size"></i> 상품검색
									</div>
									<form method="get" action="${pageContext.request.contextPath}/community/photo_rv.do">
										<input type="search" name="keyword" class="h_input">
										<button type="submit" class="btn" id="sc_bt" value="${keyword}">검색</button>
									</form>
									<a href="${pageContext.request.contextPath}/community/photo_wri.do"><div class="pencil"><i class="glyphicon glyphicon-pencil"></i>글쓰기</div></a>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div>
				<c:set var="a" value="${keyword}" />
				<c:if test="${a == null}">
					<!-- 게시물 하나 시작 -->
					<c:forEach var="item" items="${output}" varStatus="status">
					<div width="50%">
						<div class="pr_box">
							<div class="pr_in_box">
								<a href="${pageContext.request.contextPath}/community/photo.do"> <img alt="사진"
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
								<button class="btn btn-inverse" id="heart_bt">
									<i class="glyphicon glyphicon-heart icon_size"></i> 추천
								</button>
							</div>
						</div>
					</div>			
					</c:forEach>
					<!-- 게시물 하나 끝 -->
				</c:if>
				<c:set var="a" value="${keyword}" />
				<c:if test="${a == a}">
					<!-- 게시물 하나 시작 -->
					<c:forEach var="item" items="${output}" varStatus="status">
					<div width="50%">
						<div class="pr_box">
							<div class="pr_in_box">
								<a href="${pageContext.request.contextPath}/community/photo.do"> <img alt="사진"
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
								<button class="btn btn-inverse" id="heart_bt">
									<i class="glyphicon glyphicon-heart icon_size"></i> 추천
								</button>
							</div>
						</div>
					</div>			
					</c:forEach>
					<!-- 게시물 하나 끝 -->
				</c:if>	
				</div>
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
		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	<script type="text/javascript">
    $(function() {
        $('.pr_box button').click(function() {
            $(this).toggleClass("btn, btn-inverse");
        });
    });
    </script>
</body>

</html>