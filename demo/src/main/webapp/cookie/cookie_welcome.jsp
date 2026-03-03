<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // request에 있는 쿠키 정보를 가져오기(user_id 쿠키)
    Cookie[] cookies = request.getCookies();
    String id = "";
    if (cookies != null) {  // 쿠키가 있다는 의미.
        // 쿠키 안에 user_id 쿠키가 있는지 확인
        for(Cookie c: cookies) {
            if (c.getName().equals("user_id")) {
                id = c.getValue();
            }
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cookie Welcome!!</title>
    </head>
    <body>
        <!-- "로그인 사용자" 님 환경합니다. -->
        <b><%=id %></b> 님 환영합니다.<br>
        <a href="cookie_login.jsp">로그인 화면으로 이동</a> 
    </body>
</html>