<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	href="${pageContext.request.contextPath }/share/plugins/sweetalert/sweetalert2.min.css" />

<script src="${pageContext.request.contextPath }/share/plugins/handlebars/handlebars-v4.0.5.js"></script>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>포토리뷰 수정
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
						<input type="text" id="search-keyword" name="search-goods"
							placeholder="상품명을 입력하세요." />
					</div>
					<button class="btn btn-sm btn-searching" id="search_goods_btn">검
						색</button>
				</div>

				<div class="search-result">
					총 <b class="search-qty">0</b>개의 상품이 검색되었습니다.
				</div>
			</div>
			<div class="search-body">
				<ul class="search-list" id="search_goods_list">

				</ul>
			</div>
			<div class="search-modal-layer"></div>
		</div>
		<!-- 모달창 끝 -->
		<div class="container">
			<form class="form-horizontal" name="wri_form" id="wri_form"
				method="POST" enctype="multipart/form-data"
				action="${pageContext.request.contextPath}/community/photo_edit_ok.do">
				<input type="hidden" name="bbsno" value="${output.bbsno}" /> <input
					type="hidden" name="imgsno" value="${output.imgsno}" />
				<div class="select">
					<div class="choice clearfix">
						<div class="col-xs-4">
							<a href="#" class="item-img"><img
								src="../share/img/ppnoimage.JPG" id="item_img"></a>
						</div>
						<div class="col-xs-8">
							<div class="select-item-content">
								<p id="item_name">
									<br /> <b class="select-item-price" id="item_price"></b>
								</p>
							</div>
							<button type="button" class="btn item-select">상품정보선택</button>
							<input type="hidden" name="goodsno" id="setting-goodsno" />
						</div>
					</div>
				</div>
				<div class="title">
					<div>
						<p>제목</p>
						<span class="redStar">＊</span>
					</div>
					<input type="text" name="bbstitle" class="tit" id="bbstitle"
						maxlength="20" value="${output.bbstitle}">
				</div>
				<div class="star">
					<div>
						<p>평점</p>
					</div>
					<input type="radio" name="rvlike" value="★★★★★"
						<c:if test="${output.rvlike=='★★★★★'}">checked</c:if> /> <label>★★★★★</label>
					<input type="radio" name="rvlike" value="★★★★"
						<c:if test="${output.rvlike=='★★★★'}">checked</c:if> /> <label>★★★★</label>
					<input type="radio" name="rvlike" value="★★★"
						<c:if test="${output.rvlike=='★★★'}">checked</c:if> /> <label>★★★</label>
					<input type="radio" name="rvlike" value="★★"
						<c:if test="${output.rvlike=='★★'}">checked</c:if> /> <label>★★</label>
					<input type="radio" name="rvlike" value="★"
						<c:if test="${output.rvlike=='★'}">checked</c:if> /> <label>★</label>
				</div>
				<div class="write">
					<textarea name="bbscontent" class="rv_area" id="bbscontent"
						placeholder="내용을 입력하세요." maxlength="1800">${output.bbscontent}</textarea>
				</div>
				<div class="file">
					<div>
						<p>첨부파일</p>
					</div>
					<input type="file" name="photo" id="photo" />
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
		{{#each item}}
			<li class="search-list-item">
				<div class="search-item-img">
					<img src="{{imgpath}}" />
				</div>
				<div class="search-item-content">
					<p>
						{{gname}}<br /> 
						<b class="search-item-price">{{gprice}}원</b>
					</p>
				</div>
				<div class="search-item-btn">
					<button type="button" class="btn btn-sm search-item-select" id="select_btn" data-goodsno={{goodsno}}>선택</button>
				</div>
			</li>

		{{/each}}
	</script>
	<!-- 플러그인 JS 참조 -->
	<script src="${pageContext.request.contextPath }/share/plugins/validate/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath }/share/plugins/validate/additional-methods.min.js"></script>
	<script src="${pageContext.request.contextPath }/share/plugins/sweetalert/sweetalert2.min.js"></script>
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
					bbstitle : {
						required : true,
						minlength : 4
					},
					bbscontent : {
						required : true,
						minlength : 4
					}
				},

				messages : {
					bbstitle : {
						required : "제목을 입력하세요.",
						minlength : "제목은 4글자 이상 입력하셔야 합니다."
					},
					bbscontent : {
						required : "내용을 입력하세요.",
						minlength : "내용은 4글자 이상 입력하셔야 합니다."
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

			$(function() {
				// 검색버튼 클릭이벤트 
				$("#search_goods_btn")
						.click(
								function(e) {
									let keyword = $("#search-keyword").val();
									let page = 1;
									$
											.get(
													"${pageContext.request.contextPath}/community/qna_goods",
													{
														"keyword" : keyword,
														"page" : page
													},
													function(req) {
														// 미리 준비한 HTML틀을 읽어온다.
														var template = Handlebars
																.compile($(
																		"#goods_item_tmpl")
																		.html());
														// Ajax 를 통해서 읽어온 JSON 을 템플릿에 병합한다.
														var html = template(req);
														// #search_goods_list 에 읽어온 내용을 추가한다.
														$("#search_goods_list").append(html);
														var length = $(".search-item-img").length;
														console.log(length);
														$(".search-qty").text(length);
													});
								
								});
			}); // 함수 호출하며 검색 결과 n개 나타내기 

			/** 선택 버튼을 누르면 item의 정보를 본문으로 넣기 */
			$(function() {
				// 검색된 상품이 클릭되는 경우
				$("#search_goods_list").on(
						'click',
						'button',
						function(e) {
							// 클릭된 상품의 href 속성 가져오기
							var src = $(event.target).parent().prev().prev()
									.children().attr('src');
							// console.log(src);

							// 클릭된 상품의 이름 및 가격 가져오기
							var name = $(event.target).parent().prev()
									.children().html();
							var goodsno = $(event.target).data("goodsno");
							console.log(goodsno);
							// 1) 본문의 '#item_img'를 찾아 상품이미지 설정
							$("#item_img").attr('src', src);
							// 2) 제목 및 가격 설정
							$("#item_name").html(name);
							// 3) 굿즈넘버 데이터 설정
							$("#setting-goodsno").attr("value", goodsno);

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