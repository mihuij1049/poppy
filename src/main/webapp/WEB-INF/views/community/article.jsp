<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>

<head>
<%@ include file="../share/head_tp.jsp"%>
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
.comment_edit {
	width: 100%;
	min-height: 50px;
}

.insert {
	
}

/** 비밀번호 입력 모달 */
.content {
	position: relative;
}

.customer_pass {
	margin: auto;
	display: none;
	width: 90%;
	position: absolute;
	z-index: 1;
	border: 1px solid #ffc7c1;
	background: #ffc7c1;
	text-align: center;
	margin: auto;
}

.pass_label {
	padding-top: 15px;
	padding-bottom: 15px;
}

/** 글 수정삭제 버튼 */
.editbuttons {
	float: right;
}
</style>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">
		
			<div class="page-title clearfix">

				<h4>
					<b> 
					<a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a> 
							${output.bbstype }
   							</b>
				</h4>

			</div>
			<div class="subject">
				<b id="title">${output.bbstitle}</b><br> <small id="user_name">${output.username}
					| <span id="wri_date">${output.regdate}</span> | 조회<span id="hit">215</span>
				</small>
				<div class="editbuttons">
					<button type="submit" class="btn btn-sm btn-edit">수정</button>
					<button type="submit" class="btn btn-inverse btn-sm btn-del">삭제</button>
				</div>
			</div>

			<hr>
			<div class="nai">
				<p id="main_text">${output.bbscontent}</p>
			</div>
			<div class="comment">
				<button type="button"
					onclick="location.href='${pageContext.request.contextPath}/community/notice.do'"
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
		<!--   비밀번호 입력 모달 ------------------------->
		<div class="customer_pass" id="customer_pass">
			<b class="plz_pass">비밀번호를 입력해 주세요.</b><br> <label for="cs_pass"
				class="pass_label">비밀번호</label> <input type="password"
				name="cs_pass" class="cs_pass" id="cs_pass"><br>

			<div class="cs_pass_2btns">
				<button type="submit" class="btn btn-sm btn-ok">확인</button>
				<button type="submit" class="btn btn-inverse btn-sm btn-cancel">취소</button>
			</div>
		</div>
	</div>


	<%@ include file="../share/bottom_tp.jsp"%>


	<script type="text/javascript">
		/** 댓글 수정 삭제 --- 등록 취소 버튼 기능 구현 */
		$(function() {
			// 댓글 내용을 text에 담기
			var original = $(this).parent().prev().children().eq(2).text();
			// 수정 버튼 클릭시
			$(".btn-edit").on(
					"click",
					function(e) {
						$("#customer_pass").show();
						var edit_commit = $(this).text();

						// 사용자의 입력값을 가져온다.
						var upass = $("cs_pass").val();

						$.ajax({
							// 결과를 읽어올 URL --> <form>태그의 action속성
							url : "../api/a_pass.do",
							// 웹 프로그램에게 데이터를 전송하는 방식 --> <form> 태그의 method 속성
							method : "post",
							// 전달할 조건값은 사용자의 입력값을 활용하여 JSON형식으로 구성
							data : {
								cs_pass : upass
							},
							// 읽어올 내용의 형식 (생략할 경우 json)
							dataType : "html",
							// 읽어온 내용을 처리하기 위한 함수
							success : function(req) {
								$("#result").html(req);
							}
						});

						if (edit_commit == "수정") {
							var original = $(this).parent().prev().children()
									.eq(2).text();
							// 댓글 내용을 지워버리기
							$(this).parent().prev().children().eq(2).text("");

							// 텍스트 태그를 html에 담기
							var comment_edit = $("<textarea>");
							// <textarea class="comment-edit"></textarea> --> 아랫줄 실행시 완성된 HTML 태그
							comment_edit.addClass('comment_edit');
							// 생성된 태그에 원래의 댓글 내용 original 추가하기
							comment_edit.text(original);
							// "" 로 지운 댓글 내용에 textarea 추가하기
							$(this).parent().prev().children().eq(2).append(
									comment_edit);
							$(this).text("등록");
							$(this).next().text("취소");

						} else {
							// 사용자가  글 내용을 담는다.
							var result = confirm("수정하시겠습니까?");
							if (result) {
								var recommit = $(".comment_edit").val();
								$(this).parent().prev().children().eq(3)
										.remove();
								$(this).parent().prev().children().eq(2).text(
										recommit);
								$(this).text("수정");
								$(this).next().text("삭제");
							} else {
								return false;
							}

						}

					});

			// 댓글 삭제 버튼 
			$(".btn-del").on('click', function(e) {
				var del_cancel = $(this).text();
				var original = $(this).parent().prev().children().eq(2).text();

				if (del_cancel == "삭제") {
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