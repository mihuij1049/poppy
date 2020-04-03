<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="/share/head_tp.jsp" %>
    <style type="text/css">
    .choice {
        margin-top: 20px;
        margin-bottom: 10px;
    }

    .choice .col-xs-8 {
        margin-top: 30px;
    }

    .qna-title,
    .qna-desc,
    .qna-url,
    .qna-pw,
    .qna-private {
        margin-bottom: 10px;
    }

    .col-xs-4,
    .col-xs-8,
    .col-xs-12 {
        margin-bottom: 15px;
    }


    .item-img>img {
        width: 100px;
        height: 100px;
    }

    input[type=text],
    input[type=password] {
        width: 100%;
    }

    .qna_area {
        width: 100%;
        min-height: 180px;
        resize: none;
    }

    .qna_private {}

    .qna_btn {
        margin-top: 0px;
        text-align: center;
        margin-bottom: 50px;
    }

    #qna_ok {
        width: 45%;
    }

    #qna_re {
        width: 45%;
    }

#search-modal {
  display:none;
  position:absolute;
  left:5%;
  z-index:1;
  border:1px solid #ff8f83;
  width:90%;
  margin:auto;
}
.search-title {
  width:100%;
  margin: auto;
  padding:10px 10px;
  background:#fff5f4;
}
.search-body {
  width:100%;
  margin: auto;
  padding:10px 10px;
  background:#fff5f4;
}
.search-item-paging {
  width:100%;
  margin: auto;
  padding:20px 10px;
  background:#fff5f4;
}

.search-modal-layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}   
</style>
    </style>
</head>

<body>
	<%@ include file="/share/top_tp.jsp" %>
    
        <div class="content">
            <!-- 여기에 작성 -->
            <div class="container">
                <div class="page-title clearfix">
                    <h4><b>
                            <a href="#" onclick="history.back(); return false;"><i class="glyphicon glyphicon-chevron-left"></i></a>QnA 글쓰기
                        </b></h4>
                </div>
                <div id="search-modal">
                            	<div class="search-title clearfix">
                            		<div class="search-bar pull-left">셀렉트, 검생 인풋 텍스트, 검색버튼</div>
                            		<div class="search-close pull-right">창 닫기 버튼</div>
                            		<div>검색된 상품 갯수 </div>
                            	</div>
                            	<div class="search-body">검색된 상품 나열</div>
                            	<div class="search-item-paging">페이징</div>
                            	<div class="search-modal-layer"></div>
                            </div>
                <form method="post" action="">
                    <div class="container">
                        <div class="choice clearfix">
                            <div class="col-xs-4"><a href="#" class="item-img"><img src="../share/img/slide.jpg"></a></div>
                            <div class="col-xs-8"><button type="button" class="item-select">상품정보선택</button></div>
                        </div>
                        
                        <div class="qna-title">
                            <div class="col-xs-4">
                                <label>제목</label>
                            </div>
                            <div class="col-xs-8"><input type="text">
                            </div>
                        </div>
                        <div class="qna-desc">
                            <div class="col-xs-12">
                                <textarea name="content" class="qna_area" placeholder="내용을 입력하세요." maxlength="1800"></textarea>
                            </div>
                        </div>
                        <div class="qna-url">
                            <div class="col-xs-4">
                                <label>UCC URL</label>
                            </div>
                            <div class="col-xs-8">
                                <input type="text">
                            </div>
                        </div>
                        <div class="qna-pw">
                            <div class="col-xs-4">
                                <label>비밀번호</label>
                            </div>
                            <div class="col-xs-8">
                                <input type="password">
                            </div>
                        </div>
                        <div class="qna-private">
                            <div class="col-xs-4">
                                <label>비밀글설정</label>
                            </div>
                            <div class="col-xs-8">
                                <input type="radio" name="public">
                                <label>공개글 &nbsp;</label>
                                <input type="radio" name="public">
                                <label>비밀글</label>
                            </div>
                        </div>
                    </div>
                    <div class="qna_btn">
                        <button type="submit" id="qna_ok" class="btn">등록</button>
                        <button type="reset" id="qna_re" class="btn btn-inverse">취소</button>
                    </div>
                </form>
            </div>
        </div>
        <%@ include file="/share/bottom_tp.jsp" %>
        $(function() {
        	$(".item-select").click(function(e) {
        		$("#search-modal").fadeIn();
        	});
        	$("#search-close").click(function(e) {
        		$("#search-modal").fadeOut();
        	});
        });
        </script>
</body>

</html>