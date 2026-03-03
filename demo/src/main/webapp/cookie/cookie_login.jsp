<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    /*
    1. idCheck 쿠키가 있는지 확인, 있으면 id 입력 부분에 값을 미리 넣어주기
    */
    // cookie 얻어서 확인
    Cookie[] cookies = request.getCookies();
    String id = "";
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("idCheck")) {
                id = c.getValue();
            }
            if(c.getName().equals("user_id")) {
                response.sendRedirect("cookie_welcome.jsp");
            }
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cookie Login</title>
        <style>
            .wrap{
                width:257px;
                margin: 0 auto;
                text-align: center;
            }
            
            .btn{
                width:60px;
                height: 50px;
                background-color : aqua;
            }
            
        </style>
    </head>
    <body>
        <form action="cookie_login_ok.jsp" method="post">
            <table border="1">
                <tr>  <!-- rowspan, colspan 사용 -->
                    <td><input type="text" name="id" placeholder="아이디" value="<%=id %>"></td>
                    <td rowspan=2><input type="submit" value="로그인" class="btn"></td>
                </tr>
                <tr>
                    <td><input type="password" name="pw" placeholder="비밀번호"></td>

                </tr>
                <tr>
                    <td colspan="2">
                        <label for="idCheck">아이디 기억하기</label>
                        <input type="checkbox" id="idCheck" name="idCheck" value="y">

                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>