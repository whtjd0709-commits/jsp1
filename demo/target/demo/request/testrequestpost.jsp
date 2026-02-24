<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%
    // request에는 브라우저에 대한 정보를 사용자에게 전달하는 많은 내용이 자동 저장
    StringBuffer url = request.getRequestURL();
    String uri = request.getRequestURI();
    String path = request.getContextPath();
    String query = request.getQueryString();
    String addr = request.getRemoteAddr();
    
    // request의 값을 utf-8로 받기 설정
    request.setCharacterEncoding("utf-8");
    // request에 있는 값을 받기
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String address = request.getParameter("addr");
    // checkbox는 getParameterValues메서드을 활용합니다. 왜? 여러개의 값을 하나의 name으로 전달하기 때문에
    String[] checkboxs = request.getParameterValues("intro");
    String major = request.getParameter("major");
    String phone = request.getParameter("phone");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>request 객체</title>
    </head>

    <body>
        url 주소 : <%=url %><br>
        uri 주소 : <%=uri %><br>
        컨텍스트경로 : <%=path %><br>
        쿼리값 : <%=query %><br>
        접속 경로 : <%=addr %><br>
        <hr>
        아이디 : <%=id %><br>
        비밀번호 : <%=pw %><br>
        이름 : <%=name %><br>
        주소 : <%=address %><br>
        관심분야 : <%=Arrays.toString(checkboxs) %><br>
        전공 : <%=major %><br>
        통신사 : <%=phone %><br>
    </body>

</html>