<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>

<head>
<%@ include file="../share/head_tp.jsp"%>
<style type="text/css">
.find {
	margin-top: 10px;
}

.member {
	border: 1px solid #ffc7c1;
	border-bottom: none;
	width: 96%;
	height: 60px;
	margin: auto;
	margin-top: 20px;
	padding-top: 19px;
}

.auth {
	border: 1px solid #ffc7c1;
	border-bottom: none;
	width: 96%;
	height: 60px;
	margin: auto;
	padding-top: 19px;
}

.auth input {
	margin-left: 30px;
}

.user_id {
	border: 1px solid #ffc7c1;
	border-bottom: none;
	width: 96%;
	height: 60px;
	margin: auto;
	padding-top: 19px;
}

.user_id input {
	margin-left: 40px;
}

.user_name {
	border: 1px solid #ffc7c1;
	border-bottom: none;
	width: 96%;
	height: 60px;
	margin: auto;
	padding-top: 19px;
}

.user_email {
	border: 1px solid #ffc7c1;
	height: 60px;
	width: 96%;
	margin: auto;
	padding-top: 19px;
}

.find-pw b {
	padding-left: 40px;
}

.m_type {
	margin-left: 30px;
}

.user_name input {
	margin-left: 55px;
}

.user_email input {
	margin-left: 40px;
}

/** 확인버튼 전체영역 */
.btn-confirm-div {
	text-align: center;
}

/** 확인버튼 */
.btn-confirm {
	width: 90%;
	height: 40px;
	margin-top: 15px;
	margin-bottom: 50px;
}

.btn-confirm:hover {
	color: white;
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
							class="glyphicon glyphicon-chevron-left"></i></a>비밀번호 찾기
					</b>
				</h4>
			</div>
			<form id="find-pw" class="find-pw" name="find-pw" method="post" action="${pageContext.request.contextPath}/member/find_pw_email.do">
				<div class="member">
					<b>회원구분</b> <select name="m_type" class="m_type">
						<option value="개인회원">개인회원</option>
						<option value="개인 사업자회원">개인 사업자회원</option>
						<option value="법인 사업자회원">법인 사업자회원</option>
						<option value="외국인회원">외국인회원</option>
					</select>
				</div>
				<div class="auth">
					<b>인증방법</b> <input type="radio" name="auth" value="email" checked>이메일
				</div>
				<div class="user_id">
					<b>아이디</b> <input type="text" name="user_id" id="user_id" maxlength="20"
						placeholder="아이디를 입력해주세요.">
				</div>
				<div class="user_name">
					<b>이름</b> <input type="text" name="user_name" id="user_name"
						maxlength="20" placeholder="이름을 입력해주세요.">
				</div>
				<div class="user_email">
					<b>이메일</b> <input type="email" name="user_email" id="user_email"
						maxlength="20" placeholder="이메일을 입력해주세요.">
				</div>
				<div class="btn-confirm-div">
					<button type="submit" class="btn btn-confirm">확인</button>
				</div>
			</form>
			<div id="result"></div>
		</div>
		
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	<script type="text/javascript">
		 $(function() {
				$("#find-pw").submit(function(e) {
					// <form> 태그가 submit 되어 페이지가 이동되는 것을 방지한다.
					/* e.preventDefault(); */
					
					
					/**아이디 검사 */
		            if (!regex.value('#user_id', '아이디를 입력하세요.')) { return false; }
		            if (!regex.eng_num('#user_id', '아이디는 영어와 숫자 조합만 입력 가능합니다.')) { return false; }
		            if (!regex.min_length('#user_id', 4, '아이디는 최소 4자 이상 입력 가능합니다.')) { return false; }
		            if (!regex.max_length('#user_id', 20, '아이디는 최대 20자 까지만 입력 가능합니다.')) { return false; }
		            /** 이름 검사 */
		            if (!regex.value('#user_name', '이름을 입력하세요.')) { return false; }
		            if (!regex.kor('#user_name', '이름은 한글만 입력 가능합니다.')) { return false; }
		            if (!regex.min_length('#user_name', 2, '이름은 최소 2자 이상 입력 가능합니다.')) { return false; }
		            if (!regex.max_length('#user_name', 20, '이름은 최대 20자 까지만 입력 가능합니다.')) { return false; }
		            /** 이메일 검사 */
		            if (!regex.value('#user_email', '이메일을 입력하세요.')) { return false; }
		            if (!regex.email('#user_email', '이메일 주소가 잘못되었습니다.')) { return false; }
		            
		            
					// 사용자의 입력값을 가져온다.
					var uid = $("#user_id").val();
					console.log(uid);
					var uname = $("#user_name").val();
					console.log(uname);
					var umail = $("#user_email").val();
					console.log(umail);
					/* $.ajax( {
						// 결과를 읽어올 URL --> <form>태그의 action속성
						url : "../api/find_pw.do",
						// 웹 프로그램에게 데이터를 전송하는 방식 --> <form> 태그의 method 속성
						method: "post",
						// 전달할 조건값은 사용자의 입력값을 활용하여 JSON형식으로 구성
						data: { user_id : uid, user_name : uname, user_email : umail },
						// 읽어올 내용의 형식 (생략할 경우 json)
						dataType: "html",
						// 읽어온 내용을 처리하기 위한 함수
						success: function(req) {
							$("#result").html(req);
						}
					});  */
				}); 
			});
	</script>
</body>

</html>