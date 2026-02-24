<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%--
JSP 내장 객체
1. request (O) -> HTTPServletRequest
2. response (O) -> HttpServletResponse
3. out (.)  -> JspWriter
4. session  -> HttpSession
5. application (.)  -> ServletContext
6. pageContext
7. page
8. config
9. exception
--%>
<%--
request 객체가 제공하는 기능
1. 클라이언트와 관련된 정보 읽기 기능
2. 서버와 관련된 정보 읽기 기능
3. 클라이언트가 전송한 요청 파라미터 읽기 기능
4. 클라이언트가 전송한 쿠기 읽기 기능
---
request 객체가 가지고 있는 메서드
1. getContextPath()* : String - 웹 어플리케이션 컨텍스트 루트의 경로를 얻음
2. getMethod() : String - 웹 브라우저가 정보를 전송했을 때 요청 방식(get, post)
3. getServerName() : String - 연결할 때 사용한 서버의 이름
4. getServerPort() : int - 연결할 때 사용된 포트 번호ㅓ
5. getRequestURL()* : String - 요청 url
6. getRequestURI()* : String - 요청 uri
7. getRemoteAddr() : String - 웹 서버에 연결할 클라이언트 IP 주소
8. getProtocal() : String - 프로토콜 정보
9. getParameter(name)**  : name에 해당된 파라미터 값을 구합니다. 존재하지 않으면 null
10. getParameterValues(name)** : name 속한 모든 파라미터를 배열로 구함. 존재하지 않으면 null

*** request는 url 주소에 대해서 전달하고, 주소 바뀌면 사용X
--%>

<%
    // request에는 브라우저에 대한 정보를 사용자에게 전달하는 많은 내용이 자동 저장
    // request의 값을 utf-8로 받기 설정
    request.setCharacterEncoding("utf-8");
    StringBuffer url = request.getRequestURL();
    String uri = request.getRequestURI();
    String path = request.getContextPath();
    String query = request.getQueryString();
    String addr = request.getRemoteAddr();
    
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