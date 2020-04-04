<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/share/head_tp.jsp"%>
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
	width: 100%;
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
							class="glyphicon glyphicon-chevron-left"></i></a>QnA 글쓰기
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
						<button class="btn btn-sm btn-searching">검 색</button>
					</div>

					<div class="search-result">
						총 <b class="search-qty">0</b>개의 상품이 검색되었습니다.
					</div>
				</div>
				<div class="search-body">
					<ul class="search-list">
						<li class="search-list-item">
							<div class="search-item-img">
								<img src="../share/img/4_M.jpg" />
							</div>
							<div class="search-item-content">
								<p>
									펫클럽 데이스포 케어츄르 15kg*4개입/츄르간식<br /> <b class="search-item-price">2,300원</b>

								</p>
							</div>
							<div class="search-item-btn">
								<button type="button" class="btn btn-sm search-item-select">선택</button>
							</div>
						</li>
					</ul>
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
			<form method="post" action="">
				<div class="container">
					<div class="choice clearfix">
						<div class="col-xs-4">
							<a href="#" class="item-img"><img
								src="../share/img/slide.jpg"></a>
						</div>
						<div class="col-xs-8">
							<button type="button" class="item-select">상품정보선택</button>
						</div>
					</div>

					<div class="qna-title">
						<div class="col-xs-4">
							<label>제목</label>
						</div>
						<div class="col-xs-8">
							<input type="text">
						</div>
					</div>
					<div class="qna-desc">
						<div class="col-xs-12">
							<textarea name="content" class="qna_area"
								placeholder="내용을 입력하세요." maxlength="1800"></textarea>
						</div>
					</div>
					<div class="qna-url">
						<div class="col-xs-4">
							<label>UCC URL</label>
						</div>
						<div class="col-xs-8">
							<input type="text">
						</div>
					</div>
					<div class="qna-pw">
						<div class="col-xs-4">
							<label>비밀번호</label>
						</div>
						<div class="col-xs-8">
							<input type="password">
						</div>
					</div>
					<div class="qna-private">
						<div class="col-xs-4">
							<label>비밀글설정</label>
						</div>
						<div class="col-xs-8">
							<input type="radio" name="public"> <label>공개글
								&nbsp;</label> <input type="radio" name="public"> <label>비밀글</label>
						</div>
					</div>
				</div>
				<div class="qna_btn">
					<button type="submit" id="qna_ok" class="btn">등록</button>
					<button type="reset" id="qna_re" class="btn btn-inverse">취소</button>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/share/bottom_tp.jsp"%>
	<script type="text/javascript">
		/** 모달창 켜고 끄기 */
		$(function() {
			$(".item-select").click(function(e) {
				$("#search-modal").fadeIn();
			});
			$(".search-close").click(function(e) {
				$("#search-modal").fadeOut();
			});
		});  // end 모달창 켜고 끄기
		
	</script>
</body>

</html>