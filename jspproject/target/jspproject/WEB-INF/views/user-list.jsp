<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>사용자 등록 관리 페이지</title>
    </head>
    <body>
        <h2>사용자 등록</h2>
        <form action="users" method="post">
            이름 : <input type="text" name="username" placeholder="사용자 이름"><br>
            이메일 : <input type="email" name="email" placeholder="사용자 이메일"><br>
            <button type="submit">등록</button>
        </form>
        <hr>
        <h2>사용자 목록</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>이름</th>
                <th>이메일</th>
                <th>작업</th>
            </tr>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td><a href="users?action=delete&id=${user.id}">삭제</a></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>