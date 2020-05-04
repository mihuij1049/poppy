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
						class="glyphicon glyphicon-chevron-left"></i></a>
						<c:forEach var="item" items="${output}" varStatus="status" end="0">
							${item.cate1}
						</c:forEach>
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
				<c:forEach var="item" items="${output}" varStatus="status">
				<div>
					<div class="pr_box">
						
							<div class="pr_in_box">
								<a href="${pageContext.request.contextPath }/gallery/goods.do">
								<img alt="사진" src="${item.imgpath}${item.imgname}.jpg" class="img_size">
									<h5>
										<div class="gnameblock"  style="height: 32px">
											<b>
												${item.gname}
											</b>
										</div>
									</h5>
									<hr />
									${item.gprice}원
								</a>
								<div id="pay">
									<i class="glyphicon glyphicon-heart-empty"></i>
								</div>
							</div>
					</div>
				</div>
				</c:forEach>
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