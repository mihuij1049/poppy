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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/share/find_pw_ok.css" />
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">
			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>비밀번호 찾기 완료
					</b>
				</h4>
			</div>
			<div class="message">
				<p class="send-msg">
					임시 비밀번호가<br />
					<br /> <b>고객님의 메일로 전송되었습니다.</b>
				</p>
			</div>
			<div class="info">
				<b>아이디</b><span class="info-name">bbobikim</span><br> <b>이메일</b><span
					class="info-email">abc123@naver.com</span>
			</div>
		</div>
		<div class="btn-login-div">
			<button type="button" class="btn btn-login"
				onclick="location.href='${pageContext.request.contextPath}/member/login.do'">지금 로그인 하러 가기</button>
		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	</script>
</body>

</html>