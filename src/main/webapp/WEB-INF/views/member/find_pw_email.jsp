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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/share/find_pw_email.css" />
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->

		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>비밀번호 찾기
				</b>
			</h4>
		</div>
		<div class="info">
			<b>이 &nbsp;름</b><span class="info-name">김뽀삐</span><br> <b>이메일</b><span
				class="info-email">abc123@naver.com</span>
		</div>
		<div class=id>
			<input type="radio" value="id"><span class="id-info"><b>abc123</b></span>
			&nbsp;(개인회원, 2020-02-12 가입)
		</div>
	</div>
	<div class="btn-goimail-div">
	
			<button type="button" class="btn btn-goimail" onclick="location.href='${pageContext.request.contextPath}/member/find_pw_ok.do'">임시 비밀번호 이메일로
				전송</button>
	</div>

	<%@ include file="../share/bottom_tp.jsp"%>

</body>

</html>