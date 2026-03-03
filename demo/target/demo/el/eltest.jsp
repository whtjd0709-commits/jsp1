<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>EL 표기법</title>
    </head>
    <body>
        <%-- 기본 리터럴 --%>
        <p>문자열 : ${"Jakarta EE"}</p>
        <p>논리값 : ${true}/${false}</p>
        <p>Null 출력 : ${null}(공백으로 출력됨)</p>

        <%-- 산술연산자(자동 형변환)--%>
        <p>덧셈 : ${10 + 20} = 30 </p>
        <p>나눗셈 : ${10/3} = ${10 div 3}</p>
        <p>나머지 : ${10 % 3} = ${10 mod 3}</p>

        <%-- 비교 및 논리 연산 --%>
        <p>동등 비교: ${10 eq 10} / ${10 == 10}</p>
        <p>논리곱: ${true and false} / ${true && false}</p>
        <p>논리합: ${true or false} / ${true || false}</p>

        <%-- 삼항 연산자 --%>
        <p>삼항 연산자(1==2) : ${1==2 ? "같음": "다름"}</p>
        <p>삼항 연산자(2==2) : ${2==2 ? "같음": "다름"}</p>

    </body>
</html>