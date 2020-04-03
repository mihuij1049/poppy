<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/share/head_tp.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Poppy-Poppy</title>
<!-- 플러그인 CSS 참조 -->
<link rel="stylesheet"
	href="../share/plugins/sweetalert/sweetalert2.min.css" />
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../share/assets/ico/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="../share/ico/apple-touch-icon-144-precomposed.png">
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="../share/assets/css/bootstrap.min.css">
<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css"
	href="../share/assets/css/nanumfont.css" />
<link rel="stylesheet" type="text/css" href="../share/tmpl.css" />
<style type="text/css">
.content .container {
	margin-top: 20px;
	width: 96%;
}

.content p {
	display: inline;
	font-size: 14px;
	font-weight: bold;
}

.select {
	border: 1px solid #ffc7c1;
	padding: 16px 14px;
}

.select .btn {
	text-align: center;
	width: 120px;
	margin-left: 10px;
}

.btn:hover {
	background-color: #FF6261;
	color: #fff;
}

.title {
	border: 1px solid #ffc7c1;
	border-top: none;
	padding: 16px 14px;
}

.title div {
	display: inline-block;
	width: 18%;
}

.tit {
	width: 80%;
}

.star {
	border: 1px solid #ffc7c1;
	border-top: none;
	padding: 16px 14px;
}

.star div {
	display: inline-block;
	width: 18%;
}

input[type="radio"] {
	vertical-align: -2px;
}

label {
	font-size: 10px;
	vertical-align: 2px;
}

span {
	color: red;
}

input {
	margin-top: 1.5px;
}

.write {
	border: 1px solid #ffc7c1;
	border-top: none;
	padding: 14px;
}

.text {
	width: 100%;
	height: 100px;
}

.UCC {
	border: 1px solid #ffc7c1;
	border-top: none;
	padding: 16px 14px;
}

.UCC p {
	font-size: 13px;
}

.UCC div {
	display: inline-block;
	width: 18%;
}

.url {
	width: 80%;
}

.file {
	border: 1px solid #ffc7c1;
	border-top: none;
	padding: 16px 14px;
}

.file div {
	display: inline-block;
	width: 24%;
}

.file input {
	display: inline;
	width: 70%;
}

.password {
	border: 1px solid #ffc7c1;
	border-top: none;
	padding: 16px 14px;
}

.password p {
	font-size: 14px;
}

.password div {
	display: inline-block;
	width: 22%;
}

.pass {
	position: relative;
	bottom: 2px;
	width: 75%;
}

.sign {
	margin: auto;
	padding-top: 15px;
	margin-bottom: 50px;
}

.btn {
	padding: 10px 15px;
	width: 49%;
	margin: auto;
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
<%@ include file="/share/top_tp.jsp" %>
	<div class="container">
		<div class="content">
			<!-- 여기에 작성 -->
			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>포토리뷰
					</b>
				</h4>
			</div>
			<div class="container">
				<form class="form-horizontal" name="wri_form" id="wri_form"
					action="photo_rv.html">
					<div class="select">
						<img src="../share/img/photo-file.PNG">
						<input type="button" class="btn" value="상품정보선택" />
					</div>
					<div class="title">
						<div>
							<p>제목</p>
							<span>＊</span>
						</div>
						<input type="text" name="title" class="tit" id="title"
							maxlength="20">
					</div>
					<div class="star">
						<div>
							<p>평점</p>
						</div>
						<input type="radio" name="star" checked> <label>★★★★★</label>
						<input type="radio" name="star"> <label>★★★★</label> <input
							type="radio" name="star"> <label>★★★</label> <input
							type="radio" name="star"> <label>★★</label> <input
							type="radio" name="star"> <label>★</label>
					</div>
					<div class="write">
						<input type="textarea" name="photo_content" class="text"
							id="photo_content">
					</div>
					<div class="UCC">
						<div>
							<p>UCC URL</p>
						</div>
						<input type="text" name="" class="url">
					</div>
					<div class="file">
						<div>
							<p>첨부파일 1</p>
						</div>
						<input type="file" name="">
					</div>
					<div class="file">
						<div>
							<p>첨부파일 2</p>
							&nbsp;&nbsp;
						</div>
						<input type="file" name="">
					</div>
					<div class="file">
						<div>
							<p>첨부파일 3</p>
							&nbsp;&nbsp;
						</div>
						<input type="file" name="">
					</div>
					<div class="file">
						<div>
							<p>첨부파일 4</p>
							&nbsp;&nbsp;
						</div>
						<input type="file" name="">
					</div>
					<div class="file">
						<div>
							<p>첨부파일 5</p>
							&nbsp;&nbsp;
						</div>
						<input type="file" name="">
					</div>
					<div class="password">
						<div>
							<p>비밀번호</p>
							<span>＊</span>
						</div>
						<input type="password" name="password" class="pass" id="password">
					</div>
					<div class="sign">
						<button type="submit" class="btn">등록</button>
						<button class="btn btn-inverse">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/share/bottom_tp.jsp" %>
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

			$("#wri_form").validate({
				rules : {
					title : {
						required : true,
						minlength : 4
					},
					photo_content : {
						required : true,
						minlength : 4
					},
					password : {
						required : true,
						minlength : 4
					}
				},

				messages : {
					title : {
						required : "제목을 입력하세요.",
						minlength : "제목은 4글자 이상 입력하셔야 합니다."
					},
					photo_content : {
						required : "내용을 입력하세요.",
						minlength : "내용은 4글자 이상 입력하셔야 합니다."
					},
					password : {
						required : "비밀번호를 입력하세요.",
						minlength : "비밀번호는 4글자 이상 입력하셔야 합니다."
					}
				}
			});
		});
	</script>
</body>

</html>