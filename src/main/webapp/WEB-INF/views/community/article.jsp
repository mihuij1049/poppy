<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<style type="text/css">
.cannot {
	dispay: block;
	border: 1px solid #ffc7c1;
	background: #ffc7c1;
	padding: 15px;
	text-align: center;
	width: 100%;
	color: white;
	margin: auto;
	color: white;
}

.cannotbox {
	width: 100%;
	height: 50px;
}
.nai {
	padding-top: 15px;
	margin-bottom: 50px;
}

.list {
	margin: 10px 10px;
}
.solidhr {
	margin: 0px;
}
</style>
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
							class="glyphicon glyphicon-chevron-left"></i></a> 
							<c:choose>
					<c:when test="${output.bbstype=='A'}">
					공지사항
					</c:when>
					<c:otherwise>
					QnA
					</c:otherwise>
					</c:choose>
					</b>
				</h4>

			</div>
			<div class="wriinfo">
				<c:choose>
					<c:when test="${output.bbstype=='A'}">
						<p class="articletitle">[공지사항] ${output.bbstitle}</p>
					</c:when>
					<c:otherwise>
						<p class="articletitle">[Q&A] ${output.bbstitle}</p>
					</c:otherwise>
				</c:choose>
				<p class="articlewriter">${output.username }</p>
			</div>
			<div class="nai">
				<p id="main_text">${output.bbscontent}</p>
			</div>
			
				
<c:choose>
					<c:when test="${output.bbstype=='A'}">
					<hr class="solidhr">
						<button type="button"
							onclick="location.href='${pageContext.request.contextPath}/community/notice.do'"
							class="btn btn-inverse btn-sm list">목록</button>
							<hr class="solidhr">
					</c:when>

					<c:otherwise>
					<div class="comment">
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
									href="${pageContext.request.contextPath}/community/editqna.do?bbsno=${output.bbsno}">
									<button type="submit" class="btn btn-sm btn-edit">수정</button>
								</a>


							</c:if>
						</div>
						</div>
					</c:otherwise>

				</c:choose>

			


			<div class="comment-list">
			<c:if test="${output.bbstype=='B'}">
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
										<c:param name="bbstype" value="${item.bbstype}" />
									</c:url>
									<div class="comment-nai"
										style="border-bottom: 1px dotted #eee;">
										<div class="menory">
											<small class="small"><span>${item.username} |
											</span><span>${item.regdate}</span></small>
										</div>
										<c:if test="${userInfo.username==item.username}">


											<button type="submit"
												class="btn btn-inverse btn-sm btn-delar" id="btn-delar" data-cmtno="${item.cmtno}">삭제</button>
											<button type="submit" class="btn btn-sm btn-editar"
												id="btn-editar">수정</button>
										</c:if>
										<span class="span">${item.cmtcontent}</span><br />
									</div>

								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				</c:if>
			</div>
			<c:if test="${output.bbstype=='B'}">
			<c:choose>
				<c:when test="${!empty userInfo.username }">
					<form class="article-comment" id="addForm" method="POST"
						action="${pageContext.request.contextPath}/community/article_cmtAdd">
						<input type="hidden" value="${myCmt.memno}" name="memno" /> 
						<input type="hidden" value="${output.bbsno}" name="bbsno" />
						<input type="hidden" value="${output.bbstype}" name="bbstype" />
						<div class="comment-write">
							<div class="info-name">이름: ${myCmt.username}</div>
						</div>
						<textarea class="comment_area" id="comment_area" name="cmtcontent"></textarea>
						<button type="submit" class="enter btn btn-sm" id="enter">등록</button>
					</form>
				</c:when>
				<c:otherwise>
					<div class="cannotbox">
						<b class="cannot">작성 권한이 없습니다. 로그인 후 이용 부탁드립니다.</b>
					</div>
				</c:otherwise>
			</c:choose>
			</c:if>


		</div>

		<!--   비밀번호 입력 모달 ------------------------->
		<div class="customer_pass" id="customer_pass">
			<b class="plz_pass">비밀번호를 입력해 주세요.</b><br> <label for="cs_pass"
				class="pass_label">비밀번호</label> <input type="password"
				name="cs_pass" class="cs_pass" id="cs_pass"><br>

			<div class="cs_pass_2btns">
				<button type="submit" class="btn btn-sm btn-ok">확인</button>
				<button type="button" class="btn btn-inverse btn-sm btn-cancel">취소</button>
			</div>
		</div>
	</div>


	<%@ include file="../share/bottom_tp.jsp"%>

	<!-- jQuery Ajax Form plugin CDN -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
	<!-- jQuery Ajax Setup -->
	<script
		src="${pageContext.request.contextPath}/share/plugins/ajax/ajax_helper.js"></script>
	<!-- User Code -->
	<script>
    $(function() {
        // #addForm에 대한 submit이벤트를 가로채서 Ajax요청을 전송한다.
        $("#addForm").ajaxForm({
            // 전송 메서드 지정
            method: "POST",
            // 서버에서 200 응답을 전달한 경우 실행됨
            success: function(json) {
                
                // json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
                if (json.rt == "OK") {
                	window.location="${pageContext.request.contextPath}/community/article.do?bbstype=B&bbsno=" + json.item.bbsno; 
                }
            }
        });
    });
    
    $(function() {
 	   $("#btn-delar").click(function(e) {
 		   e.preventDefault();
 		   let current = $(this);
 		   let cmtno = current.data('cmtno');
 		   //삭제 확인
 		   if(!confirm("댓글을 삭제하시겠습니까?")) {
 			   return false;
 		   }
 		//delete 메서드로 Ajax 요청 --> <form> 전송이 아니므로 직접 구현한다.
            $.delete("${pageContext.request.contextPath}/community/article", {
                "cmtno": cmtno
            }, function(json) {
                if (json.rt == "OK") {
                    alert("삭제되었습니다.");
                    // 삭제 완료 후 목록 페이지로 이동
                    window.location="${pageContext.request.contextPath}/community/article.do?bbstype=B&bbsno=" + json.item.bbsno;
                }
            });
            });
        });
 	   
	   $(function() { 
			// 댓글 내용을 text에 담기
			
			// 수정 버튼 클릭시
			$("#btn-editar").on("click",function(e) {
				// 원래 댓글 담기
				var original = $(this).next().text();
				console.log(original);
						// 버튼의 텍스트 담기 --> 수정
						var edit_commit = $(this).text();
                if (edit_commit == "수정") {
                	// 댓글 지우기 
                	$(this).next().text("");
					// 텍스트 태그를 html에 담기
					var comment_edit = $("<textarea></textarea>");
					comment_edit.id = 'editcomment';
					// <textarea class="comment-edit"></textarea> --> 아랫줄 실행시 완성된 HTML 태그
					comment_edit.addClass('comment_edit');
					// 생성된 태그에 원래의 댓글 내용 original 추가하기
					comment_edit.text(original);
					// "" 로 지운 댓글 내용에 textarea 추가하기
					$(this).next().append(comment_edit);
					$(this).text("등록");
					$(this).prev().text("취소");
					
				// 등록일 때...
				} else {
					// 사용자가  글 내용을 담는다.
					var result = confirm("수정하시겠습니까?");
					if (result) {
						var recommit = $("#btn-editar").val();
						$(this).text("수정");
						$(this).prev().text("삭제");
					}
					}
				}); 
			}); 
					
					$("#btn-editar").on("click",function(e) {
							
							// #addForm에 대한 submit이벤트를 가로채서 Ajax요청을 전송한다.
					        $(".comment_edit").ajaxForm({
					            // 전송 메서드 지정
					            method: "PUT",
					            // 서버에서 200 응답을 전달한 경우 실행됨
					            success: function(json) {
					                console.log(json);
				                // json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
				                if (json.rt == "OK") {
				                	window.location = "${pageContext.request.contextPath}/community/article.do?bbstype=B" + "&bbsno=" + json.item.bbsno; 
				                }
				            }
					        }); 
					        
									 });
    </script>

</body>

</html>