<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>

<head>
<%@ include file="/share/head_tp.jsp"%>
<style type="text/css">
/** 전체 마진 */
.container_1 {
	margin-bottom: 50px
}

/** 전체 마진 끝 */
.pr_search_tab_bg {
	width: 100%;
	background-color: #ffc7c1;
	padding-top: 10px;
	margin-top: 20px;
	margin-bottom: 15px;
	color: #fff;
}

.pr_search_tab {
	width: 95%;
	padding: 10px;
	padding-left: 15px;
	margin: auto;
}

.pr_search_tab_bg .btn {
	background-color: #ff8f83;
	color: #fff;
	font-size: 13px;
	height: 25px;
}

.pr_search_tab .cate_ip {
	float: left;
	width: 35%;
}

.pr_search_tab .cate_ip .icon_size {
	font-size: 15px;
	position: relative;
	top: 3px;
}

.pr_search_tab input {
	height: 23px;
	width: 33%;
}

.container .cate_select {
	width: 65%;
	height: 23px;
	margin-bottom: 10px;
}

.h_input {
	width: 70%;
	height: 20px;
}

.container #sc_bt {
	padding-top: 3px;
	margin-bottom: 3px;
	width: 40px;
	padding-right: 35px;
}

/** 포토리뷰 시작 */
.pr_box {
	float: left;
	width: 50%;
	padding: 5px;
}

.pr_box a {
	display: block;
	text-decoration: none;
}

.pr_in_box {
	border: 1px solid #FF8F83;
	padding: 5px;
}

.container .img_size {
	width: 100%;
}

.container .icon_size {
	height: 8px;
	font-size: 10px;
}

.pr_box .btn {
	margin: 10px 0px 0px 0px;
	padding: 5px 50px 22px 10px;
	width: 50px;
	height: 25px;
	font-size: 12px;
	font-color: #fff;
}

/** 연필 글리피콘 ^^ */

.pencil {
	display: inline-block;
	border-radius: 2px;
	bacground-color: #ff8f83;
	font-size: 5px;
}
.glyphicon-pencil {
	font-size: 15px;
	color: #fff;
	margin: 3px;
}

/** 끝 */

.pr_box .btn:active {
	font-color: #fff;
}

.pr_box .btn-inverse {
	margin: 10px 0px 0px 0px;
	padding: 5px 50px 22px 10px;
	width: 50px;
	height: 25px;
	font-size: 12px;
	font-color: #ff8f83;
}

.pr_box .btn-inverse:active {
	font-color: #ff8f83;
}

.container_1 hr {
	margin: 5px 0px 5px 0;
	padding: 0;
}

.container_1 h5 {
	color: #FF8F83;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.container_1 .pr_content {
	height: 60px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	/* 라인수 */
	-webkit-box-orient: vertical;
	word-wrap: break-word;
}

.pagination>.active>span {
	background-color: #FF8F83;
	border-color: #FF8F83;
}

.container a {
	color: #777;
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
							class="glyphicon glyphicon-chevron-left"></i></a>포토리뷰
					</b>
				</h4>
			</div>
			<div class="container_1">
				<div>
					<form>
						<div class="pr_search_tab_bg">
							<div class="pr_search_tab">
								<div class="cate_ip">
									<i class="glyphicon glyphicon-th-list icon_size"></i> 카테고리선택
								</div>
								<select name="category" class="cate_select">
									<option value="">best</option>
									<option value="">new</option>
									<option value="">푸드</option>
									<option value="">의류</option>
									<option value="">외출용품</option>
									<option value="">대형견코너</option>
									<option value="">홈리빙</option>
								</select>
								<div>
									<div class="cate_ip">
										<i class="glyphicon glyphicon-search icon_size"></i> 상품검색
									</div>
									<input type="text" name="search" class="h_input">
									<button class="btn" id="sc_bt">검색</button>
									<a href="photo_wri.jsp"><div class="pencil"><i class="glyphicon glyphicon-pencil"></i>글쓰기</div></a>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div>
					<!-- 게시물 하나 시작 -->
					<div width="50%">
						<div class="pr_box">
							<div class="pr_in_box">
								<a href="photo.jsp"> <img alt="사진"
									src="../share/img/img1.jpg" class="img_size" />
									<div>
										<h5>
											<b>글제목입니다. 말줄임 처리도 합니다.</b>
										</h5>
										아이디<br>
										<hr />
										<div class="pr_content">글내용입니다. 여기도 말줄임 처리가 되나요? 일단
											해보겠습니다. 박스로 영역 크기를 잡은 후 말줄임 처리를 합니다. 긴 내용을 적어도 괜찮습니다. 지금은 4월
											2일 오전 11시 6분. 점심시간까지 두 시간 좀 안 되게 남았어요.</div>
									</div>
								</a>
								<button class="btn btn-inverse" id="heart_bt">
									<i class="glyphicon glyphicon-heart icon_size"></i> 추천
								</button>
							</div>
						</div>
					</div>
					<!-- 게시물 하나 끝 -->
					<!-- 게시물 하나 시작 -->
					<div>
						<div class="pr_box">
							<div class="pr_in_box">
								<a href="photo.jsp"> <img alt="사진"
									src="../share/img/img2.jpg" class="img_size" />
									<div>
										<h5>
											<b>글제목입니다. 말줄임 처리도 합니다.</b>
										</h5>
										아이디<br>
										<hr />
										<div class="pr_content">글내용입니다. 여기도 말줄임 처리가 되나요? 일단
											해보겠습니다. 박스로 영역 크기를 잡은 후 말줄임 처리를 합니다. 긴 내용을 적어도 괜찮습니다. 지금은 4월
											2일 오전 11시 6분. 점심시간까지 두 시간 좀 안 되게 남았어요.</div>
									</div>
								</a>
								<button class="btn btn-inverse" id="heart_bt">
									<i class="glyphicon glyphicon-heart icon_size"></i> 추천
								</button>
							</div>
						</div>
					</div>
					<!--// 게시물 하나 끝 -->
					<!-- 게시물 하나 시작 -->
					<div>
						<div class="pr_box">
							<div class="pr_in_box">
								<a href="photo.jsp"> <img alt="사진"
									src="../share/img/img3.jpg" class="img_size" />
									<div>
										<h5>
											<b>글제목입니다. 말줄임 처리도 합니다.</b>
										</h5>
										아이디<br>
										<hr />
										<div class="pr_content">글내용입니다. 여기도 말줄임 처리가 되나요? 일단
											해보겠습니다. 박스로 영역 크기를 잡은 후 말줄임 처리를 합니다. 긴 내용을 적어도 괜찮습니다. 지금은 4월
											2일 오전 11시 6분. 점심시간까지 두 시간 좀 안 되게 남았어요.</div>
									</div>
								</a>
								<button class="btn btn-inverse" id="heart_bt">
									<i class="glyphicon glyphicon-heart icon_size"></i> 추천
								</button>
							</div>
						</div>
					</div>
					<!--// 게시물 하나 끝 -->
					<!-- 게시물 하나 시작 -->
					<div>
						<div class="pr_box">
							<div class="pr_in_box">
								<a href="photo.jsp"> <img alt="사진"
									src="../share/img/img4.jpg" class="img_size" />
									<div>
										<h5>
											<b>글제목입니다. 말줄임 처리도 합니다.</b>
										</h5>
										아이디<br>
										<hr />
										<div class="pr_content">글내용입니다. 여기도 말줄임 처리가 되나요? 일단
											해보겠습니다. 박스로 영역 크기를 잡은 후 말줄임 처리를 합니다. 긴 내용을 적어도 괜찮습니다. 지금은 4월
											2일 오전 11시 6분. 점심시간까지 두 시간 좀 안 되게 남았어요.</div>
									</div>
								</a>
								<button class="btn btn-inverse" id="heart_bt">
									<i class="glyphicon glyphicon-heart icon_size"></i> 추천
								</button>
							</div>
						</div>
					</div>
					<!--// 게시물 하나 끝 -->
				</div>
				<div class="text-center">
					<ul class="pagination pagination-sm">
						<li class="disabled"><a href="#">&laquo;</a></li>
						<li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/share/bottom_tp.jsp"%>
	<script type="text/javascript">
    $(function() {
        $('.pr_box button').click(function() {
            $(this).toggleClass("btn, btn-inverse");
        });
    });
    </script>
</body>

</html>