<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>

<head>
<%@ include file="/share/head_tp.jsp"%>
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

.user-id {
	border: 1px solid #ffc7c1;
	border-bottom: none;
	width: 96%;
	height: 60px;
	margin: auto;
	padding-top: 19px;
}

.user-id input {
	margin-left: 40px;
}

.user-name {
	border: 1px solid #ffc7c1;
	border-bottom: none;
	width: 96%;
	height: 60px;
	margin: auto;
	padding-top: 19px;
}

.user-email {
	border: 1px solid #ffc7c1;
	height: 60px;
	width: 96%;
	margin: auto;
	padding-top: 19px;
}

.find-pw b {
	padding-left: 50px;
}

.m_type {
	margin-left: 30px;
}

.user-name input {
	margin-left: 55px;
}

.user-email input {
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
	<%@ include file="/share/top_tp.jsp"%>
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
			<form method="post" class="find-pw" id="find-pw"
				action="../member/find_pw_email.jsp">
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
				<div class="user-id">
					<b>아이디</b> <input type="text" name="id" id="user-id" maxlength="20"
						placeholder="아이디를 입력해주세요.">
				</div>
				<div class="user-name">
					<b>이름</b> <input type="text" name="name" id="user-name"
						maxlength="20" placeholder="이름을 입력해주세요.">
				</div>
				<div class="user-email">
					<b>이메일</b> <input type="email" name="email" id="user-email"
						maxlength="20" placeholder="이메일을 입력해주세요.">
				</div>
				<div class="btn-confirm-div">
					<button type="submit" class="btn btn-confirm">확인</button>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/share/bottom_tp.jsp"%>
	<script type="text/javascript">
	
		 $(function() {
        $("#find-pw").submit(function(e) {
            
            /**아이디 검사 */
            if (!regex.value('#user-id', '아이디를 입력하세요.')) { return false; }
            if (!regex.eng_num('#user-id', '아이디는 영어와 숫자 조합만 입력 가능합니다.')) { return false; }
            if (!regex.min_length('#user-id', 4, '아이디는 최소 4자 이상 입력 가능합니다.')) { return false; }
            if (!regex.max_length('#user-id', 20, '아이디는 최대 20자 까지만 입력 가능합니다.')) { return false; }
            /** 이름 검사 */
            if (!regex.value('#user-name', '이름을 입력하세요.')) { return false; }
            if (!regex.kor('#user-name', '이름은 한글만 입력 가능합니다.')) { return false; }
            if (!regex.min_length('#user-name', 2, '이름은 최소 2자 이상 입력 가능합니다.')) { return false; }
            if (!regex.max_length('#user-name', 20, '이름은 최대 20자 까지만 입력 가능합니다.')) { return false; }
            /** 이메일 검사 */
            if (!regex.value('#user-email', '이메일을 입력하세요.')) { return false; }
            if (!regex.email('#user-email', '이메일 주소가 잘못되었습니다.')) { return false; }
        });
    });
	</script>
</body>

</html>