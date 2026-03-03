<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
    /*
    show 쿠키가 있다면 쿠키가 가지고 있는 값을 화면에 출력.
    만약에 쿠키가 없다면, "쿠키가 없습니다." 출력
    */
    // 1. request에서 전달된 쿠키 값을 얻기(request에는 Cookie배열로 저장됨)
    Cookie[] cookies = request.getCookies();
    // 날짜를 저장할 변수 date
    String date = null;
    // 2. 쿠키가 있는지 여부를 확인
    if (cookies != null) {  // 쿠키가 존재함. 
        // show라는 이름의 쿠키를 찾아서 그 값을 date에 저장. 
        for(int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("show")) {
                date = cookies[i].getValue();
            }
        }
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cookie 확인(show 쿠키)</title>
    </head>
    <body>
        <!-- 쿠키 확인하는 부분 -->
        <% if (date==null) {%>
            <b>쿠키가 없습니다.</b>
        <%} else {%>
            <b>마지막 접속 날짜 : <%=date %></b>
        <%}%>
    </body>
</html>