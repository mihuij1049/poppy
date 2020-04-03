<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/share/head_tp.jsp"%>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Poppy-Poppy</title>
<style type="text/css">
p {
	margin: 0;
}

.content .container {
	margin-top: 20px;
	margin-bottom: 50px;
	width: 96%;
	border: 1px solid #ffc7c1;
	padding: 10px;
}

.big-image {
	border: 1px solid #ffc7c1;
	width: 100%;
}

.info-box {
	padding: 10px 0;
	font-size: 11px;
	border-bottom: 1px solid #ddd;
}

.info-box a {
	color: #333;
}

.info-content {
	display: inline;
	padding-left: 5px;
}

.small-image {
	border: 1px solid #ffc7c1;
	width: 20%;
	float: left;
}

.info-content p {
	display: inline;
	padding-left: 5px;
}

.star {
	padding-top: 5px;
}

.writer {
	padding-top: 10px;
}

.rv-title {
	padding: 10px 0;
	border-bottom: 1px solid #ddd;
}

.rv-content {
	padding: 10px 0;
}

.date {
	color: #aaa;
	font-size: 12px;
	padding-bottom: 10px;
}

.recommend {
	padding: 5px;
	border: 1px dashed #ddd;
	margin-bottom: 30px;
}

.recommend p {
	display: inline;
	padding-right: 10px;
}

.btn:hover {
	background-color: #FF6261;
	color: #fff;
}

.rv-footer {
	padding: 15px 0;
	height: 50px;
	text-align: center;
	color: #fff;
	background: #ffc7c1;
}

.clear:after {
	content: '';
	display: block;
	float: none;
	clear: both;
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
						class="glyphicon glyphicon-chevron-left"></i></a>포토리뷰
				</b>
			</h4>
		</div>
		<div class="container">
			<img src="../share/img/img1.jpg" alt="리뷰사진" class="big-image">
			<div class="info-box">
				<a href="../gallery/goods.jsp"><img src="../share/img/4_M.jpg"
					class="small-image"></a>
				<div class="info-content clear">
					<a href="../gallery/goods.jsp">펫클럽 데이스포 케어츄르 15gX4개입/고양이츄르간식</a><br>
					<div class="star">
						<p>★★★★★</p>
						<p>(5.0)</p>
						<br>
					</div>
					<div class="writer">
						<p>김****</p>
					</div>
				</div>
			</div>
			<div class="rv-title">
				<p>이 리뷰에 대해 n명의 고객님께서 추천해 주셨습니다.</p>
			</div>
			<div class="rv-content">
				<p class="date">20.01.31</p>
				<p>리뷰내용~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~</p>
			</div>
			<div class="recommend">
				<p>이 리뷰가 도움이 되셨다면 눌러주세요</p>
				<button class="btn">추천</button>
			</div>
			<div class="rv-footer">
				<p>관리자에게만 댓글작성 권한이 있습니다.</p>
			</div>
		</div>
	</div>
	<%@ include file="/share/bottom_tp.jsp"%>
	<!-- Javascript -->
	<script src="../share/assets/js/jquery-3.2.1.min.js"></script>
	<script src="../share/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		
	</script>
</body>

</html>