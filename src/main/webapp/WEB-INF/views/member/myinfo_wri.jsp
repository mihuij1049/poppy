<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../share/head_tp.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/share/myinfo_wri.css" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Poppy-Poppy</title>
<!-- 플러그인 CSS 참조 -->
<link rel="stylesheet"
	href="../share/plugins/sweetalert/sweetalert2.min.css" />

</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>정보입력
				</b>
			</h4>
		</div>
		<div class="container">
			<form class="form-horizontal" name="join_form" id="join_form"
				method="post"
				action="${pageContext.request.contextPath}/member/join_members_ok.do">
				<input type="hidden" name="useagree" value="${agree_ok.useagree }" />
				<input type="hidden" name="privateagree"
					value="${agree_ok.privateagree }" /> <input type="hidden"
					name="emailagree" value="${agree_ok.emailagree }" /> <input
					type="hidden" name="shoppingagree"
					value="${agree_ok.shoppingagree }" />
				<div class="id-box join-form">
					<label for="user_id"> 아이디<span>＊</span>
					</label> <input type="text" name="user_id" id="user_id" maxlength="20">
					<button type="button" class="btn btn2 id-btn" id="id_check">
						<p>중복확인</p>
					</button>
				</div>
				<div class="join-form">
					<label for="user_pw"> 비밀번호<span>＊</span>
					</label> <input type="password" name="user_pw" id="user_pw" maxlength="20">
				</div>
				<div class="join-form">
					<label for="user_pw"> 비밀번호<br>확인<span>＊</span>
					</label> <input type="password" name="user_pw_re" id="user_pw_re"
						maxlength="20">
				</div>
				<div class="join-form">
					<label for="user_name"> 이름<span>*</span>
					</label> <input type="text" name="user_name" id="user_name" maxlength="20">
				</div>
				<div class="join-form">
					<label for="tel"> 휴대전화 </label> <select class="form-control status" name="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					<p class="dash">-</p>
					<input type="tel" name="tel2" id="tel" maxlength="4">
					<p class="dash">-</p>
					<input type="tel" name="tel3" id="tel2" maxlength="4">
				</div>
				<div class="join-form">
					<label for="email"> 이메일<span>*</span>
					</label> <input type="email" name="email" id="email" maxlength="50">
					<button type="button" class="btn btn2 id-btn" id="email_check">
						<p>중복확인</p>
					</button>
				</div>
				<div class="join">
					<button type="submit" class="btn btn2" id="join">가입하기</button>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	<!-- 플러그인 JS 참조 -->
	<script src="../share/plugins/validate/jquery.validate.min.js"></script>
	<script src="../share/plugins/validate/additional-methods.min.js"></script>
	<script src="../share/plugins/sweetalert/sweetalert2.min.js"></script>
	<script type="text/javascript">
		$(function() {
			/** 플러그인의 기본 설정 옵션 추가 */
			jQuery.validator.setDefaults({
				// 키보드입력시 검사 안함
				onkeyup : false,
				// <input> 태그 클릭시 검사 안함
				onclick : false,
				// 포커스가 빠져나올 때 검사안함
				onfocusout : false,
				// 에러 발생시 호출되는 함수  재정의
				showErrors : function(errorMap, errorList) {
					// 에러가 있을때만..
					if (this.numberOfInvalids()) {
						//0 번째 에러 메시지에 대한 javascript 기본 alert 함수 사용
						// alert(errorList[0].message);
						// 0번째 에러 발생 항목에 포커스 지정
						// $(errorList[0].element).focus();

						swal({
							title : "에러",
							text : errorList[0].message,
							type : "error"
						}).then(function(result) {
							// 창이 닫히는 애니메이션의 시간이 있으므로, 0.1초의 딜레이 적용후 포커스 이동
							setTimeout(function() {
								$(errorList[0].element).val("");
								$(errorList[0].element).focus();
							}, 100);
						});
					}
				}
			});

			/** 유효성 검사 검사 함수 */
			$.validator.addMethod("kor", function(value, element) {
				return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value);
			});

			$.validator.addMethod("phone",
					function(value, element) {
						if ($("#tel").val().length != 4
								|| $("#tel2").val().length != 4) {
							return false;
						}
						return this.optional(element)
								|| /^[0-9]*$/i.test(value);
					});

			$("#join_form").validate({
				rules : {
					// [아이디] 필수 + 알파벳, 숫자 조합만 허용
					user_id : {
						required : true,
						alphanumeric : true,
						minlength : 4
					},
					// [비밀번호] 필수 + 글자수 길이 제한
					user_pw : {
						required : true,
						minlength : 4
					},
					// [비밀번호 확인] 필수 + 특정 항목과 일치 (id로 연결)
					user_pw_re : {
						required : true,
						equalTo : "#user_pw"
					},
					// [이름] 필수
					user_name : {
						required : true,
						kor : true
					},
					// [연락처] 필수
					tel : {
						required : false,
						phone : true
					},
					// [이메일] 필수 + 이메일 형식 일치 필요
					email : {
						required : true,
						email : true
					}
				},
				messages : {
					user_id : {
						required : " 아이디를 입력하세요.",
						alphanumeric : "아이디는 영어, 숫자만 입력 가능 합니다.",
						minlength : "아이디는 4글자 이상 입력하셔야 합니다.",
					},
					// [비밀번호] 필수 + 글자수 길이 제한
					user_pw : {
						required : "비밀번호를 입력하세요.",
						minlength : "비밀번호는 4글자 이상 입력하셔야 합니다."
					},
					// [비밀번호 확인] 필수 + 특정 항목과 일치 (id로 연결)
					user_pw_re : {
						required : "비밀번호 확인값을 입력하세요.",
						equalTo : "비밀번호 확인이 잘못되었습니다."
					},
					// [이름] 필수
					user_name : {
						required : "이름을 입력하세요.",
						kor : "이름은 한글만 입력 가능합니다."
					},
					// [연락처] 필수
					tel : {
						required : "연락처를 입력하세요.",
						phone : "연락처 형식이 잘못되었습니다"
					},
					// [이메일] 필수 + 이메일 형식 일치 필요
					email : {
						required : "이메일을 입력하세요.",
						email : "이메일 형식이 잘못되었습니다"
					}
				}
			});
			var id_check = 0;
			var email_check = 0;
			$("#id_check").click(function(e) {
				e.preventDefault();
				
				var user_id = $("#user_id").val();
				
				id_check = 0;
				if (user_id.length != 0) {
					$.get("${pageContext.request.contextPath}/myInfo/same_check",
							{ "userid" : user_id },
						function(json) {
							if (json.rt == "OK") {
								alert("사용이 불가능한 아이디 입니다.");
							} else {
								alert("사용이 가능한 아이디 입니다^^");
								id_check++;
							}
						});
				} 
			});
			$("#email_check").click(function() {
				var useremail = $("#email").val();
				email_check = 0;
				if (email.length != 0) {
					$.get("${pageContext.request.contextPath}/myInfo/same_check",
							{ "useremail" : useremail },
						function(json) {
							if (json.rt == "OK") {
								alert("사용이 불가능한 이메일 입니다.");
							} else {
								alert("사용이 가능한 이메일 입니다^^");
								email_check++;
							}
						});
				} 
			});

			$("#join").click(function() {
				user_id = $("#user_id").val();
				if (user_id.length != 0 && id_check == 0) {
					alert("아이디 중복확인 바랍니다.");
					return false;
				}
				email = $("#email").val();
				if (email.length != 0 && email_check == 0) {
					alert("이메일 중복확인 바랍니다.");
					return false;
				}
			});
		});
	</script>
</body>

</html>