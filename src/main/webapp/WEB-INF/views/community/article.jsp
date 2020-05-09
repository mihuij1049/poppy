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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/share/article.css" />

</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">

			<div class="page-title clearfix">

				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a> ${output.bbstype }
					</b>
				</h4>

			</div>
			<div class="nai">
				<p id="main_text">${output.bbscontent}</p>
			</div>
			<div class="comment">
				<c:choose>

					<c:when test="${output.bbstype=='공지사항'}">
						<button type="button"
							onclick="location.href='${pageContext.request.contextPath}/community/notice.do'"
							class="btn btn-inverse btn-sm list">목록</button>
					</c:when>

					<c:otherwise>
						<div class="eddlbuttons clearfix">
							<button type="button"
								onclick="location.href='${pageContext.request.contextPath}/community/qna.do'"
								class="btn btn-inverse btn-sm list">목록</button>
							<!-- 글쓴이가 로그인중인 사용자라면 수정/삭제 버튼이 보인다 -->
							<c:if test="${userInfo.username==output.username}">
								<a
									href="${pageContext.request.contextPath}/community/deleteqna.do?bbsno=${output.bbsno}">
									<button type="submit" class="btn btn-inverse btn-sm btn-del">삭제</button>
								</a>
								<a
									href="${pageContext.request.contextPath}/community/qna_edit.do?bbsno=${output.bbsno}">
									<button type="submit" class="btn btn-sm btn-del">수정</button>
								</a>


							</c:if>
						</div>
					</c:otherwise>

				</c:choose>

			</div>


			<div class="comment-list">
				<div class="list-subject">
					<b style="color: white;">댓글목록</b>
				</div>
				<table class="table">
					<tbody>
						<c:choose>
							<%-- 조회결과가 없는 경우 --%>
							<c:when test="${output2 == null || fn:length(output2) == 0}">
								<tr>
									<td colspan="9" align="center">조회결과가 없습니다.</td>
								</tr>
							</c:when>
							<%-- 조회결과가 있는  경우 --%>
							<c:otherwise>
								<%-- 조회 결과에 따른 반복 처리 --%>
								<c:forEach var="item" items="${output2}" varStatus="status">
									<%-- 출력을 위해 준비한 변수 --%>
									<c:set var="cmtno" value="${item.cmtno}" />
									<%-- 상세페이지로 이동하기 위한 URL --%>
									<c:url value="/community/article.do" var="viewUrl">
										<c:param name="bbsno" value="${item.bbsno}" />
									</c:url>
									<div class="comment-nai"
										style="border-bottom: 1px dotted #eee;">
										<div class="menory">

											<small class="small"><span>${item.username} |
											</span><span>${item.regdate}</span></small>
										</div>
										<c:if test="${userInfo.username==item.username}">
											<button type="submit" class="btn btn-sm btn-edit">수정</button>
											<button type="submit" class="btn btn-inverse btn-sm btn-del">삭제</button>
										</c:if>
										<span class="span">${item.cmtcontent}</span><br />

									</div>

								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<c:choose>
				<c:when test="${!empty userInfo.username }">
					<form class="article-comment" method="post"
						action="${pageContext.request.contextPath}/community/article.do">
						<div class="comment-write">
							<div class="info-name">이름: ${myCmt.username}</div>
						</div>
						<textarea class="comment_area" id="comment_area" name="cmtcontent"></textarea>
						<button type="submit" class="enter btn btn-sm" id="enter">등록</button>
					</form>
				</c:when>
				<c:otherwise>
					<b class="cannot">작성 권한이 없습니다. 로그인 후 이용 부탁드립니다.</b>
				</c:otherwise>
			</c:choose>


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
							url : "../api/comments.do",
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