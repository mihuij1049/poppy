<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Poppy-Poppy</title>
<!-- 플러그인 CSS 참조 -->
<link rel="stylesheet"
	href="../share/plugins/sweetalert/sweetalert2.min.css" />
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../share/assets/ico/favicon.png" />
<link rel="apple-touch-icon-precomposed"
	href="../share/assets/ico/apple-touch-icon-144-precomposed.png" />
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="../share/assets/css/bootstrap.min.css" />
<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css"
	href="../share/assets/css/nanumfont.css" />
<link rel="stylesheet" type="text/css" href="../share/tmpl.css" />
<!-- 반응형 웹을 지원하지 않을 경우 -->
<!-- <link rel="stylesheet" href="../share/assets/css/non-responsive.css" /> -->
<!-- IE8 이하 버전 지원 -->
<!--[if lt IE 9]>
        <script type="text/javascript" src="../share/assets/js/html5shiv.js"></script>
        <script type="text/javascript" src="../share/assets/js/respond.min.js"></script>
        <![endif]-->
<!-- IE10 반응형 웹 버그 보완 -->
<!--[if gt IE 9]>
        <link rel="stylesheet" type="text/css" href="../share/assets/css/ie10.css" />
        <script type="text/javascript" src="../share/assets/js/ie10.js"></script>
        <![endif]-->
<style type="text/css">
.content .container {
	margin-top: 20px;
	width: 96%;
}

form div {
	border-bottom: 1px solid #ffc7c1;
	border-left: 1px solid #ffc7c1;
	border-right: 1px solid #ffc7c1;
}

.id-box {
	border-top: 1px solid #ffc7c1;
}

form div:last-child {
	border: none;
}

.content .container .join-form {
	padding: 16px 12px;
}

.content .container label {
	width: 22%;
}

span {
	color: red;
}

#user_id {
	margin-right: 10px;
	width: 40%;
}

input {
	vertical-align: -1px;
	border: 1px solid #d5d5d5;
}

button {
	width: 70px;
	height: 26px;
	text-align: center;
}

button p {
	font-size: 12px;
	line-height: 10px;
}

.btn:hover {
	background-color: #FF6261;
	color: #fff;
}

#user_pw {
	width: 50%;
}

#user_pw_re {
	width: 50%;
	vertical-align: 8.5px;
}

#user_name {
	width: 40%;
}

.container select {
	width: 23%;
	height: 26px;
	font-size: 11px;
	display: inline;
	border-radius: 0;
	vertical-align: -2px;
	border: 1px solid #d5d5d5;
}

.dash {
	display: inline;
	margin: 2px;
}

#tel {
	width: 15%;
	display: inline;
	vertical-align: -2px;
}

#tel2 {
	width: 15%;
	display: inline;
	vertical-align: -2px;
}

#email {
	margin-right: 10px;
	width: 50%;
}

.join {
	padding-top: 15px;
	margin: auto;
	margin-bottom: 50px;
	border-bottom: none;
}

.join button {
	width: 100%;
	height: 36px;
	color: #fff;
}

.swal2-icon {
	margin-top: 0;
	margin-bottom: 20px;
}

.swal2-popup .swal2-content {
	font-size: 15px;
}

.swal2-confirm {
	width: 88.56px;
	height: 40px;
	background-color: #ff8f83 !important;
}
</style>
</head>

<body>
	<div class="container">
		<div class="header">
			<a href="../index.html" id="logo"> <img
				src="../share/img/logojpg.jpg">
			</a> <a href="../pay/cart.html"> <span
				class="glyphicon glyphicon-shopping-cart" id="cart">
					<h1>장바구니</h1>
			</span> <span class="badge">
					<p>11</p>
			</span>
			</a>
			<hr>
			<ul class="category">
				<a href="#">
					<li>BEST</li>
				</a>
				<a href="#">
					<li>NEW</li>
				</a>
				<a href="#">
					<li>푸드</li>
				</a>
				<a href="#">
					<li>의류</li>
				</a>
				<a href="#">
					<li>외출용품</li>
				</a>
				<a href="#">
					<li>홈리빙</li>
				</a>
				<a href="#">
					<li>대형견</li>
				</a>
				<a href="#">
					<li>타임세일</li>
				</a>
				<a href="#">
					<li>유통임박</li>
				</a>
			</ul>
			<hr>
		</div>
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
					action="myinfo_wri_ok.html">
					<div class="id-box join-form">
						<label for="user_id"> 아이디<span>＊</span>
						</label> <input type="text" name="user_id" id="user_id" maxlength="20">
						<button type="button" class="btn id-btn">
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
						<label for="tel"> 휴대전화 </label> <select
							class="form-control status">
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>
						<p class="dash">-</p>
						<input type="tel" name="tel" id="tel" maxlength="4">
						<p class="dash">-</p>
						<input type="tel" name="tel2" id="tel2" maxlength="4">
					</div>
					<div class="join-form">
						<label for="email"> 이메일<span>*</span>
						</label> <input type="email" name="email" id="email" maxlength="50">
						<button type="button" class="btn id-btn">
							<p>중복확인</p>
						</button>
					</div>
					<div class="join">
						<button type="submit" class="btn" id="join">가입하기</button>
					</div>
				</form>
			</div>
		</div>
		<div class="footer">
			<!-- 하단 네비게이션 고정-->
			<!--- 소개 4인방 링크 -->
			<hr />
			<div class="etc">
				<a href="../etc/page_info1.html">회사소개</a> <a
					href="../etc/page_info2.html">이용약관</a> <a
					href="../etc/page_info3.html">개인정보취급방침</a> <a
					href="../etc/page_info4.html">이용안내</a>
			</div>
			<hr />
			<div class="row">
				<div class="col-xs-6 etc">
					<h5>
						<b>상담센터</b>
					</h5>
					<p style="font-size: 15px; font-weight: bold;">070-123-4567</p>
					<p style="font-size: 12px">
						운영시간 : 10:00 - 18:00<br />주말, 공휴일은 후뮤입니다.
					</p>
				</div>
				<div class="col-xs-6 etc">
					<h5>
						<b>입금계좌안내</b>
					</h5>
					<br />
					<p>
						하나 355-342432-23445<br>예금주 : (주)뽀삐뽀삐
					</p>
				</div>
			</div>
			<address class="clearfix">
				<p>
					상점명: (주)뽀삐뽀삐 대표 : 아무개 <br>주소 : 서울특별시 행복구 존버동 8282-5959 102호 -
					물류팀<br> 사업자등록번호 : 123-86-43567<br> 통신판매업신고 :
					제2020-서울서초-0082호<br> 개인정보관리책임 : 아무개 <br> <br />
					COPYRIGHT&copy; (주)뽀삐뽀삐 ALL RIGHTS RESERVED <br /> <i>DESIGN
						BY EZEN-team4</i>
				</p>
			</address>
			<div class="navbar" id="navbarback">
				<ul class="btmbar-nav clearfix navbar-fixed-bottom">
					<hr />
					<a href="../community/photo_rv.html"> <span
						class="glyphicon glyphicon-comment">
							<p>커뮤니티</p>
					</span>
					</a>
					<a href="../myInfo/order_list.html"> <span
						class="glyphicon glyphicon-list-alt">
							<p>주문조회</p>
					</span>
					</a>
					<a href="#"> <span class="glyphicon glyphicon-search">
							<p>&nbsp;검색&nbsp;</p>
					</span>
					</a>
					<a href="#"> <span class="glyphicon glyphicon-th-large">
							<p>카테고리</p>
					</span>
					</a>
					<a href="../myinfo/myinfo.html"> <span
						class="glyphicon glyphicon-user">
							<p>MY정보</p>
					</span>
					</a>
				</ul>
			</div>
		</div>
	</div>
	<!-- Javascript -->
	<script src="../share/assets/js/jquery-3.2.1.min.js"></script>
	<script src="../share/assets/js/bootstrap.min.js"></script>
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
		});
	</script>
</body>

</html>