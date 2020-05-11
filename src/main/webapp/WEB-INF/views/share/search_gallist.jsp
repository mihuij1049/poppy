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
	float: left;
	padding: 0px 10px;
	border: 0px;
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
				<!-- 게시물 영역 시작 -->
				<div>
					<c:forEach var="item" items="${output}" varStatus="status">
						<div>
							<div class="pr_box">
								<div class="pr_in_box">
									<a href="${pageContext.request.contextPath }/gallery_ajax/goods.do?goodsno=${item.goodsno}">
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
									<button type="button" class="btn btn-inverse delete-one"
									id="delete-one" data-heartno="${item.heartno}">♥</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
			</div>
		</div>
	<%@ include file="../share/bottom_tp.jsp"%>
</body>
</html>