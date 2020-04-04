<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>

<head>
<%@ include file="/share/head_tp.jsp"%>
<style type="text/css">
.page-title {
	vertical-align: middle;
	width: auto;
}

.page-title a {
	display: block;
	float: left;
	padding-top: 5px;
	position: relative;
	z-index: 10;
}

.page-title h3 {
	padding-top: 5px;
	margin-top: 5px;
	text-align: center;
	padding-right: 35px;
}

* {
	margin: 0;
	padding: 0;
}

.message {
	border: 1px solid #ffc7c1;
	text-align: center;
	width: 96%;
	margin: auto;
	margin-top: 20px;
	height: 100px;
	padding-top: 30px;
}

.info {
	border: 1px solid #ffc7c1;
	background: #ffc7c1;
	width: 96%;
	height: 150px;
	margin: auto;
	margin-top: 20px;
	padding-top: 35px;
	padding-left: 25px;
	line-height: 40px;
	border-top-right-radius: 5px;
	border-top-left-radius: 5px;
}

.info-name {
	padding-left: 30px;
	margin-bottom: 20px;
	font-size: 18px;
	letter-spacing: 5px;
}

.info-email {
	padding-left: 22px;
	font-size: 18px;
	letter-spacing: 2px;
}

.id {
	border: 1px solid #ffc7c1;
	width: 96%;
	height: 70px;
	margin: auto;
	margin-bottom: 15px;
	padding-left: 25px;
	padding-top: 20px;
	border-top: none;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

.id-info {
	margin-left: 10px;
	font-size: 18px;
}

.btn-goimail-div {
	text-align: center;
	margin-bottom: 50px;
}

.btn-goimail {
	background-color: #ff8f83;
	color: #fff;
	width: 90%;
	height: 40px;
}

.btn-goimail:hover {
	color: white;
}
</style>
</head>

<body>
	<%@ include file="/share/top_tp.jsp"%>
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
	
			<button type="button" class="btn btn-goimail" onclick="location.href='pw_email.jsp'">임시 비밀번호 이메일로
				전송</button>
	</div>

	<%@ include file="/share/bottom_tp.jsp"%>

</body>

</html>