<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <body>
        <h2>로그인 성공</h2>
        <p> 환영합니다. </p>
        <%
            out.println("<b>out 객체를 사용한 화면에 출력입니다.</b>");
        %>
        <%= "<b>표현식으로 값을 출력해봅니다.</b>"%>
    </body>
</html>