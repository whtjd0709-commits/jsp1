<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.UserInfo"%>
<%
    // String id, String pw, String name, int age, String[] hobby
    UserInfo userInfo = new UserInfo(
    "userId", "userPw", "김덕우", 23, new String[]{"독서","검도"});
    
    // request 메시지에 UserInfo를 전달.
    request.setAttribute("userInfo", userInfo);
    
    // 포워드 처리 : url 주소는 변경되지 않고, forward된 jsp의 결과를 불러와요.
    RequestDispatcher dp = request.getRequestDispatcher("el_request_ok.jsp");
    // request, response는 JSP가 가지고 있는 내장객체
    dp.forward(request, response);
    
%>
