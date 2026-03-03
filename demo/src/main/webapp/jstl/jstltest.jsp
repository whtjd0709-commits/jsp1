<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%
    // 1. EL은 로컬 변수을 읽지 못하고, page, request, session 등과 같은 context의 값을 
    // 읽어서 처리하게 만들어져 있어서 바로 접근은 불가능. 때문에 아래와 같이 사용
    pageContext.setAttribute("name", "홍길동");

    // 2. 로컬로 선언한 후에 jstl을 이용한 설정. 
    String name2 = "홍길동2";

%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>JSTL 사용1</title>
    </head>
    <body>
        <%-- JSTL을 이용한 출력 : EL표기법, JSP 표현식과 같은 기능 --%>
        <%-- 변수 선언 --%>
        <c:set var="firstjstl" value="첫번째 jstl연습" scope="page"></c:set>
        <%-- 화면 출력 --%>
        ${firstjstl}
        <br>
        <c:out value="출력할 내용"></c:out>
        <br>
        pageContext 저장된 name 값 : ${pageScope.name}
        <br>
        <c:if test='${name.equals("홍길동")}'>
            if가 true 인 경우에 실행됩니다.
        </c:if>
        <c:set var="name2" value="<%= name2%>"></c:set>
        <br>
        ${name2}
        
    </body>
</html>