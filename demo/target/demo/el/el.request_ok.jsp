<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>request 처리</title>
    </head>
    <body>
        아이디 : ${requestScope.userInfo.id} <br>
        패스워드 : ${requestScope.userInfo.pw} <br>
        이름 : ${requestScope.userInfo.name} <br>
        나이 : ${requestScope.userInfo.age} <br>
        취미 : ${requestScope.userInfo.hobby}, ${requestScope.userInfo.hobby[0]}  <br>

    </body>
</html>