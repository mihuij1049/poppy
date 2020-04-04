<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>

<head>
<%@ include file="/share/head_tp.jsp"%>
<style type="text/css">
.message {
	border-top: 1px solid #ff6261;
	border-bottom: 1px solid #ff6261;
	background: #ff6261;
	width: 96%;
	text-align: center;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 15px;
	height: 70px;
	padding-top: 20px;
}

.message b {
	color: white;
}

.info {
	border: 1px solid #ffc7c1;
	background: #ffc7c1;
	width: 96%;
	height: 90px;
	margin: auto;
	margin-top: 1px;
	padding-top: 25px;
	padding-left: 25px;
}

.info-name {
	padding-left: 30px;
	margin-bottom: 20px;
}

.info-email {
	padding-left: 22px;
}

.id {
	border: 1px solid #ffc7c1;
	width: 96%;
	height: 50px;
	margin: auto;
	margin-bottom: 15px;
	padding-left: 25px;
	padding-top: 12px;
	border-top: none;
}

.id-info {
	margin-left: 10px;
}

.btns {
	text-align: center;
	margin-bottom: 50px;
}

.btn1 {
	width: 45%;
	height: 40px;
	margin-right: 10px;
}

.btn2 {
	width: 45%;
	height: 40px;
}

.btn1:hover {
	color: white;
}

.btns>a:hover {
	text-decoration: none;
}
</style>
</head>

<body>
	<%@ include file="/share/top_tp.jsp"%>

	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">
			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>아이디 찾기 완료
					</b>
				</h4>
			</div>
			<div class="message">
				<b>아이디 찾기가 완료되었습니다.</b>
			</div>
			<div class="info">
				<b>이 &nbsp;름</b><span class="info-name">김뽀삐</span><br> <b>이메일</b><span
					class="info-email">abc123@naver.com</span>
			</div>
			<div class=id>
				<input type="radio" value="id"><span class="id-info">abc123&nbsp;(개인회원,
					2020-02-12 가입)</span>
			</div>
		</div>
		<div class="btns">
			
				<button type="button" class="btn btn1" onclick="location.href='login.jsp'">로그인</button>
		
				<button type="button" class="btn btn-inverse btn2" onclick="location.href='find_pw.jsp'">비밀번호 찾기</button>
			</a>
		</div>
	</div>
	<%@ include file="/share/bottom_tp.jsp"%>
	</script>

</body>

</html>