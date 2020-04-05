<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/share/head_tp.jsp"%>
<style type="text/css">
/** 전체 마진 */
.container_1 {
	margin-bottom: 50px
}

/** 전체 마진 끝 */
.search_tab_bg {
	width: 100%;
	background-color: #ffc7c1;
	padding-top: 10px;
	margin-top: 20px;
	margin-bottom: 15px;
	color: #fff;
}

.container .cate_select {
	width: 30%;
	height: 23px;
	margin: 0 0 10px 10px;
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

.pr_box {
	float: left;
	width: 50%;
	padding: 5px;
}

.pr_in_box {
	border: none;
	padding: 5px;
	margin: 10px 0 10px 0;
}

.pr_in_box h5 {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	/* 라인수 */
	-webkit-box-orient: vertical;
	word-wrap: break-word;
}

.container .img_size {
	width: 100%;
}

.container . .pr_box .btn {
	padding-right: 50px;
	padding-bottom: 20px;
	width: 50px;
	height: 25px;
	font-size: 12px;
	background-color: #ffc7c1;
	color: #fff;
}

.container_1 hr {
	margin: 2px 2px 10px 2px;
	padding: 0;
}

.container_1 h5 {
	color: #FF8F83;
}

.pagination>.active>span {
	background-color: #FF8F83;
	border-color: #FF8F83;
}

/** 이건 그겁니다. 하트 버튼이요! 누르면 숫자가 올라가는 그거. */

.pr_in_box #pay {
	display: inline-block;
	float: right;
}

.pr_in_box #pay i {
	margin: 0px 2px 0px 0px;
}

.pr_in_box #pay p {
	display: inline-block;
	float: right;
	margin: 1px 0px 0px 2px;
}

.container .glyphicon-heart {
	height: 8px;
	font-size: 20px;
	color: #ff8f83;
	margin-right: 10px;
	z-index: 10000;
}

.container .glyphicon-heart-empty {
	height: 8px;
	font-size: 20px;
	color: #ff8f83;
	margin-right: 10px;
}

/** 하트버튼 끝입니다! */

.container a {
	color: #777;
	text-decoration: none;
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
						class="glyphicon glyphicon-chevron-left"></i></a>BEST
				</b>
			</h4>
		</div>
			<div class="container_1">
				<div>
					<form>
						<div class="search_tab_bg">
							<select name="category" class="cate_select">
								<option value="">정렬방식</option>
								<option value="">신상품</option>
								<option value="">상품명</option>
								<option value="">낮은가격</option>
								<option value="">높은가격</option>
								<option value="">상품후기</option>
							</select>
						</div>
					</form>
				</div>
				<div>
					<!-- 게시물 하나 시작 -->
					<div width="50%">
						<div class="pr_box">
							<div class="pr_in_box">
								<a href="goods.jsp"> <img alt="사진"
									src="../share/img/gal_list_img1.jpg" class="img_size">
									<div >
										<h5>
											<b>벨버드 고흡수 30g 오리지날패드 300매 대용량애견패드</b>
										</h5>
										<hr />
										50,000원</a>
								<div id="pay">
									<i class="glyphicon glyphicon-heart-empty"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 게시물 하나 끝 -->
				<!-- 게시물 하나 시작 -->
				<div>
					<div class="pr_box">
						<div class="pr_in_box">
							<img alt="사진" src="../share/img/gal_list_img2.jpg"
								class="img_size">
							<div class="gal_text">
								<h5>
									<b>펫클럽 시간순삭노즈워크매트 옐로 원형/애견노즈워크</b>
								</h5>
								<hr />
								50,000원
								<div id="pay">
									<i class="glyphicon glyphicon-heart-empty icon_size"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--// 게시물 하나 끝 -->
				<!-- 게시물 하나 시작 -->
				<div>
					<div class="pr_box">
						<div class="pr_in_box">
							<img alt="사진" src="../share/img/gal_list_img3.jpg"
								class="img_size">
							<div>
								<h5>
									<b>펫클럽 벨버드 순삭져키 1kg 1+1/강아지간식/애견간식</b>
								</h5>
								<hr />
								50,000원
								<div id="pay">
									<i class="glyphicon glyphicon-heart-empty icon_size"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--// 게시물 하나 끝 -->
				<!-- 게시물 하나 시작 -->
				<div>
					<div class="pr_box">
						<div class="pr_in_box">
							<img alt="사진" src="../share/img/gal_list_img4.jpg"
								class="img_size">
							<div>
								<h5>
									<b>펫클럽 데이스포 케어츄르 오리 닭 관절 15g 32개입</b>
								</h5>
								<hr />
								50,000원
								<div id="pay">
									<i class="glyphicon glyphicon-heart-empty icon_size"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--// 게시물 하나 끝 -->
				<div>
					<div class="pr_box">
						<div class="pr_in_box">
							<a href="goods.jsp"> <img alt="사진"
								src="../share/img/gal_list_img1.jpg" class="img_size">
							</a>
							<div>
								<h5>
									<b>벨버드 고흡수 30g 오리지날패드 300매 대용량애견패드</b>
								</h5>
								<hr />
								50,000원
								<div id="pay">
									<i class="glyphicon glyphicon-heart-empty icon_size"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 게시물 하나 끝 -->
				<!-- 게시물 하나 시작 -->
				<div>
					<div class="pr_box">
						<div class="pr_in_box">
							<img alt="사진" src="../share/img/gal_list_img2.jpg"
								class="img_size">
							<div>
								<h5>
									<b>펫클럽 시간순삭노즈워크매트 옐로 원형/애견노즈워크</b>
								</h5>
								<hr />
								50,000원
								<div id="pay">
									<i class="glyphicon glyphicon-heart-empty icon_size"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--// 게시물 하나 끝 -->
				<!-- 게시물 하나 시작 -->
				<div>
					<div class="pr_box">
						<div class="pr_in_box">
							<img alt="사진" src="../share/img/gal_list_img3.jpg"
								class="img_size">
							<div>
								<h5>
									<b>펫클럽 벨버드 순삭져키 1kg 1+1/강아지간식/애견간식</b>
								</h5>
								<hr />
								50,000원
								<div id="pay">
									<i class="glyphicon glyphicon-heart-empty icon_size"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--// 게시물 하나 끝 -->
				<!-- 게시물 하나 시작 -->
				<div>
					<div class="pr_box">
						<div class="pr_in_box">
							<img alt="사진" src="../share/img/gal_list_img4.jpg"
								class="img_size">
							<div>
								<h5>
									<b>펫클럽 데이스포 케어츄르 오리 닭 관절 15g 32개입</b>
								</h5>
								<hr />
								50,000원
								<div id="pay">
									<i class="glyphicon glyphicon-heart-empty icon_size"></i>
								</div>
							</div>
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
        $('.pr_in_box i').click(function() {
            $(this).toggleClass("glyphicon-heart glyphicon-heart-empty");
        });
    });
    </script>
</body>

</html>