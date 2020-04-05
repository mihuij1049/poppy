<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>

<head>
<%@ include file="/share/head_tp.jsp"%>
<style type="text/css">
.subject {
	margin: 20px 15px;
}

.subject b {
	display: inline-block;
	margin-top: 10px;
	margin-bottom: 10px;
}

.nai {
	text-align: center;
	font-size: 17px;
	padding-top: 30px;
	padding-bottom: 30px;
	border-bottom: 1px solid #eee;
}

.list {
	margin: 10px 10px;
}

.list-subject {
	border: 1px solid #ffc7c1;
	background-color: #ffc7c1;
}

.list-subject b {
	display: inline-block;
	padding: 10px 10px;
}

.small {
	display: inline-block;
	padding-top: 25px;
	padding-bottom: 5px;
	padding-left: 15px;
}

.span {
	display: inline-block;
	padding-left: 20px;
	padding-bottom: 25px;
}

.button2 {
	display: inline-block;
	float: right;
	margin-right: 15px;
	margin-top: 60px;
}

.comment_nai {
	border-bottom: 1px solid #eee;
}

.comment-ana {
	padding: 20px 15px;
	border: solid 1px #ffc7c1;
	background: #ffc7c1;
}

.memory {
	display: inline-block;
}

.comment_area {
	display: block;
	margin: auto;
	width: 95%;
	min-height: 150px;
	resize: none;
	margin-top: 20px;
	margin-bottom: 15px;
	border: solid 1px #8C8C8C;
	border-radius: 5px;
	padding-left: 10px;
}

.comment-write {
	margin-top: 20px;
}

.info {
	display: inline-block;
}

.info-name {
	display: inline-block;
	margin-left: 15px;
}

.info-pass {
	display: inline-block;
	margin-left: 10px;
}

.information1 {
	width: 70px;
	margin-right: 20px;
	border: solid 1px #8C8C8C;
	border-radius: 2px;
	padding-left: 10px;
}

.information2 {
	width: 100px;
	border: solid 1px #8C8C8C;
	border-radius: 2px;
	padding-left: 10px;
}

.enter {
	display: block;
	float: right;
	margin-right: 15px;
	margin-bottom: 30px;
	border-bottom: 1px solid #eee;
}

.next {
	border-top: 1px solid #eee;
	padding-left: 10px;
	padding-top: 8px;
}

.next a {
	text-decoration: none;
	color: #333;
}

.next a:hover {
	font-weight: bold;
}

.solid {
	border: solid 1px #eee;
	margin-bottom: 50px;
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
							class="glyphicon glyphicon-chevron-left"></i></a>공지사항
					</b>
				</h4>
			</div>
			<div class="subject">
				<b>☆뽀삐뽀삐 사이트 오픈 공지☆</b><br> <small>(주)뽀삐뽀삐 | <span>2020.01.29</span>
					| 조회<span>215</span></small>
			</div>
			<hr>
			<div class="nai">
				<p>
					안녕하세요! 뽀삐뽀삐 입니다:)<br> premium dog food and itet<br> 댕댕이들을
					위한 쇼핑몰 뽀삐뽀삐<br> 사이트를 오픈하였습니다.<br>
				</p>
			</div>
			<div class="comment">
				<button type="button" onclick="location.href='notice.jsp'"
					class="btn btn-inverse btn-sm list">목록</button>
			</div>
			<div class="comment-list">
				<div class="list-subject">
					<b style="color: white;">댓글목록</b>
				</div>
				<div class="comment-nai">
					<div class="memory">
						<small class="small"><span>박** | </span><span>20.02.01</span></small><br />
						<span class="span">자주 이용할게요~</span><br />
					</div>
					<div class="button2">
						<button type="submit" class="btn btn-sm btn-edit">수정</button>
						<button type="submit" class="btn btn-inverse btn-sm">삭제</button>
					</div>
				</div>
				<div class="comment-nai">
					<div class="memory">
						<small class="small"><span>김** | </span><span>20.02.03</span></small><br />
						<span class="span">할인 많이 해주세요!!</span><br />
					</div>
					<div class="button2">
						<button type="submit" class="btn btn-sm btn-edit">수정</button>
						<button type="submit" class="btn btn-inverse btn-sm">삭제</button>
					</div>
				</div>
				<div class="comment-nai">
					<div class="memory">
						<small class="small"><span>최** | </span><span>20.02.07</span></small><br />
						<span class="span">매일 놀러올게요>_ <</span> <br />
					</div>
					<div class="button2">
						<button type="submit" class="btn btn-sm btn-edit">수정</button>
						<button type="submit" class="btn btn-inverse btn-sm">삭제</button>
					</div>
				</div>
				<div class="comment-nai">
					<div class="memory">
						<small class="small"><span>이** | </span><span>20.02.10</span></small><br />
						<span class="span">맛난 개껌 많이 팔아주세여~!</span><br />
					</div>
					<div class="button2">
						<button type="submit" class="btn btn-sm btn-edit">수정</button>
						<button type="submit" class="btn btn-inverse btn-sm">삭제</button>
					</div>
				</div>
				<div class="comment-nai">
					<div class="memory">
						<small class="small"><span>박** | </span><span>20.02.015</span></small><br />
						<span class="span">번창하세용^___^</span><br />
					</div>
					<div class="button2">
						<button type="submit" class="btn btn-sm btn-edit">수정</button>
						<button type="submit" class="btn btn-inverse btn-sm">삭제</button>
					</div>
				</div>
			</div>
			<div class="comment-ana" id="comment-ana">
				<small>회원에게만 댓글권한이 있습니다.</small>
			</div>
			<form id="article-comment" class="article-comment" name="article-comment" method="post" action="../api/a_comment.do">
			<div class="comment-write">
				<div class="info-name">
					<label for="name_write">이름</label> <input type="text"
						name="name_write" class="information1" id="name_write">
				</div>
				<div class=info-pass>
					<label for="pass_write">비밀번호</label> <input type="password"
						name="pass_write" class="information2" id="pass_write">
				</div>
			</div>
			<textarea class="comment_area" id = "comment_area" placeholder="내용을 입력하세요."
				maxlength="1800"></textarea>
			<button type="submit" class="enter btn btn-sm" id="enter">등록</button>
			</form>
		</div>
		<div class="next">
			<p>
				<b>다음글&nbsp;&nbsp;&nbsp;</b> <span><a href="#">신규 회원가입 고객
						혜택안내</span>
			</p>
			</a>
		</div>
		<div id="result">
		
		</div>
	</div>
	<%@ include file="/share/bottom_tp.jsp"%>
	
	
	<script type="text/javascript">
	 $(function() {
		$("#enter").click(function(e){
			e.preventDefault();
		
			// 사용자의 입력값을 가져온다.
			var uname = $("#name_write").val();
			console.log(uname);
			var upw = $("#pass_write").val();
			console.log(upw);
			var comment = $("#comment_area").val();
			console.log(comment);
			
	    	
	    		$.ajax({
	    			url : "../api/a_comment.do",
	                type: "POST",
	                data: { name_write : uname, pass_write : upw, comment_area : comment },
					// 읽어올 내용의 형식 (생략할 경우 json)
					dataType: "html",
					// 읽어온 내용을 처리하기 위한 함수
					success: function(req) {
						$("#result").html(req);
					}
				}); 
			}); 
		});
	</script>
</body>

</html>