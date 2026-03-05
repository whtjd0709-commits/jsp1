<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>인라인 편집 패턴</title>
        <script src="https://unpkg.com/htmx.org@2.0.0"></script>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    
    <body class="bg-gray-100 p-100">
        <div class="max-w-2xl mx-auto"></div>
        <header class="mb-6">
            <a href="" class="text-blue-600 hover:underline"> ← 홈으로 돌아가기 </a>
            <h1 class = "text-3xl font-bold mt-2">pattern 01: 인라인 편집</h1>
            <p class="text-gray-600">클릭하면  즉시 입력 폼으로 변환되는 UI입니다.</p>
        </header>

        <div id = "conTact-card" class="bg-white rounded-xl shadow-lg border border-gray-20"></div>
        <div hx-get="${pageContext.request.contextPath}/patterns/p1-edit?id=1" hx-trigger="load"
        hx-swap="outerHTML"></div>
    </body>
</html>