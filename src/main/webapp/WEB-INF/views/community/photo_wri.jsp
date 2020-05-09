<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Poppy-Poppy</title>
<%@ include file="../share/head_tp.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/share/photo_wri.css?ver=1" />
<!-- 플러그인 CSS 참조 -->
<link rel="stylesheet"
	href="../share/plugins/sweetalert/sweetalert2.min.css" />

<script src="../share/plugins/handlebars/handlebars-v4.0.5.js"></script>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>포토리뷰
				</b>
			</h4>
		</div>
		<!-- 모달창 시작 -->
		<div id="search-modal">
			<div class="search-title clearfix">
				상품정보선택
				<div class="search-close pull-right">X</div>
			</div>
			<div class="search-searching">
				<div class="search-bar">
					<div class="search-textbar">
						<input type="text" name="search-goods" placeholder="상품명을 입력하세요." />
					</div>
					<button class="btn btn-sm btn-searching" id="search_goods_btn">검
						색</button>
				</div>

				<div class="search-result">
					총 <b class="search-qty">0</b>개의 상품이 검색되었습니다.
				</div>
			</div>
			<div class="search-body">
				<ul class="search-list" id="search_goods_list"></ul>
			</div>
			<div class="search-item-paging">
				<ul class="pagination pagination-xs">
					<li class="disabled"><a href="#">«</a></li>
					<!-- 활성화 버튼은 아래의 구조로 구성하시면 됩니다. sr-only는 스크린리더 전용입니다. -->
					<li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
					<li><span>2</span></li>
					<li><span>3</span></li>
					<li class="paging-right"><a href="#">»</a></li>
				</ul>
			</div>
			<div class="search-modal-layer"></div>
		</div>
		<!-- 모달창 끝 -->
		<div class="container">
			<form class="form-horizontal" name="wri_form" id="wri_form" method="POST"
				action="${pageContext.request.contextPath}/community/photo_wri_ok.do">
				<div class="select">
					<div class="choice clearfix">
						<div class="col-xs-4">
							<a href="#" class="item-img"><img
								src="../share/img/noimage.JPG" id="item_img"></a>
						</div>
						<div class="col-xs-8">
							<div class="select-item-content">
								<p id="item_name">
									<br /> <b class="select-item-price" id="item_price"></b>
								</p>
							</div>
							<button type="button" class="btn item-select">상품정보선택</button>
						</div>
					</div>
				</div>
				<div class="title">
					<div>
						<p>제목</p>
						<span class="redStar">＊</span>
					</div>
					<input type="text" name="bbstitle" class="tit" id="title"
						maxlength="20">
				</div>
				<div class="star">
					<div>
						<p>평점</p>
					</div>
					<input type="radio" name="rvlike" checked> <label>★★★★★</label>
					<input type="radio" name="rvlike"> <label>★★★★</label> <input
						type="radio" name="rvlike"> <label>★★★</label> <input
						type="radio" name="rvlike"> <label>★★</label> <input
						type="radio" name="rvlike"> <label>★</label>
				</div>
				<div class="write">
					<textarea name="bbscontent" class="rv_area"
								placeholder="내용을 입력하세요." maxlength="1800"></textarea>
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
						<span class="redStar">＊</span>
					</div>
					<input type="password" name="password" class="pass" id="password">
				</div>
				<div class="sign">
					<button type="submit" class="btn btn2">등록</button>
					<button type="reset" class="btn btn2 btn-inverse"
						onclick="location.href='${pageContext.request.contextPath}/community/photo_rv.do'">취소</button>
				</div>
			</form>
		</div>
	</div>
	<!-- Javascript -->
	<%@ include file="../share/bottom_tp.jsp"%>
	<script id="goods_item_tmpl" type="text/x-handlebars-template">
		{{#each goods}}
			<li class="search-list-item">
				<div class="search-item-img">
					<img src="{{url}}" />
				</div>
				<div class="search-item-content">
					<p>
						{{name}}<br /> 
						<b class="search-item-price">{{price}}원</b>
					</p>
				</div>
				<div class="search-item-btn">
					<button type="button" class="btn btn-sm search-item-select">선택</button>
				</div>
			</li>
		{{/each}}
	</script>
	<!-- 플러그인 JS 참조 -->
	<script src="../share/plugins/validate/jquery.validate.min.js"></script>
	<script src="../share/plugins/validate/additional-methods.min.js"></script>
	<script src="../share/plugins/sweetalert/sweetalert2.min.js"></script>
	<!-- Javascript -->
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
			/** 모달창 켜고 끄기 */
			$(function() {
				$(".item-select").click(function(e) {
					$("#search-modal").fadeIn();
				});
				$(".search-close").click(function(e) {
					$("#search-modal").fadeOut();
					$("li").remove(".search-list-item");
					$(".search-qty").text("0");
				});
			}); // end 모달창 켜고 끄기

			/** 검색 버튼 클릭시 검색 결과 화면에 나타내기 */
			function get_list() {
				$.get("../share/plugins/goods_list.json", function(req) {
					// 미리 준비한 HTML틀을 읽어온다.
					var template = Handlebars.compile($("#goods_item_tmpl")
							.html());
					// Ajax 를 통해서 읽어온 JSON 을 템플릿에 병합한다.
					var html = template(req);
					// #search_goods_list 에 읽어온 내용을 추가한다.
					$("#search_goods_list").append(html);
				});
			} // 검색 결과를 템플릿을 이용해서 화면에 나타낼 함수 정의

			$(function() {
				$("#search_goods_btn").click(function(e) {
					get_list(); // 버튼이 클릭되면 호출된다.
					var length = $("ul").length;
					// console.log(length);
					$(".search-qty").text(length);
				});
			}); // 함수 호출하며 검색 결과 n개 나타내기 
			/** 선택 버튼을 누르면 item의 정보를 본문으로 넣기 */
			$(function() {
				// 링크가 클릭된 경우
				$("#search_goods_list").on(
						'click',
						'button',
						function(e) {
							alert("선택버튼 테스트 중");
							// 클릭된 상품의 href 속성 가져오기
							var src = $(event.target).parent().prev().prev()
									.children().attr('src');
							// console.log(src);

							// 클릭된 상품의 이름 및 가격 가져오기
							var name = $(event.target).parent().prev()
									.children().html();
							// console.log(name);
							// 1) 본문의 '#item_img'를 찾아 상품이미지 설정
							$("#item_img").attr('src', src);
							// 2) 제목 및 가격 설정
							$("#item_name").html(name);

							// 모달창 닫기
							$("#search-modal").fadeOut();
							$("li").remove(".search-list-item");
							$(".search-qty").text("0");

						});
			});
		});
	</script>
</body>

</html>