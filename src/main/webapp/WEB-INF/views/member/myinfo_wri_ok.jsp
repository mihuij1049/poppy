<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../share/head_tp.jsp"%>
<style type="text/css">
.content .container {
	width: 96%;
}

.message {
	color: #fff;
	border-top: 1px solid #ff6261;
	border-bottom: 1px solid #ff6261;
	background: #ff6261;
	text-align: center;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 15px;
	padding: 20px 0;
}

.info {
	color: #fff;
	border: 1px solid #ffc7c1;
	background: #ffc7c1;
	margin: auto;
	margin-top: 1px;
	padding: 20px 0;
	padding-left: 25px;
}

.info-id {
	padding-left: 23px;
}

.info-name {
	padding-left: 30px;
	margin-bottom: 20px;
}

.info-email {
	padding-left: 25px;
}

.id {
	border: 1px solid #ffc7c1;
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

.btn2 {
	width: 100%;
	margin-top: 15px;
	margin-bottom: 50px;
}

.btn2:hover {
	background: #ff6261;
	color: #fff;
	text-decoration: none;
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
							class="glyphicon glyphicon-chevron-left"></i></a>회원가입 완료
					</b>
				</h4>
			</div>
			<div class="message">
				<b>회원가입이 완료되었습니다.</b><br> <b>김뽀삐</b><b>님은 [일반회원] 회원이십니다.</b>
			</div>
			<div class="info">
				<b>아이디</b><span class="info-id">user_id</span><br> <b>이
					&nbsp;름</b><span class="info-name">김뽀삐</span><br> <b>이메일</b><span
					class="info-email">abc123@naver.com</span>
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