<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="/share/head_tp.jsp" %>
    <style type="text/css">
    .login {
        margin: 80px 30px;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        line-height: 40px;
        border-radius: 5px;
        font-size: 16px;
        padding-left: 10px;
    }

    .login-go {
        margin-top: 30px;
        width: 100%;
        font-size: 18px;
        height: 45px;
    }

    .login-go:hover {
        font-size: 20px;
        color: #fff;
    }

    .help-user {
        width: 90%;
        margin: auto;
        margin-top: -30px;
        margin-bottom: 50px;

    }

    .help-user>a {
        display: block;
        float: left;
        text-align: center;
        text-decoration: none;
        color: #191919;
        width: 33%;
        height: 30px;
    }

    .help-user>a:hover {
        text-decoration: none;
        color: #ff8f83;
        font-size: 16px;
        font-weight: bold;
    }
    </style>
</head>

<body>
     <%@ include file="/share/top_tp.jsp" %>
        <div class="content">
            <!-- 여기에 작성 -->
            <div class="container">
                <div class="page-title clearfix">
                    <h4><b>
                            <a href="#" onclick="history.back(); return false;"><i class="glyphicon glyphicon-chevron-left"></i></a>로그인
                        </b></h4>
                </div>
                <div class="login">
                    <form id="login" name="login" method="post">
                        <p><input type="text" name="user-id" placeholder="&nbsp;아이디"></p>
                        <p><input type="password" name="user_pw" placeholder="&nbsp;비밀번호"></p>
                        <p><input type="checkbox" name="login_keep value="Y" /> 로그인 상태유지&nbsp;
                            <span class="glyphicon glyphicon-lock"></span> 보안접속
                        </p>
                        <p><button type="submit" class="login-go btn">로 그 인</button></p>
                    </form>
                </div>
                <div class="help-user clearfix" id="help-user">
                    <a href="find_id.jsp">아이디찾기</a>
                    <a href="find_pw.jsp">비밀번호찾기</a>
                    <a href="myinfo_wri.jsp">회원가입</a>
                </div>
            </div>
        </div>
        <%@ include file="/share/bottom_tp.jsp" %>
        </script>
</body>

</html>