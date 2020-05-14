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
	href="${pageContext.request.contextPath}/share/photo.css?ver=1" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Poppy-Poppy</title>

</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>

	<div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>포토리뷰
				</b>
			</h4>
		</div>
		<div class="container">
			<img src="${output.imgpath}${output.imgname}.${output.imgext}" alt="리뷰사진" class="big-image">
			<div class="info-box">
				<a href="${pageContext.request.contextPath}/gallery/goods.do"><img
					src="${output.gipath}${output.giname}.${output.giext}" class="small-image"></a>
				<div class="info-content clear">
					<a href="${pageContext.request.contextPath}/gallery/goods.do">
						${output.bbstitle}</a><br>
					<div class="star">
						<p>${output.rvlike}</p>
						<br>
					</div>
					<div class="writer">
						<p>(${fn:substring(output.username,0,1)}**)</p>
					</div>
				</div>
			</div>
			<div class="rv-content">
				<p class="date">${output.regdate}</p>
				<p>${output.bbscontent}</p>
			</div>
			<div class="recommend">
				<p>이 리뷰가 도움이 되셨다면 눌러주세요.</p>
				<button class="btn" id="recommend">추천</button>
			</div>
			<div class="rv-footer">
				<p>관리자에게만 댓글작성 권한이 있습니다.</p>
			</div>
		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	<!-- Javascript -->
	<script type="text/javascript">
		$(function() {
			var count = 5;
			$("#recommend").click(function() {
				if (count == 5) {
					alert("추천되었습니다.");
					count++;
					$("#rvcount").html(count);
				} else {
					alert("이 게시물에는 더이상 추천하실 수 없습니다.")
				}
			});
		});
	</script>
</body>

</html>