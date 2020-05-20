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
<style type="text/css">

</style>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content" id="content">
		<!-- 여기에 작성 -->
		<div class="container">

			<div class="page-title clearfix">

				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a> 
					Q&A
					</b>
				</h4>
			</div>
			<div class="wriinfo">
						<b class="articletitle">[Q&A] ${output.bbstitle}</b>
				<p class="articlewriter">${output.username }</p>
			</div>
			<!-- QNA 상품정보 불러오기 -->
				<div class="qnagoods">
					<img class="photo"
						src="${output.imgpath}" data-goodsno="${output.goodsno}" />
					<div class="goodsname">
						<div class="goodsname">
							${output.gname}<br>
						</div>
						<div class="goodsprice"><fmt:formatNumber value="${output.gprice}" pattern="#,###" />원</div>
					</div>
					<br>
				</div>
			<div class="nai">
				<p id="main_text">${output.bbscontent}</p>
			</div>
					<div class="comment">
						
						<div class="eddlbuttons clearfix">
						<hr class="solidhr" />
							<button type="button"
								onclick="location.href='${pageContext.request.contextPath}/community/qna.do'"
								class="btn btn-inverse btn-sm list" style="margin-bottom: 10px;">목록</button>

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
											<c:param name="bbstype" value="${item.bbstype}" />
											<c:param name="goodsno" value="${item.goodsno}" />
										</c:url>
										<div class="comment-nai"
											style="border-bottom: 1px dotted #eee;">
											<div class="menory">
												<small class="small"><span>${item.username} |
												</span><span>${item.regdate}</span></small>
											</div>

											<div class="all">
												<!---------------- 동적생성 영역 --------------------->
												<div class="cmtcontent">
													<span class="span">${item.cmtcontent}</span><br />
												</div>
												<div class="arbuttons">
													<c:if test="${userInfo.username==item.username}">
														<button type="submit" class="btn btn-sm btn-editar"
															id="btn-editar" data-cmtno="${item.cmtno}"
															data-bbsno="${item.bbsno}">수정</button>
														<button type="button"
															class="btn btn-inverse btn-sm btn-delar" id="btn-delar"
															data-cmtno="${item.cmtno}" data-bbsno="${item.bbsno}">삭제</button>
													</c:if>
												</div>
												<!---------------- // 동적생성 영역 --------------------->
											</div>

										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>

					</table>
				
			</div>
				<c:choose>
					<c:when test="${!empty userInfo.username }">
						<form class="article-comment" id="addForm" method="POST"
							action="${pageContext.request.contextPath}/community/article_cmtAdd">
							<input type="hidden" value="${myCmt.memno}" name="memno" /> <input
								type="hidden" value="${output.bbsno}" name="bbsno" /> <input
								type="hidden" value="${output.bbstype}" name="bbstype" />
							<div class="comment-write">
								<div class="info-name"><span class="glyphicon glyphicon-user"></span> ${myCmt.username}</div>
							</div>
							<textarea class="comment_area" id="comment_area"
								name="cmtcontent"></textarea>
							<button type="submit" class="enter btn btn-sm" id="enter">등록</button>
						</form>
					</c:when>
					<c:otherwise>
						<div class="cannotbox">

							<b class="cannot">작성 권한이 없습니다. 로그인 후 이용 부탁드립니다.</b>

						</div>
					</c:otherwise>
				</c:choose>
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
 	   $(".btn-delar").click(function(e) {
 		  var edit_commit1 = $(this).text();
 		 if (edit_commit1 == "삭제") {
 		   e.preventDefault();
 		   let current = $(this);
 		   let cmtno = current.data('cmtno');
 		  let bbsno = current.data('bbsno');
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
                    window.location="${pageContext.request.contextPath}/community/article.do?bbstype=B&bbsno=" + bbsno;
                }
            });
 		 }
            });
        });
 	   
    /** 사진 클릭 시 상품상세페이지로 이동 */
   $(function() {
	   $(".photo").on("click", function(e) {
		   let current = $(this);
		   let goodsno = current.data('goodsno');
		   window.location="${pageContext.request.contextPath}/gallery_ajax/goods.do?goodsno=" + goodsno;  
	   });
   });
	   $(function() { 
			
			// 수정 버튼 클릭시
			$(".btn-editar").on("click",function(e) {
						// 버튼의 텍스트 담기 --> 수정
						var edit_commit = $(this).text();
                if (edit_commit == "수정") {
                	// 댓글 내용 담기
    				var original=$(this).parent().parent().children().eq(0).text().trim();
    				console.log(original);
                	// 댓글 지우기 
                	$(this).parent().prev().children().hide();
                	var comment_form = $("<form></form>");
                	$(this).parent().prev().append(comment_form);
					// set attribute <form>
					comment_form.attr("id", "editForm");
					comment_form.attr("method", "PUT");
					comment_form.attr("class", "editForm");
					comment_form.attr("action", "${pageContext.request.contextPath}/community/article_cmtEdit"); 
					
					// textarea 생성
					var comment_textarea = $("<textarea></textarea>");
					$(comment_form).append(comment_textarea);
					comment_textarea.attr("id", "editTextarea");
				
					// 생성된 태그에 원래의 댓글 내용 original 추가하기
					comment_textarea.html(original);
					$(this).text("등록");
					$(this).next().text("취소");
					$(this).next().attr("id", "cancelar");
					$("#cancelar").on("click", function(e) {
						$("#editForm").remove();
						$(this).text("삭제");
						$(this).prev().text("수정");
						$(this).next().attr("id", "btn-delar");
						$(this).next().attr("class", "btn-delar");
						$(this).parent().prev().children().show();
					   });
				// 등록일 때...
				} else {
					var result = confirm("수정하시겠습니까?");
					if (result) {
						let current = $(this);
						let cmtno = current.data('cmtno');
				 		  let bbsno= current.data('bbsno');
				 		 var aaa = $("#editTextarea").val();
				 		 console.log(aaa);
						$.put("${pageContext.request.contextPath}/community/article_cmtEdit", {
			                "cmtno": cmtno,
			                "cmtcontent": aaa,
			                "bbsno": bbsno
			            }, function(json) {
			                if (json.rt == "OK") {
			                    alert("수정되었습니다.");
			                    // 삭제 완료 후 목록 페이지로 이동
			                    window.location="${pageContext.request.contextPath}/community/article.do?bbstype=B&bbsno=" + bbsno;
			                }
			            });
						$(this).text("수정");
						$(this).next().text("삭제");
						$(this).next().attr("id", "cancelar");
			                
			            
					}
				}
			});
			});
    </script>
</body>
</html>