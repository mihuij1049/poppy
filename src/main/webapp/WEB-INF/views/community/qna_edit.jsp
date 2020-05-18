<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../share/head_tp.jsp"%>

<script src="../share/plugins/handlebars/handlebars-v4.0.5.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/share/qna-edit.css" />
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>

	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">
			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>Q&A 수정하기
					</b>
				</h4>
			</div>
			<!-- 모달창 시작 -->
			<div id="search-modal">
				<div class="search-title clearfix">
					상품정보선택
					<div class="search-close pull-right">X</div>
				</div>
				<div class="search-searching">
					<div class="search-bar">
						<div class="search-textbar">
							<input type="text" name="search-goods" placeholder="상품명을 입력하세요." />
						</div>
						<button class="btn btn-sm btn-searching" id="search_goods_btn">검
							색</button>
					</div>

					<div class="search-result">
						총 <b class="search-qty">0</b>개의 상품이 검색되었습니다.
					</div>
				</div>
				<div class="search-body">
					<ul class="search-list" id="search_goods_list">

					</ul>
				</div>
				<div class="search-item-paging">
					<ul class="pagination pagination-xs">
						<li class="disabled"><a href="#">«</a></li>
						<!-- 활성화 버튼은 아래의 구조로 구성하시면 됩니다. sr-only는 스크린리더 전용입니다. -->
						<li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
						<li><span>2</span></li>
						<li><span>3</span></li>
						<li class="paging-right"><a href="#">»</a></li>
					</ul>
				</div>
				<div class="search-modal-layer"></div>
			</div>
			<!-- 모달창 끝 -->
			<form name="qna_wri" id="editForm"
				action="${pageContext.request.contextPath}/community/qna_edit_ok.do">
				<%
					/* action 페이지에서 사용할 WHERE 조건값을 hidden 필드로 숨겨서 전송한다. */
				%>
				<input type="hidden" name="bbsno" value="${output.bbsno}" />
				<div class="container"></div>
				<!-- QNA 상품정보 불러오기 -->
				<div class="qnagoods">
					<img class="photo"
						src="${output.imgpath}${output.imgname}.${output.imgext}" />
					<div class="goodsname">
						<div class="goodsname">
							${output.gname}<br>
						</div>
						<div class="goodsprice">
							<fmt:formatNumber value="${output.gprice}" pattern="#,###" />
							원
						</div>
					</div>
					<br>
				</div>

				<div class="qna-title">
					<div class="col-xs-4 edittitle">
						<label>제목</label>
					</div>
					<div class="col-xs-8 editinputtitle">
						<input type="text" name="bbstitle" value="${output.bbstitle}" id="bbstitle" />
					</div>
				</div>
				<div class="qna-desc">
					<div class="col-xs-12">
						<textarea class="qna_area" id="content" placeholder="내용을 입력하세요."
							maxlength="1800" name="bbscontent">${output.bbscontent}</textarea>
					</div>
				</div>


				<div class="qna-private">
					<div class="col-xs-4">
						<label>비밀글설정</label>
					</div>
					<div class="col-xs-8">
						<input type="radio" name="qnasec" value="0" id="public"> <label>공개글
							&nbsp;</label> <input type="radio" id="private" name="qnasec" value="1"
							checked> <label>비밀글</label>
					</div>
				</div>

				<div class="qna-pw">
					<div class="col-xs-4">
						<label>비밀번호</label>
					</div>
					<div class="col-xs-8">
						<input type="password" id="password" name="qnapw" maxlength="4"
							placeholder="비밀번호 4자리를 입력하세요.">
					</div>
				</div>
				<div class="qna_btn">
					<button type="submit" id="qna_ok" class="btn">등록</button>
					<button type="button" id="qna_re" class="btn btn-inverse"
						onclick="history.back(); return false;">취소</button>
				</div>
			</form>
		</div>
	</div>
	<div class="modal fade" id="myModal2">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="cart-modal">
					<div class="modal-header2">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">QnA 게시판 글 등록</h4>
					</div>
					<div class="modal-body2">
						<p>작성하신 글을 등록 하시겠습니까??</p>
					</div>
					<div class="modal-footer2">
						<button type="button" class="btn btn2" data-dismiss="modal">아니오</button>
						<button type="submit" class="btn btn2 qna-submit"
							data-dismiss="modal">예</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	<script type="text/javascript">
		/** 공개글 / 비밀글 라디오박스 체크 이벤트 */
		$('input[type=radio]').change(function() {
			// 공개글
			if (this.value == '0') {
				$("#password").attr("readonly", true).attr("disabled", false);
				$("#password").val("");
				$("#password").removeAttr("placeholder");
			}
			// 비밀글 
			else {
				$("#password").attr("disabled", false).attr("readonly", false);
				$("#password").attr("placeholder", "비밀번호 4자리를 입력하세요.");
			}
		});

		$(function() {
			/** 등록버튼을 눌렀을 때 */
			$("#qna_ok").on("click", function(e) {
				var title = $("#bbstitle").val();
				var content = $("#content").val();
				if(title=="") {
					alert("제목을 입력해주세요.");
					return false;
				}
				if(content=="") {
					alert("내용을 입력해주세요.");
					return false;
				}
				
				// 비밀글에 체크된 상태라면
				if ($("input:radio[id='private']").is(":checked") == true) {
					// 비밀번호를 pw에 담는다.
					var pw = $("#password").val();
					// 비밀번호 길이를 변수에 담기
					var pwlength = $("#password").val().length;
					// 비밀번호가 null / 4자리수 이하라면 경고메시지
					if (pw == "" || pwlength < 4) {
						alert("비밀번호는 4자리로 입력해주세요.");
						return false;
					}
					if (pwlength=4) {
					$("#myModal2").modal("show");
					}
					// 공개글에 체크된 상태라면
				} else {
					// 클릭시 모달창이 뜨는 이벤트
					$("#myModal2").modal("show");
				}
			});
		}); // end function
		$(".qna-submit").click(function(e) {
			$("#qna_wri").submit();
		});
	</script>
</body>

</html>