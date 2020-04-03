<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>

<head>
<%@ include file="/share/head_tp.jsp"%>
<style type="text/css">
.tabtab {
	margin-top: 10px;
}

.nav-tabs {
	width: 100%;
	margin-top: 20px;
}

.nav-tabs li {
	width: 50%;
	text-align: center;
}

.nav-tabs a {
	width: 100%;
	color: #333;
}

.bar1 {
	text-align: center;
	background: #ff6261;
	color: white;
	margin: auto;
	margin-top: 5px;
	padding: 10px 0px;
}

.bar1-good {
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.onegood {
	width: 96%;
	margin: auto;
	margin-top: 5px;
	margin-bottom: 5px;
	padding: 20px;
	border: 1px solid #FFC7C1
}

.cart-img {
	display: inline-block;
	width: 80px;
	float: left;
	margin-right: 10px;
}

.mybought {
	width: 70%;
	display: inline-block;
	float: left;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	padding-right: 10px;
	padding-bottom: 10px;
}

.mybought small {
	display: inline-block;
	padding-top: 15px;
	padding-bottom: 15px;
}

.star {
	width: 70%;
	display: inline-block;
	float: left;
}

.review {
	display: inline-block;
	width: 70%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.btn1 {
	display: inline-block;
	float: right;
	margin-top: 20px;
}

.btn1:hover {
	color: white;
}

.solid-bottom {
	border-bottom: 1px solid #eee;
}

.solid-bottom a{
	color: #333;
	text-decoration: none;
}

.onegood-bottom a {
	color: #333;
	text-decoration: none;
}

.footer {
	margin-top: 50px;
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
						class="glyphicon glyphicon-chevron-left"></i></a>후기관리
				</b>
			</h4>
		</div>
		<!-- 탭 메뉴 시작 -->
		<div class="tabtab">
			<ul class="nav nav-tabs" id="mytabs">
				<li class="active"><a href="#good1" data-toggle="tab">작성
						가능한 리뷰</a></li>
				<li><a href="#good2" data-toggle="tab">내가 작성한 리뷰</a></li>
			</ul>
			<!-- 탭화면 시작 -->
			<div class="tab-content">
				<div class="tab-pane fade in active all1" id="good1">
					<div class="bar1">
						<b>작성 가능한 리뷰<span style="color: #00C6ED"> 1</span></b>
					</div>
					<div class="onegood clearfix">
						<div class="solid-bottom clearfix">
							<a href="#"><img src="../share/img/4_M.jpg" class="cart-img">
								<div class="mybought">
									<span><b class="bar1-good">펫클럽 데이스포 케어츄르
											15kg*4개입/츄르간식1</b></span><br> <small>구매날짜: <span>20.02.22</span></small></a>
						</div>
					</div>
					<button type="button"
						onclick="location.href='../community/photo_wri.jsp'"
						class="btn btn1">리뷰쓰기</button>
				</div>
			</div>
			<div class="tab-pane fade" id="good2">
				<div class="bar1">
					<b>내가 작성한 리뷰<span style="color: #00C6ED;"> 1</span></b>
				</div>
				<div class="onegood onegood-bottom">
					<a href="#"><img src="../share/img/4_M.jpg" class="cart-img">
						<div class="mybought">
							<span><b>펫클럽 데이스포 케어츄르 15kg*4개입/츄르간식1</b></span><br></a>
				</div>
				<div class="star">
					<p class="star-rating">
						<a href="#" class="on">★</a> <a href="#" class="on">★</a> <a
							href="#" class="on">★</a> <a href="#" class="on">★</a> <a
							href="#" class="on">★</a>
					</p>
				</div>
				<br />
				<div class="review" id="review">
					<span>만족합니다~ 항상 여기서만 구매합니다!</span>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

	<%@ include file="/share/bottom_tp.jsp"%>
	<!-- Javascript -->
	<script type="text/javascript">
		$(function() {
			$("#mytabs").on("shown.bs.tab", function(e) {
				$("active").css("background", "#ff6261");
			});
		});
	</script>
</body>

</html>