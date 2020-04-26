<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<%@ include file="../share/head_tp.jsp"%>
<style type="text/css">
.login {
	margin: 80px 30px;
}

input[type="text"], input[type="password"] {
	width: 100%;
	line-height: 40px;
	border-radius: 5px;
	font-size: 16px;
	padding-left: 10px;
}

.login-go {
	margin-top: 30px;
	width: 100%;
	font-size: 18px;
	height: 45px;
}

.login-go:hover {
	font-size: 20px;
	color: #fff;
}

.help-user {
	width: 90%;
	margin: auto;
	margin-top: -30px;
	margin-bottom: 50px;
}

.help-user>a {
	display: block;
	float: left;
	text-align: center;
	text-decoration: none;
	color: #191919;
	width: 33%;
	height: 30px;
}

.help-user>a:hover {
	text-decoration: none;
	color: #ff8f83;
	font-size: 16px;
	font-weight: bold;
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
							class="glyphicon glyphicon-chevron-left"></i></a>로그인
					</b>
				</h4>
			</div>
			<div class="login">
				<form id="login" name="login" method="post" action="../api/post.do">
					<p>
						<input type="text" name="user_id" id="user_id" placeholder="&nbsp;아이디">
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
	$(function() {
		$("#login").submit(function(e) {
			// <form> 태그가 submit 되어 페이지가 이동되는 것을 방지한다.
			e.preventDefault();
			
			// 사용자의 입력값을 가져온다.
			var uid = $("#user_id").val();
			console.log(uid);
			var pwd = $("#user_pw").val();
			console.log(pwd);
			$.ajax( {
				// 결과를 읽어올 URL --> <form>태그의 action속성
				url : "../api/post.do",
				// 웹 프로그램에게 데이터를 전송하는 방식 --> <form> 태그의 method 속성
				method: "post",
				// 전달할 조건값은 사용자의 입력값을 활용하여 JSON형식으로 구성
				data: { user_id : uid, user_pw : pwd },
				// 읽어올 내용의 형식 (생략할 경우 json)
				dataType: "html",
				// 읽어온 내용을 처리하기 위한 함수
				success: function(req) {
					$("#result").html(req);
				}
			}); // end $.ajax
		}); // end submit
	});
	</script>
</body>

</html>