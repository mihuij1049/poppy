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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/share/login.css" />
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">
			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>로그인
					</b>
				</h4>
			</div>
			<div class="login">
				<form id="login" name="login" method="post" action="${pageContext.request.contextPath }/member/login_ok.do">
					<p>
						<input type="text" name="user_id" id="user_id" placeholder="&nbsp;아이디 ${user_id }">
					</p>
					<p>
						<input type="password" name="user_pw" id="user_pw" placeholder="&nbsp;비밀번호">
					</p>
					<p>
						<input type="checkbox" name="login_keep value=" Y" /> 로그인
						상태유지&nbsp; <span class="glyphicon glyphicon-lock"></span> 보안접속
					</p>
					<p>
						<button type="submit" class="login-go btn">로 그 인</button>
					</p>
				</form>
			</div>
			<div class="help-user clearfix" id="help-user">
				<a href="${pageContext.request.contextPath}/member/find_id.do">아이디찾기</a> <a href="${pageContext.request.contextPath}/member/find_pw.do">비밀번호찾기</a> <a
					href="${pageContext.request.contextPath}/member/agree_0.do">회원가입</a>
			</div>
			<div id="result"></div>
		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	<script type="text/javascript">
	</script>
</body>

</html>