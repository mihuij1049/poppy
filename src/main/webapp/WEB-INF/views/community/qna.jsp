<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>

<head>
<%@ include file="../share/head_tp.jsp"%>
<style type="text/css">
/** 하나의 글 덩어리 */
.questions {
	border-top: 1px dotted #eee;
	border-bottom: 1px dotted #eee;
	padding-bottom: 10px;
	padding-left: 20px;
}

#qna_link {
	text-decoration: none;
}

.btn_write {
	float: right;
	margin-right: 15px;
}

.qna_subject {
	padding-left:10px;
}

.uname {
	padding-left:10px;
}
</style>
<script src="../share/plugins/handlebars/handlebars-v4.0.5.js"></script>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>상품Q&A
				</b>
			</h4>
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/community/qna_wri.do'"
				class="btn btn_write btn-sm">글쓰기</button>
		</div>
		<ul class="cus_qna_list" id="cus_qna_list">

		</ul>
	</div>

	<%@ include file="../share/bottom_tp.jsp"%>
	<!-- 여기서부터 핸들바 템플릿 구조 만들기 -->
	<script id="customer_qna_tmpl" type="text/x-handlebars-template">
	{{#each qnas}}
	<li class="questions" id="question1">
		<div class="qnas clearfix">
			<a href="#" class="qna_link" id="qna_link" style="color:black;">
				<span class="glyphicon glyphicon-lock"><span class="qna_subject">{{qna_subject}}</span></span><br></a>
				<small class="uname">{{user_name}} 날짜</small>
			
		</div>
		
	</li>
	{{/each}}
	</script>
	<script type="text/javascript">
		/** Ajax 통신을 통해 json 파일을 읽어들여 핸들바 템플릿에 적용 */
		$(function() {
			// get요청을 통한 핸들바 템플릿 태그 조립하기
			function get_list() {
				$.get("../share/plugins/questions_list.json", function(req) {
					// 미리 준비한 HTML틀을 읽어온다.
					var template = Handlebars.compile($("#customer_qna_tmpl")
							.html());
					// Ajax 를 통해서 읽어온 JSON 을 템플릿에 병합한다.
					var html = template(req);
					// #interest-item-group 에 읽어온 내용을 추가한다.
					$("#cus_qna_list").append(html);
				});
			} // 검색 결과를 템플릿을 이용해서 화면에 나타낼 함수 정의 끝
			/** 함수 호출 -> 이 부분에서 상품 리스트가 화면에 뿌려짐 */
			get_list();
		});
	</script>

</body>

</html>