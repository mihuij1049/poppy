<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>

<head>
<%@ include file="../share/head_tp.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/share/article.css" />
	<style type="text/css">
	
}
</style>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">

			<div class="page-title clearfix">

				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a> 
							공지사항
				</b>
				</h4>

			</div>
			<div class="wriinfo">
						<b class="articletitle">[공지사항] ${output.bbstitle}</b>
				<p class="articlewriter">${output.username }</p>
			</div>
			<div class="nai">
				<p id="main_text">${output.bbscontent}</p>
			</div>

					<hr class="solidhr">
					<button type="button"
						onclick="location.href='${pageContext.request.contextPath}/community/notice.do'"
						class="btn btn-inverse btn-sm list" style="margin-bottom: 10px;">목록</button>
					<hr class="solidhr">

			<div class="comment-list">
				<hr class="solidhr">
			</div>
		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
</body>
</html>