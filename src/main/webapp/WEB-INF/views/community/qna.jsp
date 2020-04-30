<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../share/head_tp.jsp"%>
    <style type="text/css">

        .notice {
            margin-top: 20px;
        }

        hr {
            margin: 0;
        }

        .table span {
            font-size: 11px;
        }

        .table td {
            height: 70px;
        }

        .table .subject {
            vertical-align: middle;
        }

        .pagination>.active>span {
            background-color: #777;
            border-color: #777;
        }

        a {
            color: #777;
        }

        .paging {
            text-align: center;
        }

        .paging .disabled {
            position: relative;
            right: 10px;
        }

        .paging .paging-right {
            position: relative;
            left: 10px;
        }

        .row {
            margin-bottom: 50px;
        }

        .form-group {
            max-width: 100%;
            padding-top: 5px;
            position: relative;
            top: 5px;
        }

        .form-group #array1 {
            font-size: 12px;
            margin-left: 2%;
            margin-right: 2%;
            padding-left: 5px;
            display: inline;
            width: 47%;
            height: 30px;
        }

        .form-group #array2 {
            font-size: 12px;
            margin-right: 2%;
            padding-left: 5px;
            width: 47%;
            height: 30px;
        }

        .form-group #search {
            display: inline;
            margin-top: 8px;
            margin-left: 2%;
            margin-right: 2%;
            width: 82%;
            height: 30px;

        }

        .form-group .btn {
            font-size: 12px;
            color: #fff;
            background: #ff8f83;
            padding-left: 10px;
            margin-top: 8px;
            width: 12%;
            height: 30px;

        }
        /** 글쓰기 버튼 */
        .btn_write {
        	float:right;
        	margin-right:15px;
        }
        /** 글리피콘 */
        .glyphicon-lock {
        margin: 10px;
        }
        .name {
        padding-left:10px;
        }
    </style>
</head>

<body>
    <%@ include file="../share/top_tp.jsp"%>
    <div class="content">
        <div class="page-title clearfix">
         <h4><b>
            <a href="#" onclick="history.back(); return false;"><i class="glyphicon glyphicon-chevron-left"></i></a>상품Q&A
        </b></h4>
        <button type="button" onclick="location.href='${pageContext.request.contextPath}/community/qna_wri.do'"
				class="btn btn_write btn-sm">글쓰기</button>
    </div>
    <div class="notice">
        <table class="table">
            <tbody>
					<c:choose>
						<%-- 조회결과가 없는 경우 --%>
						<c:when test="${output == null || fn:length(output) == 0}">
							<tr>
								<td colspan="9" align="center">조회결과가 없습니다.</td>
							</tr>
						</c:when>
						<%-- 조회결과가 있는  경우 --%>
						<c:otherwise>
							<%-- 조회 결과에 따른 반복 처리 --%>
							<c:forEach var="item" items="${output}" varStatus="status">
								<%-- 출력을 위해 준비한 bbstitle 변수 --%>
								
								<c:set
								
								var="bbstitle" value="${item.bbstitle}">
								</c:set> 

								<%-- 검색어가 있다면? --%>
								<c:if test="${keyword != ''}">
									<%-- 검색어에 <mark> 태그를 적용하여 형광팬 효과 준비 --%>
									<c:set var="mark" value="<mark>${keyword}</mark>" />
									<%-- 출력을 위해 준비한 bbstitle에서 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
									<c:set var="bbstitle"
										value="${fn:replace(bbstitle, keyword, mark)}" />
								</c:if>
								<%-- 상세페이지로 이동하기 위한 URL --%>
								<c:url value="/community/article.do" var="viewUrl">
									<c:param name="bbsno" value="${item.bbsno}" />
								</c:url>
								<tr>
									<td class="subject"
										onclick="location.href='${pageContext.request.contextPath}/community/article.do';"
										style="cursor: pointer;"><strong>${item.bbstitle}
											<span class="comment">[50]</span>
									</strong><br /> <span class="name" title="작성자">${item.username}</span> <span
										class="date" title="작성일">${item.regdate}</span> <span>조회 235</span></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</tbody>
        </table>
    </div>
    <div class=" paging">
        <ul class="pagination pagination-sm">
            <li class="disabled"><a href="#">&laquo;</a></li>
            <!-- 활성화 버튼은 아래의 구조로 구성하시면 됩니다. sr-only는 스크린리더 전용입니다. -->
            <li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
            <li class="paging-right"><a href="#">&raquo;</a></li>
        </ul>
    </div>
    <hr>
    <div class="row">
        <div class="form-group">
            <select id="array1" class="col-xs-6 form-control">
                <option value="">일주일</option>
                <option value="1">한달</option>
                <option value="2">세달</option>
                <option value="3">전체</option>
            </select>
            <select id="array2" class="col-xs-6 form-control">
                <option value="">내용</option>
                <option value="1">제목</option>
                <option value="2">글쓴이</option>
                <option value="3">아이디</option>
                <option value="3">별명</option>
            </select>
            <input type="text" id="search" class="col-xs-11 form-control">
            <button type="button" class="col-xs-1 btn btn-dark">검색</button>
        </div>
    </div>
</div>
</div>
<%@ include file="../share/bottom_tp.jsp"%>
</body>

</html>