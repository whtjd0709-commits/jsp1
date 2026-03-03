<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<%
    /*
    1. Date 클래스를 이용해서 페이지에 접근한 시간 정보를 yyyy년 MM월 dd일 형태로 생성
    해당 날짜 형식으로 문자열을 show라는 이름을 가진 쿠기로 생성
    2. 클라이언트에 전달.
    */
    // 날짜 생성
    Date now = new Date();
    SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
    
    // 쿠키 생성
    Cookie show = new Cookie("show", date.format(now));  // "show":쿠키 이름
    /*
    쿠키의 메서드
    1. setMaxAge() : 쿠키의 유효시간을 설정(*)
    2. setPath() : 쿠키 사용 유효 디렉터리를 설정
    3. setValue() : 쿠키의 값을 설정
    4. setVersion() : 쿠키 버전을 설정
    5. getMaxAge() : 쿠키 유효시간을 불러옴
    6. getName() : 쿠키 이름을 얻음(*)
    7. getPath() : 쿠키 유효 디렉터리 정보를 얻음
    8. getValue() : 쿠키 값을 얻음(*)
    9. getVersion() : 쿠키 버전 값을 얻음
    */
    show.setMaxAge(30);  // 30s
    // 응답에 쿠키를 추가
    response.addCookie(show);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cookie01 테스트</title>
    </head>
    <body>
        <a href="cookie02.jsp">쿠키에 저장된 값을 확인</a>
    </body>
</html>