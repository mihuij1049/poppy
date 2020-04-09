<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>

<head>
<%@ include file="/share/head_tp.jsp"%>
<style type="text/css">
/** 글쓰기 버튼 */
.btn1 {
	position: absolute;
	right: 5px;
	top: 127px;
	height: 30px;
}

/** 상품 이미지 */
.img-good {
	margin-left: 50px;
}

/** re박스 */
.re {
	display: inline-block;
	border: 1px solid #ffc7c1;
	background-color: #ffc7c1;
	border-radius: 3px;
	width: 50px;
	height: 30px;
	text-align: center;
	padding-top: 5px;
	margin-left: 80px;
}

/** 글리피콘 */
.glyphicon-lock {
	padding-left: 40px;
	padding-right: 15px;
}

/** 제목 */
.media-body b {
	padding-left: 5px;
}

/** 고객 작성자/날짜 */
.date-co {
	display: block;
	padding-top: 8px;
	margin-left: 40px;
}

.co {
	margin-left: 42px;
}

/** 뽀삐뽀삐 작성자/날짜 */
.date-ppo {
	margin-left: 150px;
	margin-top: -4px;
}

.ppo {
	margin-left: 150px;
}

/** 페이지 */
.paging {
	text-align: center;
}

.pagination>.active>span {
	background-color: #FF8F83;
	border-color: #FF8F83;
}

.container a {
	text-decoration: none;
	color: #333;
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
</style>
</head>

<body>
	<%@ include file="/share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>상품Q&A
				</b>
			</h4>
			<button type="button" onclick="location.href='qna_wri.jsp'"
				class="btn btn1">글쓰기</button>
		</div>
		<!-- 웹진 박스를 목록으로 구성하기 위한 구조 입니다. -->
		<div class="box-list">
			<ul class="media-list">
				<!-- 문의글 -->
				<hr>
				<li class="media"><a class="pull-left question_subject"
					href="#"> <img class="media-object img-good"
						src="../share/img/s1.jpg" width="60" height="60"
						alt="Generic placeholder image">

						<div class="media-body">
							<!-- 제목영역의 float 처리를 위한 마감제 박스 -->
							<div class="clearfix">
								<span class="glyphicon glyphicon-lock"></span> <b>궁금합니다.</b><br>
								<small class="date-co">&nbsp;2019-10-20 13:12:32</small></a>
		</div>
		<p class="co">김** 조회5</p>
	</div>
	</li>
	<hr>
	<!-- 문의글 답변 -->
	<li class="media">
		<div class="media-body">
			<a class="Answer_subject"> <b class="re">RE</b> <span
				class="glyphicon glyphicon-lock"></span> <b>답변드립니다!</b> <br> <small
				class="date-ppo">&nbsp;2019-11-20 16:12:12</small></a>
			<p class="ppo">(주) 뽀삐뽀삐 조회3</p>
		</div>

	</li>
	<hr>
	<!-- 문의글 -->
	<li class="media"><a class="pull-left question_subject" href="#">
			<img class="media-object img-good" src="../share/img/s1.jpg"
			width="60" height="60" alt="Generic placeholder image">
			<div class="media-body">
				<!-- 제목영역의 float 처리를 위한 마감제 박스 -->
				<div class="clearfix">
					<span class="glyphicon glyphicon-lock"></span> <b>궁금합니다.</b><br>
					<small class="date-co">&nbsp;2019-10-20 13:12:32</small>
	</a>

		</div>
		<p class="co">김** 조회5</p>
		</div></li>
	<hr>
	<!-- 문의글 답변 -->
	<li class="media">
		<div class="media-body">
			<a class="Answer_subject"> <b class="re">RE</b> <span
				class="glyphicon glyphicon-lock"></span> <b>답변드립니다!</b> <br> <small
				class="date-ppo">&nbsp;2019-10-20 17:12:12</small></a>
			<p class="ppo">(주) 뽀삐뽀삐 조회2</p>
		</div>
	</li>
	<hr>

	</ul>
	<div class="paging">
		<ul class="pagination pagination-sm">
			<li class="disabled"><a href="#">&laquo;</a></li>
			<!-- 활성화 버튼은 아래의 구조로 구성하시면 됩니다. sr-only는 스크린리더 전용입니다. -->
			<li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
			<li><a href=" #">&raquo;</a></li>
		</ul>
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
					<ul class="search-list" id="search_goods_list">

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
	</div>


	<%@ include file="/share/bottom_tp.jsp"%>
	<script type="text/javascript">
	/** 모달창 켜고 끄기 */
	$(function() {
		$(".question_subject").click(function(e) {
			$("#search-modal").fadeIn();
		});
		
	}); // end 모달창 켜고 끄기
	</script>




</body>

</html>