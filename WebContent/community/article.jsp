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
/** 하나의 댓글 전체 */
.comment_nai {
	border-bottom: 1px solid #red;
}

.comment-ana {
	padding: 20px 15px;
	border: solid 1px #ffc7c1;
	background: #ffc7c1;
}

/** 댓글창div 전체 */
.memory {
	display: inline-block;
	width: 68%;
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
/** 원래있던 댓글 */

/** 동적 생성된 textaread */
.comment-edit {
	min-width: 210px;
	min-height: 50px;
}

.insert {
	
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
				<b id="title">☆뽀삐뽀삐 사이트 오픈 공지☆</b><br> <small id="user_name">(주)뽀삐뽀삐
					| <span id="wri_date">2020.01.29</span> | 조회<span id="hit">215</span>
				</small>
			</div>
			<hr>
			<div class="nai">
				<p id="main_text">
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
						<button type="submit" class="btn btn-inverse btn-sm btn-del">삭제</button>
					</div>
				</div>
				<div class="comment-nai">
					<div class="memory">
						<small class="small"><span>김** | </span><span>20.02.03</span></small><br />
						<span class="span">할인 많이 해주세요!!</span><br />
					</div>
					<div class="button2">
						<button type="submit" class="btn btn-sm btn-edit">수정</button>
						<button type="submit" class="btn btn-inverse btn-sm btn-del">삭제</button>
					</div>
				</div>
				<div class="comment-nai">
					<div class="memory">
						<small class="small"><span>최** | </span><span>20.02.07</span></small><br />
						<span class="span">매일 놀러올게요>_ <</span> <br />
					</div>
					<div class="button2">
						<button type="submit" class="btn btn-sm btn-edit">수정</button>
						<button type="submit" class="btn btn-inverse btn-sm btn-del">삭제</button>
					</div>
				</div>
				<div class="comment-nai">
					<div class="memory">
						<small class="small"><span>이** | </span><span>20.02.10</span></small><br />
						<span class="span">맛난 개껌 많이 팔아주세여~!</span><br />
					</div>
					<div class="button2">
						<button type="submit" class="btn btn-sm btn-edit">수정</button>
						<button type="submit" class="btn btn-inverse btn-sm btn-del">삭제</button>
					</div>
				</div>
				<div class="comment-nai">
					<div class="memory">
						<small class="small"><span>박** | </span><span>20.02.015</span></small><br />
						<span class="span">번창하세용^___^</span><br />
					</div>
					<div class="button2">
						<button type="submit" class="btn btn-sm btn-edit">수정</button>
						<button type="submit" class="btn btn-inverse btn-sm btn-del">삭제</button>
					</div>
				</div>
			</div>
			<div class="comment-ana" id="comment-ana">
				<small>회원에게만 댓글권한이 있습니다.</small>
			</div>
			<form id="article-comment" class="article-comment"
				name="article-comment" method="post" action="../api/a_comment.do">
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
				<textarea class="comment_area" id="comment_area"
					placeholder="내용을 입력하세요." maxlength="1800"></textarea>
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
		<div id="result"></div>
	</div>
	<%@ include file="/share/bottom_tp.jsp"%>


	<script type="text/javascript">
		/** 댓글 수정 삭제 --- 등록 취소 버튼 기능 구현 */
		$(function() {
			// 댓글 내용을 text에 담기
			var original = $(this).parent().prev().children().eq(2).text();
			// 수정 버튼 클릭시
			$(".btn-edit").on("click", function(e) {
				var edit_commit = $(this).text();
				if (edit_commit=="수정") {
					var original = $(this).parent().prev().children().eq(2).text();
					// 댓글 내용을 지워버리기
					$(this).parent().prev().children().eq(2).text("");
					
					// 텍스트 태그를 html에 담기
					var comment_edit = $("<textarea>");
					// <textarea class="comment-edit"></textarea> --> 아랫줄 실행시 완성된 HTML 태그
					comment_edit.addClass('comment_edit');
					// 생성된 태그에 원래의 댓글 내용 original 추가하기
					comment_edit.text(original);
					// "" 로 지운 댓글 내용에 textarea 추가하기
					$(this).parent().prev().children().eq(2).append(comment_edit);
					$(this).text("등록");
					$(this).next().text("취소");
					
				} else {
					// 사용자가  글 내용을 담는다.
					var recommit = $(".comment_edit").val();
					$(this).parent().prev().children().eq(3).remove();
					$(this).parent().prev().children().eq(2).text(recommit);
					$(this).text("수정");
					$(this).next().text("삭제");
					
				}
				
			});
				
			// 댓글 삭제 버튼 
			$(".btn-del").on('click', function(e) {
				var del_cancel=$(this).text();
				var original = $(this).parent().prev().children().eq(2).text();
				
				if (del_cancel=="삭제") {
				$(this).parent().parent().remove();
				} else {
					$(this).parent().prev().children().eq(3).remove();
					$(this).parent().prev().children().eq(2).text(original);
					$(this).text("삭제");
					$(this).prev().text("수정");
				}
			});
			
		});

		
		
	</script>
</body>

</html>