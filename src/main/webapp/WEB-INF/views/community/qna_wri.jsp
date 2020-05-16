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
<style type="text/css">
.choice {
	margin-top: 20px;
	margin-bottom: 10px;
}

.choice .col-xs-8 {
	margin-top: 30px;
}

.qna-title, .qna-desc, .qna-url, .qna-pw, .qna-private {
	margin-bottom: 10px;
}

.col-xs-4, .col-xs-8, .col-xs-12 {
	margin-bottom: 15px;
}

.item-img>img {
	width: 100px;
	height: 100px;
}

input[type=text], input[type=password] {
	width: 100%;
}

.qna_area {
	width: 100%;
	min-height: 180px;
	resize: none;
}

.qna_private {
	
}

.qna_btn {
	margin-top: 0px;
	text-align: center;
	margin-bottom: 50px;
}

#qna_ok {
	width: 45%;
}

#qna_re {
	width: 45%;
}
/** 모달창 CSS */
#search-modal {
	display: none;
	position: absolute;
	left: 5%;
	z-index: 1;
	border: 1px solid #ff8f83;
	width: 90%;
	margin: auto;
}

.search-title {
	width: 100%;
	margin: auto;
	padding: 10px 10px;
	background: #ff8f83;
	color: #fff;
	text-align: center;
	font-size: 16px;
	font-weight: bold;
	letter-spacing: 1px;
}

.search-searching {
	width: 100%;
	margin: auto;
	padding: 10px 10px;
	background: #fff5f4;
}

.search-body {
	width: 100%;
	margin: auto;
	padding: 10px 10px;
	background: #fff5f4;
}

.search-item-paging {
	width: 100%;
	margin: auto;
	padding: 20px 10px;
	background: #fff5f4;
	text-align: center;
}

.search-modal-layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}

.search-close {
	width: 15%;
	cursor: pointer;
	height: 30px;
}

.search-bar {
	width: 100%;
}

.search-textbar {
	width: 75%;
	display: inline-block;
	font-size: 16px;
	margin-top: 10px;
}

.search-bar>.btn-searching {
	display: inline-block;
	width: 20%;
	margin-left: 10px;
	margin-bottom: 3px;
	font-size: 14px;
	padding: 3px 3px;
}

.search-list-item {
	list-style: none;
	width: 100%;
	height: 80px;
}

.search-item-img {
	float: left;
	width: 22%;
}

.search-item-img img {
	width: 60px;
	border: 1px solid #ffc7c1;
}

.search-item-content {
	float: left;
	width: 63%;
	font-size: 12px;
}

.search-item-content>p {
	margin: 0px;
	padding-right: 5px;
}

.search-item-btn {
	float: left;
	width: 15%;
	margin-top: 15px;
}

ul.pagination-xs {
	margin: 20px 0px;
	margin-top: 40px;
}

.search-item-paging>.pagination-xs>li {
	font-size: 12px;
}

.pagination>.active>a, .pagination>.active>span, .pagination>.active>a:hover,
	.pagination>.active>span:hover, .pagination>.active>a:focus,
	.pagination>.active>span:focus {
	z-index: 2;
	color: #fff;
	cursor: default;
	background-color: #ff8f83;
	border-color: #ff8f83;
}

a {
	color: #333;
	text-decoration: none;
}
/** 모달창 CSS 끝 */

/** 글 등록 확인 모달창 */
#myModal2 {
	padding-top: 50%;
}

.cart-modal {
	padding: 10px;
}

.modal-footer2 .btn2 {
	width: 65px;
	height: 34px;
	float: right;
	margin-left: 5px;
}

.modal-header2 {
	height: 50px;
}

.modal-body2 {
	padding-left: 50px;
	height: 50px;
}

.modal-footer2 {
	height: 40px;
}
/** 글등록 확인 모달창 CSS 끝 */
</style>
<script src="../share/plugins/handlebars/handlebars-v4.0.5.js"></script>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>

	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">
			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>Q&A 글쓰기
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
						총 <b class=""></b>개의 상품이 검색되었습니다.
					</div>
				</div>
				<div class="search-body">
					<ul class="search-list" id="search_goods_list">

					</ul>
				</div>
				<div class="search-modal-layer"></div>
			</div>
			<!-- 모달창 끝 -->
			<form name="qna_wri" id="qna_wri" method="POST"
				action="${pageContext.request.contextPath}/community/qna_wri_ok.do">
				<div class="container">
					<div class="choice clearfix">
						<div class="col-xs-4">
							<a href="#" class="item-img"><img
								src="../share/img/noimage.JPG" id="item_img"></a>
						</div>
						<div class="col-xs-8">
							<div class="select-item-content">
								<p id="item_name" >
									<br /> <b class="select-item-price" id="item_price"></b>
								</p>
							</div>
							<button type="button" class="item-select">상품정보선택</button>
						</div>
					</div>

					<div class="qna-title">
						<div class="col-xs-4">
							<label>제목</label>
						</div>
						<div class="col-xs-8">
							<input type="text" name="bbstitle">
						</div>
					</div>
					<div class="qna-desc">
						<div class="col-xs-12">
							<textarea name="bbscontent" class="qna_area"
								placeholder="내용을 입력하세요." maxlength="1800"></textarea>
						</div>
					</div>
					<div class="qna-private">
						<div class="col-xs-4">
							<label>비밀글설정</label>
						</div>
						<div class="col-xs-8">
							<input type="radio" name="qnasec" value="0" id="public">
							<label>공개글 &nbsp;</label> <input type="radio" id="private"
								name="qnasec" value="1" checked> <label>비밀글</label>
						</div>
					</div>
					<div class="qna-pw">
						<div class="col-xs-4">
							<label>비밀번호</label>
						</div>
						<div class="col-xs-8">
							<input type="text" id="password" name="qnapw" maxlength="4"
								placeholder="비밀번호 4자리를 입력하세요.">
						</div>
					</div>

				</div>
				<div class="qna_btn">
					<button type="submit" id="qna_ok" class="btn">등록</button>
					<button type="button" id="qna_re" class="btn btn-inverse"
						onclick="history.back(); return false;">취소</button>
				</div>
			</form>
		</div>
	</div>
	<div class="modal fade" id="myModal2">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="cart-modal">
					<div class="modal-header2">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">QnA 게시판 글 등록</h4>
					</div>
					<div class="modal-body2">
						<p>작성하신 글을 등록 하시겠습니까??</p>
					</div>
					<div class="modal-footer2">
						<button type="button" class="btn btn2" data-dismiss="modal">아니오</button>
						<button type="submit" class="btn btn2 qna-submit"
							data-dismiss="modal">예</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	<!-- Handlebars 를 이용한 HTML 템플릿 구성 -->
	<script id="goods_item_tmpl" type="text/x-handlebars-template">
		{{#each item}}
			<li class="search-list-item">
				<div class="search-item-img">
					<img src="{{imgpath}}{{imgname}}.{{imgext}}" />
				</div>
				<div class="search-item-content">
					<p>
						{{gname}}<br /> 
						<b class="search-item-price">{{gprice}}원</b>
					</p>
				</div>
				<div class="search-item-btn">
					<button type="button" class="btn btn-sm search-item-select" id="select_btn">선택</button>
				</div>
			</li>

		{{/each}}
	</script>

	<script type="text/javascript">
		/** 공개글 / 비밀글 라디오박스 체크 이벤트 */
		$('input[type=radio]').change(function() {
			// 공개글
			if (this.value == '0') {
				$("#password").attr("readonly", true).attr("disabled", false);
				$("#password").val("");
				$("#password").removeAttr("placeholder");
			}
			// 비밀글 
			else {
				$("#password").attr("disabled", false).attr("readonly", false);
				$("#password").attr("placeholder", "비밀번호 4자리를 입력하세요.");
			}
		});

		$(function() {
			/** 등록버튼을 눌렀을 때 */
			$("#qna_ok").on("click", function(e) {
				e.preventDefault();
				// 비밀글에 체크된 상태라면
				if ($("input:radio[id='private']").is(":checked") == true) {
					// 비밀번호를 pw에 담는다.
					var pw = $("#password").val();
					// 비밀번호 길이를 변수에 담기
					var pwlength = $("#password").val().length;
					// 비밀번호가 null / 4자리수 이하라면 경고메시지
					if (pw == "" || pwlength < 4) {
						alert("비밀번호는 4자리로 입력해주세요.");
						return false;
					}
					$("#myModal2").modal("show");
					// 공개글에 체크된 상태라면
				} else {
					// 클릭시 모달창이 뜨는 이벤트
					$("#myModal2").modal("show");
				}
			});
		}); // end function

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
		}
		// 검색 결과를 템플릿을 이용해서 화면에 나타낼 함수 정의

		$(function() {
			// 검색버튼 클릭이벤트 
			$("#search_goods_btn").click(function(e) {
								let keyword = $("#search-keyword").val();
								let page = 1;
								$.get("${pageContext.request.contextPath}/community/qna_goods",
												{"keyword" : keyword, "page" : page},
												function(req) {
													// 미리 준비한 HTML틀을 읽어온다.
													var template = Handlebars.compile($("#goods_item_tmpl").html());
													// Ajax 를 통해서 읽어온 JSON 을 템플릿에 병합한다.
													var html = template(req);
													// #search_goods_list 에 읽어온 내용을 추가한다.
													$("#search_goods_list").append(html);
												});
								var length = $("li[class=search-list-item").length;
								console.log(length);
								$(".search-qty").text(length);
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
						var name = $(event.target).parent().prev().children()
								.html();
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
		$(".qna-submit").click(function(e) {
			$("#qna_wri").submit();
		});

		
	</script>
</body>

</html>