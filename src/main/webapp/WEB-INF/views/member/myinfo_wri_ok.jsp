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
	href="${pageContext.request.contextPath}/share/myinfo_wri_ok.css" />

</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">
			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>회원가입 완료
					</b>
				</h4>
			</div>
			<div class="message">
				<b>회원가입이 완료되었습니다.</b><br> <b>${newmembers.username }</b><b>님은 [일반회원] 회원이십니다.</b>
			</div>
			<div class="info">
				<b>아이디</b><span class="info-id">${newmembers.userid }</span><br> <b>이
					&nbsp;름</b><span class="info-name">${newmembers.username }</span><br> <b>이메일</b><span
					class="info-email">${newmembers.useremail }</span>
			</div>
			<div class="btns">
				<a href="${pageContext.request.contextPath}/index/index.do">
					<button type="button" class="btn btn2">완료</button>
				</a>
			</div>
		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	<!-- Javascript -->
	<script type="text/javascript">
		
	</script>
</body>

</html>