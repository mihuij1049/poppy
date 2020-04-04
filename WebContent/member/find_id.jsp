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
	padding-top: 16px;
}

.auth {
	border: 1px solid #ffc7c1;
	border-bottom: none;
	width: 96%;
	height: 60px;
	margin: auto;
	padding-top: 16px;
}

.auth input {
	margin-left: 30px;
}

.name {
	border: 1px solid #ffc7c1;
	border-bottom: none;
	width: 96%;
	height: 60px;
	margin: auto;
	padding-top: 16px;
}

.email {
	border: 1px solid #ffc7c1;
	width: 96%;
	height: 60px;
	margin: auto;
	padding-top: 16px;
}

.find-id b {
	padding-left: 40px;
}

.m_type {
	margin-left: 30px;
}

.name input {
	margin-left: 55px;
}

.email input {
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

		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>아이디찾기
				</b>
			</h4>
		</div>
		<form class="find-id" id="find-id" method="post" action="../api/find_id.do">
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
			<div class="name">
				<label for="name"><b>이름</b></label> 
				<input type="text" name="user_name" id="user_name" maxlength="20" placeholder="이름을 입력해주세요." />
			</div>
			<div class="email">
				<label for="email"><b>이메일</b></label> <input type="email"
					name="user_email" id="user_email" maxlength="20" placeholder="이메일을 입력해주세요." />
			</div>

			<div class="btn-confirm-div">
				<button type="submit" class="btn btn-confirm">확인</button>
			</div>
		</form>
		<div id="result"></div>
	</div>
	<%@ include file="/share/bottom_tp.jsp"%>

	<script type="text/javascript">
	<!-- Javascript -->
			
		$(function() {
        	$("#find-id").submit(function(e) {
        		e.preventDefault();
            /** 이름 검사 */
            if (!regex.value('#user_name', '이름을 입력하세요.')) { return false; }
            if (!regex.kor('#user_name', '이름은 한글만 입력 가능합니다.')) { return false; }
            if (!regex.min_length('#user_name', 2, '이름은 최소 2자 이상 입력 가능합니다.')) { return false; }
            if (!regex.max_length('#user_name', 20, '이름은 최대 20자 까지만 입력 가능합니다.')) { return false; }
            /** 이메일 검사 */
            if (!regex.value('#user_email', '이메일을 입력하세요.')) { return false; }
            if (!regex.email('#user_email', '이메일 주소가 잘못되었습니다.')) { return false; }
        });
        
		});
		
		$(function() {
			$("#find-id").submit(function(e) {
				// <form> 태그가 submit 되어 페이지가 이동되는 것을 방지한다.
				e.preventDefault();
				
				// 사용자의 입력값을 가져온다.
				var uname = $("#user_name").val();
				console.log(uname);
				var umail = $("#user_email").val();
				console.log(umail);
				$.ajax( {
					// 결과를 읽어올 URL --> <form>태그의 action속성
					url : "../api/find_id.do",
					// 웹 프로그램에게 데이터를 전송하는 방식 --> <form> 태그의 method 속성
					method: "post",
					// 전달할 조건값은 사용자의 입력값을 활용하여 JSON형식으로 구성
					data: { user_name : uname, user_email : umail },
					// 읽어올 내용의 형식 (생략할 경우 json)
					dataType: "html",
					// 읽어온 내용을 처리하기 위한 함수
					success: function(req) {
						$("#result").html(req);
					}
				}); 
			}); 
		});
        
        

	
	</script>

</body>

</html>