<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <title>post 방식으로 데이터 전달</title>
    </head>

    <body>
        <form action="testrequestpost.jsp" method="post">

            아이디 : <input type="text" size="10" name="id"><br>
            비밀번호 : <input type="password" size="10" name="pw"><br>


            관심분야 :
            <input type="checkbox" name="intro" value="자바">자바
            <input type="checkbox" name="intro" value="JSP">JSP
            <input type="checkbox" name="intro" value="DATABASE">DATABASE

            <br>
            전공 :
            <input type="radio" name="major" value="컴공">컴공
            <input type="radio" name="major" value="디자인">디자인
            <input type="radio" name="major" value="경영">경영

            <br>
            통신사 :
            <select name="phone">
                <option>SKT</option>
                <option>LG</option>
                <option>KT</option>
            </select>
            <br>
            <!-- 이름 name, 주소address를 받아서 전송하고, 결과를 출력 -->
            이름 : <input type="text" size="10" name="name"><br>

            주소 : <input type="text" size="50" name="addr"><br>

            <br>
            <input type="submit" value="가입">
        </form>
    </body>

</html>