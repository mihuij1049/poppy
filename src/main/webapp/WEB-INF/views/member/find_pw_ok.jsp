<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../share/head_tp.jsp"%>
<style type="text/css">
.message {
	border-top: 1px solid #ff6261;
	border-bottom: 1px solid #ff6261;
	border-radius: 5px;
	background: #ff6261;
	width: 96%;
	height: 150px;
	text-align: center;
	margin: auto;
	margin-top: 20px;
	color: white;
}

.info {
	border: 1px solid #ffc1c7;
	width: 96%;
	margin: auto;
	margin-top: 15px;
	margin-bottom: 15px;
	padding-top: 25px;
	padding-bottom: 25px;
	padding-left: 25px;
	line-height: 35px;
	border-radius: 5px;
}

.message .send-msg {
	padding-top: 25px;
	line-height: 30px;
	font-size: 20px;
}

.info-name {
	padding-left: 30px;
	margin-bottom: 20px;
	font-size: 18px;
	letter-spacing: 2px;
}

.info-email {
	padding-left: 25px;
	font-size: 18px;
	letter-spacing: 1px;
}

.btn-login-div {
	text-align: center;
	margin-bottom: 50px;
}

.btn-login {
	width: 90%;
	height: 40px;
}

.btn-login:hover {
	font-weight: bold;
	font-size: 15px;
	color: #fff;
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