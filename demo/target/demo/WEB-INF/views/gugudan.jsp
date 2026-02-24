<%-- 서블릿 주석 : JSP에서 page 지시자는 현재 보여지는 페이지에 대한 설정 --%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%--
    JSP 태그 종류
    1. 스크립트릿 : <% %> 모든 자바 코드를 사용할 수 있음.
    2. 지시자 : <%@ %> 페이지 속석이나 기타 설정을 사용할 수 있음.
    3. 선언자 : <%! %> 변수나 메서드 선언시 사용
    4. 표현식 : <%= %> 결과 값을 출력할때 사용..
    5. 주석 : <%-- --%>
--%>
<!DOCTYPE html> 
<html> 
    <head>
        <title>구구단 결과</title>
    </head> 
    <body>
        <% 
            Integer dan = (Integer)request.getAttribute("dan"); 
        %>
        <h2><%= dan%>단 출력 결과</h2> 
    <ul> 
        <% //스크립트를 사용하는 이유는, 데이터를 사용한 반복적인 작업을 java 형식으로 구현
            List<String> results = (List<String>) request.getAttribute("results"); 
            for(String res : results) { 
        %> 
        <li><%= res %></li> 
        <% 
            } 
        %> 
    </ul> 
    <a href="index.jsp">처음으로</a> 
    </body> 
</html>